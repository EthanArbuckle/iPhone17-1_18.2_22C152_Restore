@interface SUUISettingsDocumentViewController
+ (double)_heightThatFitsWidth:(double)a3 withSettingsHeaderFooterDescription:(id)a4 context:(id)a5;
+ (id)_settingsGroupsFromTemplateElement:(id)a3 withDelegate:(id)a4 settingsContext:(id)a5;
- (SUUISettingsDocumentViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_barButtonItemCancel;
- (id)_barButtonItemDone;
- (id)_barButtonItemEdit;
- (id)_dequeueHeaderFooterViewWithReuseIdentifier:(id)a3;
- (id)_layoutContext;
- (id)_resourceLoader;
- (id)_tableView;
- (id)_textLayoutCache;
- (id)_viewForSettingsHeaderFooterDescription:(id)a3;
- (id)settingsGroupsDescription:(id)a3 viewForSettingAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelButtonAction:(id)a3;
- (void)_deselectItemsAnimated:(BOOL)a3;
- (void)_doneButtonAction:(id)a3;
- (void)_editButtonAction:(id)a3;
- (void)_invalidateLayout;
- (void)_reloadData;
- (void)_showBarItemLeft:(id)a3 right:(id)a4 animated:(BOOL)a5;
- (void)_showEditBarButtonItemAnimated:(BOOL)a3;
- (void)_showEditingBarButtonItemsEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)loadView;
- (void)settingsDocumentViewDidChangeTintColor:(id)a3;
- (void)settingsEditTransaction:(id)a3 isValid:(BOOL)a4;
- (void)settingsEditTransactionDidCompleteTransaction:(id)a3;
- (void)settingsEditTransactionDidFailTransaction:(id)a3;
- (void)settingsEditTransactionWillBeginTransaction:(id)a3;
- (void)settingsEditTransactionWillCommitTransaction:(id)a3;
- (void)settingsGroupsDescription:(id)a3 deletedSettingAtIndexPath:(id)a4;
- (void)settingsGroupsDescription:(id)a3 deletedSettingsGroupAtIndex:(unint64_t)a4;
- (void)settingsGroupsDescription:(id)a3 didUpdateSettingsDescription:(id)a4;
- (void)settingsGroupsDescription:(id)a3 dismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)settingsGroupsDescription:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)settingsGroupsDescriptionDidUpdateValidity:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SUUISettingsDocumentViewController

- (SUUISettingsDocumentViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SUUISettingsDocumentViewController;
  v9 = [(SUUISettingsDocumentViewController *)&v17 init];
  v10 = v9;
  if (v9)
  {
    [(SUUIViewController *)v9 setClientContext:v8];
    v11 = [[SUUISettingsContext alloc] initWithClientContext:v8];
    settingsContext = v10->_settingsContext;
    v10->_settingsContext = v11;

    objc_storeStrong((id *)&v10->_templateElement, a3);
    uint64_t v13 = [(id)objc_opt_class() _settingsGroupsFromTemplateElement:v10->_templateElement withDelegate:v10 settingsContext:v10->_settingsContext];
    settingsGroupsDescription = v10->_settingsGroupsDescription;
    v10->_settingsGroupsDescription = (SUUISettingsGroupsDescription *)v13;

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v10 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];
    [(SUUISettingsDocumentViewController *)v10 _reloadData];
    [(SUUISettingsDocumentViewController *)v10 _invalidateLayout];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83428] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUISettingsDocumentViewController;
  [(SUUIViewController *)&v4 dealloc];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription numberOfGroups];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 bounds];
  double Width = CGRectGetWidth(v16);
  v9 = [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription settingDescriptionAtIndexPath:v6];
  id v10 = objc_alloc_init(+[SUUISettingDescription viewClassForSettingDescription:v9]);
  v11 = [(SUUISettingsDocumentViewController *)self _layoutContext];
  [v10 reloadWithSettingDescription:v9 width:v11 context:Width];

  v12 = [v7 dequeueReusableCellWithIdentifier:@"SUUISettingsTableViewCellReuseIdentifier" forIndexPath:v6];

  [v12 displaySettingDescriptionView:v10];
  if ([v9 allowsSelection]) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v12 setSelectionStyle:v13];

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription numberOfSettingsInGroupAtIndex:a4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription settingDescriptionAtIndexPath:v7];
  v9 = v8;
  if (v8 && [v8 allowsSelection])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __72__SUUISettingsDocumentViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v10[3] = &unk_265401538;
    objc_copyWeak(&v11, &location);
    [v9 handleSelectionOnCompletion:v10];
    objc_destroyWeak(&v11);
  }
  else
  {
    [(SUUISettingsDocumentViewController *)self _deselectItemsAnimated:1];
  }

  objc_destroyWeak(&location);
}

