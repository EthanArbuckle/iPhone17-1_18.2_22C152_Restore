@interface MailboxParentPickerController
- (BOOL)shouldAutorotate;
- (EFCancelable)tableViewObserver;
- (MailboxParentPickerController)initWithMailboxUid:(id)a3 parentMailbox:(id)a4 visibleAccounts:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setMailboxSelectionTarget:(id)a3;
- (void)setTableViewObserver:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MailboxParentPickerController

- (MailboxParentPickerController)initWithMailboxUid:(id)a3 parentMailbox:(id)a4 visibleAccounts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MailboxParentPickerController;
  v11 = [(MailboxParentPickerController *)&v19 initWithStyle:2];
  if (v11)
  {
    v12 = [[MailboxParentPickerTableController alloc] initWithMailboxUid:v8 parentMailbox:v9 visibleAccounts:v10];
    tableController = v11->_tableController;
    v11->_tableController = v12;

    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"MAILBOX_LOCATION" value:&stru_100619928 table:@"Main"];
    v16 = [(MailboxParentPickerController *)v11 navigationItem];
    [v16 setTitle:v15];

    v17 = [(MailboxParentPickerController *)v11 tableView];
    [v17 setEstimatedRowHeight:75.0];
  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MailboxParentPickerController;
  [(MailboxParentPickerController *)&v9 viewWillAppear:a3];
  v4 = [(MailboxParentPickerController *)self mf_updatePreferredContentSizeBasedOnTableView];
  [(MailboxParentPickerController *)self setTableViewObserver:v4];

  int64_t v5 = [(MailboxParentPickerTableController *)self->_tableController indexOfParentMailbox];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v6 = v5;
    v7 = [(MailboxParentPickerController *)self tableView];
    id v8 = +[NSIndexPath indexPathForRow:v6 inSection:0];
    [v7 scrollToRowAtIndexPath:v8 atScrollPosition:0 animated:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailboxParentPickerController;
  [(MailboxParentPickerController *)&v5 traitCollectionDidChange:v4];
  [(MailboxParentPickerController *)self mf_updateTableViewBackgroundColorForPopover];
}

- (void)setMailboxSelectionTarget:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(MailboxParentPickerTableController *)self->_tableController tableView:a3 numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = [(MailboxParentPickerTableController *)self->_tableController tableView:a3 cellForRowAtIndexPath:a4];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(MailboxParentPickerTableController *)self->_tableController tableView:v9 didSelectRowAtIndexPath:v6 tableViewPath:v6];
  v7 = [(MailboxParentPickerController *)self navigationController];
  id v8 = [v7 popViewControllerAnimated:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  [v6 mf_updateBackgroundColorForPopover:[self mf_supportsPopoverPresentation]];
  [v6 setAccessibilityIdentifier:MSAccessibilityIdentifierMailEditMailboxViewMailboxPickerViewMailboxCell];
}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad] ^ 1;
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

  objc_storeStrong((id *)&self->_tableController, 0);
}

@end