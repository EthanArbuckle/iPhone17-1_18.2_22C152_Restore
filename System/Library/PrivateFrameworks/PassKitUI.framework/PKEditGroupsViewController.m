@interface PKEditGroupsViewController
- (BOOL)passExistsWithUniqueIdentifier:(id)a3;
- (BOOL)shouldShowPreviewForRowAtIndexPath:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (id)groupAtIndexPath:(id)a3;
- (id)indexPathForGroup:(id)a3;
- (id)initInEditingMode:(BOOL)a3 existingGroupsController:(id)a4 isForWatch:(BOOL)a5;
- (id)passAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)viewControllerForRowAtIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_showNoPassesViewIfNoGroupsToShow;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withGroup:(id)a5;
- (void)dealloc;
- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6;
- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5;
- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6;
- (void)groupViewController:(id)a3 isDeletingGroup:(id)a4;
- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5;
- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5;
- (void)groupsController:(id)a3 didUpdateGroup:(id)a4;
- (void)prefetchItemsAtIndexPaths:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKEditGroupsViewController

- (id)initInEditingMode:(BOOL)a3 existingGroupsController:(id)a4 isForWatch:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PKEditGroupsViewController;
  v9 = [(PKEditTableViewController *)&v38 initWithStyle:1 placeholders:0 isForWatch:v5];
  v10 = v9;
  if (v9)
  {
    v9->_editingMode = a3;
    [(PKEditTableViewController *)v9 setExistingGroupsController:v8];
    +[PKEditPassesTableViewCell imageSizeNeeded];
    v10->_imageSizeNeeded.width = v11;
    v10->_imageSizeNeeded.height = v12;
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F84740]) initWithPassTypeMask:1 passFilters:0 allowedPassUniqueIDs:0];
    groupsController = v10->_groupsController;
    v10->_groupsController = (PKGroupsController *)v13;

    [(PKGroupsController *)v10->_groupsController setDelegate:v10];
    [(PKGroupsController *)v10->_groupsController loadGroupsSynchronously];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v15 = [(PKGroupsController *)v10->_groupsController groups];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * i) addGroupObserver:v10];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v17);
    }

    viewingPass = v10->_viewingPass;
    v10->_viewingPass = 0;

    viewingGroup = v10->_viewingGroup;
    v10->_viewingGroup = 0;

    deletingGroup = v10->_deletingGroup;
    v10->_deletingGroup = 0;

    v10->_isForWatch = v5;
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v10->_actions;
    v10->_actions = v23;

    if (PKRearCameraIsAllowed())
    {
      v25 = v10->_actions;
      v26 = [PKEditGroupsAction alloc];
      v27 = PKLocalizedString(&cfstr_ScanCode.isa);
      v28 = [(PKEditGroupsAction *)v26 initWithLabel:v27 type:@"ScanCode"];
      [(NSMutableArray *)v25 addObject:v28];
    }
    v29 = v10->_actions;
    v30 = [PKEditGroupsAction alloc];
    v31 = PKLocalizedString(&cfstr_AppStore.isa);
    v32 = [(PKEditGroupsAction *)v30 initWithLabel:v31 type:@"FindApps"];
    [(NSMutableArray *)v29 addObject:v32];
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(PKGroupsController *)self->_groupsController groups];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeGroupObserver:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)PKEditGroupsViewController;
  [(PKEditGroupsViewController *)&v8 dealloc];
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)PKEditGroupsViewController;
  [(PKEditTableViewController *)&v23 viewDidLoad];
  [(PKEditTableViewController *)self setEditing:self->_editingMode animated:0];
  unint64_t v3 = [(PKEditTableViewController *)self visibleRowsCount];
  uint64_t v4 = [(PKGroupsController *)self->_groupsController groups];
  unint64_t v5 = [v4 count];
  unint64_t v17 = v5;
  if (v3 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v3;
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (v6)
  {
    uint64_t v7 = 0;
    do
    {
      objc_super v8 = [v4 objectAtIndex:v7];
      long long v9 = [(PKEditTableViewController *)self mostRecentPassInGroup:v8];
      unint64_t v10 = [v8 passCount];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __41__PKEditGroupsViewController_viewDidLoad__block_invoke;
      v18[3] = &unk_1E59D66B0;
      v18[5] = v6;
      v18[6] = v7;
      v18[4] = &v19;
      [(PKEditTableViewController *)self imageForPass:v9 stacked:v10 > 1 synchronously:1 placeholder:0 completion:v18];

      LODWORD(v9) = *((unsigned __int8 *)v20 + 24);
      if (v9) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v6 - 1 == v7;
      }
      ++v7;
    }
    while (!v11);
  }
  if (v3 < v17)
  {
    if (6 * v3 >= v17 - 1) {
      unint64_t v12 = v17 - 1;
    }
    else {
      unint64_t v12 = 6 * v3;
    }
    while (v12 > v6)
    {
      uint64_t v13 = [v4 objectAtIndex:v12];
      uint64_t v14 = [(PKEditTableViewController *)self mostRecentPassInGroup:v13];
      -[PKEditTableViewController preemptivelyCacheImagesForPass:stacked:](self, "preemptivelyCacheImagesForPass:stacked:", v14, (unint64_t)[v13 passCount] > 1);

      --v12;
    }
  }
  v15 = [(PKEditGroupsViewController *)self tableView];
  tableView = self->_tableView;
  self->_tableView = v15;

  [(PKEditTableViewController *)self setCachingDelegate:self];
  [(UITableView *)self->_tableView reloadData];
  [(PKEditGroupsViewController *)self _showNoPassesViewIfNoGroupsToShow];
  _Block_object_dispose(&v19, 8);
}