void __72__SUUISettingsDocumentViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deselectItemsAnimated:1];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  settingsGroupsDescription = self->_settingsGroupsDescription;
  id v7 = a3;
  id v8 = [(SUUISettingsGroupsDescription *)settingsGroupsDescription footerDescriptionForGroupAtIndex:a4];
  v9 = objc_opt_class();
  [v7 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  double Width = CGRectGetWidth(v26);
  v19 = [(SUUISettingsDocumentViewController *)self _layoutContext];
  [v9 _heightThatFitsWidth:v8 withSettingsHeaderFooterDescription:v19 context:Width];
  double v21 = v20;

  if ([(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription numberOfGroups] - 1 == a4)
  {
    double v22 = 36.0;
  }
  else
  {
    BOOL v23 = [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription shouldShowHeaderForGroupAtIndex:a4 + 1];
    double v22 = 36.0;
    if (v23) {
      double v22 = 2.22044605e-16;
    }
  }
  double v24 = v21 + v22;

  return v24;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  settingsGroupsDescription = self->_settingsGroupsDescription;
  id v7 = a3;
  id v8 = [(SUUISettingsGroupsDescription *)settingsGroupsDescription headerDescriptionForGroupAtIndex:a4];
  v9 = objc_opt_class();
  [v7 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  double Width = CGRectGetWidth(v26);
  v19 = [(SUUISettingsDocumentViewController *)self _layoutContext];
  [v9 _heightThatFitsWidth:v8 withSettingsHeaderFooterDescription:v19 context:Width];
  double v21 = v20;

  if (a4)
  {
    BOOL v22 = [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription shouldShowHeaderForGroupAtIndex:a4];
    double v23 = 2.22044605e-16;
    if (v22) {
      double v23 = 36.0;
    }
  }
  else
  {
    double v23 = 16.0;
  }
  double v24 = v21 + v23;

  return v24;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 bounds];
  double Width = CGRectGetWidth(v14);
  id v8 = [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription settingDescriptionAtIndexPath:v6];

  v9 = +[SUUISettingDescription viewClassForSettingDescription:v8];
  double v10 = [(SUUISettingsDocumentViewController *)self _layoutContext];
  [(objc_class *)v9 sizeThatFitsWidth:v8 settingDescription:v10 context:Width];
  double v12 = v11;

  return fmax(v12, 48.0);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ([(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription shouldShowFooterForGroupAtIndex:a4])
  {
    id v6 = [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription footerDescriptionForGroupAtIndex:a4];
    id v7 = [(SUUISettingsDocumentViewController *)self _viewForSettingsHeaderFooterDescription:v6];
  }
  else
  {
    id v7 = [(UITableView *)self->_tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SUUISettingsTableViewEmptyHeaderFooterViewReuseIdentifier"];
  }
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if ([(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription shouldShowHeaderForGroupAtIndex:a4])
  {
    id v6 = [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription headerDescriptionForGroupAtIndex:a4];
    id v7 = [(SUUISettingsDocumentViewController *)self _viewForSettingsHeaderFooterDescription:v6];
  }
  else
  {
    id v7 = [(UITableView *)self->_tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SUUISettingsTableViewEmptyHeaderFooterViewReuseIdentifier"];
  }
  return v7;
}

- (void)loadView
{
  v5 = objc_alloc_init(SUUISettingsDocumentView);
  [(SUUISettingsDocumentView *)v5 setDelegate:self];
  v3 = [(SUUISettingsDocumentViewController *)self _tableView];
  if (storeShouldReverseLayoutDirection()) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 3;
  }
  [v3 setSemanticContentAttribute:v4];
  [(SUUISettingsDocumentView *)v5 addSubview:v3];
  [(SUUISettingsDocumentViewController *)self setView:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUISettingsDocumentViewController;
  -[SUUISettingsDocumentViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  [(SUUIResourceLoader *)self->_resourceLoader enterForeground];
  if ([(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription hasEditableSettingDescriptions])
  {
    [(SUUISettingsDocumentViewController *)self _showEditBarButtonItemAnimated:v3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUISettingsDocumentViewController;
  [(SUUIViewController *)&v4 viewWillAppear:a3];
  [(SUUISettingsDocumentViewController *)self _reloadData];
  [(SUUISettingsDocumentViewController *)self _invalidateLayout];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUUISettingsDocumentViewController;
  [(SUUISettingsDocumentViewController *)&v3 viewWillLayoutSubviews];
  [(SUUISettingsDocumentViewController *)self _invalidateLayout];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUISettingsDocumentViewController;
  [(SUUISettingsDocumentViewController *)&v4 viewDidDisappear:a3];
  [(SUUIResourceLoader *)self->_resourceLoader enterBackground];
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(UITableView *)self->_tableView visibleCells];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      CGFloat v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
      CGRect v14 = [(SUUISettingsDocumentViewController *)self _layoutContext];
      LOBYTE(v13) = [v13 setImage:v7 forArtworkRequest:v6 context:v14];

      if (v13) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)documentDidUpdate:(id)a3
{
  id v10 = a3;
  settingsGroupsDescription = self->_settingsGroupsDescription;
  if (settingsGroupsDescription)
  {
    [(SUUISettingsGroupsDescription *)settingsGroupsDescription recycle];
    objc_super v5 = self->_settingsGroupsDescription;
    self->_settingsGroupsDescription = 0;
  }
  id v6 = [v10 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v6;

  id v8 = [(id)objc_opt_class() _settingsGroupsFromTemplateElement:self->_templateElement withDelegate:self settingsContext:self->_settingsContext];
  uint64_t v9 = self->_settingsGroupsDescription;
  self->_settingsGroupsDescription = v8;

  if ([(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription hasEditableSettingDescriptions])
  {
    [(SUUISettingsDocumentViewController *)self _showEditBarButtonItemAnimated:1];
  }
  [(SUUISettingsDocumentViewController *)self _reloadData];
  [(SUUISettingsDocumentViewController *)self _invalidateLayout];
}

- (void)settingsDocumentViewDidChangeTintColor:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SUUISettingsDocumentViewController *)self _layoutContext];
  id v6 = [v4 tintColor];

  [v5 setTintColor:v6];
  [(SUUISettingsDocumentViewController *)self _invalidateLayout];
}

- (void)settingsEditTransactionDidCompleteTransaction:(id)a3
{
}

- (void)settingsEditTransactionDidFailTransaction:(id)a3
{
  id v3 = [(SUUISettingsDocumentViewController *)self _barButtonItemDone];
  [v3 setEnabled:1];
}

- (void)settingsEditTransactionWillBeginTransaction:(id)a3
{
  uint64_t v4 = [a3 isValid];
  [(SUUISettingsDocumentViewController *)self _showEditingBarButtonItemsEnabled:v4 animated:1];
}

- (void)settingsEditTransactionWillCommitTransaction:(id)a3
{
  id v3 = [(SUUISettingsDocumentViewController *)self _barButtonItemDone];
  [v3 setEnabled:0];
}

- (void)settingsEditTransaction:(id)a3 isValid:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SUUISettingsDocumentViewController *)self _barButtonItemDone];
  [v5 setEnabled:v4];
}

- (void)settingsGroupsDescription:(id)a3 deletedSettingAtIndexPath:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFF8C0];
  id v6 = a4;
  id v7 = (id)objc_msgSend([v5 alloc], "initWithObjects:", v6, 0);

  [(UITableView *)self->_tableView deleteRowsAtIndexPaths:v7 withRowAnimation:0];
}

- (void)settingsGroupsDescription:(id)a3 deletedSettingsGroupAtIndex:(unint64_t)a4
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F088D0]) initWithIndex:a4];
  [(UITableView *)self->_tableView deleteSections:v5 withRowAnimation:0];
}

