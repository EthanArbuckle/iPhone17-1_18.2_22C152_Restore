@interface RUIPage
- (BOOL)_shouldShowMultiChoiceElement;
- (BOOL)hasChoiceView;
- (BOOL)hasMultiChoiceView;
- (BOOL)hasPasscodeView;
- (BOOL)hasSpinnerView;
- (BOOL)hasTableView;
- (BOOL)hasToolBar;
- (BOOL)hasWebView;
- (BOOL)hidesBackButton;
- (BOOL)isLoading;
- (BOOL)isPrimaryElementNilOrKindOf:(Class)a3;
- (BOOL)multiChoiceViewFloatsAboveKeyboard;
- (BOOL)navBarIndicatorHidesLeftButton;
- (BOOL)needsToShowToolbarInPrefsAppRoot;
- (BOOL)showsTitlesAsHeaderViews;
- (NSArray)accessoryViews;
- (NSArray)buttonItems;
- (NSArray)buttons;
- (NSArray)childPages;
- (NSDictionary)attributes;
- (NSDictionary)leftNavigationBarButton;
- (NSDictionary)leftToolbarButton;
- (NSDictionary)middleToolbarButton;
- (NSDictionary)rightNavigationBarButton;
- (NSDictionary)rightToolbarButton;
- (NSString)activityIndicatorStyle;
- (NSString)backButtonTitle;
- (NSString)description;
- (NSString)loadingTitle;
- (NSString)navSubTitle;
- (NSString)navTitle;
- (NSString)pageID;
- (NSString)validationFunction;
- (RUIBarButtonItem)leftNavigationBarButtonItem;
- (RUIBarButtonItem)leftToolbarButtonItem;
- (RUIBarButtonItem)middleToolbarButtonItem;
- (RUIBarButtonItem)rightNavigationBarButtonItem;
- (RUIBarButtonItem)rightToolbarButtonItem;
- (RUIObjectModel)objectModel;
- (RUIPage)init;
- (RUIPage)initWithAttributes:(id)a3;
- (RUIPage)parentPage;
- (RUIPageElement)pageElement;
- (RUIPasscodeView)passcodeViewOM;
- (RUISpinnerView)spinnerViewOM;
- (RUIStyle)style;
- (RUITableView)tableViewOM;
- (RUITopLevelElementProvider)elementProvider;
- (RUITopLevelPageElement)primaryElement;
- (RUIWebView)webViewOM;
- (UIBarButtonItem)leftToolbarItem;
- (UIBarButtonItem)middleToolbarItem;
- (UIBarButtonItem)rightToolbarItem;
- (UIEdgeInsets)customEdgeInsets;
- (UIEdgeInsets)titleLabelPadding;
- (UILabel)titleLabel;
- (UIToolbar)toolbar;
- (UIView)containerView;
- (double)_buttonTrayLayoutInset;
- (double)_buttonTrayScrollInset;
- (double)customMargin;
- (id)_childElements;
- (id)elementsWithName:(id)a3;
- (id)flexibleSpace;
- (id)preferredFocusEnvironments;
- (id)subElementWithID:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addChildPage:(id)a3;
- (void)_barButtonPressed:(id)a3 isRight:(BOOL)a4 isNavbar:(BOOL)a5;
- (void)_handlePageUpdateRequestedNotification:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_leftNavigationBarButtonPressed:(id)a3;
- (void)_leftToolbarButtonPressed:(id)a3;
- (void)_middleToolbarButtonPressed:(id)a3;
- (void)_reloadTitleLabel;
- (void)_rightNavigationBarButtonPressed:(id)a3;
- (void)_rightToolbarButtonPressed:(id)a3;
- (void)_setContentInset:(double)a3;
- (void)_setParentPage:(id)a3;
- (void)_updateLoadingUI;
- (void)_updateParentPage;
- (void)_updateToolbar;
- (void)_updateWithCompletedChild:(id)a3;
- (void)addDidAppearBlock:(id)a3;
- (void)addElementProvider:(id)a3;
- (void)dealloc;
- (void)dismissIfPresentedWithCompletion:(id)a3;
- (void)loadView;
- (void)notifyPageDidChangePublisher;
- (void)populatePostbackDictionary:(id)a3;
- (void)populatePostbackDictionary:(id)a3 elementProvider:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setBackButtonTitle:(id)a3;
- (void)setButton:(id)a3 enabled:(BOOL)a4;
- (void)setCustomEdgeInsets:(UIEdgeInsets)a3;
- (void)setCustomMargin:(double)a3;
- (void)setElementProvider:(id)a3;
- (void)setHasToolbar;
- (void)setHidesBackButton:(BOOL)a3;
- (void)setLeftNavigationBarButton:(id)a3;
- (void)setLeftNavigationBarButtonItem:(id)a3;
- (void)setLeftNavigationBarButtonItem:(id)a3 barButtonItem:(id)a4;
- (void)setLeftToolbarButton:(id)a3;
- (void)setLeftToolbarButtonItem:(id)a3;
- (void)setLeftToolbarItem:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLoadingTitle:(id)a3;
- (void)setMiddleToolbarButton:(id)a3;
- (void)setMiddleToolbarButtonItem:(id)a3;
- (void)setMiddleToolbarItem:(id)a3;
- (void)setNavSubTitle:(id)a3;
- (void)setNavTitle:(id)a3;
- (void)setObjectModel:(id)a3;
- (void)setPageElement:(id)a3;
- (void)setPageID:(id)a3;
- (void)setRightNavigationBarButton:(id)a3;
- (void)setRightNavigationBarButtonItem:(id)a3;
- (void)setRightNavigationBarButtonItem:(id)a3 barButtonItem:(id)a4;
- (void)setRightToolbarButton:(id)a3;
- (void)setRightToolbarButtonItem:(id)a3;
- (void)setRightToolbarItem:(id)a3;
- (void)setShowsTitlesAsHeaderViews:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setTitleLabelPadding:(UIEdgeInsets)a3;
- (void)setValidationFunction:(id)a3;
- (void)setValue:(id)a3 forField:(id)a4;
- (void)topLevelElementProvider:(id)a3 didCreatePasscodeView:(id)a4;
- (void)topLevelElementProvider:(id)a3 didCreateSpinnerView:(id)a4;
- (void)topLevelElementProvider:(id)a3 didCreateTableView:(id)a4;
- (void)topLevelElementProvider:(id)a3 didCreateWebView:(id)a4;
- (void)topLevelElementProvider:(id)a3 didSetPrimaryElement:(id)a4 previousElement:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePreferredContentSize;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation RUIPage

- (RUIPage)initWithAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(RUIPage *)self init];
  v6 = v5;
  if (v5) {
    [(RUIPage *)v5 setAttributes:v4];
  }

  return v6;
}

- (RUIPage)init
{
  v8.receiver = self;
  v8.super_class = (Class)RUIPage;
  v2 = [(RUIPage *)&v8 initWithNibName:0 bundle:0];
  if (v2)
  {
    uint64_t v3 = +[RUIStyle defaultStyle];
    style = v2->_style;
    v2->_style = (RUIStyle *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    elementProviders = v2->_elementProviders;
    v2->_elementProviders = (NSMutableArray *)v5;
  }
  return v2;
}

- (NSString)activityIndicatorStyle
{
  v2 = [(RUIPage *)self attributes];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"activityIndicatorStyle"];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = @"activeElement";
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p id='%@', title='%@'>", objc_opt_class(), self, self->_pageID, self->_navTitle];
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    [(RUIPage *)self _updateLoadingUI];
  }
}

- (void)setLoadingTitle:(id)a3
{
  if (self->_loadingTitle != a3)
  {
    id v4 = (NSString *)[a3 copy];
    loadingTitle = self->_loadingTitle;
    self->_loadingTitle = v4;

    [(RUIPage *)self _updateLoadingUI];
  }
}

- (BOOL)navBarIndicatorHidesLeftButton
{
  v2 = [(RUIBarButtonItem *)self->_leftNavigationBarButtonItem itemType];
  char v3 = [v2 isEqualToString:@"titleBarItem"] ^ 1;

  return v3;
}

- (void)updatePreferredContentSize
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if ([(RUIPage *)self isPrimaryElementNilOrKindOf:objc_opt_class()])
  {
    char v3 = [(RUIPage *)self navigationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v5 = [(RUIPage *)self navigationController];
      if ([v5 ruiModalPresentationStyle] == 2 && -[RUIPage hasTableView](self, "hasTableView"))
      {
        v6 = [(RUIPage *)self tableViewOM];
        v7 = [v6 tableView];
        [v7 frame];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;

        v16 = [(RUIPage *)self tableViewOM];
        v17 = [v16 tableView];
        [v17 beginUpdates];

        v18 = [(RUIPage *)self tableViewOM];
        v19 = [v18 tableView];
        [v19 endUpdates];

        v20 = [(RUIPage *)self tableViewOM];
        v21 = [v20 tableView];
        [v21 layoutIfNeeded];

        -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", self->_containerView, v9, v11, v13, v15);
        double v23 = v22;
        v24 = [(RUIPage *)self elementProvider];
        v25 = [v24 tableViewOM];
        v26 = [v25 tableView];
        [v26 contentSize];
        double v28 = v27;
        v29 = [(RUIPage *)self elementProvider];
        v30 = [v29 tableViewOM];
        v31 = [v30 tableView];
        [v31 contentInset];
        double v33 = v32;
        double v34 = v23 + v28;

        if (_isInternalInstall())
        {
          v35 = _RUILoggingFacility();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = [(RUIPage *)self elementProvider];
            v37 = [v36 tableViewOM];
            v38 = [v37 tableView];
            double v39 = [v38 window];
            int v56 = 138412290;
            double v57 = v39;
            _os_log_impl(&dword_2144F2000, v35, OS_LOG_TYPE_DEFAULT, ">> window: %@", (uint8_t *)&v56, 0xCu);
          }
        }
        double v40 = v34 + v33;
        if (_isInternalInstall())
        {
          v41 = _RUILoggingFacility();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = [(RUIPage *)self elementProvider];
            v43 = [v42 tableViewOM];
            v44 = [v43 tableView];
            [v44 adjustedContentInset];
            int v56 = 134217984;
            double v57 = v45;
            _os_log_impl(&dword_2144F2000, v41, OS_LOG_TYPE_DEFAULT, ">> adjustedContentInset: %f", (uint8_t *)&v56, 0xCu);
          }
        }
        double v46 = v40 + 0.0;
        if (_isInternalInstall())
        {
          v47 = _RUILoggingFacility();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            int v56 = 134217984;
            double v57 = v46;
            _os_log_impl(&dword_2144F2000, v47, OS_LOG_TYPE_DEFAULT, ">> preferredContentSize: %f", (uint8_t *)&v56, 0xCu);
          }
        }
        [(RUIPage *)self preferredContentSize];
        if (v49 != v13 || v48 != v46) {
          -[RUIPage setPreferredContentSize:](self, "setPreferredContentSize:", v13, v46);
        }
        v50 = [(RUIPage *)self navigationController];
        [v50 preferredContentSize];
        double v52 = v51;
        double v54 = v53;

        if (v52 != v13 || v54 != v46)
        {
          v55 = [(RUIPage *)self navigationController];
          objc_msgSend(v55, "setPreferredContentSize:", v13, v46);
        }
      }
    }
  }
}

