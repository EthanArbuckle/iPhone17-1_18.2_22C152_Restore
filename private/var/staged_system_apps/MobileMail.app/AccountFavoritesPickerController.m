@interface AccountFavoritesPickerController
+ (int64_t)tableViewStyle;
- (AccountFavoritesPickerControllerDelegate)delegate;
- (BOOL)shouldAutorotate;
- (BOOL)shouldHideInbox;
- (BOOL)shouldHideNotesForAccount:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (EFCancelable)tableViewObserver;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_ntsMailboxesForAccount:(id)a3;
- (id)indexPathForMailbox:(id)a3;
- (id)mailboxForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doneButtonClicked:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTableViewObserver:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AccountFavoritesPickerController

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AccountFavoritesPickerController;
  [(MailboxListViewControllerBase *)&v9 viewWillAppear:a3];
  v4 = [(MailboxListViewControllerBase *)self account];
  v5 = [v4 displayName];
  v6 = [(AccountFavoritesPickerController *)self navigationItem];
  [v6 setTitle:v5];

  v7 = [(AccountFavoritesPickerController *)self tableView];
  [v7 reloadData];

  v8 = [(AccountFavoritesPickerController *)self mf_updatePreferredContentSizeBasedOnTableView];
  [(AccountFavoritesPickerController *)self setTableViewObserver:v8];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)AccountFavoritesPickerController;
  [(MailboxListViewControllerBase *)&v9 viewDidLoad];
  id v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"DONE" value:&stru_100619928 table:@"Main"];
  id v6 = [v3 initWithTitle:v5 style:2 target:self action:"doneButtonClicked:"];

  v7 = [(AccountFavoritesPickerController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  v8 = [(AccountFavoritesPickerController *)self tableView];
  +[MailboxTableCell defaultRowHeight];
  [v8 setEstimatedRowHeight:];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AccountFavoritesPickerController;
  [(AccountFavoritesPickerController *)&v5 traitCollectionDidChange:v4];
  [(AccountFavoritesPickerController *)self mf_updateTableViewBackgroundColorForPopover];
}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad] ^ 1;
}

- (BOOL)shouldHideInbox
{
  return 1;
}

- (BOOL)shouldHideNotesForAccount:(id)a3
{
  return [a3 isSyncingNotes];
}

+ (int64_t)tableViewStyle
{
  return 2;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(MailboxListViewControllerBase *)self sortedMailboxes];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (void)doneButtonClicked:(id)a3
{
  id v3 = [(AccountFavoritesPickerController *)self delegate];
  [v3 didFinish];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [UIApp preferredContentSizeCategory:a3, a4];
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    return UITableViewAutomaticDimension;
  }

  +[MailboxTableCell defaultRowHeight];
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"AccountFavoritesPickerControllerReuseCell"];
  if (!v7) {
    v7 = [[MailboxTableCell alloc] initWithStyle:3 reuseIdentifier:@"AccountFavoritesPickerControllerReuseCell"];
  }
  v8 = [(AccountFavoritesPickerController *)self mailboxForIndexPath:v6];
  id v9 = [v8 type];
  v10 = +[NSSet setWithObject:v8];
  [(MailboxTableCell *)v7 setLegacyMailboxes:v10];

  if (v9 == (id)7)
  {
    [(MailboxTableCell *)v7 setCellEnabled:0];
  }
  else
  {
    v11 = [(AccountFavoritesPickerController *)self delegate];
    unsigned __int8 v12 = [v11 selectedStateForMailbox:v8];

    if (v12)
    {
      uint64_t v13 = 3;
      goto LABEL_8;
    }
  }
  uint64_t v13 = 0;
LABEL_8:
  [(MailboxTableCell *)v7 setAccessoryType:v13];

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(AccountFavoritesPickerController *)self mailboxForIndexPath:v5];
  v7 = v6;
  v8 = v5;
  if (v6)
  {
    v8 = v5;
    if ([v6 type] == (id)7)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [v12 cellForRowAtIndexPath:v6];
  v8 = [(AccountFavoritesPickerController *)self mailboxForIndexPath:v6];
  id v9 = [(AccountFavoritesPickerController *)self delegate];
  unsigned int v10 = [v9 toggleAndReturnSelectedStateForMailbox:v8];

  if (v10) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [v7 setAccessoryType:v11];
  [v12 deselectRowAtIndexPath:v6 animated:1];
}

- (id)mailboxForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxListViewControllerBase *)self sortedMailboxes];
  id v6 = [v5 objectAtIndex:[v4 row]];

  return v6;
}

- (id)indexPathForMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxListViewControllerBase *)self sortedMailboxes];
  id v6 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v5 indexOfObject:v4], 0);

  return v6;
}

- (id)_ntsMailboxesForAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[MailChangeManager sharedChangeManager];
  id v6 = [v5 allMailboxUidsSortedWithSpecialsAtTopForAccount:v4 includingLocals:1 client:self outbox:0];

  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  [v6 mf_updateBackgroundColorForPopover:[self mf_supportsPopoverPresentation]];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MailboxListViewControllerBase *)self sortedMailboxes];
  v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

  if (v7) {
    unsigned __int8 v8 = [v7 mv_isSelectable];
  }
  else {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (AccountFavoritesPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AccountFavoritesPickerControllerDelegate *)WeakRetained;
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
}

@end