- (void)settingsGroupsDescription:(id)a3 didUpdateSettingsDescription:(id)a4
{
  id v13 = a4;
  switch([v13 updateType])
  {
    case 0:
      tableView = self->_tableView;
      id v7 = [v13 indexSet];
      [(UITableView *)tableView deleteSections:v7 withRowAnimation:0];
      break;
    case 1:
      id v8 = self->_tableView;
      id v7 = [v13 indexSet];
      [(UITableView *)v8 insertSections:v7 withRowAnimation:0];
      break;
    case 2:
      uint64_t v9 = self->_tableView;
      id v7 = [v13 indexSet];
      [(UITableView *)v9 reloadSections:v7 withRowAnimation:0];
      break;
    case 3:
      id v10 = self->_tableView;
      id v7 = [v13 indexPaths];
      [(UITableView *)v10 deleteRowsAtIndexPaths:v7 withRowAnimation:0];
      break;
    case 4:
      uint64_t v11 = self->_tableView;
      id v7 = [v13 indexPaths];
      [(UITableView *)v11 insertRowsAtIndexPaths:v7 withRowAnimation:0];
      break;
    case 5:
      uint64_t v12 = self->_tableView;
      id v7 = [v13 indexPaths];
      [(UITableView *)v12 reloadRowsAtIndexPaths:v7 withRowAnimation:5];
      break;
    default:
      id v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SUUISettingsDocumentViewController.m" lineNumber:374 description:@"Hit unhandled update type."];
      break;
  }
}