- (void)_updateLoadingUI
{
  double v39 = self->_navTitle;
  char v3 = self->_navSubTitle;
  id v4 = [(RUIPage *)self activityIndicatorStyle];
  char v5 = [v4 isEqualToString:@"navbar"];

  if (v5)
  {
    int v6 = 1;
  }
  else
  {
    v7 = [(RUIPage *)self activityIndicatorStyle];
    int v8 = [v7 isEqualToString:@"default"];

    if (v8)
    {
      double v9 = [(RUIPage *)self objectModel];
      double v10 = [v9 activeElement];
      int v6 = [v10 wantsInlineActivityIndicator] ^ 1;
    }
    else
    {
      int v6 = 0;
    }
  }
  if ([(NSString *)self->_loadingTitle length])
  {
    int v11 = self->_loading ? v6 : 0;
    if (v11 == 1)
    {
      double v12 = self->_loadingTitle;

      double v39 = v12;
    }
  }
  if (self->_showsTitlesAsHeaderViews
    && ([(RUIPage *)self hasTableView]
     || [(RUIPage *)self hasPasscodeView]
     || ([(RUIPage *)self primaryElement],
         double v13 = objc_claimAutoreleasedReturnValue(),
         v13,
         v13)))
  {
    double v14 = [(RUIPage *)self navigationItem];
    [v14 setTitle:0];

    double v15 = [(RUIPage *)self elementProvider];
    v16 = [v15 tableViewOM];
    [v16 setHeaderTitle:v39];

    v17 = [(RUIPage *)self elementProvider];
    v18 = [v17 tableViewOM];
    [v18 setSubHeaderTitle:v3];

    v19 = [(RUIPage *)self elementProvider];
    uint64_t v20 = [v19 passcodeViewOM];
    [(id)v20 setHeaderTitle:v39];

    v21 = [(RUIPage *)self primaryElement];
    LOBYTE(v20) = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0) {
      goto LABEL_21;
    }
    double v22 = [(RUIPage *)self primaryElement];
    double v23 = v22;
    v24 = v39;
  }
  else
  {
    v25 = [(RUIPage *)self navigationItem];
    [v25 setTitle:v39];

    v26 = [(RUIPage *)self elementProvider];
    double v27 = [v26 tableViewOM];
    [v27 setHeaderTitle:0];

    double v28 = [(RUIPage *)self elementProvider];
    v29 = [v28 tableViewOM];
    [v29 setSubHeaderTitle:0];

    v30 = [(RUIPage *)self elementProvider];
    uint64_t v31 = [v30 passcodeViewOM];
    [(id)v31 setHeaderTitle:0];

    double v32 = [(RUIPage *)self primaryElement];
    LOBYTE(v31) = objc_opt_respondsToSelector();

    if ((v31 & 1) == 0) {
      goto LABEL_21;
    }
    double v22 = [(RUIPage *)self primaryElement];
    double v23 = v22;
    v24 = 0;
  }
  [v22 setTitle:v24];

LABEL_21:
  [(RUIPage *)self _reloadTitleLabel];
  if (v6)
  {
    double v33 = objc_msgSend(NSString, "stringWithFormat:", @"RUIPage:%p", self);
    containerView = self->_containerView;
    if (self->_loading)
    {
      [(UIView *)containerView setUserInteractionEnabled:0];
      v35 = +[RUINavBarSpinnerManager sharedSpinnerManager];
      v36 = [(RUIPage *)self style];
      objc_msgSend(v35, "setActivityIndicatorViewStyle:", objc_msgSend(v36, "navBarActivityIndicatorStyle"));

      v37 = +[RUINavBarSpinnerManager sharedSpinnerManager];
      v38 = [(RUIPage *)self navigationItem];
      objc_msgSend(v37, "startAnimatingInNavItem:title:forIdentifier:hideBackButton:hideLeftItems:", v38, 0, v33, 1, -[RUIPage navBarIndicatorHidesLeftButton](self, "navBarIndicatorHidesLeftButton"));
    }
    else
    {
      [(UIView *)containerView setUserInteractionEnabled:1];
      v37 = +[RUINavBarSpinnerManager sharedSpinnerManager];
      [v37 stopAnimatingForIdentifier:v33];
    }
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RUIPage;
  id v4 = a3;
  [(RUIPage *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[RUIPage setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)setNavTitle:(id)a3
{
  if (self->_navTitle != a3)
  {
    id v4 = (NSString *)[a3 copy];
    navTitle = self->_navTitle;
    self->_navTitle = v4;

    [(RUIPage *)self _updateLoadingUI];
  }
}

- (void)setNavSubTitle:(id)a3
{
  if (self->_navSubTitle != a3)
  {
    id v4 = (NSString *)[a3 copy];
    navSubTitle = self->_navSubTitle;
    self->_navSubTitle = v4;

    [(RUIPage *)self _updateLoadingUI];
  }
}

- (void)setBackButtonTitle:(id)a3
{
  double v7 = (NSString *)a3;
  if (self->_backButtonTitle != v7)
  {
    objc_storeStrong((id *)&self->_backButtonTitle, a3);
    double v5 = [(RUIPage *)self navigationItem];
    double v6 = [v5 backBarButtonItem];
    [v6 setTitle:v7];
  }
}

- (void)setShowsTitlesAsHeaderViews:(BOOL)a3
{
  if (self->_showsTitlesAsHeaderViews != a3)
  {
    self->_showsTitlesAsHeaderViews = a3;
    [(RUIPage *)self _updateLoadingUI];
  }
}

- (UILabel)titleLabel
{
  char v3 = [(RUIPage *)self primaryElement];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(RUIPage *)self primaryElement];
    double v6 = [v5 titleLabel];
  }
  else
  {
    double v6 = 0;
  }
  return (UILabel *)v6;
}

- (void)setTitleLabelPadding:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ([(RUIPage *)self hasTableView])
  {
    double v8 = [(RUIPage *)self elementProvider];
    objc_super v9 = [v8 tableViewOM];
    id v10 = [v9 headerView];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v10, "setMargins:", top, left, bottom, right);
    }
  }
}

- (UIEdgeInsets)titleLabelPadding
{
  if (![(RUIPage *)self hasTableView]) {
    goto LABEL_5;
  }
  char v3 = [(RUIPage *)self elementProvider];
  char v4 = [v3 tableViewOM];
  double v5 = [v4 headerView];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    double v7 = *MEMORY[0x263F834E8];
    double v9 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v11 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v13 = *(double *)(MEMORY[0x263F834E8] + 24);
    goto LABEL_6;
  }
  [v5 margins];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

LABEL_6:
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.double right = v17;
  result.double bottom = v16;
  result.double left = v15;
  result.double top = v14;
  return result;
}

- (void)_reloadTitleLabel
{
  if ([(RUIPage *)self hasTableView])
  {
    id v5 = [(RUIPage *)self elementProvider];
    char v3 = [v5 tableViewOM];
    char v4 = [v3 tableView];
    [v4 reloadData];
  }
}

- (void)setHidesBackButton:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hidesBackButton = a3;
  id v4 = [(RUIPage *)self navigationItem];
  [v4 setHidesBackButton:v3];
}

- (void)setHasToolbar
{
  if (!self->_toolbar)
  {
    id v3 = objc_alloc(MEMORY[0x263F82D70]);
    id v4 = (UIToolbar *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    toolbar = self->_toolbar;
    self->_toolbar = v4;

    containerView = self->_containerView;
    double v7 = self->_toolbar;
    [(UIView *)containerView addSubview:v7];
  }
}

- (BOOL)needsToShowToolbarInPrefsAppRoot
{
  return self->_toolbar == 0;
}

- (void)setValue:(id)a3 forField:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  elementProviders = self->_elementProviders;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __29__RUIPage_setValue_forField___block_invoke;
  v11[3] = &unk_264211770;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(NSMutableArray *)elementProviders enumerateObjectsUsingBlock:v11];
}

void __29__RUIPage_setValue_forField___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 tableViewOM];
  id v6 = [(id)v3 rowWithIdentifier:*(void *)(a1 + 32)];

  id v4 = self;
  LOBYTE(v3) = objc_opt_isKindOfClass();

  if (v3)
  {
    [v6 setValueFromString:*(void *)(a1 + 40)];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 40) stringValue];
    [v6 setValueFromString:v5];
  }
}

- (void)setCustomMargin:(double)a3
{
  self->_customMargin = a3;
  id v5 = [(RUIPage *)self elementProvider];
  id v6 = [v5 tableViewOM];
  id v10 = [v6 tableView];

  if (v10)
  {
    if (a3 >= 0.0)
    {
      [(UIView *)v10 setClipsToBounds:0];
      -[UIView setScrollIndicatorInsets:](v10, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, -a3);
      containerView = self->_containerView;
      id v7 = [(UIView *)v10 panGestureRecognizer];
      double v8 = containerView;
    }
    else
    {
      [(UIView *)v10 setClipsToBounds:1];
      -[UIView setScrollIndicatorInsets:](v10, "setScrollIndicatorInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
      id v7 = [(UIView *)v10 panGestureRecognizer];
      double v8 = v10;
    }
    [(UIView *)v8 addGestureRecognizer:v7];
  }
}

- (NSArray)buttonItems
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = v3;
  if (self->_leftNavigationBarButtonItem) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_rightNavigationBarButtonItem) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_leftToolbarButtonItem) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_rightToolbarButtonItem) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_middleToolbarButtonItem) {
    objc_msgSend(v4, "addObject:");
  }
  return (NSArray *)v4;
}

- (void)setButton:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 objectForKey:@"position"];
  double v8 = [v6 objectForKey:@"parentBar"];

  if ([v8 isEqualToString:@"navigationBar"])
  {
    if ([v7 isEqualToString:@"right"])
    {
      id v9 = [(RUIPage *)self navigationItem];
      uint64_t v10 = [v9 rightBarButtonItem];
LABEL_9:
      id v12 = (id)v10;

      double v11 = v12;
      goto LABEL_15;
    }
    if ([v7 isEqualToString:@"left"])
    {
      id v9 = [(RUIPage *)self navigationItem];
      uint64_t v10 = [v9 leftBarButtonItem];
      goto LABEL_9;
    }
  }
  else if ([v8 isEqualToString:@"toolbar"])
  {
    if ([v7 isEqualToString:@"right"])
    {
      double v11 = [(RUIPage *)self rightToolbarItem];
      goto LABEL_15;
    }
    if ([v7 isEqualToString:@"left"])
    {
      double v11 = [(RUIPage *)self leftToolbarItem];
      goto LABEL_15;
    }
    if ([v7 isEqualToString:@"center"])
    {
      double v11 = [(RUIPage *)self middleToolbarItem];
      goto LABEL_15;
    }
  }
  double v11 = 0;
