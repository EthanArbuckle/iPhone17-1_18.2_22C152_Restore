@interface MailboxParentPickerTableController
- (MailboxParentPickerTableController)initWithMailboxUid:(id)a3 parentMailbox:(id)a4 visibleAccounts:(id)a5;
- (NSArray)visibleAccounts;
- (NSMutableArray)sortedAccountsMailboxes;
- (id)indexPathForMailbox:(id)a3;
- (id)mailboxForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)indexOfParentMailbox;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setMailboxSelectionTarget:(id)a3;
- (void)setSortedAccountsMailboxes:(id)a3;
- (void)setVisibleAccounts:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 tableViewPath:(id)a5;
@end

@implementation MailboxParentPickerTableController

- (MailboxParentPickerTableController)initWithMailboxUid:(id)a3 parentMailbox:(id)a4 visibleAccounts:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MailboxParentPickerTableController;
  v12 = [(MailboxParentPickerTableController *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mailbox, a3);
    objc_storeStrong((id *)&v13->_parentMailbox, a4);
    v14 = (NSArray *)[v11 copy];
    visibleAccounts = v13->_visibleAccounts;
    v13->_visibleAccounts = v14;

    sortedAccountsMailboxes = v13->_sortedAccountsMailboxes;
    v13->_sortedAccountsMailboxes = 0;
  }
  return v13;
}

- (NSMutableArray)sortedAccountsMailboxes
{
  sortedAccountsMailboxes = self->_sortedAccountsMailboxes;
  if (!sortedAccountsMailboxes)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = self->_sortedAccountsMailboxes;
    self->_sortedAccountsMailboxes = v4;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = [(MailboxParentPickerTableController *)self visibleAccounts];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          [(NSMutableArray *)self->_sortedAccountsMailboxes addObject:v10];
          id v11 = +[MailChangeManager sharedChangeManager];
          v12 = [v11 genericMailboxUidsSortedForAccount:v10 includingLocals:0 excludingMailbox:self->_mailbox];

          [(NSMutableArray *)self->_sortedAccountsMailboxes addObjectsFromArray:v12];
        }
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    sortedAccountsMailboxes = self->_sortedAccountsMailboxes;
  }

  return sortedAccountsMailboxes;
}

- (int64_t)indexOfParentMailbox
{
  if (!self->_parentMailbox) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 = [(MailboxParentPickerTableController *)self sortedAccountsMailboxes];
  id v4 = [v3 indexOfObject:self->_parentMailbox];

  return (int64_t)v4;
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
  id v4 = [(MailboxParentPickerTableController *)self sortedAccountsMailboxes];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(MailboxParentPickerTableController *)self mailboxForIndexPath:a4];
  uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"MailboxParentPickerReuseCell"];
  if (!v8) {
    uint64_t v8 = [[MailMailboxGroupedPickerTableCell alloc] initWithStyle:0 reuseIdentifier:@"MailboxParentPickerReuseCell"];
  }
  [(MailboxGroupedPickerTableCell *)v8 setMailbox:v7];
  if (self->_parentMailbox == v7) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  [(MailMailboxGroupedPickerTableCell *)v8 setAccessoryType:v9];

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 tableViewPath:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(MailboxParentPickerTableController *)self indexPathForMailbox:self->_parentMailbox];
  id v11 = [NSIndexPath indexPathForRow:[v10 row] inSection:[v9 section]];
  v12 = [(MailboxParentPickerTableController *)self mailboxForIndexPath:v8];
  objc_storeStrong((id *)&self->_parentMailbox, v12);
  v13 = [v15 cellForRowAtIndexPath:v11];
  [v13 setAccessoryType:0];

  long long v14 = [v15 cellForRowAtIndexPath:v9];
  [v14 setAccessoryType:3];

  [(MailboxParentPickerSelectionTarget *)self->_mailboxSelectionTarget mailboxParentPickerDidSelectMailbox:v12];
}

- (id)mailboxForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxParentPickerTableController *)self sortedAccountsMailboxes];
  id v6 = [v5 objectAtIndexedSubscript:[v4 row]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_5:
    id v8 = v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 rootMailbox];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (id)indexPathForMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxParentPickerTableController *)self sortedAccountsMailboxes];
  id v6 = [v5 indexOfObject:v4];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL
    && ([(MailboxParentPickerTableController *)self sortedAccountsMailboxes],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v4 account],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v7 indexOfObject:v8],
        v8,
        v7,
        v6 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = +[NSIndexPath indexPathForRow:v6 inSection:0];
  }

  return v9;
}

- (NSArray)visibleAccounts
{
  return self->_visibleAccounts;
}

- (void)setVisibleAccounts:(id)a3
{
}

- (void)setSortedAccountsMailboxes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedAccountsMailboxes, 0);
  objc_storeStrong((id *)&self->_visibleAccounts, 0);
  objc_storeStrong((id *)&self->_mailboxSelectionTarget, 0);
  objc_storeStrong((id *)&self->_parentMailbox, 0);

  objc_storeStrong((id *)&self->_mailbox, 0);
}

@end