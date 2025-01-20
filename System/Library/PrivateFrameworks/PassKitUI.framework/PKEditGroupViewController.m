@interface PKEditGroupViewController
- (BOOL)passExistsWithUniqueIdentifier:(id)a3;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (PKEditGroupViewController)initWithGroup:(id)a3 existingGroupsController:(id)a4 style:(int64_t)a5 placeholders:(id)a6 isForWatch:(BOOL)a7 delegate:(id)a8;
- (id)group;
- (id)pass;
- (id)passAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)viewControllerForRowAtIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_deleteAllPassesInGroup;
- (void)_deleteButtonPressed;
- (void)_presentAlertForUpdatedExpressPass:(id)a3;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withPass:(id)a5;
- (void)dealloc;
- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6;
- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5;
- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6;
- (void)prefetchItemsAtIndexPaths:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKEditGroupViewController

- (PKEditGroupViewController)initWithGroup:(id)a3 existingGroupsController:(id)a4 style:(int64_t)a5 placeholders:(id)a6 isForWatch:(BOOL)a7 delegate:(id)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PKEditGroupViewController;
  v19 = [(PKEditTableViewController *)&v25 initWithStyle:0 placeholders:v17 isForWatch:v9];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_group, a3);
    v20->_isForWatch = v9;
    [(PKEditTableViewController *)v20 setExistingGroupsController:v16];
    [(PKEditTableViewController *)v20 setPlaceholders:v17];
    [(PKGroup *)v20->_group addGroupObserver:v20];
    viewingPass = v20->_viewingPass;
    v20->_viewingPass = 0;

    +[PKEditPassesTableViewCell imageSizeNeeded];
    v20->_imageSizeNeeded.width = v22;
    v20->_imageSizeNeeded.height = v23;
    v20->_editStyle = a5;
    objc_storeWeak((id *)&v20->_delegate, v18);
  }

  return v20;
}

- (void)dealloc
{
  [(PKGroup *)self->_group removeGroupObserver:self];
  [(PKEditGroupViewController *)self setToolbarItems:0];
  v3.receiver = self;
  v3.super_class = (Class)PKEditGroupViewController;
  [(PKEditGroupViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)PKEditGroupViewController;
  [(PKEditTableViewController *)&v31 viewDidLoad];
  objc_super v3 = [(PKEditGroupViewController *)self tableView];
  tableView = self->_tableView;
  self->_tableView = v3;

  v5 = self->_tableView;
  +[PKEditPassesTableViewCell separatorInset];
  -[UITableView setSeparatorInset:](v5, "setSeparatorInset:");
  objc_super v25 = [(PKGroup *)self->_group passes];
  unint64_t v6 = [v25 count];
  unint64_t v7 = [(PKEditTableViewController *)self visibleRowsCount];
  unint64_t v23 = v7;
  unint64_t v24 = v6;
  if (v7 >= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v7;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  if (v8)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = objc_msgSend(v25, "objectAtIndex:", v9, v23, v24);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __40__PKEditGroupViewController_viewDidLoad__block_invoke;
      v26[3] = &unk_1E59D66B0;
      v26[5] = v8;
      v26[6] = v9;
      v26[4] = &v27;
      [(PKEditTableViewController *)self imageForPass:v10 stacked:0 synchronously:1 placeholder:0 completion:v26];
      int v11 = *((unsigned __int8 *)v28 + 24);

      if (v11) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v8 - 1 == v9;
      }
      ++v9;
    }
    while (!v12);
  }
  if (v23 < v24)
  {
    if (6 * v23 >= v24 - 1) {
      unint64_t v13 = v24 - 1;
    }
    else {
      unint64_t v13 = 6 * v23;
    }
    while (v13 > v8)
    {
      v14 = [v25 objectAtIndex:v13];
      [(PKEditTableViewController *)self preemptivelyCacheImagesForPass:v14 stacked:0];

      --v13;
    }
  }
  if (!self->_editStyle)
  {
    id v15 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v16 = PKLocalizedString(&cfstr_PassEditingDel_1.isa);
    id v17 = (UIBarButtonItem *)[v15 initWithTitle:v16 style:0 target:self action:sel__deleteButtonPressed];
    deleteToolbarItem = self->_deleteToolbarItem;
    self->_deleteToolbarItem = v17;

    v19 = self->_deleteToolbarItem;
    v20 = [MEMORY[0x1E4FB1618] redColor];
    [(UIBarButtonItem *)v19 setTintColor:v20];

    v21 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    flexibleSpace = self->_flexibleSpace;
    self->_flexibleSpace = v21;
  }
  _Block_object_dispose(&v27, 8);
}