- (void)settingsGroupsDescription:(id)a3 dismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v16 = a4;
  id v10 = a6;
  uint64_t v11 = [(SUUISettingsDocumentViewController *)self presentedViewController];
  char v12 = [v11 isEqual:v16];

  if ((v12 & 1) == 0)
  {
    long long v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SUUISettingsDocumentViewController.m" lineNumber:383 description:@"Cannot dismiss view controller as it is not the view controller currently presented."];
  }
  id v13 = [(SUUISettingsDocumentViewController *)self presentedViewController];
  int v14 = [v13 isEqual:v16];

  if (v14) {
    [(SUUISettingsDocumentViewController *)self dismissViewControllerAnimated:v7 completion:v10];
  }
}

- (void)settingsGroupsDescription:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v14 = a4;
  id v10 = a6;
  uint64_t v11 = [(SUUISettingsDocumentViewController *)self presentedViewController];

  if (v11)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SUUISettingsDocumentViewController.m" lineNumber:393 description:@"Already presenting a view controller."];
  }
  char v12 = [(SUUISettingsDocumentViewController *)self presentedViewController];

  if (!v12) {
    [(SUUISettingsDocumentViewController *)self presentViewController:v14 animated:v7 completion:v10];
  }
}

- (id)settingsGroupsDescription:(id)a3 viewForSettingAtIndexPath:(id)a4
{
  BOOL v4 = [(UITableView *)self->_tableView cellForRowAtIndexPath:a4];
  id v5 = [v4 settingDescriptionView];

  return v5;
}

- (void)settingsGroupsDescriptionDidUpdateValidity:(id)a3
{
  if (self->_editTransaction)
  {
    barButtonItemDone = self->_barButtonItemDone;
    BOOL v4 = [(SUUISettingsEditTransaction *)self->_editTransaction isValid];
    [(UIBarButtonItem *)barButtonItemDone setEnabled:v4];
  }
}