LABEL_15:
  id v13 = v11;
  [v11 setEnabled:v4];
}

- (void)setRightNavigationBarButtonItem:(id)a3 barButtonItem:(id)a4
{
  id v7 = (RUIBarButtonItem *)a3;
  p_rightNavigationBarButtonItem = &self->_rightNavigationBarButtonItem;
  if (self->_rightNavigationBarButtonItem != v7)
  {
    double v11 = v7;
    objc_storeStrong((id *)p_rightNavigationBarButtonItem, a3);
    id v9 = a4;
    uint64_t v10 = [(RUIPage *)self navigationItem];
    [v10 setRightBarButtonItem:v9];

    id v7 = v11;
  }
  MEMORY[0x270F9A758](p_rightNavigationBarButtonItem, v7);
}

- (void)setRightNavigationBarButtonItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  double v8 = __43__RUIPage_setRightNavigationBarButtonItem___block_invoke;
  id v9 = &unk_264211570;
  objc_copyWeak(&v10, &location);
  [v4 setAction:&v6];
  id v5 = objc_msgSend(v4, "barButtonItem", v6, v7, v8, v9);
  [(RUIPage *)self setRightNavigationBarButtonItem:v4 barButtonItem:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__RUIPage_setRightNavigationBarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rightNavigationBarButtonPressed:0];
}

- (void)setLeftNavigationBarButtonItem:(id)a3 barButtonItem:(id)a4
{
  uint64_t v7 = (RUIBarButtonItem *)a3;
  p_leftNavigationBarButtonItem = &self->_leftNavigationBarButtonItem;
  if (self->_leftNavigationBarButtonItem != v7)
  {
    double v11 = v7;
    objc_storeStrong((id *)p_leftNavigationBarButtonItem, a3);
    id v9 = a4;
    id v10 = [(RUIPage *)self navigationItem];
    [v10 setLeftBarButtonItem:v9];

    uint64_t v7 = v11;
  }
  MEMORY[0x270F9A758](p_leftNavigationBarButtonItem, v7);
}

- (void)setLeftNavigationBarButtonItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 itemType];
  char v6 = [v5 isEqualToString:@"tapToRadarBarItem"];

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __42__RUIPage_setLeftNavigationBarButtonItem___block_invoke;
    double v11 = &unk_264211570;
    objc_copyWeak(&v12, &location);
    [v4 setAction:&v8];
    objc_destroyWeak(&v12);
  }
  uint64_t v7 = objc_msgSend(v4, "barButtonItem", v8, v9, v10, v11);
  [(RUIPage *)self setLeftNavigationBarButtonItem:v4 barButtonItem:v7];

  objc_destroyWeak(&location);
}

void __42__RUIPage_setLeftNavigationBarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _leftNavigationBarButtonPressed:0];
}

- (id)flexibleSpace
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  return v2;
}

- (void)_updateToolbar
{
  v27[3] = *MEMORY[0x263EF8340];
  if (!self->_middleFlexSpace)
  {
    uint64_t v3 = [(RUIPage *)self flexibleSpace];
    middleFlexSpace = self->_middleFlexSpace;
    self->_middleFlexSpace = v3;
  }
  if (!self->_leftFlexSpace)
  {
    id v5 = [(RUIPage *)self flexibleSpace];
    leftFlexSpace = self->_leftFlexSpace;
    self->_leftFlexSpace = v5;
  }
  leftToolbarItem = self->_leftToolbarItem;
  if (!leftToolbarItem) {
    leftToolbarItem = self->_leftFlexSpace;
  }
  uint64_t v8 = leftToolbarItem;
  rightToolbarItem = self->_rightToolbarItem;
  if (rightToolbarItem)
  {
    id v10 = rightToolbarItem;
  }
  else
  {
    id v10 = [(RUIPage *)self flexibleSpace];
  }
  double v11 = v10;
  if (self->_middleToolbarItem)
  {
    id v12 = self->_leftToolbarItem;
    if (!v12) {
      id v12 = self->_leftFlexSpace;
    }
    id v13 = v12;
    double v14 = self->_rightToolbarItem;
    if (v14)
    {
      double v15 = v14;
    }
    else
    {
      double v15 = [(RUIPage *)self flexibleSpace];
    }
    double v17 = v15;
    if (self->_leftToolbarItem || self->_rightToolbarItem)
    {
      v26[0] = v13;
      v18 = [(RUIPage *)self flexibleSpace];
      middleToolbarItem = self->_middleToolbarItem;
      v26[1] = v18;
      v26[2] = middleToolbarItem;
      uint64_t v20 = [(RUIPage *)self flexibleSpace];
      v26[3] = v20;
      v26[4] = v17;
      v21 = (void *)MEMORY[0x263EFF8C0];
      double v22 = v26;
      uint64_t v23 = 5;
    }
    else
    {
      v18 = [(RUIPage *)self flexibleSpace];
      uint64_t v20 = [(RUIPage *)self flexibleSpace];
      v25[2] = v20;
      v21 = (void *)MEMORY[0x263EFF8C0];
      double v22 = v25;
      uint64_t v23 = 3;
    }
    v24 = [v21 arrayWithObjects:v22 count:v23];
    [(UIToolbar *)self->_toolbar setItems:v24];
  }
  else
  {
    double v16 = self->_middleFlexSpace;
    v27[0] = v8;
    v27[1] = v16;
    v27[2] = v10;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
    [(UIToolbar *)self->_toolbar setItems:v13];
  }
}

- (void)setRightToolbarButtonItem:(id)a3
{
  id v5 = (RUIBarButtonItem *)a3;
  p_rightToolbarButtonItem = (id *)&self->_rightToolbarButtonItem;
  if (self->_rightToolbarButtonItem != v5)
  {
    objc_storeStrong((id *)&self->_rightToolbarButtonItem, a3);
    objc_initWeak(&location, self);
    id v7 = *p_rightToolbarButtonItem;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    double v11 = __37__RUIPage_setRightToolbarButtonItem___block_invoke;
    id v12 = &unk_264211570;
    objc_copyWeak(&v13, &location);
    [v7 setAction:&v9];
    uint64_t v8 = objc_msgSend(*p_rightToolbarButtonItem, "barButtonItem", v9, v10, v11, v12);
    [(RUIPage *)self setRightToolbarItem:v8];

    [(RUIPage *)self _updateToolbar];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __37__RUIPage_setRightToolbarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rightToolbarButtonPressed:0];
}

- (void)setMiddleToolbarButtonItem:(id)a3
{
  id v5 = (RUIBarButtonItem *)a3;
  p_middleToolbarButtonItem = (id *)&self->_middleToolbarButtonItem;
  if (self->_middleToolbarButtonItem != v5)
  {
    objc_storeStrong((id *)&self->_middleToolbarButtonItem, a3);
    objc_initWeak(&location, self);
    id v7 = *p_middleToolbarButtonItem;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    double v11 = __38__RUIPage_setMiddleToolbarButtonItem___block_invoke;
    id v12 = &unk_264211570;
    objc_copyWeak(&v13, &location);
    [v7 setAction:&v9];
    uint64_t v8 = objc_msgSend(*p_middleToolbarButtonItem, "barButtonItem", v9, v10, v11, v12);
    [(RUIPage *)self setMiddleToolbarItem:v8];

    [(RUIPage *)self _updateToolbar];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __38__RUIPage_setMiddleToolbarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _middleToolbarButtonPressed:0];
}

- (void)setLeftToolbarButtonItem:(id)a3
{
  id v5 = (RUIBarButtonItem *)a3;
  p_leftToolbarButtonItem = (id *)&self->_leftToolbarButtonItem;
  if (self->_leftToolbarButtonItem != v5)
  {
    objc_storeStrong((id *)&self->_leftToolbarButtonItem, a3);
    objc_initWeak(&location, self);
    id v7 = *p_leftToolbarButtonItem;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    double v11 = __36__RUIPage_setLeftToolbarButtonItem___block_invoke;
    id v12 = &unk_264211570;
    objc_copyWeak(&v13, &location);
    [v7 setAction:&v9];
    uint64_t v8 = objc_msgSend(*p_leftToolbarButtonItem, "barButtonItem", v9, v10, v11, v12);
    [(RUIPage *)self setLeftToolbarItem:v8];

    [(RUIPage *)self _updateToolbar];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __36__RUIPage_setLeftToolbarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _leftToolbarButtonPressed:0];
}

- (void)setRightToolbarButton:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setAttributes:v4];

  [(RUIPage *)self setRightToolbarButtonItem:v5];
}

- (NSDictionary)rightToolbarButton
{
  return [(RUIElement *)self->_rightToolbarButtonItem attributes];
}

- (void)setMiddleToolbarButton:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setAttributes:v4];

  [(RUIPage *)self setMiddleToolbarButtonItem:v5];
}

- (NSDictionary)middleToolbarButton
{
  return [(RUIElement *)self->_middleToolbarButtonItem attributes];
}

- (void)setLeftToolbarButton:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setAttributes:v4];

  [(RUIPage *)self setLeftToolbarButtonItem:v5];
}

- (NSDictionary)leftToolbarButton
{
  return [(RUIElement *)self->_leftToolbarButtonItem attributes];
}

- (void)setRightNavigationBarButton:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setAttributes:v4];

  [(RUIPage *)self setRightNavigationBarButtonItem:v5];
}

- (NSDictionary)rightNavigationBarButton
{
  return [(RUIElement *)self->_rightNavigationBarButtonItem attributes];
}

- (void)setLeftNavigationBarButton:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setAttributes:v4];

  [(RUIPage *)self setLeftNavigationBarButtonItem:v5];
}

- (NSDictionary)leftNavigationBarButton
{
  return [(RUIElement *)self->_leftNavigationBarButtonItem attributes];
}

- (NSArray)buttons
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  leftNavigationBarButtonItem = self->_leftNavigationBarButtonItem;
  if (leftNavigationBarButtonItem)
  {
    id v5 = [(RUIElement *)leftNavigationBarButtonItem attributes];
    [v3 addObject:v5];
  }
  rightNavigationBarButtonItem = self->_rightNavigationBarButtonItem;
  if (rightNavigationBarButtonItem)
  {
    id v7 = [(RUIElement *)rightNavigationBarButtonItem attributes];
    [v3 addObject:v7];
  }
  leftToolbarButtonItem = self->_leftToolbarButtonItem;
  if (leftToolbarButtonItem)
  {
    uint64_t v9 = [(RUIElement *)leftToolbarButtonItem attributes];
    [v3 addObject:v9];
  }
  rightToolbarButtonItem = self->_rightToolbarButtonItem;
  if (rightToolbarButtonItem)
  {
    double v11 = [(RUIElement *)rightToolbarButtonItem attributes];
    [v3 addObject:v11];
  }
  middleToolbarButtonItem = self->_middleToolbarButtonItem;
  if (middleToolbarButtonItem)
  {
    id v13 = [(RUIElement *)middleToolbarButtonItem attributes];
    [v3 addObject:v13];
  }
  return (NSArray *)v3;
}

