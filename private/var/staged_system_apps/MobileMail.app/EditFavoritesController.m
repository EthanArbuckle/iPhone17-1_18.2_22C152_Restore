@interface EditFavoritesController
- (BOOL)isSingleAccount;
- (BOOL)selectedStateForMailbox:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)shouldHideInbox;
- (BOOL)shouldHideNotesForAccount:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)toggleAndReturnSelectedStateForMailbox:(id)a3;
- (EFCancelable)tableViewObserver;
- (EditFavoritesController)initWithAccountsProvider:(id)a3 favoritesManager:(id)a4;
- (EditFavoritesControllerDelegate)delegate;
- (NSArray)selectedFavoriteMailboxes;
- (NSArray)selectedSmartMailboxes;
- (NSArray)sortedAccounts;
- (NSArray)sortedMailboxes;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)didFinish;
- (void)doneButtonClicked:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSingleAccount:(BOOL)a3;
- (void)setSortedAccounts:(id)a3;
- (void)setSortedMailboxes:(id)a3;
- (void)setTableViewObserver:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EditFavoritesController

- (EditFavoritesController)initWithAccountsProvider:(id)a3 favoritesManager:(id)a4
{
  id v29 = a3;
  id v30 = a4;
  v35.receiver = self;
  v35.super_class = (Class)EditFavoritesController;
  v6 = [(EditFavoritesController *)&v35 initWithStyle:2];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    selectedSmartMailboxes = v6->_selectedSmartMailboxes;
    v6->_selectedSmartMailboxes = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    selectedFavoriteMailboxes = v6->_selectedFavoriteMailboxes;
    v6->_selectedFavoriteMailboxes = v9;

    v28 = [v29 orderedAccounts];
    -[EditFavoritesController setIsSingleAccount:](v6, "setIsSingleAccount:", [v29 isDisplayingMultipleAccounts] ^ 1);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v11 = [v30 mailboxesCollection];
    v12 = [v11 items];

    id v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v32;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          p_selectedFavoriteMailboxes = (id *)&v6->_selectedFavoriteMailboxes;
          if ((isKindOfClass & 1) == 0)
          {
            objc_opt_class();
            char v19 = objc_opt_isKindOfClass();
            p_selectedFavoriteMailboxes = (id *)&v6->_selectedSmartMailboxes;
            if ((v19 & 1) == 0)
            {
              objc_opt_class();
              char v20 = objc_opt_isKindOfClass();
              p_selectedFavoriteMailboxes = (id *)&v6->_selectedSmartMailboxes;
              if ((v20 & 1) == 0) {
                continue;
              }
            }
          }
          [*p_selectedFavoriteMailboxes addObject:v16];
        }
        id v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v13);
    }

    if ([(EditFavoritesController *)v6 isSingleAccount])
    {
      sortedAccounts = [v28 firstObject];
      v22 = +[MailChangeManager sharedChangeManager];
      uint64_t v23 = [v22 allMailboxUidsSortedWithSpecialsAtTopForAccount:sortedAccounts includingLocals:1 client:v6 outbox:0];
      sortedMailboxes = v6->_sortedMailboxes;
      v6->_sortedMailboxes = (NSArray *)v23;
    }
    else
    {
      v25 = v28;
      sortedAccounts = v6->_sortedAccounts;
      v6->_sortedAccounts = v25;
    }

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v6 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(EditFavoritesController *)v6 setHidesBottomBarWhenPushed:1];
  }

  return v6;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)EditFavoritesController;
  [(EditFavoritesController *)&v13 viewDidLoad];
  id v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"DONE" value:&stru_100619928 table:@"Main"];
  id v6 = [v3 initWithTitle:v5 style:2 target:self action:"doneButtonClicked:"];

  v7 = [(EditFavoritesController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"MAILBOXES" value:&stru_100619928 table:@"Main"];
  v10 = [(EditFavoritesController *)self navigationItem];
  [v10 setTitle:v9];

  v11 = [(EditFavoritesController *)self tableView];
  +[MailboxTableCell defaultRowHeight];
  [v11 setEstimatedRowHeight:];

  v12 = [(EditFavoritesController *)self navigationController];
  [v12 _setClipUnderlapWhileTransitioning:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EditFavoritesController;
  [(EditFavoritesController *)&v6 viewWillAppear:a3];
  [(EditFavoritesController *)self preferredContentSize];
  [(EditFavoritesController *)self setPreferredContentSize:375.0];
  v4 = [(EditFavoritesController *)self mf_updatePreferredContentSizeBasedOnTableView];
  [(EditFavoritesController *)self setTableViewObserver:v4];

  v5 = [(EditFavoritesController *)self tableView];
  [v5 reloadData];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EditFavoritesController;
  [(EditFavoritesController *)&v5 traitCollectionDidChange:v4];
  [(EditFavoritesController *)self mf_updateTableViewBackgroundColorForPopover];
}

- (void)doneButtonClicked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained editFavoritesControllerDidFinish:self];
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