- (void)_cancelButtonAction:(id)a3
{
  if ([(SUUISettingsEditTransaction *)self->_editTransaction isCommiting])
  {
    editTransaction = self->_editTransaction;
    [(SUUISettingsEditTransaction *)editTransaction cancelTransaction];
  }
  else
  {
    id v5 = [(SUUISettingsDocumentViewController *)self view];
    id v6 = [v5 window];
    BOOL v7 = [v6 firstResponder];
    [v7 resignFirstResponder];

    [(SUUISettingsEditTransaction *)self->_editTransaction rollbackTransaction];
    id v8 = self->_editTransaction;
    self->_editTransaction = 0;
  }
}

- (void)_doneButtonAction:(id)a3
{
  BOOL v4 = [(SUUISettingsDocumentViewController *)self view];
  id v5 = [v4 window];
  id v6 = [v5 firstResponder];
  [v6 resignFirstResponder];

  editTransaction = self->_editTransaction;
  [(SUUISettingsEditTransaction *)editTransaction commitTransaction];
}

- (void)_editButtonAction:(id)a3
{
  BOOL v4 = [(SUUISettingsGroupsDescription *)self->_settingsGroupsDescription createEditTransaction];
  editTransaction = self->_editTransaction;
  self->_editTransaction = v4;

  [(SUUISettingsEditTransaction *)self->_editTransaction setDelegate:self];
  id v6 = self->_editTransaction;
  [(SUUISettingsEditTransaction *)v6 beginTransaction];
}

+ (double)_heightThatFitsWidth:(double)a3 withSettingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  if (!a4) {
    return 0.0;
  }
  id v7 = a5;
  id v8 = a4;
  [(objc_class *)+[SUUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:v8] sizeThatFitsWidth:v8 settingsHeaderFooterDescription:v7 context:a3];
  double v10 = v9;

  return v10;
}

+ (id)_settingsGroupsFromTemplateElement:(id)a3 withDelegate:(id)a4 settingsContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [[SUUISettingsGroupsDescription alloc] initWithDelegate:v8 settingsContext:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __102__SUUISettingsDocumentViewController__settingsGroupsFromTemplateElement_withDelegate_settingsContext___block_invoke;
  v13[3] = &unk_2654008B8;
  uint64_t v11 = v10;
  id v14 = v11;
  [v9 enumerateChildrenUsingBlock:v13];

  return v11;
}

void __102__SUUISettingsDocumentViewController__settingsGroupsFromTemplateElement_withDelegate_settingsContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 46) {
    [*(id *)(a1 + 32) addSettingsGroupWithViewElement:v3];
  }
}

- (id)_barButtonItemCancel
{
  barButtonItemCancel = self->_barButtonItemCancel;
  if (!barButtonItemCancel)
  {
    BOOL v4 = [(SUUIViewController *)self clientContext];
    id v5 = v4;
    if (v4) {
      [v4 localizedStringForKey:@"SETTINGS_NAVIGATION_CANCEL" inTable:@"Settings"];
    }
    else {
    id v6 = +[SUUIClientContext localizedStringForKey:@"SETTINGS_NAVIGATION_CANCEL" inBundles:0 inTable:@"Settings"];
    }

    id v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v6 style:0 target:self action:sel__cancelButtonAction_];
    id v8 = self->_barButtonItemCancel;
    self->_barButtonItemCancel = v7;

    barButtonItemCancel = self->_barButtonItemCancel;
  }
  return barButtonItemCancel;
}

- (id)_barButtonItemDone
{
  barButtonItemDone = self->_barButtonItemDone;
  if (!barButtonItemDone)
  {
    BOOL v4 = [(SUUIViewController *)self clientContext];
    id v5 = v4;
    if (v4) {
      [v4 localizedStringForKey:@"SETTINGS_NAVIGATION_DONE" inTable:@"Settings"];
    }
    else {
    id v6 = +[SUUIClientContext localizedStringForKey:@"SETTINGS_NAVIGATION_DONE" inBundles:0 inTable:@"Settings"];
    }

    id v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v6 style:2 target:self action:sel__doneButtonAction_];
    id v8 = self->_barButtonItemDone;
    self->_barButtonItemDone = v7;

    barButtonItemDone = self->_barButtonItemDone;
  }
  return barButtonItemDone;
}