- (void)_barButtonPressed:(id)a3 isRight:(BOOL)a4 isNavbar:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v33 = a3;
  uint64_t v8 = [v33 attributes];
  uint64_t v9 = [v8 objectForKey:@"type"];
  int v10 = [v9 isEqualToString:@"editBarItem"];

  if (v10)
  {
    double v11 = [(RUIPage *)self elementProvider];
    id v12 = [v11 tableViewOM];
    id v13 = [v12 tableView];

    int v14 = [v13 isEditing];
    double v15 = [(RUIPage *)self elementProvider];
    double v16 = [v15 tableViewOM];
    double v17 = [v16 tableView];
    uint64_t v18 = v14 ^ 1u;
    [v17 setEditing:v18 animated:1];

    v19 = &selRef__rightNavigationBarButtonPressed_;
    if (!v5) {
      v19 = &selRef__rightToolbarButtonPressed_;
    }
    uint64_t v20 = &selRef__leftNavigationBarButtonPressed_;
    if (!v5) {
      uint64_t v20 = &selRef__leftToolbarButtonPressed_;
    }
    if (!v6) {
      v19 = v20;
    }
    v21 = *v19;
    id v22 = objc_alloc(MEMORY[0x263F824A8]);
    if (v14) {
      uint64_t v23 = 2;
    }
    else {
      uint64_t v23 = 0;
    }
    v24 = (void *)[v22 initWithBarButtonSystemItem:v23 target:self action:v21];
    if (v5)
    {
      v25 = [(RUIPage *)self navigationItem];
      v26 = v25;
      if (v6) {
        [v25 setRightBarButtonItem:v24];
      }
      else {
        [v25 setLeftBarButtonItem:v24];
      }
    }
    else
    {
      if (v6) {
        [(RUIPage *)self setRightToolbarItem:v24];
      }
      else {
        [(RUIPage *)self setLeftToolbarItem:v24];
      }
      [(RUIPage *)self _updateToolbar];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    [WeakRetained RUIPage:self toggledEditing:v18];
  }
  else
  {
    double v27 = [v33 itemType];
    int v28 = [v27 isEqualToString:@"closeButtonBarItem"];

    if (v28)
    {
      id v13 = [(RUIPage *)self navigationController];
      [v13 dismissViewControllerAnimated:1 completion:0];
      goto LABEL_28;
    }
    v29 = [v33 itemType];
    if ([v29 isEqualToString:@"backButtonBarItem"])
    {
      v30 = [v8 objectForKey:@"url"];

      if (!v30)
      {
        id v13 = [(RUIPage *)self navigationController];
        id v31 = (id)[v13 popViewControllerAnimated:1];
        goto LABEL_28;
      }
    }
    else
    {
    }
    id v13 = objc_loadWeakRetained((id *)&self->_objectModel);
    [v13 RUIPage:self pressedNavBarButton:v33];
  }
LABEL_28:
}

- (void)_rightNavigationBarButtonPressed:(id)a3
{
}

- (void)_leftNavigationBarButtonPressed:(id)a3
{
}

- (void)_rightToolbarButtonPressed:(id)a3
{
}

- (void)_leftToolbarButtonPressed:(id)a3
{
}

- (void)_middleToolbarButtonPressed:(id)a3
{
}

- (void)_setContentInset:(double)a3
{
  BOOL v5 = [(RUIPage *)self elementProvider];
  BOOL v6 = [v5 tableViewOM];

  if (v6)
  {
    id v7 = [(RUIPage *)self elementProvider];
    uint64_t v8 = [v7 tableViewOM];
    uint64_t v9 = [v8 tableView];
    [v9 contentInset];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v16 = [(RUIPage *)self elementProvider];
    double v17 = [v16 tableViewOM];
    uint64_t v18 = [v17 tableView];
    objc_msgSend(v18, "setContentInset:", v11, v13, a3, v15);

    id v21 = [(RUIPage *)self elementProvider];
    v19 = [v21 tableViewOM];
    uint64_t v20 = [v19 tableView];
    objc_msgSend(v20, "setScrollIndicatorInsets:", v11, v13, a3, v15);
  }
}

- (NSArray)accessoryViews
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(RUIPage *)self elementProvider];
  id v4 = [v3 tableViewOM];
  BOOL v5 = [v4 tableView];

  BOOL v6 = [v5 tableHeaderView];
  id v7 = [v5 tableFooterView];
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = &unk_26C5912E8;
  if ([v6 conformsToProtocol:v9]) {
    [v8 addObject:v6];
  }
  v26 = v6;
  if ([v7 conformsToProtocol:v9]) {
    [v8 addObject:v7];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v10 = [(RUIPage *)self elementProvider];
  double v11 = [v10 tableViewOM];
  double v12 = [v11 sections];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v18 = [v17 headerView];
        int v19 = [v18 conformsToProtocol:v9];

        if (v19)
        {
          uint64_t v20 = [v17 headerView];
          [v8 addObject:v20];
        }
        id v21 = [v17 footerView];
        int v22 = [v21 conformsToProtocol:v9];

        if (v22)
        {
          uint64_t v23 = [v17 footerView];
          [v8 addObject:v23];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  return (NSArray *)v8;
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RUIPage *)self elementProvider];
  BOOL v6 = [v5 tableViewOM];
  id v7 = [v6 tableView];

  uint64_t v8 = [v7 window];

  if (v8)
  {
    uint64_t v9 = [v4 userInfo];
    double v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F837B8]];
    [v10 CGRectValue];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    int v19 = [v4 object];
    uint64_t v20 = [v19 coordinateSpace];

    id v21 = [(RUIPage *)self view];
    objc_msgSend(v20, "convertRect:toCoordinateSpace:", v21, v12, v14, v16, v18);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    long long v30 = [v7 visibleCells];
    [v7 frame];
    double MaxY = CGRectGetMaxY(v40);
    v41.origin.x = v23;
    v41.origin.y = v25;
    v41.size.width = v27;
    v41.size.height = v29;
    double v32 = fmax(MaxY - CGRectGetMinY(v41), 0.0);
    [(UIView *)self->_containerView safeAreaInsets];
    id v33 = (void *)MEMORY[0x263F828D0];
    v36[1] = 3221225472;
    v36[0] = MEMORY[0x263EF8330];
    v36[2] = __29__RUIPage__keyboardWillShow___block_invoke;
    v36[3] = &unk_264211798;
    v36[4] = self;
    double v39 = v32 + v34;
    id v37 = v7;
    id v38 = v30;
    id v35 = v30;
    [v33 performOnControllers:v36];
  }
}

void __29__RUIPage__keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) hasMultiChoiceView] & 1) == 0) {
    [*(id *)(a1 + 32) _setContentInset:*(double *)(a1 + 56)];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v2 = [*(id *)(a1 + 32) accessoryViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v7 tableViewDidUpdateContentInset:*(void *)(a1 + 40)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        if (objc_msgSend(v13, "_isAncestorOfFirstResponder", (void)v21))
        {
          double v14 = [*(id *)(a1 + 32) elementProvider];
          double v15 = [v14 tableViewOM];
          double v16 = [v15 tableView];
          double v17 = [*(id *)(a1 + 32) elementProvider];
          double v18 = [v17 tableViewOM];
          int v19 = [v18 tableView];
          uint64_t v20 = [v19 indexPathForCell:v13];
          [v16 scrollToRowAtIndexPath:v20 atScrollPosition:2 animated:1];

          goto LABEL_22;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_22:
}

- (void)_keyboardWillHide:(id)a3
{
  uint64_t v4 = [(RUIPage *)self elementProvider];
  uint64_t v5 = [v4 tableViewOM];
  BOOL v6 = [v5 tableView];

  id v7 = [v6 window];

  if (v7)
  {
    id v8 = [(RUIPage *)self tableViewOM];
    char v9 = [v8 isShowingPicker];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = (void *)MEMORY[0x263F828D0];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __29__RUIPage__keyboardWillHide___block_invoke;
      v11[3] = &unk_2642117C0;
      void v11[4] = self;
      id v12 = v6;
      [v10 performOnControllers:v11];
    }
  }
}

void __29__RUIPage__keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) hasMultiChoiceView] & 1) == 0) {
    [*(id *)(a1 + 32) _setContentInset:0.0];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "accessoryViews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tableViewDidUpdateContentInset:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id v8 = [*(id *)(a1 + 32) view];
  [v8 setNeedsLayout];
}

- (void)setPageElement:(id)a3
{
  uint64_t v5 = (RUIPageElement *)a3;
  pageElement = self->_pageElement;
  long long v9 = v5;
  if (pageElement != v5)
  {
    [(RUIPageElement *)pageElement setPage:0];
    objc_storeStrong((id *)&self->_pageElement, a3);
    [(RUIPageElement *)self->_pageElement setPage:self];
    id v7 = [[RUITopLevelElementProvider alloc] initWithParentElement:v9];
    elementProvider = self->_elementProvider;
    self->_elementProvider = v7;

    [(RUIPage *)self addElementProvider:self->_elementProvider];
    [(RUITopLevelElementProvider *)self->_elementProvider setDelegate:self];
  }
}

- (void)_setParentPage:(id)a3
{
}

- (void)_addChildPage:(id)a3
{
  id v4 = a3;
  childPages = self->_childPages;
  id v8 = v4;
  if (!childPages)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = self->_childPages;
    self->_childPages = v6;

    id v4 = v8;
    childPages = self->_childPages;
  }
  [(NSMutableArray *)childPages addObject:v4];
  [v8 _setParentPage:self];
}