void *__41__PKEditGroupsViewController_viewDidLoad__block_invoke(void *result, double a2)
{
  if ((double)(unint64_t)(result[5] - result[6]) * a2 > 0.3) {
    *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 1;
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKEditGroupsViewController;
  [(PKEditGroupsViewController *)&v7 viewWillAppear:a3];
  uint64_t v4 = [(PKEditGroupsViewController *)self navigationController];
  [v4 setToolbarHidden:1 animated:1];
  viewingGroup = self->_viewingGroup;
  self->_viewingGroup = 0;

  viewingPass = self->_viewingPass;
  self->_viewingPass = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKEditGroupsViewController;
  [(PKEditGroupsViewController *)&v5 viewDidAppear:a3];
  if ([(PKEditTableViewController *)self performanceTest] == 1)
  {
    uint64_t v4 = [(PKEditTableViewController *)self testIteration];
    if (v4 > 9)
    {
      [(PKEditTableViewController *)self passedTest];
    }
    else
    {
      [(PKEditTableViewController *)self setTestIteration:v4 + 1];
      [(PKEditTableViewController *)self selectFirstRowOrFailTest];
    }
  }
}

- (void)_showNoPassesViewIfNoGroupsToShow
{
  BOOL v3 = [(PKGroupsController *)self->_groupsController groupCount] == 0;

  [(PKEditTableViewController *)self showNoPassesView:v3];
}

- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  deletingGroup = self->_deletingGroup;
  if (!deletingGroup
    || ([(PKGroup *)deletingGroup groupID],
        unint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v16 groupID],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v12 != v13))
  {
    uint64_t v14 = [(PKEditGroupsViewController *)self indexPathForGroup:v16];
    if (v14)
    {
      v15 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v14];
      if (v15) {
        [(PKEditGroupsViewController *)self configureCell:v15 atIndexPath:v14 withGroup:v16];
      }
    }
  }
}

- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5
{
  id v20 = a3;
  id v7 = a4;
  [(PKEditTableViewController *)self clearImageCacheForPass:v7];
  deletingGroup = self->_deletingGroup;
  if (!deletingGroup
    || ([(PKGroup *)deletingGroup groupID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v20 groupID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 != v10))
  {
    BOOL v11 = [(PKEditGroupsViewController *)self indexPathForGroup:v20];
    if (v11)
    {
      unint64_t v12 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v11];
      if (v12) {
        [(PKEditGroupsViewController *)self configureCell:v12 atIndexPath:v11 withGroup:v20];
      }
    }
  }
  if (self->_viewingPass)
  {
    uint64_t v13 = [v7 uniqueID];
    uint64_t v14 = [(PKPass *)self->_viewingPass uniqueID];
    int v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      id v16 = [(PKEditGroupsViewController *)self navigationController];
      id v17 = (id)[v16 popToViewController:self animated:1];

      viewingGroup = self->_viewingGroup;
      self->_viewingGroup = 0;

      viewingPass = self->_viewingPass;
      self->_viewingPass = 0;
    }
  }
}

- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  deletingGroup = self->_deletingGroup;
  if (!deletingGroup
    || ([(PKGroup *)deletingGroup groupID],
        unint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v16 groupID],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v12 != v13))
  {
    uint64_t v14 = [(PKEditGroupsViewController *)self indexPathForGroup:v16];
    if (v14)
    {
      int v15 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v14];
      if (v15) {
        [(PKEditGroupsViewController *)self configureCell:v15 atIndexPath:v14 withGroup:v16];
      }
    }
  }
}

- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v6 = a3;
  deletingGroup = self->_deletingGroup;
  unint64_t v12 = v6;
  if (!deletingGroup
    || ([(PKGroup *)deletingGroup groupID],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        [v12 groupID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        id v6 = v12,
        v8 != v9))
  {
    id v10 = [(PKEditGroupsViewController *)self indexPathForGroup:v6];
    if (v10)
    {
      BOOL v11 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v10];
      if (v11) {
        [(PKEditGroupsViewController *)self configureCell:v11 atIndexPath:v10 withGroup:v12];
      }
    }
    id v6 = v12;
  }
}

- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  [v7 addGroupObserver:self];
  [(UITableView *)self->_tableView beginUpdates];
  tableView = self->_tableView;
  id v10 = [(PKEditGroupsViewController *)self indexPathForGroup:v7];

  v15[0] = v10;
  BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(UITableView *)tableView insertRowsAtIndexPaths:v11 withRowAnimation:2];

  uint64_t v12 = [v8 groupCount];
  if (v12 == 1)
  {
    uint64_t v13 = self->_tableView;
    uint64_t v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [(UITableView *)v13 reloadSections:v14 withRowAnimation:2];

    [(PKEditGroupsViewController *)self _showNoPassesViewIfNoGroupsToShow];
  }
  [(UITableView *)self->_tableView endUpdates];
}

- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = (PKGroup *)a4;
  id v9 = a3;
  [(PKGroup *)v8 removeGroupObserver:self];
  [(PKEditGroupsViewController *)self _showNoPassesViewIfNoGroupsToShow];
  id v10 = [(PKEditTableViewController *)self mostRecentPassInGroup:v8];
  [(PKEditTableViewController *)self clearImageCacheForPass:v10];

  viewingGroup = self->_viewingGroup;
  if (viewingGroup == v8)
  {
    [MEMORY[0x1E4F39CF8] begin];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__PKEditGroupsViewController_groupsController_didRemoveGroup_atIndex___block_invoke;
    v23[3] = &unk_1E59CA7D0;
    v23[4] = self;
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v23];
    uint64_t v12 = [(PKEditGroupsViewController *)self navigationController];
    id v13 = (id)[v12 popToViewController:self animated:1];

    [MEMORY[0x1E4F39CF8] commit];
    uint64_t v14 = self->_viewingGroup;
    self->_viewingGroup = 0;

    viewingPass = self->_viewingPass;
    self->_viewingPass = 0;
  }
  [(UITableView *)self->_tableView beginUpdates];
  tableView = self->_tableView;
  id v17 = [MEMORY[0x1E4F28D58] indexPathForRow:a5 inSection:0];
  v24[0] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [(UITableView *)tableView deleteRowsAtIndexPaths:v18 withRowAnimation:1];

  uint64_t v19 = [v9 groupCount];
  if (!v19)
  {
    id v20 = self->_tableView;
    uint64_t v21 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [(UITableView *)v20 reloadSections:v21 withRowAnimation:1];
  }
  [(UITableView *)self->_tableView endUpdates];
  deletingGroup = self->_deletingGroup;
  self->_deletingGroup = 0;
}

uint64_t __70__PKEditGroupsViewController_groupsController_didRemoveGroup_atIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) performanceTest];
  if (result == 3)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 passedTest];
  }
  return result;
}

- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  [(UITableView *)self->_tableView beginUpdates];
  id v10 = [MEMORY[0x1E4F28D58] indexPathForRow:a5 inSection:0];
  id v9 = [MEMORY[0x1E4F28D58] indexPathForRow:a6 inSection:0];
  [(UITableView *)self->_tableView moveRowAtIndexPath:v10 toIndexPath:v9];
  [(UITableView *)self->_tableView endUpdates];
}

- (void)groupsController:(id)a3 didUpdateGroup:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  deletingGroup = self->_deletingGroup;
  if (!deletingGroup
    || ([(PKGroup *)deletingGroup groupID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v7 groupID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 != v10))
  {
    BOOL v11 = [(PKEditGroupsViewController *)self indexPathForGroup:v7];
    [(UITableView *)self->_tableView beginUpdates];
    tableView = self->_tableView;
    v14[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(UITableView *)tableView reloadRowsAtIndexPaths:v13 withRowAnimation:0];

    [(UITableView *)self->_tableView endUpdates];
  }
}

- (void)groupViewController:(id)a3 isDeletingGroup:(id)a4
{
}