- (id)_barButtonItemEdit
{
  barButtonItemEdit = self->_barButtonItemEdit;
  if (!barButtonItemEdit)
  {
    BOOL v4 = [(SUUIViewController *)self clientContext];
    id v5 = v4;
    if (v4) {
      [v4 localizedStringForKey:@"SETTINGS_NAVIGATION_EDIT" inTable:@"Settings"];
    }
    else {
    id v6 = +[SUUIClientContext localizedStringForKey:@"SETTINGS_NAVIGATION_EDIT" inBundles:0 inTable:@"Settings"];
    }

    id v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v6 style:0 target:self action:sel__editButtonAction_];
    id v8 = self->_barButtonItemEdit;
    self->_barButtonItemEdit = v7;

    barButtonItemEdit = self->_barButtonItemEdit;
  }
  return barButtonItemEdit;
}

- (id)_dequeueHeaderFooterViewWithReuseIdentifier:(id)a3
{
  BOOL v4 = [(UITableView *)self->_tableView dequeueReusableHeaderFooterViewWithIdentifier:a3];
  [(UITableView *)self->_tableView layoutMargins];
  objc_msgSend(v4, "setLayoutMargins:");
  return v4;
}

- (void)_deselectItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = [(UITableView *)self->_tableView indexPathsForSelectedRows];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [(UITableView *)self->_tableView deselectRowAtIndexPath:*(void *)(*((void *)&v10 + 1) + 8 * v9++) animated:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_invalidateLayout
{
  if ([(SUUISettingsDocumentViewController *)self isViewLoaded])
  {
    settingsGroupsDescription = self->_settingsGroupsDescription;
    [(UITableView *)self->_tableView bounds];
    double Width = CGRectGetWidth(v14);
    id v5 = [(SUUISettingsDocumentViewController *)self _layoutContext];
    [(SUUISettingsGroupsDescription *)settingsGroupsDescription requestLayoutForWidth:v5 context:Width];

    uint64_t v6 = [(SUUISettingsDocumentViewController *)self _textLayoutCache];
    uint64_t v7 = [v6 layoutCache];
    [v7 commitLayoutRequests];

    id v12 = [(SUUISettingsTemplateViewElement *)self->_templateElement style];
    uint64_t v8 = [v12 valueForStyle:*MEMORY[0x263F4B340]];
    uint64_t v9 = v8;
    if (v8)
    {
      tableView = self->_tableView;
      long long v11 = [v8 color];
      [(UITableView *)tableView setBackgroundColor:v11];
    }
    [(UITableView *)self->_tableView reloadData];
  }
}

- (id)_layoutContext
{
  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    BOOL v4 = objc_alloc_init(SUUIViewElementLayoutContext);
    id v5 = self->_layoutContext;
    self->_layoutContext = v4;

    [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:self];
    uint64_t v6 = self->_layoutContext;
    uint64_t v7 = [(SUUISettingsDocumentViewController *)self _textLayoutCache];
    [(SUUIViewElementLayoutContext *)v6 setLabelLayoutCache:v7];

    uint64_t v8 = self->_layoutContext;
    uint64_t v9 = [(SUUISettingsDocumentViewController *)self _resourceLoader];
    [(SUUIViewElementLayoutContext *)v8 setResourceLoader:v9];

    long long v10 = self->_layoutContext;
    long long v11 = [(SUUIViewController *)self clientContext];
    [(SUUIViewElementLayoutContext *)v10 setClientContext:v11];

    id v12 = self->_layoutContext;
    long long v13 = [(SUUISettingsDocumentViewController *)self view];
    CGRect v14 = [v13 tintColor];
    [(SUUIViewElementLayoutContext *)v12 setTintColor:v14];

    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_reloadData
{
}

- (id)_resourceLoader
{
  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    BOOL v4 = [SUUIResourceLoader alloc];
    id v5 = [(SUUIViewController *)self clientContext];
    uint64_t v6 = [(SUUIResourceLoader *)v4 initWithClientContext:v5];
    uint64_t v7 = self->_resourceLoader;
    self->_resourceLoader = v6;

    uint64_t v8 = self->_resourceLoader;
    uint64_t v9 = SUUIResourceLoaderGetNameForObject(self);
    [(SUUIResourceLoader *)v8 setName:v9];

    resourceLoader = self->_resourceLoader;
  }
  return resourceLoader;
}

- (void)_showBarItemLeft:(id)a3 right:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = [(SUUISettingsDocumentViewController *)self parentViewController];
  long long v10 = [v9 navigationItem];

  if (v13)
  {
    [v10 setHidesBackButton:1 animated:v5];
    long long v11 = v10;
    id v12 = v13;
  }
  else
  {
    [v10 setHidesBackButton:0 animated:v5];
    long long v11 = v10;
    id v12 = 0;
  }
  [v11 setLeftBarButtonItem:v12 animated:v5];
  [v10 setRightBarButtonItem:v8 animated:v5];
}