void *__40__PKEditGroupViewController_viewDidLoad__block_invoke(void *result, double a2)
{
  if ((double)(unint64_t)(result[5] - result[6]) * a2 > 0.3) {
    *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 1;
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKEditGroupViewController;
  [(PKEditGroupViewController *)&v10 viewWillAppear:a3];
  v4 = [(PKEditGroupViewController *)self navigationController];
  if (self->_editStyle == 1)
  {
    v5 = PKLocalizedString(&cfstr_PassGroupEditi.isa);
    [(PKEditGroupViewController *)self setTitle:v5];
  }
  else
  {
    v5 = [(PKEditTableViewController *)self mostRecentPassInGroup:self->_group];
    unint64_t v6 = [v5 localizedDescription];
    [(PKEditGroupViewController *)self setTitle:v6];
  }
  viewingPass = self->_viewingPass;
  self->_viewingPass = 0;

  if (!self->_editStyle)
  {
    deleteToolbarItem = self->_deleteToolbarItem;
    v11[0] = self->_flexibleSpace;
    v11[1] = deleteToolbarItem;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(PKEditGroupViewController *)self setToolbarItems:v9];

    [v4 setToolbarHidden:0 animated:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKEditGroupViewController;
  [(PKEditGroupViewController *)&v5 viewDidAppear:a3];
  if (([(PKEditTableViewController *)self performanceTest] | 2) == 3)
  {
    if ([(PKGroup *)self->_group passCount])
    {
      v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      [(PKEditGroupViewController *)self tableView:self->_tableView didSelectRowAtIndexPath:v4];
    }
  }
}

- (void)_deleteButtonPressed
{
  objc_super v3 = PKLocalizedString(&cfstr_RemoveSheetCan.isa);
  v4 = PKLocalizedString(&cfstr_PassEditingDel_2.isa, &cfstr_Lu.isa, [(PKGroup *)self->_group passCount]);
  objc_super v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  unint64_t v6 = [MEMORY[0x1E4FB1410] actionWithTitle:v3 style:1 handler:0];
  [v5 addAction:v6];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PKEditGroupViewController__deleteButtonPressed__block_invoke;
  v8[3] = &unk_1E59CB1F0;
  v8[4] = self;
  unint64_t v7 = [MEMORY[0x1E4FB1410] actionWithTitle:v4 style:2 handler:v8];
  [v5 addAction:v7];

  [(PKEditGroupViewController *)self presentViewController:v5 animated:1 completion:0];
}

uint64_t __49__PKEditGroupViewController__deleteButtonPressed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteAllPassesInGroup];
}

- (void)_deleteAllPassesInGroup
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C28], 0);
  [(UITableView *)self->_tableView setAllowsSelection:0];
  [(UITableView *)self->_tableView setAllowsSelectionDuringEditing:0];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    objc_super v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 groupViewController:self isDeletingGroup:self->_group];
    }
  }
  deleteToolbarItem = self->_deleteToolbarItem;
  objc_super v10 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIBarButtonItem *)deleteToolbarItem setTintColor:v10];

  [(UIBarButtonItem *)self->_deleteToolbarItem setEnabled:0];
  if (self->_isForWatch) {
    [MEMORY[0x1E4F84898] sharedInstanceWithRemoteLibrary];
  }
  else {
  id v12 = [MEMORY[0x1E4F84898] sharedInstance];
  }
  int v11 = [(PKGroup *)self->_group passes];
  [v12 removePasses:v11];
}

- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  v11[1] = *MEMORY[0x1E4F143B8];
  [(PKEditTableViewController *)self clearImageCacheForPass:a4];
  tableView = self->_tableView;
  uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:a6 inSection:0];
  v11[0] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(UITableView *)tableView reloadRowsAtIndexPaths:v10 withRowAnimation:0];
}

- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  v12[1] = *MEMORY[0x1E4F143B8];
  [(UITableView *)self->_tableView beginUpdates];
  tableView = self->_tableView;
  uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:a6 inSection:0];
  v12[0] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(UITableView *)tableView insertRowsAtIndexPaths:v10 withRowAnimation:2];

  [(UITableView *)self->_tableView endUpdates];
  if (!a6 && self->_editStyle == 1)
  {
    int v11 = [(PKGroup *)self->_group passAtIndex:0];
    [(PKEditGroupViewController *)self _presentAlertForUpdatedExpressPass:v11];
  }
}

- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  [(PKEditTableViewController *)self clearImageCacheForPass:v7];
  [(UITableView *)self->_tableView beginUpdates];
  tableView = self->_tableView;
  uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:a5 inSection:0];
  v19[0] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [(UITableView *)tableView deleteRowsAtIndexPaths:v10 withRowAnimation:2];

  [(UITableView *)self->_tableView endUpdates];
  if (!a5)
  {
    int v11 = [(PKGroup *)self->_group passAtIndex:0];
    if (v11) {
      [(PKEditGroupViewController *)self _presentAlertForUpdatedExpressPass:v11];
    }
  }
  id v12 = [v7 uniqueID];
  unint64_t v13 = [(PKPass *)self->_viewingPass uniqueID];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    [MEMORY[0x1E4F39CF8] begin];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__PKEditGroupViewController_group_didRemovePass_atIndex___block_invoke;
    v18[3] = &unk_1E59CA7D0;
    v18[4] = self;
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v18];
    id v15 = [(PKEditGroupViewController *)self navigationController];
    id v16 = (id)[v15 popToViewController:self animated:1];

    [MEMORY[0x1E4F39CF8] commit];
  }
  if ([(PKGroup *)self->_group passCount] == 1 && self->_editStyle == 1)
  {
    id v17 = [(PKEditGroupViewController *)self navigationController];
    [v17 dismissViewControllerAnimated:1 completion:0];
  }
}

uint64_t __57__PKEditGroupViewController_group_didRemovePass_atIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) performanceTest];
  if (result == 3)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 passedTest];
  }
  return result;
}

- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  if (a4 != a5)
  {
    [(UITableView *)self->_tableView beginUpdates];
    tableView = self->_tableView;
    objc_super v10 = [MEMORY[0x1E4F28D58] indexPathForRow:a4 inSection:0];
    int v11 = [MEMORY[0x1E4F28D58] indexPathForRow:a5 inSection:0];
    [(UITableView *)tableView moveRowAtIndexPath:v10 toIndexPath:v11];

    id v12 = self->_tableView;
    [(UITableView *)v12 endUpdates];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(PKGroup *)self->_group passCount];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKEditTableViewController *)self tableView:a3 cellWithIdentifier:@"cellPassEditIdentifier"];
  id v8 = -[PKGroup passAtIndex:](self->_group, "passAtIndex:", [v6 row]);
  [(PKEditGroupViewController *)self configureCell:v7 atIndexPath:v6 withPass:v8];

  return v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withPass:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setPass:v8];
    [(PKEditTableViewController *)self loadContentAndImageSetFromExistingPassForPass:v8];
    int64_t editStyle = self->_editStyle;
    objc_super v10 = [v7 textLabel];
    if (editStyle == 1)
    {
      int v11 = [v8 fieldForKey:*MEMORY[0x1E4F87A28]];
      id v12 = [v11 value];
      [v10 setText:v12];

      unint64_t v13 = [v7 detailTextLabel];
      int v14 = [v8 localizedDescription];
      [v13 setText:v14];

      [v7 setShowsReorderControl:1];
      [v7 setAccessoryType:0];
      [v7 setEditingAccessoryType:0];
    }
    else
    {
      id v15 = [v8 localizedDescription];
      [v10 setText:v15];

      id v16 = [v8 ingestedDate];
      id v17 = PKRelativeDateStringWithFullDateForUnits();
      id v18 = PKLocalizedString(&cfstr_PassEditingAdd.isa, &cfstr_Lu_0.isa, 1, v17);

      v19 = [v7 detailTextLabel];
      v20 = objc_msgSend(v18, "pk_uppercaseFirstStringForPreferredLocale");
      [v19 setText:v20];

      [v7 setShowsReorderControl:0];
      [v7 setAccessoryType:1];
      [v7 setEditingAccessoryType:1];
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__PKEditGroupViewController_configureCell_atIndexPath_withPass___block_invoke;
    v24[3] = &unk_1E59CA910;
    id v25 = v7;
    id v26 = v8;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__PKEditGroupViewController_configureCell_atIndexPath_withPass___block_invoke_2;
    v21[3] = &unk_1E59D66D8;
    id v22 = v25;
    id v23 = v26;
    [(PKEditTableViewController *)self imageForPass:v23 stacked:0 synchronously:0 placeholder:v24 completion:v21];
  }
}

uint64_t __64__PKEditGroupViewController_configureCell_atIndexPath_withPass___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setImage:a2 forPass:*(void *)(a1 + 40)];
}