- (void)_updateWithCompletedChild:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 tableViewOM];
  uint64_t v58 = self;
  uint64_t v6 = [(RUIPage *)self tableViewOM];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v7 = [v5 sections];
  uint64_t v59 = [v7 countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v59)
  {
    id v50 = v4;
    double v51 = v6;
    double v49 = v5;
    id v8 = 0;
    v63 = 0;
    v64 = 0;
    obuint64_t j = v7;
    uint64_t v56 = *(void *)v78;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v78 != v56) {
          objc_enumerationMutation(obj);
        }
        v61 = v9;
        long long v10 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v9);
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v11 = objc_msgSend(v10, "rows", v49, v50);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v83 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              double v16 = v8;
              if (*(void *)v74 != v14) {
                objc_enumerationMutation(v11);
              }
              double v17 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              double v18 = [v17 attributes];
              id v8 = [v18 objectForKeyedSubscript:@"radioGroup"];

              if ([v8 length])
              {
                int v19 = [v17 tableCell];
                uint64_t v20 = [v19 remoteUIAccessoryType];

                if (v20 == 3)
                {
                  uint64_t v21 = [v18 objectForKeyedSubscript:@"value"];

                  uint64_t v22 = [v18 objectForKeyedSubscript:@"label"];

                  v63 = (void *)v22;
                  v64 = (void *)v21;
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v73 objects:v83 count:16];
          }
          while (v13);
        }

        long long v9 = v61 + 1;
      }
      while (v61 + 1 != (char *)v59);
      uint64_t v59 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
    }
    while (v59);

    if (!v64)
    {
      uint64_t v5 = v49;
      id v4 = v50;
      uint64_t v6 = v51;
      goto LABEL_39;
    }
    uint64_t v6 = v51;
    if (!v63)
    {
      uint64_t v5 = v49;
      id v4 = v50;
      goto LABEL_39;
    }
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v52 = [v51 sections];
    id obja = (id)[v52 countByEnumeratingWithState:&v69 objects:v82 count:16];
    if (obja)
    {
      uint64_t v53 = *(void *)v70;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v70 != v53) {
            objc_enumerationMutation(v52);
          }
          uint64_t v57 = v23;
          long long v24 = *(void **)(*((void *)&v69 + 1) + 8 * v23);
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v62 = [v24 rows];
          uint64_t v25 = [v62 countByEnumeratingWithState:&v65 objects:v81 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v66;
            do
            {
              uint64_t v28 = 0;
              uint64_t v60 = v26;
              do
              {
                if (*(void *)v66 != v27) {
                  objc_enumerationMutation(v62);
                }
                CGFloat v29 = *(void **)(*((void *)&v65 + 1) + 8 * v28);
                long long v30 = [v29 attributes];
                uint64_t v31 = (void *)[v30 mutableCopy];

                double v32 = [v29 linkedPage];
                id v33 = [v32 pageID];
                int v34 = [v33 isEqualToString:v8];

                if (v34)
                {
                  id v35 = [v29 tableCell];
                  v36 = [v35 ruiDetailTextLabel];
                  [v36 setText:v63];

                  id v37 = [v29 tableCell];
                  id v38 = [v37 ruiDetailTextLabel];
                  double v39 = [(RUIPage *)v58 style];
                  CGRect v40 = [v39 selectPageDetailTextColor];
                  [v38 setTextColor:v40];

                  [v31 setObject:v64 forKeyedSubscript:@"value"];
                  uint64_t v26 = v60;
                  [v31 setObject:v63 forKeyedSubscript:@"detailLabel"];
                }
                [v29 setAttributes:v31];
                CGRect v41 = [v29 tableCell];
                [v41 setNeedsLayout];

                ++v28;
              }
              while (v26 != v28);
              uint64_t v26 = [v62 countByEnumeratingWithState:&v65 objects:v81 count:16];
            }
            while (v26);
          }

          uint64_t v23 = v57 + 1;
        }
        while ((id)(v57 + 1) != obja);
        id obja = (id)[v52 countByEnumeratingWithState:&v69 objects:v82 count:16];
      }
      while (obja);
    }

    v42 = [(RUIPage *)v58 elementProvider];
    v43 = [v42 tableViewOM];
    v44 = [v43 objectModel];
    double v45 = [(RUIPage *)v58 elementProvider];
    double v46 = [v45 tableViewOM];
    [v44 tableViewOMDidChange:v46];

    id v7 = [(RUIPage *)v58 elementProvider];
    v47 = [v7 tableViewOM];
    double v48 = [v47 tableView];
    [v48 reloadData];

    uint64_t v5 = v49;
    id v4 = v50;
    uint64_t v6 = v51;
  }
  else
  {
    v63 = 0;
    v64 = 0;
    id v8 = 0;
  }

LABEL_39:
}

- (void)_updateParentPage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentPage);
  [WeakRetained _updateWithCompletedChild:self];
}

- (id)subElementWithID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(RUIPage *)self _childElements];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = [v10 identifier];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = v10;
LABEL_13:
          uint64_t v14 = v13;
          goto LABEL_14;
        }
        id v13 = [v10 subElementWithID:v4];
        if (v13) {
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v14 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)_childElements
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(RUIPage *)self primaryElement];
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v4);

  uint64_t v5 = [(RUIPage *)self elementProvider];
  uint64_t v6 = [v5 tableViewOM];
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v6);

  uint64_t v7 = [(RUIPage *)self elementProvider];
  uint64_t v8 = [v7 webViewOM];
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v8);

  long long v9 = [(RUIPage *)self elementProvider];
  long long v10 = [v9 passcodeViewOM];
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v10);

  long long v11 = [(RUIPage *)self elementProvider];
  int v12 = [v11 spinnerViewOM];
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", v12);

  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_leftNavigationBarButtonItem);
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_rightNavigationBarButtonItem);
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_leftToolbarButtonItem);
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_middleToolbarButtonItem);
  objc_msgSend(v3, "_remoteUI_addObjectIfNotNil:", self->_rightToolbarButtonItem);
  return v3;
}

- (id)viewForElementIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(RUIPage *)self _childElements];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) viewForElementIdentifier:v4];
        if (v10)
        {
          long long v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  long long v11 = 0;
LABEL_11:

  return v11;
}

- (id)elementsWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(RUIPage *)self primaryElement];
  uint64_t v7 = [v6 name];
  int v8 = [v7 isEqualToString:v4];

  if (v8)
  {
    long long v9 = [(RUIPage *)self primaryElement];
    [v5 addObject:v9];
  }
  uint64_t v10 = [(RUIPage *)self elementProvider];
  long long v11 = [v10 tableViewOM];
  int v12 = [v11 name];
  int v13 = [v12 isEqualToString:v4];

  if (v13)
  {
    long long v14 = [(RUIPage *)self elementProvider];
    long long v15 = [v14 tableViewOM];
    [v5 addObject:v15];
  }
  long long v16 = [(RUIPage *)self elementProvider];
  long long v17 = [v16 webViewOM];
  uint64_t v18 = [v17 name];
  int v19 = [v18 isEqualToString:v4];

  if (v19)
  {
    uint64_t v20 = [(RUIPage *)self elementProvider];
    uint64_t v21 = [v20 webViewOM];
    [v5 addObject:v21];
  }
  uint64_t v22 = [(RUIPage *)self elementProvider];
  uint64_t v23 = [v22 passcodeViewOM];
  long long v24 = [v23 name];
  int v25 = [v24 isEqualToString:v4];

  if (v25)
  {
    uint64_t v26 = [(RUIPage *)self elementProvider];
    uint64_t v27 = [v26 passcodeViewOM];
    [v5 addObject:v27];
  }
  uint64_t v28 = [(RUIPage *)self elementProvider];
  CGFloat v29 = [v28 spinnerViewOM];
  long long v30 = [v29 name];
  int v31 = [v30 isEqualToString:v4];

  if (v31)
  {
    double v32 = [(RUIPage *)self elementProvider];
    id v33 = [v32 spinnerViewOM];
    [v5 addObject:v33];
  }
  int v34 = [(RUIPage *)self primaryElement];
  id v35 = [v34 subElementsWithName:v4];
  [v5 addObjectsFromArray:v35];

  v36 = [(RUIPage *)self elementProvider];
  id v37 = [v36 tableViewOM];
  id v38 = [v37 subElementsWithName:v4];
  [v5 addObjectsFromArray:v38];

  double v39 = [(RUIPage *)self elementProvider];
  CGRect v40 = [v39 webViewOM];
  CGRect v41 = [v40 subElementsWithName:v4];
  [v5 addObjectsFromArray:v41];

  v42 = [(RUIPage *)self elementProvider];
  v43 = [v42 passcodeViewOM];
  v44 = [v43 subElementsWithName:v4];
  [v5 addObjectsFromArray:v44];

  double v45 = [(RUIPage *)self elementProvider];
  double v46 = [v45 spinnerViewOM];
  v47 = [v46 subElementsWithName:v4];
  [v5 addObjectsFromArray:v47];

  double v48 = [(RUIElement *)self->_leftNavigationBarButtonItem name];
  LODWORD(v46) = [v48 isEqualToString:v4];

  if (v46) {
    [v5 addObject:self->_leftNavigationBarButtonItem];
  }
  double v49 = [(RUIElement *)self->_rightNavigationBarButtonItem name];
  int v50 = [v49 isEqualToString:v4];

  if (v50) {
    [v5 addObject:self->_rightNavigationBarButtonItem];
  }
  double v51 = [(RUIElement *)self->_leftToolbarButtonItem name];
  int v52 = [v51 isEqualToString:v4];

  if (v52) {
    [v5 addObject:self->_leftToolbarButtonItem];
  }
  uint64_t v53 = [(RUIElement *)self->_middleToolbarButtonItem name];
  int v54 = [v53 isEqualToString:v4];

  if (v54) {
    [v5 addObject:self->_middleToolbarButtonItem];
  }
  v55 = [(RUIElement *)self->_rightToolbarButtonItem name];
  int v56 = [v55 isEqualToString:v4];

  if (v56) {
    [v5 addObject:self->_rightToolbarButtonItem];
  }

  return v5;
}

- (RUITableView)tableViewOM
{
  v2 = [(RUIPage *)self elementProvider];
  uint64_t v3 = [v2 makeTableViewOM];

  return (RUITableView *)v3;
}

- (void)topLevelElementProvider:(id)a3 didCreateTableView:(id)a4
{
  if (!self->_containerView) {
    return;
  }
  id v5 = a4;
  id v14 = [v5 tableView];
  uint64_t v6 = [(RUIPage *)self traitCollection];
  [v5 traitCollectionDidChangeFrom:0 toTraitCollection:v6];

  if ([(RUIPage *)self hasWebView])
  {
    [(UIView *)self->_containerView insertSubview:v14 atIndex:0];
  }
  else
  {
    uint64_t v7 = [(RUIPage *)self elementProvider];
    uint64_t v8 = [v7 primaryElement];
    if (v8)
    {
      long long v9 = (void *)v8;
      uint64_t v10 = [(RUIPage *)self elementProvider];
      long long v11 = [v10 primaryElement];
      int v12 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    [(UIView *)self->_containerView addSubview:v14];
  }
LABEL_10:
}

- (BOOL)hasTableView
{
  v2 = [(RUIPage *)self elementProvider];
  char v3 = [v2 hasTableView];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RUIPage;
  [(RUIPage *)&v12 traitCollectionDidChange:v4];
  id v5 = [(RUIPage *)self elementProvider];
  uint64_t v6 = [v5 tableViewOM];

  if (v6)
  {
    uint64_t v7 = [(RUIPage *)self elementProvider];
    uint64_t v8 = [v7 tableViewOM];
    long long v9 = [(RUIPage *)self traitCollection];
    [v8 traitCollectionDidChangeFrom:v4 toTraitCollection:v9];
  }
  [(RUIBarButtonItem *)self->_leftNavigationBarButtonItem updateBackButtonColors];
  uint64_t v10 = [(RUIPage *)self style];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  [v10 applyToObjectModel:WeakRetained];
}

- (RUIWebView)webViewOM
{
  v2 = [(RUIPage *)self elementProvider];
  char v3 = [v2 makeWebViewOM];

  return (RUIWebView *)v3;
}

- (void)topLevelElementProvider:(id)a3 didCreateWebView:(id)a4
{
  id v7 = a4;
  if ([(RUIPage *)self isPrimaryElementNilOrKindOf:objc_opt_class()])
  {
    containerView = self->_containerView;
    uint64_t v6 = [v7 webView];
    [(UIView *)containerView addSubview:v6];
  }
}

- (BOOL)hasWebView
{
  v2 = [(RUIPage *)self elementProvider];
  char v3 = [v2 hasWebView];

  return v3;
}

- (RUITopLevelPageElement)primaryElement
{
  v2 = [(RUIPage *)self elementProvider];
  char v3 = [v2 primaryElement];

  return (RUITopLevelPageElement *)v3;
}

- (void)topLevelElementProvider:(id)a3 didSetPrimaryElement:(id)a4 previousElement:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  if (v14 != v7)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v7 viewController];
    }
    else
    {
      uint64_t v8 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      long long v9 = [v14 viewController];
    }
    else
    {
      long long v9 = 0;
    }
    [v8 willMoveToParentViewController:0];
    [v8 removeFromParentViewController];
    uint64_t v10 = [v7 view];
    [v10 removeFromSuperview];

    if (v9) {
      [(RUIPage *)self addChildViewController:v9];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    [v14 setObjectModel:WeakRetained];

    containerView = self->_containerView;
    if (containerView)
    {
      int v13 = [v14 view];
      [(UIView *)containerView addSubview:v13];
    }
    [v9 didMoveToParentViewController:self];
  }
}