- (id)groupAtIndexPath:(id)a3
{
  groupsController = self->_groupsController;
  uint64_t v4 = [a3 row];

  return (id)[(PKGroupsController *)groupsController groupAtIndex:v4];
}

- (id)indexPathForGroup:(id)a3
{
  uint64_t v3 = [(PKGroupsController *)self->_groupsController indexOfGroup:a3];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForRow:v3 inSection:0];
  }

  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    if ([(PKGroupsController *)self->_groupsController groupCount])
    {
      uint64_t v7 = [(NSMutableArray *)self->_actions count];
      goto LABEL_6;
    }
LABEL_7:
    int64_t v8 = 0;
    goto LABEL_8;
  }
  if (a4) {
    goto LABEL_7;
  }
  uint64_t v7 = [(PKGroupsController *)self->_groupsController groupCount];
LABEL_6:
  int64_t v8 = v7;
LABEL_8:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section])
  {
    int64_t v8 = [(PKEditTableViewController *)self tableView:v7 cellWithIdentifier:@"cellActionEditIdentifier"];

    actions = self->_actions;
    uint64_t v10 = [v6 row];

    BOOL v11 = [(NSMutableArray *)actions objectAtIndex:v10];
    id v6 = [v8 textLabel];
    uint64_t v12 = [v11 actionLabel];
    [v6 setText:v12];
  }
  else
  {
    int64_t v8 = [(PKEditTableViewController *)self tableView:v7 cellWithIdentifier:@"cellPassEditIdentifier"];

    BOOL v11 = [(PKEditGroupsViewController *)self groupAtIndexPath:v6];
    [(PKEditGroupsViewController *)self configureCell:v8 atIndexPath:v6 withGroup:v11];
  }

  return v8;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v11 = [(PKEditTableViewController *)self mostRecentPassInGroup:v10];
    [v8 setPass:v11];
    uint64_t v12 = [v10 passCount];
    [(PKEditTableViewController *)self loadContentAndImageSetFromExistingPassForPass:v11];
    id v13 = [v8 textLabel];
    uint64_t v14 = [v11 localizedDescription];
    [v13 setText:v14];

    int v15 = [v11 ingestedDate];
    id v16 = PKRelativeDateStringWithFullDateForUnits();
    id v17 = PKLocalizedString(&cfstr_PassEditingAdd.isa, &cfstr_Lu_0.isa, v12, v16);
    uint64_t v18 = objc_msgSend(v17, "pk_uppercaseFirstStringForPreferredLocale");

    if ((unint64_t)[v10 passCount] < 2)
    {
      id v20 = [v8 detailTextLabel];
      [v20 setText:v18];
    }
    else
    {
      uint64_t v19 = PKLocalizedString(&cfstr_PassEditingPas.isa, &cfstr_Lu_0.isa, v12, v18);
      id v20 = objc_msgSend(v19, "pk_uppercaseFirstStringForPreferredLocale");

      uint64_t v21 = [v8 detailTextLabel];
      [v21 setText:v20];
    }
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 0;
    BOOL v22 = (unint64_t)[v10 passCount] > 1;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __66__PKEditGroupsViewController_configureCell_atIndexPath_withGroup___block_invoke;
    v28[3] = &unk_1E59D8AE8;
    v31 = v32;
    id v29 = v8;
    id v30 = v11;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __66__PKEditGroupsViewController_configureCell_atIndexPath_withGroup___block_invoke_2;
    v24[3] = &unk_1E59D8B10;
    v27 = v32;
    id v25 = v29;
    id v23 = v30;
    id v26 = v23;
    [(PKEditTableViewController *)self imageForPass:v23 stacked:v22 synchronously:0 placeholder:v28 completion:v24];

    _Block_object_dispose(v32, 8);
  }
}

uint64_t __66__PKEditGroupsViewController_configureCell_atIndexPath_withGroup___block_invoke(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24)) {
    return [*(id *)(result + 32) setImage:a2 forPass:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __66__PKEditGroupsViewController_configureCell_atIndexPath_withGroup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) setImage:a2 forPass:*(void *)(a1 + 40)];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  [a3 deselectRowAtIndexPath:v13 animated:1];
  uint64_t v6 = [v13 section];
  if (v6 == 1)
  {
    id v7 = -[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", [v13 row]);
    uint64_t v12 = [v7 actionType];
    if ([v12 isEqualToString:@"FindApps"])
    {
      [(PKEditTableViewController *)self findApps];
    }
    else if ([v12 isEqualToString:@"ScanCode"])
    {
      [(PKEditTableViewController *)self scanCode];
    }
    goto LABEL_9;
  }
  if (!v6 && !self->_viewingGroup)
  {
    id v7 = [(PKEditGroupsViewController *)self viewControllerForRowAtIndexPath:v13];
    id v8 = [v7 group];
    viewingGroup = self->_viewingGroup;
    self->_viewingGroup = v8;

    id v10 = [v7 pass];
    viewingPass = self->_viewingPass;
    self->_viewingPass = v10;

    uint64_t v12 = [(PKEditGroupsViewController *)self navigationController];
    [v12 pushViewController:v7 animated:1];
LABEL_9:
  }
}