- (void)_showEditBarButtonItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUUISettingsDocumentViewController *)self _barButtonItemEdit];
  [(SUUISettingsDocumentViewController *)self _showBarItemLeft:0 right:v5 animated:v3];
}

- (void)_showEditingBarButtonItemsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(SUUISettingsDocumentViewController *)self _barButtonItemDone];
  [v7 setEnabled:v5];

  id v9 = [(SUUISettingsDocumentViewController *)self _barButtonItemCancel];
  id v8 = [(SUUISettingsDocumentViewController *)self _barButtonItemDone];
  [(SUUISettingsDocumentViewController *)self _showBarItemLeft:v9 right:v8 animated:v4];
}

- (id)_textLayoutCache
{
  textLayoutCache = self->_textLayoutCache;
  if (!textLayoutCache)
  {
    BOOL v4 = objc_alloc_init(SUUILayoutCache);
    BOOL v5 = [[SUUIViewElementTextLayoutCache alloc] initWithLayoutCache:v4];
    uint64_t v6 = self->_textLayoutCache;
    self->_textLayoutCache = v5;

    textLayoutCache = self->_textLayoutCache;
  }
  return textLayoutCache;
}

- (id)_tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C78]);
    BOOL v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    uint64_t v6 = self->_tableView;
    self->_tableView = v5;

    [(UITableView *)self->_tableView setAutoresizingMask:18];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"SUUISettingsTableViewCellReuseIdentifier"];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"SUUISettingsTableViewEmptyHeaderFooterViewReuseIdentifier"];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"SUUISettingsTableViewHeaderFooterViewReuseIdentifier"];
    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView setDataSource:self];
    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_viewForSettingsHeaderFooterDescription:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(+[SUUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:v4]);
  [(UITableView *)self->_tableView bounds];
  double Width = CGRectGetWidth(v11);
  uint64_t v7 = [(SUUISettingsDocumentViewController *)self _layoutContext];
  [v5 reloadWithSettingsHeaderFooterDescription:v4 width:v7 context:Width];

  id v8 = [(SUUISettingsDocumentViewController *)self _dequeueHeaderFooterViewWithReuseIdentifier:@"SUUISettingsTableViewHeaderFooterViewReuseIdentifier"];
  [v8 displaySettingsHeaderFooterDescriptionView:v5];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_settingsGroupsDescription, 0);
  objc_storeStrong((id *)&self->_settingsContext, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_editTransaction, 0);
  objc_storeStrong((id *)&self->_barButtonItemEdit, 0);
  objc_storeStrong((id *)&self->_barButtonItemDone, 0);
  objc_storeStrong((id *)&self->_barButtonItemCancel, 0);
}

@end