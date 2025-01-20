@interface OBTableWelcomeController
- (BOOL)_buttonTrayInlined;
- (BOOL)_scrollContentUnderButtonTrayForGroupedStyle;
- (BOOL)_scrollViewContentIsUnderTray;
- (BOOL)adoptTableViewScrollView;
- (BOOL)contentViewUnderButtonTray;
- (OBTableHeaderFooterView)footerContainer;
- (OBTableHeaderFooterView)headerContainer;
- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (UITableView)tableView;
- (UIView)hostedTableFooterView;
- (UIView)hostedTableHeaderView;
- (double)headerViewBottomToTableViewTopPadding;
- (id)scrollView;
- (void)_floatButtonTray;
- (void)_inlineButtonTray;
- (void)_insertPendingTableView;
- (void)_layoutButtonTray;
- (void)_layoutFooterContainerFloatButtonTray;
- (void)_layoutFooterContainerInlineButtonTray;
- (void)_scrollViewDidLayoutSubviews:(id)a3;
- (void)_setTableView:(id)a3;
- (void)_setTableViewNonHeaderFooterDonation:(id)a3;
- (void)_setTableViewWithHeaderFooterDonation:(id)a3;
- (void)_setupScrollView;
- (void)_updateButtonTrayTableFooterContainerSizeIfNeeded;
- (void)_updateDirectionalLayoutMarginsForTableView;
- (void)_updateHeaderFooterViewSizeIfNeeded;
- (void)_updateHeaderTopOffsetConstraint;
- (void)_updateTableHeaderViewSizeIfNeeded;
- (void)loadView;
- (void)setAdoptTableViewScrollView:(BOOL)a3;
- (void)setFooterContainer:(id)a3;
- (void)setHeaderContainer:(id)a3;
- (void)setHostedTableFooterView:(id)a3;
- (void)setHostedTableHeaderView:(id)a3;
- (void)setTableFooterView:(id)a3;
- (void)setTableHeaderView:(id)a3;
- (void)setTableView:(id)a3;
- (void)updateDirectionalLayoutMargins;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OBTableWelcomeController

- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)OBTableWelcomeController;
  result = [(OBWelcomeController *)&v6 initWithTitle:a3 detailText:a4 icon:a5 contentLayout:3];
  if (result) {
    result->_adoptTableViewScrollView = 0;
  }
  return result;
}

- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)OBTableWelcomeController;
  v5 = [(OBWelcomeController *)&v8 initWithTitle:a3 detailText:a4 symbolName:a5];
  objc_super v6 = v5;
  if (v5)
  {
    [(OBWelcomeController *)v5 setContentViewLayout:3];
    v6->_adoptTableViewScrollView = 0;
  }
  return v6;
}

- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  v8.receiver = self;
  v8.super_class = (Class)OBTableWelcomeController;
  result = [(OBWelcomeController *)&v8 initWithTitle:a3 detailText:a4 icon:a5 contentLayout:3];
  if (result) {
    result->_adoptTableViewScrollView = a6;
  }
  return result;
}

- (OBTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  v8.receiver = self;
  v8.super_class = (Class)OBTableWelcomeController;
  result = [(OBWelcomeController *)&v8 initWithTitle:a3 detailText:a4 symbolName:a5 contentLayout:3];
  if (result) {
    result->_adoptTableViewScrollView = a6;
  }
  return result;
}

- (void)setTableView:(id)a3
{
  id v5 = a3;
  if ([(OBTableWelcomeController *)self isViewLoaded]) {
    [(OBTableWelcomeController *)self _setTableView:v5];
  }
  else {
    objc_storeStrong((id *)&self->_tableView, a3);
  }
}

- (void)updateDirectionalLayoutMargins
{
  v3.receiver = self;
  v3.super_class = (Class)OBTableWelcomeController;
  [(OBWelcomeController *)&v3 updateDirectionalLayoutMargins];
  [(OBTableWelcomeController *)self _updateDirectionalLayoutMarginsForTableView];
}