- (RUIPasscodeView)passcodeViewOM
{
  v2 = [(RUIPage *)self elementProvider];
  char v3 = [v2 makePasscodeViewOM];

  return (RUIPasscodeView *)v3;
}

- (void)topLevelElementProvider:(id)a3 didCreatePasscodeView:(id)a4
{
  id v5 = a4;
  if (self->_containerView)
  {
    id v7 = v5;
    uint64_t v6 = [v5 passcodeView];
    if ([(RUIPage *)self isPrimaryElementNilOrKindOf:objc_opt_class()])
    {
      [v7 setShouldManageScrollViewInsets:1];
      [(UIView *)self->_containerView addSubview:v6];
    }

    id v5 = v7;
  }
}

- (BOOL)hasPasscodeView
{
  v2 = [(RUIPage *)self elementProvider];
  char v3 = [v2 hasPasscodeView];

  return v3;
}

- (RUISpinnerView)spinnerViewOM
{
  v2 = [(RUIPage *)self elementProvider];
  char v3 = [v2 makeSpinnerViewOM];

  return (RUISpinnerView *)v3;
}

- (void)topLevelElementProvider:(id)a3 didCreateSpinnerView:(id)a4
{
  if (self->_containerView)
  {
    objc_msgSend(a4, "spinnerView", a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(UIView *)self->_containerView addSubview:v5];
  }
}

- (BOOL)hasSpinnerView
{
  v2 = [(RUIPage *)self elementProvider];
  char v3 = [v2 hasSpinnerView];

  return v3;
}

- (BOOL)multiChoiceViewFloatsAboveKeyboard
{
  return 0;
}

- (BOOL)hasMultiChoiceView
{
  return 0;
}

- (BOOL)hasChoiceView
{
  return 0;
}

- (BOOL)hasToolBar
{
  return 0;
}

- (void)setObjectModel:(id)a3
{
  p_objectModel = &self->_objectModel;
  id v5 = a3;
  objc_storeWeak((id *)p_objectModel, v5);
  uint64_t v6 = [(RUIPage *)self elementProvider];
  id v7 = [v6 tableViewOM];
  [v7 setObjectModel:v5];

  uint64_t v8 = [(RUIPage *)self elementProvider];
  long long v9 = [v8 webViewOM];
  [v9 setDelegate:v5];

  uint64_t v10 = [(RUIPage *)self elementProvider];
  long long v11 = [v10 passcodeViewOM];
  [v11 setObjectModel:v5];

  objc_super v12 = [(RUIPage *)self elementProvider];
  int v13 = [v12 spinnerViewOM];
  [v13 setObjectModel:v5];

  id v14 = [(RUIPage *)self primaryElement];
  [v14 setObjectModel:v5];
}

- (void)populatePostbackDictionary:(id)a3 elementProvider:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 tableViewOM];
  [v6 populatePostbackDictionary:v11];

  id v7 = [v5 passcodeViewOM];
  [v7 populatePostbackDictionary:v11];

  uint64_t v8 = [v5 primaryElement];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [v5 primaryElement];
    [v10 populatePostbackDictionary:v11];
  }
}

- (void)populatePostbackDictionary:(id)a3
{
  id v4 = a3;
  elementProviders = self->_elementProviders;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__RUIPage_populatePostbackDictionary___block_invoke;
  v7[3] = &unk_264211770;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)elementProviders enumerateObjectsUsingBlock:v7];
}

uint64_t __38__RUIPage_populatePostbackDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) populatePostbackDictionary:*(void *)(a1 + 40) elementProvider:a2];
}

- (void)dealloc
{
  char v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F837E8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837E0] object:0];
  [(RUIPage *)self setLoading:0];
  id v4 = [(RUIPage *)self elementProvider];
  id v5 = [v4 tableViewOM];
  [v5 setObjectModel:0];

  id v6 = [(RUIPage *)self elementProvider];
  id v7 = [v6 webViewOM];
  [v7 setDelegate:0];

  id v8 = [(RUIPage *)self elementProvider];
  char v9 = [v8 passcodeViewOM];
  [v9 setObjectModel:0];

  uint64_t v10 = [(RUIPage *)self elementProvider];
  id v11 = [v10 spinnerViewOM];
  [v11 setObjectModel:0];

  objc_super v12 = [(RUIPage *)self primaryElement];
  [v12 setObjectModel:0];

  v13.receiver = self;
  v13.super_class = (Class)RUIPage;
  [(RUIPage *)&v13 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  containerView = self->_containerView;
  self->_containerView = v4;

  id v6 = [(RUIPage *)self style];
  id v7 = [v6 backgroundColor];

  if (v7)
  {
    id v8 = [(RUIPage *)self style];
    char v9 = [v8 backgroundColor];
    [(UIView *)self->_containerView setBackgroundColor:v9];
  }
  uint64_t v10 = [(RUIPage *)self style];
  id v11 = [v10 tintColor];
  [(UIView *)self->_containerView setTintColor:v11];

  [(UIView *)self->_containerView setAutoresizingMask:18];
  [(RUIPage *)self setView:self->_containerView];
  objc_super v12 = [(RUIPage *)self elementProvider];
  objc_super v13 = [v12 webViewOM];

  if (v13 && [(RUIPage *)self isPrimaryElementNilOrKindOf:objc_opt_class()])
  {
    id v14 = self->_containerView;
    long long v15 = [(RUIPage *)self elementProvider];
    long long v16 = [v15 webViewOM];
    long long v17 = [v16 webView];
    [(UIView *)v14 addSubview:v17];
  }
  uint64_t v18 = [(RUIPage *)self primaryElement];

  if (!v18)
  {
    uint64_t v22 = [(RUIPage *)self elementProvider];
    uint64_t v23 = [v22 tableViewOM];

    long long v24 = [(RUIPage *)self elementProvider];
    int v25 = v24;
    if (v23)
    {
      uint64_t v26 = [v24 tableViewOM];
      uint64_t v20 = [v26 tableView];

      [(UIView *)self->_containerView setPreservesSuperviewLayoutMargins:1];
      BOOL v27 = [(RUIPage *)self hasWebView];
      uint64_t v28 = self->_containerView;
      if (v27) {
        [(UIView *)v28 insertSubview:v20 atIndex:0];
      }
      else {
        [(UIView *)v28 addSubview:v20];
      }
      uint64_t v21 = [(RUIPage *)self elementProvider];
      int v34 = [v21 tableViewOM];
      [v34 addSearchBarToPage:self];

      goto LABEL_20;
    }
    uint64_t v29 = [v24 passcodeViewOM];
    if (v29)
    {
      long long v30 = (void *)v29;
      BOOL v31 = [(RUIPage *)self isPrimaryElementNilOrKindOf:objc_opt_class()];

      if (v31)
      {
        double v32 = self->_containerView;
        uint64_t v20 = [(RUIPage *)self elementProvider];
        uint64_t v21 = [v20 passcodeViewOM];
        uint64_t v33 = [v21 passcodeView];
LABEL_19:
        id v37 = (void *)v33;
        [(UIView *)v32 addSubview:v33];

        goto LABEL_20;
      }
    }
    else
    {
    }
    id v35 = [(RUIPage *)self elementProvider];
    v36 = [v35 spinnerViewOM];

    if (!v36) {
      goto LABEL_21;
    }
    double v32 = self->_containerView;
    uint64_t v20 = [(RUIPage *)self elementProvider];
    uint64_t v21 = [v20 spinnerViewOM];
    uint64_t v33 = [v21 spinnerView];
    goto LABEL_19;
  }
  int v19 = self->_containerView;
  uint64_t v20 = [(RUIPage *)self primaryElement];
  uint64_t v21 = [v20 view];
  [(UIView *)v19 addSubview:v21];
LABEL_20:

LABEL_21:
  [(RUIPage *)self _setupMultiChoiceView];
  [(UIView *)self->_containerView addSubview:self->_toolbar];
  id v38 = [(RUIPage *)self pageElement];
  [v38 configureAccessiblityWithTarget:self->_containerView];
}

- (void)viewDidLoad
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)RUIPage;
  [(RUIPage *)&v14 viewDidLoad];
  id v3 = [(RUIPage *)self elementProvider];
  id v4 = [v3 tableViewOM];
  id v5 = [v4 tableView];
  [v5 reloadData];

  id v6 = [(RUIPage *)self primaryElement];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(RUIPage *)self primaryElement];
    [v8 viewDidLoad];
  }
  char v9 = [(RUIPage *)self attributes];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"refreshOnNotification"];
  if (([v10 BOOLValue] & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  id v11 = [(RUIPage *)self pageID];

  if (v11)
  {
    if (_isInternalInstall())
    {
      objc_super v12 = _RUILoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v13 = [(RUIPage *)self pageID];
        *(_DWORD *)buf = 138412290;
        long long v16 = v13;
        _os_log_impl(&dword_2144F2000, v12, OS_LOG_TYPE_DEFAULT, "Refresh notification listener added for page: %@", buf, 0xCu);
      }
    }
    char v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel__handlePageUpdateRequestedNotification_ name:@"RUIPageRefreshRequestedNotification" object:0];
    goto LABEL_11;
  }
LABEL_12:
  [(RUIPage *)self setPreferredContentSize:RemoteUIPreferredContentSize()];
}