uint64_t __64__PKEditGroupViewController_configureCell_atIndexPath_withPass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setImage:a2 forPass:*(void *)(a1 + 40)];
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return self->_editStyle == 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  if (self->_editStyle == 1)
  {
    id v6 = a4;
    [a3 deselectRowAtIndexPath:v6 animated:1];
    id v10 = [(PKEditGroupViewController *)self viewControllerForRowAtIndexPath:v6];

    if (!self->_viewingPass)
    {
      id v7 = [v10 pass];
      viewingPass = self->_viewingPass;
      self->_viewingPass = v7;

      uint64_t v9 = [(PKEditGroupViewController *)self navigationController];
      [v9 pushViewController:v10 animated:1];
    }
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6 = *MEMORY[0x1E4F85C40];
  id v7 = a5;
  MEMORY[0x1A6220EC0](v6, 0);
  uint64_t v8 = [v7 row];

  id v13 = [(PKGroup *)self->_group passAtIndex:v8];
  if (self->_isForWatch)
  {
    uint64_t v9 = [MEMORY[0x1E4F84898] sharedInstanceWithRemoteLibrary];
    id v10 = [v9 _remoteLibrary];
    [v10 removePass:v13];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F84898] sharedInstance];
    [v9 removePass:v13];
  }

  int v11 = [(PKEditTableViewController *)self existingGroupsController];
  id v12 = [v13 uniqueID];
  [v11 handleUserPassDelete:v12];
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  uint64_t v8 = [(PKEditGroupViewController *)self passAtIndexPath:v11];
  uint64_t v9 = [(PKEditTableViewController *)self existingGroupsController];
  [v9 suppressRemoteUpdates:1];
  objc_msgSend(v9, "movePass:inGroup:toIndex:", v8, self->_group, objc_msgSend(v7, "row"));
  [v9 enableRemoteUpdates];
  if (v11 != v7
    && (![v7 row] && self->_editStyle == 1 || !objc_msgSend(v11, "row") && self->_editStyle == 1))
  {
    id v10 = [(PKGroup *)self->_group passAtIndex:0];
    [(PKEditGroupViewController *)self _presentAlertForUpdatedExpressPass:v10];
  }
}

- (void)_presentAlertForUpdatedExpressPass:(id)a3
{
  if (a3)
  {
    objc_super v3 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v4 = a3;
    id v12 = objc_alloc_init(v3);
    uint64_t v5 = MEMORY[0x1E4F1CC38];
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F88058]];
    [v12 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F88050]];
    uint64_t v6 = [v4 fieldForKey:*MEMORY[0x1E4F87A28]];

    id v7 = [v6 value];
    uint64_t v8 = PKLocalizedShareableCredentialString(&cfstr_SelectExpressP_3.isa, &stru_1EF1B4C70.isa, v7);
    [v12 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

    if (PKPearlIsAvailable()) {
      uint64_t v9 = @"SELECT_EXPRESS_PASS_DESCRIPTION_FACE_ID";
    }
    else {
      uint64_t v9 = @"SELECT_EXPRESS_PASS_DESCRIPTION_TOUCH_ID";
    }
    id v10 = PKLocalizedShareableCredentialString(&v9->isa);
    [v12 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

    id v11 = PKLocalizedShareableCredentialString(&cfstr_SelectExpressP_4.isa);
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

    [MEMORY[0x1E4F850F0] presentNotificationWithParameters:v12 responseHandler:&__block_literal_global_117];
  }
}

- (id)viewControllerForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && self->_editStyle != 1)
  {
    id v7 = -[PKGroup passAtIndex:](self->_group, "passAtIndex:", [v4 row]);
    uint64_t v6 = [[PKEditSinglePassViewController alloc] initWithGroup:self->_group pass:v7];
    int64_t v8 = [(PKEditTableViewController *)self performanceTest];
    if (v8)
    {
      [(PKEditSinglePassViewController *)v6 setPerformanceTest:v8];
      uint64_t v9 = [(PKEditTableViewController *)self performanceTestName];
      [(PKEditSinglePassViewController *)v6 setPerformanceTestName:v9];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)passAtIndexPath:(id)a3
{
  group = self->_group;
  uint64_t v4 = [a3 row];

  return (id)[(PKGroup *)group passAtIndex:v4];
}

- (void)prefetchItemsAtIndexPaths:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PKGroup *)self->_group passes];
  uint64_t v5 = [v10 count];
  if (v5 - 1 >= 0)
  {
    uint64_t v6 = v5;
    do
    {
      id v7 = [v10 objectAtIndex:--v6];
      unint64_t v8 = [v7 row];
      if ([v4 count] > v8)
      {
        uint64_t v9 = -[PKGroup passAtIndex:](self->_group, "passAtIndex:", [v7 row]);
        [(PKEditTableViewController *)self loadContentAndImageSetFromExistingPassForPass:v9];
        [(PKEditTableViewController *)self preemptivelyCacheImagesForPass:v9 stacked:0];
      }
    }
    while (v6 > 0);
  }
}

- (BOOL)passExistsWithUniqueIdentifier:(id)a3
{
  return [(PKGroup *)self->_group indexForPassUniqueID:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)group
{
  return self->_group;
}

- (id)pass
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_viewingPass, 0);
  objc_storeStrong((id *)&self->_flexibleSpace, 0);
  objc_storeStrong((id *)&self->_deleteToolbarItem, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end