- (BOOL)shouldShowPreviewForRowAtIndexPath:(id)a3
{
  return a3 && [a3 section] == 0;
}

- (id)viewControllerForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  if (-[PKEditGroupsViewController shouldShowPreviewForRowAtIndexPath:](self, "shouldShowPreviewForRowAtIndexPath:", v4)&& ![v4 section])
  {
    id v7 = [(PKEditGroupsViewController *)self groupAtIndexPath:v4];
    [v7 addGroupObserver:self];
    if ([v7 passCount] == 1)
    {
      id v8 = [v7 passAtIndex:0];
      objc_super v5 = [[PKEditSinglePassViewController alloc] initWithGroup:v7 pass:v8];
    }
    else
    {
      id v9 = [PKEditGroupViewController alloc];
      id v8 = [(PKEditTableViewController *)self existingGroupsController];
      id v10 = [(PKEditTableViewController *)self placeholders];
      objc_super v5 = [(PKEditGroupViewController *)v9 initWithGroup:v7 existingGroupsController:v8 style:0 placeholders:v10 isForWatch:self->_isForWatch delegate:self];
    }
    int64_t v11 = [(PKEditTableViewController *)self performanceTest];
    if (v11)
    {
      [(PKEditSinglePassViewController *)v5 setPerformanceTest:v11];
      uint64_t v12 = [(PKEditTableViewController *)self performanceTestName];
      [(PKEditSinglePassViewController *)v5 setPerformanceTestName:v12];
    }
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v4 = [(PKEditGroupsViewController *)self groupAtIndexPath:a4];
  if ([v4 passCount] == 1) {
    objc_super v5 = @"PASS_EDITING_DELETE";
  }
  else {
    objc_super v5 = @"PASS_EDITING_DELETE_ALL";
  }
  uint64_t v6 = PKLocalizedString(&v5->isa);

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  unint64_t v4 = objc_msgSend(a4, "section", a3);
  if (v4 > 2) {
    return 0;
  }
  else {
    return qword_1A0444938[v4];
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C30], 0);
  id v7 = [(PKEditGroupsViewController *)self groupAtIndexPath:v6];
  objc_storeStrong((id *)&self->_deletingGroup, v7);
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "passCount"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = objc_msgSend(v7, "passes", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) uniqueID];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  groupsController = self->_groupsController;
  id v16 = (void *)[v8 copy];
  [(PKGroupsController *)groupsController handleUserPassesDelete:v16];
}

- (id)passAtIndexPath:(id)a3
{
  unint64_t v4 = -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", [a3 row]);
  if (v4)
  {
    objc_super v5 = [(PKEditTableViewController *)self mostRecentPassInGroup:v4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (void)prefetchItemsAtIndexPaths:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [(PKGroupsController *)self->_groupsController groups];
  uint64_t v5 = [v11 count];
  if (v5 - 1 >= 0)
  {
    uint64_t v6 = v5;
    do
    {
      id v7 = [v11 objectAtIndex:--v6];
      unint64_t v8 = [v7 row];
      if ([v4 count] > v8)
      {
        id v9 = [v4 objectAtIndex:v8];
        uint64_t v10 = [(PKEditTableViewController *)self mostRecentPassInGroup:v9];
        [(PKEditTableViewController *)self loadContentAndImageSetFromExistingPassForPass:v10];
        -[PKEditTableViewController preemptivelyCacheImagesForPass:stacked:](self, "preemptivelyCacheImagesForPass:stacked:", v10, (unint64_t)[v9 passCount] > 1);
      }
    }
    while (v6 > 0);
  }
}

- (BOOL)passExistsWithUniqueIdentifier:(id)a3
{
  uint64_t v3 = [(PKGroupsController *)self->_groupsController passWithUniqueID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_deletingGroup, 0);
  objc_storeStrong((id *)&self->_viewingGroup, 0);
  objc_storeStrong((id *)&self->_viewingPass, 0);

  objc_storeStrong((id *)&self->_groupsController, 0);
}

@end