@interface AccountListController
- (AccountListController)initWithScene:(id)a3;
- (AccountListControllerDelegate)accountListDelegate;
- (BOOL)_enableAccount:(id)a3;
- (BOOL)canDismiss;
- (BOOL)containsMultipleAccounts;
- (BOOL)shouldAutorotate;
- (MailAccount)selectedAccount;
- (MailScene)scene;
- (NSSet)disabledAccounts;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_indexPathForSelectedAccount;
- (id)accounts;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_updateBarButtonItems;
- (void)cancelButtonClicked;
- (void)selectAccount:(id)a3 mailbox:(id)a4;
- (void)setAccountListDelegate:(id)a3;
- (void)setDisabledAccounts:(id)a3;
- (void)setScene:(id)a3;
- (void)setSelectedAccount:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AccountListController

- (AccountListController)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AccountListController;
  v5 = [(AccountListController *)&v8 initWithStyle:0];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v6;
}

- (id)accounts
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 accountsProvider];
  id v4 = [v3 orderedAccounts];

  return v4;
}

- (BOOL)containsMultipleAccounts
{
  v2 = [(AccountListController *)self accounts];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)selectAccount:(id)a3 mailbox:(id)a4
{
  v9 = (MailAccount *)a3;
  v6 = +[LocalAccount localAccount];

  v7 = v9;
  if (v6 != v9)
  {
    if (self->_selectedAccount != v9) {
      objc_storeStrong((id *)&self->_selectedAccount, a3);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountListDelegate);
    [WeakRetained accountList:self didSelectAccount:self->_selectedAccount];

    v7 = v9;
  }
}

- (void)cancelButtonClicked
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountListDelegate);
  [WeakRetained accountList:self didCancel:1];
}

- (BOOL)canDismiss
{
  return 0;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)AccountListController;
  [(AccountListController *)&v7 viewDidLoad];
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"ACCOUNTS" value:&stru_100619928 table:@"Main"];
  [(AccountListController *)self setTitle:v4];

  v5 = [(AccountListController *)self tableView];
  +[MailboxTableCell defaultRowHeight];
  [v5 setEstimatedRowHeight:];
  [v5 setSeparatorStyle:1];
  v6 = +[UIColor tableBackgroundColor];
  [v5 setBackgroundColor:v6];

  [v5 setContentInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  [v5 setAccessibilityIdentifier:MSAccessibilityIdentifierMailMoveMessageViewAccountsTable];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AccountListController;
  -[AccountListController viewWillAppear:](&v10, "viewWillAppear:");
  v5 = [(AccountListController *)self _indexPathForSelectedAccount];
  if (v5)
  {
    v6 = [(AccountListController *)self tableView];
    if (+[UIDevice mf_isPad]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = 2;
    }
    [v6 selectRowAtIndexPath:v5 animated:0 scrollPosition:v7];
    objc_super v8 = [(AccountListController *)self splitViewController];
    unsigned int v9 = [v8 isCollapsed];

    if (v9) {
      [v6 deselectRowAtIndexPath:v5 animated:v3];
    }
  }
  [(AccountListController *)self _updateBarButtonItems];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AccountListController;
  [(AccountListController *)&v5 viewDidDisappear:0];
  id v4 = [(AccountListController *)self parentViewController];

  if (!v4) {
    [(AccountListController *)self unloadViewIfReloadable];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AccountListController;
  [(AccountListController *)&v5 traitCollectionDidChange:v4];
  [(AccountListController *)self _updateBarButtonItems];
}

- (void)_updateBarButtonItems
{
  id v9 = [(AccountListController *)self navigationItem];
  BOOL v3 = [(AccountListController *)self splitViewController];
  unsigned int v4 = [v3 isCollapsed];

  if (v4)
  {
    id v5 = objc_alloc((Class)UIBarButtonItem);
    v6 = +[NSBundle mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
    id v8 = [v5 initWithTitle:v7 style:0 target:self action:"cancelButtonClicked"];

    [v8 setAccessibilityIdentifier:MSAccessibilityIdentifierMailMoveMessageViewCancelButton];
    [v9 setRightBarButtonItem:v8];
  }
  else
  {
    [v9 setRightBarButtonItem:0];
  }
}

- (id)_indexPathForSelectedAccount
{
  if (self->_selectedAccount
    && ([(AccountListController *)self accounts],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 indexOfObject:self->_selectedAccount],
        v3,
        v4 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    id v5 = +[NSIndexPath indexPathForRow:v4 inSection:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_getRotationContentSettings:(id *)a3
{
  *(_WORD *)&a3->var0 = 257;
  a3->var5 = 25.0;
}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad] ^ 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(AccountListController *)self accounts];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"AccountListTableCell"];
  if (!v7) {
    uint64_t v7 = [[MailboxTableCell alloc] initWithStyle:1 reuseIdentifier:@"AccountListTableCell"];
  }
  id v8 = [(AccountListController *)self accounts];
  id v9 = [v8 objectAtIndex:[v6 row]];

  objc_super v10 = [v9 displayName];
  [(MailboxTableCell *)v7 setTitle:v10];
  [(MailboxTableCell *)v7 setCellEnabled:[(AccountListController *)self _enableAccount:v9]];
  [(MailboxTableCell *)v7 setIcon:0];
  v11 = +[NSString stringWithFormat:@"Mail.moveMessagePopover.accountsTable.%@Cell", v10];
  [(MailboxTableCell *)v7 setAccessibilityIdentifier:v11];

  v12 = [(AccountListController *)self splitViewController];
  unsigned int v13 = [v12 isCollapsed];

  [(MailboxTableCell *)v7 setAccessoryType:v13];

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [UIApp preferredContentSizeCategory:a3, a4];
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    return UITableViewAutomaticDimension;
  }
  unsigned int v7 = +[UIDevice mf_isPad];
  double result = 48.0;
  if (v7) {
    return 44.0;
  }
  return result;
}

- (BOOL)_enableAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[UIApplication sharedApplication];
  unsigned int v6 = [v5 canPerformNetworkOperationOnAccount:v4];

  if (v6) {
    unsigned int v7 = ![(NSSet *)self->_disabledAccounts containsObject:v4];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(AccountListController *)self accounts];
  unsigned int v7 = [v6 objectAtIndex:[v5 row]];

  if (v7 && ![(NSSet *)self->_disabledAccounts containsObject:v7]) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unsigned int v7 = v6;
  if (v6 && [v6 row] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(AccountListController *)self accounts];
    id v9 = [v8 objectAtIndex:[v7 row]];

    [(AccountListController *)self selectAccount:v9 mailbox:0];
  }
}

- (AccountListControllerDelegate)accountListDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountListDelegate);

  return (AccountListControllerDelegate *)WeakRetained;
}

- (void)setAccountListDelegate:(id)a3
{
}

- (MailAccount)selectedAccount
{
  return self->_selectedAccount;
}

- (void)setSelectedAccount:(id)a3
{
}

- (NSSet)disabledAccounts
{
  return self->_disabledAccounts;
}

- (void)setDisabledAccounts:(id)a3
{
}

- (MailScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_disabledAccounts, 0);
  objc_storeStrong((id *)&self->_selectedAccount, 0);

  objc_destroyWeak((id *)&self->_accountListDelegate);
}

@end