- (void)_updateDirectionalLayoutMarginsForTableView
{
  [(OBBaseWelcomeController *)self directionalLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  v7 = [(OBTableWelcomeController *)self tableView];
  objc_msgSend(v7, "setDirectionalLayoutMargins:", 0.0, v4, 0.0, v6);

  id v15 = +[OBDevice currentDevice];
  if ([v15 type] == 2)
  {
    objc_super v8 = [(OBTableWelcomeController *)self tableView];
    uint64_t v9 = [v8 style];

    if (v9) {
      return;
    }
    v10 = [(OBTableWelcomeController *)self tableView];
    [v10 separatorInset];
    double v12 = v11;
    double v14 = v13;

    id v15 = [(OBTableWelcomeController *)self tableView];
    objc_msgSend(v15, "setSeparatorInset:", v12, v4, v14, v6);
  }
}

- (void)_setTableViewNonHeaderFooterDonation:(id)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_tableView, a3);
  id v20 = a3;
  [(OBTableWelcomeController *)self _updateDirectionalLayoutMarginsForTableView];
  double v5 = [(OBWelcomeController *)self contentView];
  [v5 addSubview:v20];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v28 = [(OBWelcomeController *)self contentView];
  v26 = [v28 topAnchor];
  v27 = [(OBTableWelcomeController *)self tableView];
  v25 = [v27 topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  v23 = [(OBWelcomeController *)self contentView];
  v21 = [v23 leadingAnchor];
  v22 = [(OBTableWelcomeController *)self tableView];
  v19 = [v22 leadingAnchor];
  v17 = [v21 constraintEqualToAnchor:v19];
  v29[1] = v17;
  v16 = [(OBWelcomeController *)self contentView];
  double v6 = [v16 trailingAnchor];
  v7 = [(OBTableWelcomeController *)self tableView];
  objc_super v8 = [v7 trailingAnchor];
  uint64_t v9 = [v6 constraintEqualToAnchor:v8];
  v29[2] = v9;
  v10 = [(OBWelcomeController *)self contentView];
  double v11 = [v10 bottomAnchor];
  double v12 = [(OBTableWelcomeController *)self tableView];
  double v13 = [v12 bottomAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13];
  v29[3] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v18 activateConstraints:v15];
}

- (id)scrollView
{
  if ([(OBTableWelcomeController *)self adoptTableViewScrollView])
  {
    double v3 = [(OBTableWelcomeController *)self tableView];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)OBTableWelcomeController;
    double v3 = [(OBWelcomeController *)&v5 scrollView];
  }
  return v3;
}

