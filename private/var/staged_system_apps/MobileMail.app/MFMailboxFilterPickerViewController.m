@interface MFMailboxFilterPickerViewController
- (EFCancelable)tableViewObserver;
- (MFMailboxFilterPickerViewController)initWithViewModel:(id)a3 delegate:(id)a4;
- (MFMailboxFilterPickerViewControllerDelegate)delegate;
- (MFMailboxFilterPickerViewModel)viewModel;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setupNavigationBar;
- (void)_setupTableView;
- (void)_updateSelectedRows;
- (void)cancelButtonPressed:(id)a3;
- (void)doneButtonPressed:(id)a3;
- (void)mailboxFilterPickerSwitchCell:(id)a3 valueDidChange:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setTableViewObserver:(id)a3;
- (void)setViewModel:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MFMailboxFilterPickerViewController

- (MFMailboxFilterPickerViewController)initWithViewModel:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MFMailboxFilterPickerViewController.m", 39, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = +[NSAssertionHandler currentHandler];
  [v15 handleFailureInMethod:a2, self, @"MFMailboxFilterPickerViewController.m", 40, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)MFMailboxFilterPickerViewController;
  v11 = [(MFMailboxFilterPickerViewController *)&v16 initWithStyle:2];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_viewModel, a3);
  }

  return v12;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailboxFilterPickerViewController;
  [(MFMailboxFilterPickerViewController *)&v3 viewDidLoad];
  [(MFMailboxFilterPickerViewController *)self _setupNavigationBar];
  [(MFMailboxFilterPickerViewController *)self _setupTableView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMailboxFilterPickerViewController;
  [(MFMailboxFilterPickerViewController *)&v5 viewWillAppear:a3];
  v4 = [(MFMailboxFilterPickerViewController *)self mf_updatePreferredContentSizeBasedOnTableView];
  [(MFMailboxFilterPickerViewController *)self setTableViewObserver:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailboxFilterPickerViewController;
  [(MFMailboxFilterPickerViewController *)&v4 viewDidAppear:a3];
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"MFMailboxFilterPickerViewControllerDidShow" object:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFMailboxFilterPickerViewController;
  [(MFMailboxFilterPickerViewController *)&v5 traitCollectionDidChange:v4];
  [(MFMailboxFilterPickerViewController *)self mf_updateTableViewBackgroundColorForPopover];
}

- (void)_setupTableView
{
  id v3 = [(MFMailboxFilterPickerViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"MFMailboxFilterPickerSwitchCell"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"MFMailboxFilterPickerCheckmarkCell"];
  [v3 setKeyboardDismissMode:1];
  [v3 setEstimatedRowHeight:44.0];
  [v3 setRowHeight:UITableViewAutomaticDimension];
  [v3 setAllowsMultipleSelection:1];
  [(MFMailboxFilterPickerViewController *)self _updateSelectedRows];
}

- (void)_setupNavigationBar
{
  id v5 = +[NSBundle mainBundle];
  id v3 = [v5 localizedStringForKey:@"FILTERS_PICKER_TITLE" value:&stru_100619928 table:@"Main"];
  [(MFMailboxFilterPickerViewController *)self setTitle:v3];

  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed:"];
  id v4 = [(MFMailboxFilterPickerViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v6];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(MFMailboxFilterPickerViewController *)self viewModel];
  id v6 = [v5 titleForSection:a4];

  v7 = [v6 localizedUppercaseString];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(MFMailboxFilterPickerViewController *)self viewModel];
  id v4 = [v3 numberOfFilterSection];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(MFMailboxFilterPickerViewController *)self viewModel];
  id v6 = [v5 numberOfFiltersForSection:a4];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFMailboxFilterPickerViewController *)self viewModel];
  id v9 = [v8 selectionTypeAtIndex:v7];

  if (v9)
  {
    if (v9 == (id)1)
    {
      v10 = [v6 dequeueReusableCellWithIdentifier:@"MFMailboxFilterPickerSwitchCell" forIndexPath:v7];
      [v10 setDelegate:self];
    }
    else
    {
      v11 = +[NSAssertionHandler currentHandler];
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MFMailboxFilterPickerViewController tableView:cellForRowAtIndexPath:]");
      [v11 handleFailureInFunction:v12 file:@"MFMailboxFilterPickerViewController.m" lineNumber:133 description:@"Unknown selection type"];

      v10 = 0;
    }
  }
  else
  {
    v10 = [v6 dequeueReusableCellWithIdentifier:@"MFMailboxFilterPickerCheckmarkCell" forIndexPath:v7];
  }
  v13 = [(MFMailboxFilterPickerViewController *)self viewModel];
  v14 = [v13 filterAtIndexPath:v7];

  [v10 bindWithMailboxFilter:v14];
  [v10 mf_updateBackgroundColorForPopover:[self mf_supportsPopoverPresentation]];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v5 = [(MFMailboxFilterPickerViewController *)self viewModel];
  [v5 selectFilterAtIndexPath:v6];
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MFMailboxFilterPickerViewController *)self viewModel];
  if ([v6 canDeselectRowAtIndexPath:v5]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v5 = [(MFMailboxFilterPickerViewController *)self viewModel];
  [v5 deselectFilterAtIndexPath:v6];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  [v6 mf_updateBackgroundColorForPopover:[self mf_supportsPopoverPresentation]];
}

- (void)doneButtonPressed:(id)a3
{
  id v4 = [(MFMailboxFilterPickerViewController *)self viewModel];
  id v6 = [v4 selectedFilters];

  id v5 = [(MFMailboxFilterPickerViewController *)self delegate];
  [v5 mailboxFilterPickerViewController:self didFinishPickingWithSelectedFilters:v6];
}

- (void)cancelButtonPressed:(id)a3
{
  id v4 = [(MFMailboxFilterPickerViewController *)self delegate];
  [v4 didDismissMailboxFilterPickerViewController:self];
}

- (void)_updateSelectedRows
{
  id v3 = [(MFMailboxFilterPickerViewController *)self tableView];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(MFMailboxFilterPickerViewController *)self viewModel];
  id v5 = [v4 selected];

  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [v3 selectRowAtIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) animated:0 scrollPosition:0];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)mailboxFilterPickerSwitchCell:(id)a3 valueDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(MFMailboxFilterPickerViewController *)self tableView];
  uint64_t v7 = [v6 indexPathForCell:v9];

  id v8 = [(MFMailboxFilterPickerViewController *)self viewModel];
  if (v4) {
    [v8 selectFilterAtIndexPath:v7];
  }
  else {
    [v8 deselectFilterAtIndexPath:v7];
  }
}

- (MFMailboxFilterPickerViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (MFMailboxFilterPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMailboxFilterPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EFCancelable)tableViewObserver
{
  return self->_tableViewObserver;
}

- (void)setTableViewObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end