- (void)_handlePageUpdateRequestedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(RUIPage *)self pageID];
  char v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = [(RUIPage *)self attributes];
    char v9 = [v8 objectForKeyedSubscript:@"refreshUrl"];

    uint64_t v10 = [(RUIPage *)self attributes];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"refreshHttpMethod"];
    objc_super v12 = (void *)v11;
    objc_super v13 = @"GET";
    if (v11) {
      objc_super v13 = (__CFString *)v11;
    }
    objc_super v14 = v13;

    if (_isInternalInstall())
    {
      long long v15 = _RUILoggingFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = [(RUIPage *)self pageID];
        int v18 = 138412802;
        int v19 = v16;
        __int16 v20 = 2112;
        uint64_t v21 = v9;
        __int16 v22 = 2112;
        uint64_t v23 = v14;
        _os_log_impl(&dword_2144F2000, v15, OS_LOG_TYPE_DEFAULT, "Notification received for page %@. will refresh from url: %@ method: %@", (uint8_t *)&v18, 0x20u);
      }
    }
    uint64_t v17 = [(RUIPage *)self objectModel];
    [v17 openLink:v9 HTTPMethod:v14 completion:0];
    goto LABEL_12;
  }
  if (_isInternalInstall())
  {
    char v9 = _RUILoggingFacility();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    objc_super v14 = [v4 object];
    uint64_t v17 = [(RUIPage *)self pageID];
    int v18 = 138412546;
    int v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring refresh notification requestedPage: %@. currentPage: %@", (uint8_t *)&v18, 0x16u);
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RUIPage;
  -[RUIPage viewWillAppear:](&v22, sel_viewWillAppear_);
  id v5 = [(RUIPage *)self elementProvider];
  id v6 = [v5 tableViewOM];
  [v6 viewWillAppear:v3];

  char v7 = [(RUIPage *)self elementProvider];
  id v8 = [v7 passcodeViewOM];
  [v8 viewWillAppear:v3];

  char v9 = [(RUIPage *)self elementProvider];
  uint64_t v10 = [v9 spinnerViewOM];
  [v10 viewWillAppear:v3];

  uint64_t v11 = [(RUIPage *)self primaryElement];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    objc_super v13 = [(RUIPage *)self primaryElement];
    [v13 viewWillAppear:v3];
  }
  [(RUIPage *)self preferredContentSize];
  double v15 = v14;
  double v17 = v16;
  int v18 = [(RUIPage *)self navigationController];
  objc_msgSend(v18, "setPreferredContentSize:", v15, v17);

  int v19 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v20 = *MEMORY[0x263F837E8];
  [v19 removeObserver:self name:*MEMORY[0x263F837E8] object:0];
  uint64_t v21 = *MEMORY[0x263F837E0];
  [v19 removeObserver:self name:*MEMORY[0x263F837E0] object:0];
  [v19 addObserver:self selector:sel__keyboardWillShow_ name:v20 object:0];
  [v19 addObserver:self selector:sel__keyboardWillHide_ name:v21 object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)RUIPage;
  -[RUIPage viewDidAppear:](&v29, sel_viewDidAppear_);
  id v5 = [(RUIPage *)self elementProvider];
  id v6 = [v5 tableViewOM];
  [v6 viewDidAppear:v3];

  char v7 = [(RUIPage *)self elementProvider];
  id v8 = [v7 passcodeViewOM];
  [v8 viewDidAppear:v3];

  char v9 = [(RUIPage *)self elementProvider];
  uint64_t v10 = [v9 webViewOM];
  [v10 viewDidAppear:v3];

  uint64_t v11 = [(RUIPage *)self pageElement];
  [v11 reportInternalRenderEvent];

  if (UIKeyboardAutomaticIsOnScreen() && ![(RUIPage *)self hasMultiChoiceView])
  {
    char v12 = [(RUIPage *)self view];
    objc_super v13 = [v12 keyboardSceneDelegate];

    double v14 = [(RUIPage *)self view];
    [v13 visibleFrameInView:v14];
    double v16 = v15;

    [(RUIPage *)self _setContentInset:v16];
  }
  double v17 = [(RUIPage *)self primaryElement];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    int v19 = [(RUIPage *)self primaryElement];
    [v19 viewDidAppear:v3];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v20 = self->_didAppearCallbacks;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * v24) + 16))(*(void *)(*((void *)&v25 + 1) + 8 * v24));
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v22);
  }

  [(NSMutableArray *)self->_didAppearCallbacks removeAllObjects];
}

- (void)addElementProvider:(id)a3
{
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RUIPage;
  [(RUIPage *)&v4 viewIsAppearing:a3];
  [(UIView *)self->_containerView layoutIfNeeded];
  [(RUIPage *)self updatePreferredContentSize];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RUIPage;
  -[RUIPage viewWillDisappear:](&v16, sel_viewWillDisappear_);
  id v5 = [(RUIPage *)self elementProvider];
  id v6 = [v5 tableViewOM];
  [v6 viewWillDisappear:v3];

  char v7 = [(RUIPage *)self elementProvider];
  id v8 = [v7 passcodeViewOM];
  [v8 viewWillDisappear:v3];

  char v9 = [(RUIPage *)self elementProvider];
  uint64_t v10 = [v9 spinnerViewOM];
  [v10 viewWillDisappear:v3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  [WeakRetained cleanupRefreshTimer];

  char v12 = [(RUIPage *)self primaryElement];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    double v14 = [(RUIPage *)self primaryElement];
    [v14 viewWillDisappear:v3];
  }
  double v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 removeObserver:self name:*MEMORY[0x263F837E8] object:0];
  [v15 removeObserver:self name:*MEMORY[0x263F837E0] object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RUIPage;
  -[RUIPage viewDidDisappear:](&v11, sel_viewDidDisappear_);
  id v5 = [(RUIPage *)self elementProvider];
  id v6 = [v5 tableViewOM];
  [v6 viewDidDisappear:v3];

  char v7 = [(RUIPage *)self primaryElement];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(RUIPage *)self primaryElement];
    [v9 viewDidDisappear:v3];
  }
  if ([(RUIPage *)self isMovingFromParentViewController])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    [WeakRetained pageDidDisappear:self];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  p_objectModel = &self->_objectModel;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);

  if (!WeakRetained) {
    return 2;
  }
  id v5 = objc_loadWeakRetained((id *)p_objectModel);
  unint64_t v6 = [v5 supportedInterfaceOrientationsForRUIPage:self];

  return v6;
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)RUIPage;
  [(RUIPage *)&v5 viewWillLayoutSubviews];
  BOOL v3 = [(RUIPage *)self style];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  [v3 applyToObjectModel:WeakRetained];
}