- (void)loadView
{
  if ([(OBTableWelcomeController *)self adoptTableViewScrollView])
  {
    double v3 = [[OBTableHeaderFooterView alloc] initWithLayout:0];
    [(OBTableWelcomeController *)self setHeaderContainer:v3];

    double v4 = [[OBTableHeaderFooterView alloc] initWithLayout:1];
    [(OBTableWelcomeController *)self setFooterContainer:v4];

    objc_super v5 = [(OBTableWelcomeController *)self headerContainer];
    double v6 = [(OBWelcomeController *)self headerView];
    [v5 setInternalContentView:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)OBTableWelcomeController;
  [(OBWelcomeController *)&v7 loadView];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)OBTableWelcomeController;
  [(OBBaseWelcomeController *)&v11 viewDidLoad];
  [(OBTableWelcomeController *)self _insertPendingTableView];
  [(OBBaseWelcomeController *)self directionalLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  objc_super v7 = [(OBTableWelcomeController *)self headerContainer];
  [(OBWelcomeController *)self _headerTopOffset];
  double v9 = v8;
  [(OBTableWelcomeController *)self headerViewBottomToTableViewTopPadding];
  objc_msgSend(v7, "setInternalContentPadding:", v9, v4, v10, v6);
}

- (void)_updateHeaderTopOffsetConstraint
{
  if (![(OBTableWelcomeController *)self adoptTableViewScrollView])
  {
    v3.receiver = self;
    v3.super_class = (Class)OBTableWelcomeController;
    [(OBWelcomeController *)&v3 _updateHeaderTopOffsetConstraint];
  }
}

- (void)_setTableViewWithHeaderFooterDonation:(id)a3
{
  v42[3] = *MEMORY[0x1E4F143B8];
  p_tableView = &self->_tableView;
  objc_storeStrong((id *)&self->_tableView, a3);
  id v6 = a3;
  [(UITableView *)*p_tableView setDelegate:self];
  id v7 = v6;
  v39 = v6;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v8 = [(OBTableWelcomeController *)self view];
  [v8 addSubview:v7];

  v40 = [MEMORY[0x1E4F1CA48] array];
  v38 = [(OBTableWelcomeController *)self view];
  v36 = [v38 leadingAnchor];
  v37 = [(OBTableWelcomeController *)self tableView];
  v35 = [v37 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v42[0] = v34;
  v33 = [(OBTableWelcomeController *)self view];
  v32 = [v33 trailingAnchor];
  double v9 = [(OBTableWelcomeController *)self tableView];
  double v10 = [v9 trailingAnchor];
  objc_super v11 = [v32 constraintEqualToAnchor:v10];
  v42[1] = v11;
  double v12 = [(OBTableWelcomeController *)self view];
  double v13 = [v12 bottomAnchor];
  double v14 = [(OBTableWelcomeController *)self tableView];
  id v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v42[2] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
  [v40 addObjectsFromArray:v17];

  v18 = [(OBTableWelcomeController *)self view];
  v19 = [v18 safeAreaLayoutGuide];
  id v20 = [v19 topAnchor];
  v21 = [(OBTableWelcomeController *)self tableView];
  v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v41 = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  [v40 addObjectsFromArray:v24];

  [MEMORY[0x1E4F28DC8] activateConstraints:v40];
  v25 = [(OBTableWelcomeController *)self headerContainer];
  v26 = [(OBTableWelcomeController *)self view];
  [v26 bounds];
  objc_msgSend(v25, "setFrame:", 0.0, 0.0);

  v27 = [(OBTableWelcomeController *)self headerContainer];
  [v27 setNeedsLayout];

  v28 = [(OBTableWelcomeController *)self headerContainer];
  [v28 layoutIfNeeded];

  v29 = [(OBWelcomeController *)self headerView];
  v30 = [(OBTableWelcomeController *)self view];
  [v30 bounds];
  objc_msgSend(v29, "setFrame:", 0.0, 0.0);

  v31 = [(OBTableWelcomeController *)self headerContainer];
  [v39 setTableHeaderView:v31];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OBTableWelcomeController;
  [(OBWelcomeController *)&v3 viewDidLayoutSubviews];
  [(OBTableWelcomeController *)self _updateHeaderFooterViewSizeIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBTableWelcomeController;
  [(OBWelcomeController *)&v5 viewWillAppear:a3];
  double v4 = [(OBTableWelcomeController *)self tableView];
  [v4 setNeedsLayout];

  [(OBTableWelcomeController *)self _updateHeaderFooterViewSizeIfNeeded];
}

- (void)setTableFooterView:(id)a3
{
  [(OBTableWelcomeController *)self setHostedTableFooterView:a3];
  [(OBTableWelcomeController *)self _layoutButtonTray];
}

- (void)setTableHeaderView:(id)a3
{
  [(OBTableWelcomeController *)self setHostedTableHeaderView:a3];
  [(OBBaseWelcomeController *)self directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(OBTableWelcomeController *)self headerContainer];
  double v9 = [(OBTableWelcomeController *)self hostedTableHeaderView];
  [v8 setHostedView:v9];

  double v10 = [(OBTableWelcomeController *)self headerContainer];
  objc_msgSend(v10, "setHostedViewPadding:", 0.0, v5, 0.0, v7);

  objc_super v11 = [(OBTableWelcomeController *)self headerContainer];
  [v11 layoutIfNeeded];

  double v12 = [(OBTableWelcomeController *)self tableView];
  double v13 = [(OBTableWelcomeController *)self headerContainer];
  [v12 setTableHeaderView:v13];

  double v14 = [(OBTableWelcomeController *)self view];
  [v14 setNeedsLayout];

  id v15 = [(OBTableWelcomeController *)self view];
  [v15 layoutIfNeeded];
}

- (double)headerViewBottomToTableViewTopPadding
{
  v2 = +[OBDevice currentDevice];
  uint64_t v3 = [v2 templateType];

  if ((unint64_t)(v3 - 2) > 7) {
    return 57.0;
  }
  else {
    return dbl_19BF4CF38[v3 - 2];
  }
}

- (void)_layoutButtonTray
{
  if (![(OBTableWelcomeController *)self adoptTableViewScrollView]
    || ([(OBTableWelcomeController *)self tableView],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4.receiver = self;
    v4.super_class = (Class)OBTableWelcomeController;
    [(OBWelcomeController *)&v4 _layoutButtonTray];
  }
}

- (void)_floatButtonTray
{
  if ([(OBTableWelcomeController *)self adoptTableViewScrollView])
  {
    uint64_t v3 = [(OBTableWelcomeController *)self footerContainer];
    objc_super v4 = [(OBTableWelcomeController *)self view];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:", 0.0, 0.0);

    double v5 = [(OBTableWelcomeController *)self hostedTableFooterView];
    if (v5)
    {
    }
    else
    {
      double v6 = [(OBWelcomeController *)self buttonTray];
      char v7 = [v6 isHidden];

      if (v7)
      {
        double v8 = *MEMORY[0x1E4F1DB28];
        double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        double v12 = [(OBTableWelcomeController *)self footerContainer];
        objc_msgSend(v12, "setFrame:", v8, v9, v10, v11);

        double v13 = [(OBTableWelcomeController *)self footerContainer];
        [v13 setAutoresizingMask:0];

LABEL_7:
        double v14 = [(OBTableWelcomeController *)self tableView];
        id v15 = [(OBTableWelcomeController *)self footerContainer];
        [v14 setTableFooterView:v15];

        goto LABEL_8;
      }
    }
    [(OBTableWelcomeController *)self _layoutFooterContainerFloatButtonTray];
    goto LABEL_7;
  }
LABEL_8:
  v16.receiver = self;
  v16.super_class = (Class)OBTableWelcomeController;
  [(OBWelcomeController *)&v16 _floatButtonTray];
}

- (void)_inlineButtonTray
{
  if ([(OBTableWelcomeController *)self adoptTableViewScrollView])
  {
    uint64_t v3 = [(OBTableWelcomeController *)self footerContainer];
    objc_super v4 = [(OBTableWelcomeController *)self view];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:", 0.0, 0.0);

    double v5 = [(OBTableWelcomeController *)self footerContainer];
    [v5 setAutoresizingMask:16];

    [(OBTableWelcomeController *)self _layoutFooterContainerInlineButtonTray];
    double v6 = [(OBTableWelcomeController *)self tableView];
    char v7 = [(OBTableWelcomeController *)self footerContainer];
    [v6 setTableFooterView:v7];

    [(OBTableWelcomeController *)self _updateButtonTrayTableFooterContainerSizeIfNeeded];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBTableWelcomeController;
    [(OBWelcomeController *)&v8 _inlineButtonTray];
  }
}

- (BOOL)_buttonTrayInlined
{
  if ([(OBTableWelcomeController *)self adoptTableViewScrollView]
    && ([(OBTableWelcomeController *)self tableView],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    objc_super v4 = [(OBWelcomeController *)self buttonTray];
    double v5 = [v4 superview];
    double v6 = [(OBTableWelcomeController *)self footerContainer];
    BOOL v7 = v5 == v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)OBTableWelcomeController;
    return [(OBWelcomeController *)&v9 _buttonTrayInlined];
  }
  return v7;
}

- (BOOL)contentViewUnderButtonTray
{
  if ([(OBTableWelcomeController *)self adoptTableViewScrollView])
  {
    uint64_t v3 = [(OBTableWelcomeController *)self scrollView];
    [v3 contentSize];
    double v5 = v4;
    double v6 = [(OBTableWelcomeController *)self scrollView];
    [v6 frame];
    double MaxY = CGRectGetMaxY(v13);
    objc_super v8 = [(OBWelcomeController *)self buttonTray];
    [v8 intrinsicContentSize];
    BOOL v10 = v5 >= MaxY - v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)OBTableWelcomeController;
    return [(OBWelcomeController *)&v12 contentViewUnderButtonTray];
  }
  return v10;
}

- (BOOL)_scrollViewContentIsUnderTray
{
  uint64_t v3 = [(OBTableWelcomeController *)self tableView];
  if ([v3 style] == 1)
  {
    if (![(OBTableWelcomeController *)self _buttonTrayInlined])
    {
      BOOL v4 = [(OBTableWelcomeController *)self adoptTableViewScrollView];

      if (v4) {
        goto LABEL_11;
      }
LABEL_9:
      v8.receiver = self;
      v8.super_class = (Class)OBTableWelcomeController;
      return [(OBWelcomeController *)&v8 _scrollViewContentIsUnderTray];
    }
LABEL_8:

    goto LABEL_9;
  }
  double v5 = [(OBTableWelcomeController *)self tableView];
  if ([v5 style] != 2 || -[OBTableWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined"))
  {

    goto LABEL_8;
  }
  BOOL v7 = [(OBTableWelcomeController *)self adoptTableViewScrollView];

  if (!v7) {
    goto LABEL_9;
  }
LABEL_11:
  return [(OBTableWelcomeController *)self _scrollContentUnderButtonTrayForGroupedStyle];
}

- (BOOL)_scrollContentUnderButtonTrayForGroupedStyle
{
  uint64_t v3 = [(OBTableWelcomeController *)self tableView];
  [v3 bounds];
  double v5 = v4;

  double v6 = [(OBWelcomeController *)self buttonTray];
  [v6 bounds];
  double v8 = v7;

  BOOL v9 = 0;
  if (v5 != 0.0 && v8 != 0.0)
  {
    BOOL v10 = [(OBTableWelcomeController *)self tableView];
    [v10 contentSize];
    double v12 = v11;
    CGRect v13 = [(OBTableWelcomeController *)self tableView];
    [v13 contentOffset];
    double v15 = v12 - v14;
    [(OBWelcomeController *)self keyboardFrame];
    BOOL v9 = v15 > v5 - v8 - v16;
  }
  return v9;
}

- (void)_updateButtonTrayTableFooterContainerSizeIfNeeded
{
  uint64_t v3 = [(OBTableWelcomeController *)self footerContainer];
  [v3 layoutIfNeeded];

  [(OBBaseWelcomeController *)self directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(OBTableWelcomeController *)self footerContainer];
  objc_msgSend(v8, "setInternalContentPadding:", 0.0, v5, 0.0, v7);

  BOOL v9 = [(OBTableWelcomeController *)self footerContainer];
  BOOL v10 = [(OBTableWelcomeController *)self footerContainer];
  [v10 frame];
  double v12 = v11;
  CGRect v13 = [(OBTableWelcomeController *)self footerContainer];
  [v13 frame];
  double v15 = v14;
  double v16 = [(OBTableWelcomeController *)self tableView];
  [v16 bounds];
  double v18 = v17;
  v19 = [(OBTableWelcomeController *)self footerContainer];
  [v19 intrinsicContentSize];
  objc_msgSend(v9, "setFrame:", v12, v15, v18, v20);

  v21 = [(OBTableWelcomeController *)self tableView];
  v22 = [(OBTableWelcomeController *)self footerContainer];
  [v21 setTableFooterView:v22];

  [(OBWelcomeController *)self _updateButtonTrayBackdrop];
}

- (void)_updateTableHeaderViewSizeIfNeeded
{
  if ([(OBTableWelcomeController *)self adoptTableViewScrollView])
  {
    [(OBBaseWelcomeController *)self directionalLayoutMargins];
    double v4 = v3;
    double v6 = v5;
    double v7 = [(OBTableWelcomeController *)self headerContainer];
    [(OBWelcomeController *)self _headerTopOffset];
    double v9 = v8;
    [(OBTableWelcomeController *)self headerViewBottomToTableViewTopPadding];
    objc_msgSend(v7, "setInternalContentPadding:", v9, v4, v10, v6);

    double v11 = [(OBTableWelcomeController *)self headerContainer];
    [v11 layoutIfNeeded];

    double v12 = [(OBTableWelcomeController *)self headerContainer];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = [(OBTableWelcomeController *)self headerContainer];
    [v19 intrinsicContentSize];
    double v21 = v20;

    v22 = [(OBTableWelcomeController *)self headerContainer];
    objc_msgSend(v22, "setFrame:", v14, v16, v18, v21);

    id v24 = [(OBTableWelcomeController *)self tableView];
    v23 = [(OBTableWelcomeController *)self headerContainer];
    [v24 setTableHeaderView:v23];
  }
}

- (void)_setupScrollView
{
  if (![(OBTableWelcomeController *)self adoptTableViewScrollView])
  {
    v3.receiver = self;
    v3.super_class = (Class)OBTableWelcomeController;
    [(OBWelcomeController *)&v3 _setupScrollView];
  }
}

- (void)_layoutFooterContainerInlineButtonTray
{
  objc_super v3 = [(OBTableWelcomeController *)self hostedTableFooterView];

  if (v3)
  {
    double v4 = [(OBTableWelcomeController *)self footerContainer];
    double v5 = [(OBWelcomeController *)self buttonTray];
    [v4 setInternalContentView:v5];

    double v6 = [(OBTableWelcomeController *)self footerContainer];
    [(OBBaseWelcomeController *)self directionalLayoutMargins];
    double v8 = v7;
    [(OBBaseWelcomeController *)self directionalLayoutMargins];
    objc_msgSend(v6, "setInternalContentPadding:", 0.0, v8, 0.0);

    double v9 = [(OBTableWelcomeController *)self footerContainer];
    double v10 = [(OBTableWelcomeController *)self hostedTableFooterView];
    [v9 setHostedView:v10];

    double v11 = [(OBTableWelcomeController *)self footerContainer];
    [(OBBaseWelcomeController *)self directionalLayoutMargins];
    double v13 = v12;
    [(OBBaseWelcomeController *)self directionalLayoutMargins];
    objc_msgSend(v11, "setHostedViewPadding:", 0.0, v13, 0.0);
  }
  id v15 = [(OBTableWelcomeController *)self footerContainer];
  double v14 = [(OBWelcomeController *)self buttonTray];
  [v15 setInternalContentView:v14];
}

- (void)_layoutFooterContainerFloatButtonTray
{
  objc_super v3 = [(OBTableWelcomeController *)self hostedTableFooterView];

  if (v3)
  {
    double v4 = [(OBTableWelcomeController *)self footerContainer];
    [v4 setInternalContentView:0];

    double v5 = [(OBTableWelcomeController *)self footerContainer];
    [(OBBaseWelcomeController *)self directionalLayoutMargins];
    double v7 = v6;
    [(OBBaseWelcomeController *)self directionalLayoutMargins];
    objc_msgSend(v5, "setInternalContentPadding:", 0.0, v7, 0.0);

    double v8 = [(OBTableWelcomeController *)self footerContainer];
    double v9 = [(OBTableWelcomeController *)self hostedTableFooterView];
    [v8 setHostedView:v9];

    double v10 = [(OBTableWelcomeController *)self footerContainer];
    [(OBBaseWelcomeController *)self directionalLayoutMargins];
    double v12 = v11;
    [(OBBaseWelcomeController *)self directionalLayoutMargins];
    objc_msgSend(v10, "setHostedViewPadding:", 0.0, v12, 0.0);
  }
  id v13 = [(OBTableWelcomeController *)self footerContainer];
  [v13 setInternalContentView:0];
}

- (void)_updateHeaderFooterViewSizeIfNeeded
{
  if ([(OBTableWelcomeController *)self adoptTableViewScrollView])
  {
    [(OBTableWelcomeController *)self _updateTableHeaderViewSizeIfNeeded];
    [(OBTableWelcomeController *)self _updateButtonTrayTableFooterContainerSizeIfNeeded];
  }
}

- (void)_insertPendingTableView
{
  uint64_t v3 = [(OBTableWelcomeController *)self tableView];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [(OBTableWelcomeController *)self tableView];
    double v6 = [v5 superview];

    if (!v6)
    {
      id v7 = [(OBTableWelcomeController *)self tableView];
      [(OBTableWelcomeController *)self _setTableView:v7];
    }
  }
}

- (void)_setTableView:(id)a3
{
  id v6 = a3;
  double v4 = [(OBTableWelcomeController *)self tableView];
  [v4 _setLayoutObserver:0];

  double v5 = [[OBScrollViewWeakLayoutObserver alloc] initWithLayoutObserver:self];
  [v6 _setLayoutObserver:v5];

  if ([(OBTableWelcomeController *)self adoptTableViewScrollView]) {
    [(OBTableWelcomeController *)self _setTableViewWithHeaderFooterDonation:v6];
  }
  else {
    [(OBTableWelcomeController *)self _setTableViewNonHeaderFooterDonation:v6];
  }
}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBTableWelcomeController;
  [(OBWelcomeController *)&v4 _scrollViewDidLayoutSubviews:a3];
  [(OBWelcomeController *)self updateNavigationBarAnimated:1];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (OBTableHeaderFooterView)headerContainer
{
  return self->_headerContainer;
}

- (void)setHeaderContainer:(id)a3
{
}

- (OBTableHeaderFooterView)footerContainer
{
  return self->_footerContainer;
}

- (void)setFooterContainer:(id)a3
{
}

- (BOOL)adoptTableViewScrollView
{
  return self->_adoptTableViewScrollView;
}

- (void)setAdoptTableViewScrollView:(BOOL)a3
{
  self->_adoptTableViewScrollView = a3;
}

- (UIView)hostedTableFooterView
{
  return self->_hostedTableFooterView;
}

- (void)setHostedTableFooterView:(id)a3
{
}

- (UIView)hostedTableHeaderView
{
  return self->_hostedTableHeaderView;
}

- (void)setHostedTableHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedTableHeaderView, 0);
  objc_storeStrong((id *)&self->_hostedTableFooterView, 0);
  objc_storeStrong((id *)&self->_footerContainer, 0);
  objc_storeStrong((id *)&self->_headerContainer, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end