- (BOOL)selectedStateForMailbox:(id)a3
{
  id v4 = +[FavoriteItem itemForMailbox:a3 selected:1];
  LOBYTE(self) = [(NSMutableArray *)self->_selectedFavoriteMailboxes containsObject:v4];

  return (char)self;
}

- (BOOL)toggleAndReturnSelectedStateForMailbox:(id)a3
{
  id v4 = +[FavoriteItem itemForMailbox:a3 selected:1];
  unsigned int v5 = [(NSMutableArray *)self->_selectedFavoriteMailboxes containsObject:v4];
  selectedFavoriteMailboxes = self->_selectedFavoriteMailboxes;
  if (v5) {
    [(NSMutableArray *)selectedFavoriteMailboxes removeObject:v4];
  }
  else {
    [(NSMutableArray *)selectedFavoriteMailboxes addObject:v4];
  }

  return v5 ^ 1;
}

- (void)didFinish
{
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return -1;
  }
  if ([(EditFavoritesController *)self isSingleAccount]) {
    [(EditFavoritesController *)self sortedMailboxes];
  }
  else {
  objc_super v6 = [(EditFavoritesController *)self sortedAccounts];
  }
  id v4 = [v6 count];

  return (int64_t)v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v31 = a3;
  id v32 = a4;
  if ([v32 section]) {
    goto LABEL_26;
  }
  if ([(EditFavoritesController *)self isSingleAccount])
  {
    objc_super v6 = [v31 dequeueReusableCellWithIdentifier:@"MailReuseFavorites_Mailboxes"];
    if (!v6) {
      objc_super v6 = [[MailboxTableCell alloc] initWithStyle:0 reuseIdentifier:@"MailReuseFavorites_Mailboxes"];
    }
    v7 = [(EditFavoritesController *)self sortedMailboxes];
    v8 = [v7 objectAtIndexedSubscript:[v32 row]];

    v9 = +[NSSet setWithObject:v8];
    [(MailboxTableCell *)v6 setLegacyMailboxes:v9];

    v10 = +[FavoriteItem itemForMailbox:v8 selected:1];
    uint64_t v11 = [(NSMutableArray *)self->_selectedFavoriteMailboxes containsObject:v10]
        ? 3
        : 0;
    [(MailboxTableCell *)v6 setAccessoryType:v11];
  }
  else
  {
    objc_super v6 = [v31 dequeueReusableCellWithIdentifier:@"MailReuseFavorites_Accounts"];
    if (!v6) {
      objc_super v6 = [[MailboxTableCell alloc] initWithStyle:1 reuseIdentifier:@"MailReuseFavorites_Accounts"];
    }
    v12 = [(EditFavoritesController *)self sortedAccounts];
    objc_super v13 = [v12 objectAtIndexedSubscript:[v32 row]];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v14 = self->_selectedFavoriteMailboxes;
    uint64_t v15 = 0;
    id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v34;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          char v19 = [*(id *)(*((void *)&v33 + 1) + 8 * i) account];
          unsigned int v20 = [v19 isEqual:v13];

          v15 += v20;
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v16);
    }

    v21 = [v13 displayName];
    [(MailboxTableCell *)v6 setTitle:v21];

    v22 = +[NSSet setWithObject:v13];
    uint64_t v23 = +[MailAccount accountImageForAccounts:v22];
    [(MailboxTableCell *)v6 setIcon:v23];

    if (v15)
    {
      v24 = +[NSNumber numberWithUnsignedInteger:v15];
      v25 = +[NSNumberFormatter localizedStringFromNumber:v24 numberStyle:1];

      v26 = +[NSBundle bundleForClass:objc_opt_class()];
      v27 = [v26 localizedStringForKey:@"ITEMS_SELECTED%1$lu%2$@" value:&stru_100619928 table:@"Main"];
      v28 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v15, v25);

      id v29 = [(MailboxTableCell *)v6 detailTextLabel];
      [v29 setText:v28];
    }
    else
    {
      v25 = [(MailboxTableCell *)v6 detailTextLabel];
      [v25 setText:0];
    }

    [(MailboxTableCell *)v6 setAccessoryType:1];
  }
  if (!v6) {
LABEL_26:
  }
    __assert_rtn("-[EditFavoritesController tableView:cellForRowAtIndexPath:]", "EditFavoritesController.m", 215, "cell");

  return v6;
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  +[MailboxTableCell invalidateCachedLayoutInformation];
  id v4 = [(EditFavoritesController *)self tableView];
  [v4 reloadData];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (![v6 section])
  {
    if ([(EditFavoritesController *)self isSingleAccount])
    {
      v7 = [v13 cellForRowAtIndexPath:v6];
      v8 = [(EditFavoritesController *)self sortedMailboxes];
      [v8 objectAtIndexedSubscript:[v6 row]];
      v9 = (AccountFavoritesPickerController *)objc_claimAutoreleasedReturnValue();

      if ([(EditFavoritesController *)self toggleAndReturnSelectedStateForMailbox:v9])
      {
        uint64_t v10 = 3;
      }
      else
      {
        uint64_t v10 = 0;
      }
      [v7 setAccessoryType:v10];
      [v13 deselectRowAtIndexPath:v6 animated:1];
    }
    else
    {
      uint64_t v11 = [(EditFavoritesController *)self sortedAccounts];
      v7 = [v11 objectAtIndexedSubscript:[v6 row]];

      v9 = objc_alloc_init(AccountFavoritesPickerController);
      [(MailboxListViewControllerBase *)v9 setAccount:v7];
      [(AccountFavoritesPickerController *)v9 setDelegate:self];
      v12 = [(EditFavoritesController *)self navigationController];
      [v12 pushViewController:v9 animated:1];
    }
  }
  [v13 deselectRowAtIndexPath:v6 animated:1];
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

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  [v6 mf_updateBackgroundColorForPopover:[self mf_supportsPopoverPresentation]];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(EditFavoritesController *)self sortedMailboxes];
  v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

  if (v7) {
    unsigned __int8 v8 = [v7 mv_isSelectable];
  }
  else {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (NSArray)selectedSmartMailboxes
{
  return &self->_selectedSmartMailboxes->super;
}

- (NSArray)selectedFavoriteMailboxes
{
  return &self->_selectedFavoriteMailboxes->super;
}

- (EditFavoritesControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EditFavoritesControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSingleAccount
{
  return self->_isSingleAccount;
}

- (void)setIsSingleAccount:(BOOL)a3
{
  self->_isSingleAccount = a3;
}

- (NSArray)sortedAccounts
{
  return self->_sortedAccounts;
}

- (void)setSortedAccounts:(id)a3
{
}

- (NSArray)sortedMailboxes
{
  return self->_sortedMailboxes;
}

- (void)setSortedMailboxes:(id)a3
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
  objc_storeStrong((id *)&self->_sortedMailboxes, 0);
  objc_storeStrong((id *)&self->_sortedAccounts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedFavoriteMailboxes, 0);

  objc_storeStrong((id *)&self->_selectedSmartMailboxes, 0);
}

@end