- (BOOL)isPrimaryElementNilOrKindOf:(Class)a3
{
  objc_super v4 = [(RUIPage *)self primaryElement];
  if (v4)
  {
    objc_super v5 = [(RUIPage *)self primaryElement];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

- (double)_buttonTrayLayoutInset
{
  return 0.0;
}

- (double)_buttonTrayScrollInset
{
  return 0.0;
}

- (void)viewDidLayoutSubviews
{
  v137.receiver = self;
  v137.super_class = (Class)RUIPage;
  [(RUIPage *)&v137 viewDidLayoutSubviews];
  [(UIView *)self->_containerView bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(RUIPage *)self view];
  [v11 safeAreaInsets];
  double v133 = v12;
  double v14 = v13;

  toolbar = self->_toolbar;
  double v16 = v10;
  if (toolbar)
  {
    -[UIToolbar sizeThatFits:](toolbar, "sizeThatFits:", v8, v10);
    v138.size.width = v17;
    v138.size.height = v18;
    v138.origin.x = v4;
    v138.origin.y = v6;
    CGRect v139 = CGRectInset(v138, 0.0, 0.0);
    double v16 = v10 - (v14 + v139.size.height);
    -[UIToolbar setFrame:](self->_toolbar, "setFrame:", v139.origin.x, v10 - v139.size.height - v14, v139.size.width);
    [(UIToolbar *)self->_toolbar layoutSubviews];
  }
  double v136 = v8;
  double v134 = v4;
  int v19 = [(RUIPage *)self elementProvider];
  uint64_t v20 = [v19 tableViewOM];
  [v20 searchBarRectInPage:self];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  v140.origin.x = v22;
  v140.origin.y = v24;
  v140.size.width = v26;
  v140.size.height = v28;
  if (!CGRectIsEmpty(v140))
  {
    objc_super v29 = [(RUIPage *)self elementProvider];
    long long v30 = [v29 tableViewOM];
    uint64_t v31 = [v30 searchBar];
    objc_msgSend(v31, "setFrame:", v22, v24, v26, v28);
  }
  v141.origin.x = v22;
  v141.origin.y = v24;
  v141.size.width = v26;
  v141.size.height = v28;
  double MaxY = CGRectGetMaxY(v141);
  v142.origin.x = v22;
  v142.origin.y = v24;
  v142.size.width = v26;
  v142.size.height = v28;
  double v32 = CGRectGetMaxY(v142);
  BOOL v33 = [(RUIPage *)self isPrimaryElementNilOrKindOf:objc_opt_class()];
  BOOL v34 = [(RUIPage *)self isPrimaryElementNilOrKindOf:objc_opt_class()];
  BOOL v35 = [(RUIPage *)self isPrimaryElementNilOrKindOf:objc_opt_class()];
  [(RUIPage *)self _buttonTrayLayoutInset];
  double v37 = v36;
  id v38 = [MEMORY[0x263F828D0] activeKeyboardSceneDelegate];
  char v39 = [v38 isOnScreen];

  CGRect v40 = [(RUIPage *)self elementProvider];
  CGRect v41 = [v40 tableViewOM];
  v42 = v41;
  if (v41 && v34)
  {

    double v43 = v136;
    if (v39) {
      goto LABEL_11;
    }
    v44 = [(RUIPage *)self elementProvider];
    double v45 = [v44 tableViewOM];
    double v46 = [v45 tableView];
    [v46 contentInset];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;

    [(RUIPage *)self _buttonTrayScrollInset];
    double v132 = v37;
    double v53 = v10;
    double v54 = v6;
    double v56 = v55;
    uint64_t v57 = [(RUIPage *)self elementProvider];
    uint64_t v58 = [v57 tableViewOM];
    uint64_t v59 = [v58 tableView];
    objc_msgSend(v59, "setContentInset:", v48, v50, v56, v52);

    CGRect v40 = [(RUIPage *)self elementProvider];
    v42 = [v40 tableViewOM];
    uint64_t v60 = [v42 tableView];
    double v61 = v50;
    double v43 = v136;
    double v62 = v56;
    double v6 = v54;
    double v10 = v53;
    double v37 = v132;
    objc_msgSend(v60, "setVerticalScrollIndicatorInsets:", v48, v61, v62, v52);
  }
  else
  {
    double v43 = v136;
  }

LABEL_11:
  double v63 = v16 - v32;
  v64 = [(RUIPage *)self elementProvider];
  long long v65 = [v64 webViewOM];
  if (v65) {
    BOOL v66 = v35;
  }
  else {
    BOOL v66 = 0;
  }

  if (v66)
  {
    long long v67 = [(RUIPage *)self elementProvider];
    long long v68 = [v67 webViewOM];
    long long v69 = [v68 webView];
    long long v70 = [v69 scrollView];
    [v70 contentInset];
    double v72 = v71;
    double v74 = v73;
    double v76 = v75;

    [(RUIPage *)self _buttonTrayScrollInset];
    double v78 = v77;
    long long v79 = [(RUIPage *)self elementProvider];
    long long v80 = [v79 webViewOM];
    v81 = [v80 webView];
    v82 = [v81 scrollView];
    objc_msgSend(v82, "setContentInset:", v72, v74, v78, v76);

    v83 = [(RUIPage *)self elementProvider];
    v84 = [v83 webViewOM];
    uint64_t v85 = [v84 webView];
    v86 = [v85 scrollView];
    double v87 = v78;
    double v43 = v136;
    objc_msgSend(v86, "setVerticalScrollIndicatorInsets:", v72, v74, v87, v76);
  }
  double v88 = v63 - v37;
  if (+[RUIPlatform isAppleTV])
  {
    v89 = [(RUIPage *)self elementProvider];
    v90 = [v89 tableViewOM];
    v91 = [v90 attributes];
    v92 = [v91 objectForKeyedSubscript:@"splitPosition"];
    int v93 = [v92 isEqualToString:@"leftHalf"];

    if (v93)
    {
      double v94 = v134 + 120.0;
      double v95 = v43 * 0.5;
      goto LABEL_21;
    }
    v96 = [(RUIPage *)self elementProvider];
    v97 = [v96 tableViewOM];
    v98 = [v97 attributes];
    v99 = [v98 objectForKeyedSubscript:@"splitPosition"];
    int v100 = [v99 isEqualToString:@"rightHalf"];

    if (v100)
    {
      v143.origin.x = v134;
      v143.origin.y = v6;
      v143.size.width = v43;
      v143.size.height = v10;
      double v94 = (CGRectGetMaxX(v143) - v134) * 0.5 + 120.0;
      double v95 = v43 * 0.5;
LABEL_21:
      double v101 = v95 + -240.0;
      if (!v34) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
  }
  [(RUIPage *)self customMargin];
  if (v102 >= 0.0)
  {
    [(RUIPage *)self customMargin];
    double v101 = v43 + v107 * -2.0;
    [(RUIPage *)self customMargin];
    double v94 = v134 + v108;
    if (!v34) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  [(RUIPage *)self customEdgeInsets];
  double v94 = v134 + v103;
  double MaxY = MaxY + v104;
  double v101 = v43 - (v103 + v105);
  double v88 = v88 - (v104 + v106);
  if (v34)
  {
LABEL_27:
    v109 = [(RUIPage *)self elementProvider];
    v110 = [v109 tableViewOM];
    v111 = [v110 tableView];
    objc_msgSend(v111, "setFrame:", v94, MaxY, v101, v88);
  }
LABEL_28:
  v112 = [(RUIPage *)self elementProvider];
  v113 = [v112 tableViewOM];
  [v113 viewDidLayout];

  if (v35)
  {
    v114 = [(RUIPage *)self elementProvider];
    v115 = [v114 webViewOM];
    v116 = [v115 webView];
    objc_msgSend(v116, "setFrame:", v94, MaxY, v101, v88);
  }
  v117 = [(RUIPage *)self elementProvider];
  v118 = [v117 spinnerViewOM];
  [v118 viewDidLayout];

  if (v33)
  {
    v119 = [(RUIPage *)self elementProvider];
    v120 = [v119 passcodeViewOM];
    v121 = [v120 passcodeView];
    objc_msgSend(v121, "setFrame:", v134, v133, v43, v10 - v133);
  }
  v122 = [(RUIPage *)self elementProvider];
  v123 = [v122 passcodeViewOM];
  [v123 viewDidLayout];

  v124 = [(RUIPage *)self primaryElement];
  v125 = [v124 view];

  if (objc_opt_respondsToSelector())
  {
    [v125 contentInset];
    [v125 setContentInset:v133];
  }
  v126 = [(RUIPage *)self primaryElement];
  v127 = [v126 view];
  objc_msgSend(v127, "setFrame:", v134, v6, v43, v10);

  v128 = [(RUIPage *)self primaryElement];
  uint64_t v129 = [v128 view];
  [(id)v129 layoutIfNeeded];

  v130 = [(RUIPage *)self primaryElement];
  LOBYTE(v129) = objc_opt_respondsToSelector();

  if (v129)
  {
    v131 = [(RUIPage *)self primaryElement];
    [v131 viewDidLayout];
  }
}

- (id)preferredFocusEnvironments
{
  v11[1] = *MEMORY[0x263EF8340];
  double v3 = [(RUIPage *)self primaryElement];

  if (v3)
  {
    CGFloat v4 = [(RUIPage *)self primaryElement];
    double v5 = [v4 view];
    v11[0] = v5;
    double v6 = (void **)v11;
LABEL_7:
    double v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v6, 1, v9, v10, v11[0]);

    goto LABEL_8;
  }
  if ([(RUIPage *)self hasTableView])
  {
    CGFloat v4 = [(RUIPage *)self tableViewOM];
    double v5 = [v4 tableView];
    double v10 = v5;
    double v6 = &v10;
    goto LABEL_7;
  }
  if ([(RUIPage *)self hasPasscodeView])
  {
    CGFloat v4 = [(RUIPage *)self passcodeViewOM];
    double v5 = [v4 passcodeView];
    double v9 = v5;
    double v6 = &v9;
    goto LABEL_7;
  }
  double v7 = 0;
LABEL_8:
  return v7;
}

- (void)addDidAppearBlock:(id)a3
{
  id v4 = a3;
  didAppearCallbacks = self->_didAppearCallbacks;
  aBlock = v4;
  if (!didAppearCallbacks)
  {
    double v6 = (NSMutableArray *)objc_opt_new();
    double v7 = self->_didAppearCallbacks;
    self->_didAppearCallbacks = v6;

    id v4 = aBlock;
    didAppearCallbacks = self->_didAppearCallbacks;
  }
  double v8 = _Block_copy(v4);
  [(NSMutableArray *)didAppearCallbacks addObject:v8];
}

- (BOOL)_shouldShowMultiChoiceElement
{
  if (self->_toolbar) {
    return 0;
  }
  double v3 = [(RUIPage *)self elementProvider];
  id v4 = [v3 spinnerViewOM];
  BOOL v2 = v4 == 0;

  return v2;
}

- (void)dismissIfPresentedWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  double v5 = [(RUIPage *)self navigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v7 = [(RUIPage *)self navigationController];
    [v7 dismissViewControllerAnimated:1 completion:v4];
  }
  else
  {
    double v8 = [(RUIPage *)self presentingViewController];

    if (v8)
    {
      if (_isInternalInstall())
      {
        double v9 = _RUILoggingFacility();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)objc_super v11 = 0;
          _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing modally presented view controller.", v11, 2u);
        }
      }
      [(RUIPage *)self dismissViewControllerAnimated:1 completion:v4];
    }
    else
    {
      double v10 = _RUILoggingFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[RUIPage dismissIfPresentedWithCompletion:](v10);
      }

      v4[2](v4);
    }
  }
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)pageID
{
  return self->_pageID;
}

- (void)setPageID:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (RUIPageElement)pageElement
{
  return self->_pageElement;
}

- (RUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (NSString)validationFunction
{
  return self->_validationFunction;
}

- (void)setValidationFunction:(id)a3
{
}

- (NSString)navTitle
{
  return self->_navTitle;
}

- (NSString)navSubTitle
{
  return self->_navSubTitle;
}

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (BOOL)showsTitlesAsHeaderViews
{
  return self->_showsTitlesAsHeaderViews;
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (RUIBarButtonItem)rightNavigationBarButtonItem
{
  return self->_rightNavigationBarButtonItem;
}

- (RUIBarButtonItem)leftNavigationBarButtonItem
{
  return self->_leftNavigationBarButtonItem;
}

- (RUIBarButtonItem)rightToolbarButtonItem
{
  return self->_rightToolbarButtonItem;
}

- (RUIBarButtonItem)leftToolbarButtonItem
{
  return self->_leftToolbarButtonItem;
}

- (RUIBarButtonItem)middleToolbarButtonItem
{
  return self->_middleToolbarButtonItem;
}

- (UIBarButtonItem)rightToolbarItem
{
  return self->_rightToolbarItem;
}

- (void)setRightToolbarItem:(id)a3
{
}

- (UIBarButtonItem)leftToolbarItem
{
  return self->_leftToolbarItem;
}

- (void)setLeftToolbarItem:(id)a3
{
}

- (UIBarButtonItem)middleToolbarItem
{
  return self->_middleToolbarItem;
}

- (void)setMiddleToolbarItem:(id)a3
{
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (RUIObjectModel)objectModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  return (RUIObjectModel *)WeakRetained;
}

- (NSArray)childPages
{
  return &self->_childPages->super;
}

- (RUIPage)parentPage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentPage);
  return (RUIPage *)WeakRetained;
}

- (double)customMargin
{
  return self->_customMargin;
}

- (UIEdgeInsets)customEdgeInsets
{
  double top = self->_customEdgeInsets.top;
  double left = self->_customEdgeInsets.left;
  double bottom = self->_customEdgeInsets.bottom;
  double right = self->_customEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCustomEdgeInsets:(UIEdgeInsets)a3
{
  self->_customEdgeInsets = a3;
}

- (NSString)loadingTitle
{
  return self->_loadingTitle;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (RUITopLevelElementProvider)elementProvider
{
  return self->_elementProvider;
}

- (void)setElementProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementProvider, 0);
  objc_storeStrong((id *)&self->_loadingTitle, 0);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_storeStrong((id *)&self->_middleToolbarItem, 0);
  objc_storeStrong((id *)&self->_middleToolbarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftToolbarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightToolbarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftNavigationBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightNavigationBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backButtonTitle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_pageElement, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_elementProviders, 0);
  objc_storeStrong((id *)&self->_didAppearCallbacks, 0);
  objc_storeStrong((id *)&self->_childPages, 0);
  objc_destroyWeak((id *)&self->_parentPage);
  objc_storeStrong((id *)&self->_leftFlexSpace, 0);
  objc_storeStrong((id *)&self->_middleFlexSpace, 0);
  objc_storeStrong((id *)&self->_rightToolbarItem, 0);
  objc_storeStrong((id *)&self->_leftToolbarItem, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_navSubTitle, 0);
  objc_storeStrong((id *)&self->_navTitle, 0);
  objc_storeStrong((id *)&self->_validationFunction, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_pageID, 0);
}

- (void)notifyPageDidChangePublisher
{
  BOOL v2 = self;
  sub_2145579B4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26780DE80);
  sub_214557D94(&qword_26780D958);
  sub_214602418();

  swift_release();
}

- (void)dismissIfPresentedWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
}

@end