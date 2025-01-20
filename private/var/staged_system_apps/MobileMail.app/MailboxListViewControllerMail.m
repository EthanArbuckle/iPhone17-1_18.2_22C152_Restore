@interface MailboxListViewControllerMail
+ (int64_t)tableViewStyle;
- (BOOL)isRefreshing;
- (BOOL)shouldAutorotate;
- (BOOL)shouldHideInbox;
- (BOOL)shouldHideNotesForAccount:(id)a3;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CGRect)rectOfMailbox:(id)a3;
- (EFCancelable)tableViewObserver;
- (EFLazyCache)mailboxDisplayPathCache;
- (EFLocked)filteredMailboxes;
- (EFScheduler)mailboxFilterScheduler;
- (MailScene)scene;
- (MailboxListViewControllerMail)initWithScene:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_ntsMailboxesForAccount:(id)a3;
- (id)cellForMailbox:(id)a3;
- (id)displayPathForMailbox:(id)a3;
- (id)indexPathForMailbox:(id)a3;
- (id)indexPathForSelection;
- (id)mailboxForIndexPath:(id)a3;
- (id)mailboxes;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)currentMailboxFilterID;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)selectedSourceType;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_queueReloadIfOutboxChanged:(id)a3;
- (void)_reloadIfOutboxChanged:(id)a3;
- (void)applicationWillSuspend;
- (void)clearAccount;
- (void)contentSizeCategoryChanged:(id)a3;
- (void)dealloc;
- (void)didSelectMailbox:(id)a3 changed:(BOOL)a4 animated:(BOOL)a5;
- (void)disableMailboxTypes:(id)a3;
- (void)disableMailboxes:(id)a3;
- (void)enableMailboxTypes:(id)a3;
- (void)filterMailboxesContainingText:(id)a3;
- (void)mailAccountsChanged:(id)a3;
- (void)mailboxEditingControllerDidFinish:(id)a3;
- (void)messageStoreChanged:(id)a3;
- (void)newMailboxClicked:(id)a3;
- (void)pendingMailboxesChanged:(id)a3;
- (void)pulledToRefresh:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCurrentMailboxFilterID:(int64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFilteredMailboxes:(id)a3;
- (void)setHideInbox:(BOOL)a3;
- (void)setIsRefreshing:(BOOL)a3;
- (void)setMailboxDisplayPathCache:(id)a3;
- (void)setMailboxFilterScheduler:(id)a3;
- (void)setMailboxListDelegate:(id)a3;
- (void)setScene:(id)a3;
- (void)setSelectedSourceType:(unint64_t)a3;
- (void)setShowsDisclosure:(BOOL)a3;
- (void)setShowsRefreshControl:(BOOL)a3;
- (void)setTableViewObserver:(id)a3;
- (void)shouldReloadMailboxesWithOutbox:(id)a3;
- (void)showMailboxEditingControllerWithMailbox:(id)a3;
- (void)statusBarProgressDidChange:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateIsRefreshing;
- (void)updateTitle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillReappear:(BOOL)a3;
@end

@implementation MailboxListViewControllerMail

- (MailboxListViewControllerMail)initWithScene:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MailboxListViewControllerMail;
  v5 = [(MailboxListViewControllerMail *)&v16 initWithStyle:0];
  if (v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"messageStoreChanged:" name:MailMessageStoreMessagesAdded object:0];
    [v6 addObserver:v5 selector:"messageStoreChanged:" name:MailMessageStoreMessageFlagsChanged object:0];
    [v6 addObserver:v5 selector:"accountDisplayNameChanged:" name:MailApplicationDidChangeAccountDisplayName object:0];
    [v6 addObserver:v5 selector:"mailAccountsChanged:" name:ECMailAccountsDidChangeNotification object:0];
    [v6 addObserver:v5 selector:"pendingMailboxesChanged:" name:@"MVMailboxListHasPendingChangesNotification" object:0];
    [v6 addObserver:v5 selector:"contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
    *(void *)(v5 + 87) = 0;
    v5[48] |= 1u;
    v5[113] = 1;
    objc_storeWeak((id *)(v5 + 127), v4);
    id v7 = objc_alloc((Class)EFLocked);
    v8 = objc_opt_new();
    id v9 = [v7 initWithObject:v8];
    v10 = *(void **)(v5 + 143);
    *(void *)(v5 + 143) = v9;

    *(void *)(v5 + 151) = 0;
    id v11 = [objc_alloc((Class)EFLazyCache) initWithCountLimit:100];
    v12 = *(void **)(v5 + 159);
    *(void *)(v5 + 159) = v11;

    uint64_t v13 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.MailboxListViewControllerMail.mailboxFilterScheduler" qualityOfService:25];
    v14 = *(void **)(v5 + 167);
    *(void *)(v5 + 167) = v13;
  }
  return (MailboxListViewControllerMail *)v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MailboxListViewControllerMail;
  [(MailboxListViewControllerBase *)&v4 dealloc];
}

- (void)_getRotationContentSettings:(id *)a3
{
  *(_WORD *)&a3->var0 = 257;
  +[MFTableViewCell defaultAccessoryWidth];
  a3->var5 = v4;
}

- (BOOL)shouldAutorotate
{
  if (+[UIDevice mf_isPad]) {
    return [(MailboxListViewControllerMail *)self isEditing] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)clearAccount
{
}

- (void)setMailboxListDelegate:(id)a3
{
}

- (void)updateTitle
{
  v3 = +[NSBundle mainBundle];
  id v14 = [v3 localizedStringForKey:@"MAILBOXES" value:&stru_100619928 table:@"Main"];

  double v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"MAILBOXES_BACK_BUTTON" value:&stru_100619928 table:@"Main"];

  id WeakRetained = objc_loadWeakRetained((id *)(&self->_queuedOutboxCheck + 7));
  unsigned int v7 = [WeakRetained containsMultipleAccounts];

  if (v7)
  {
    v8 = [(MailboxListViewControllerBase *)self account];
    id v9 = [v8 displayName];

    if ([v9 length])
    {
      id v10 = v9;

      v5 = 0;
      id v14 = v10;
    }
  }
  id v11 = [(MailboxListViewControllerMail *)self title];
  unsigned __int8 v12 = [v14 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
    [(MailboxListViewControllerMail *)self setTitle:v14];
    uint64_t v13 = [(MailboxListViewControllerMail *)self navigationItem];
    [v13 setBackButtonTitle:v5];
  }
}

- (void)setAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxListViewControllerBase *)self account];

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)MailboxListViewControllerMail;
    [(MailboxListViewControllerBase *)&v7 setAccount:v4];
    if ([(MailboxListViewControllerMail *)self isViewLoaded])
    {
      v6 = [(MailboxListViewControllerMail *)self tableView];
      [v6 setContentOffset:CGPointZero animated:0];
    }
    [(MailboxListViewControllerMail *)self updateTitle];
  }
}

- (BOOL)isRefreshing
{
  if (pthread_main_np() != 1)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MailboxListViewControllerMail.m" lineNumber:140 description:@"Current thread must be main"];
  }
  return self->_showRefreshControl;
}

- (void)setIsRefreshing:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_main_np() != 1)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MailboxListViewControllerMail.m" lineNumber:145 description:@"Current thread must be main"];
  }
  if (self->_showRefreshControl != v3 && !v3)
  {
    self->_showRefreshControl = v3;
    uint64_t mlvcmDelegate_high = HIBYTE(self->_mlvcmDelegate);
    id v7 = [(MailboxListViewControllerMail *)self tableView];
    [v7 _endRefreshingAnimated:mlvcmDelegate_high];
  }
}

- (void)updateIsRefreshing
{
}

- (void)statusBarProgressDidChange:(id)a3
{
}

- (void)pulledToRefresh:(id)a3
{
  if (pthread_main_np() != 1)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MailboxListViewControllerMail.m" lineNumber:167 description:@"Current thread must be main"];
  }
  self->_showRefreshControl = 1;
  [(MailboxListViewControllerMail *)self performSelector:"updateIsRefreshing" withObject:0 afterDelay:0.0];
  id v5 = [(MailboxListViewControllerMail *)self scene];
  v6 = [v5 daemonInterface];
  id v8 = [v6 mailboxRepository];

  [v8 refreshMailboxList:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MailboxListViewControllerMail;
  [(MailboxListViewControllerBase *)&v23 viewWillAppear:a3];
  [(MailboxListViewControllerMail *)self updateTitle];
  [(MailboxListViewControllerMail *)self updateIsRefreshing];
  id v4 = [(MailboxListViewControllerMail *)self toolbarItems];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    id v8 = [(MailboxListViewControllerMail *)self scene];
    if ((+[UIDevice mf_isPad] & 1) == 0
      && [v8 conformsToProtocol:&OBJC_PROTOCOL___ComposeCapable]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v9 = [v8 newComposeButtonItem];
      v25[0] = v6;
      v25[1] = v7;
      v25[2] = v9;
      id v10 = +[NSArray arrayWithObjects:v25 count:3];
      [(MailboxListViewControllerMail *)self setToolbarItems:v10];
    }
    else
    {
      v24[0] = v6;
      v24[1] = v7;
      id v9 = +[NSArray arrayWithObjects:v24 count:2];
      [(MailboxListViewControllerMail *)self setToolbarItems:v9];
    }
  }
  id v11 = objc_alloc_init((Class)NSMutableSet);
  unsigned __int8 v12 = [(MailboxListViewControllerBase *)self account];
  if (v12)
  {
    uint64_t v13 = [(MailboxListViewControllerBase *)self account];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v15 = [(MailboxListViewControllerBase *)self account];
      objc_super v16 = [v15 primaryMailboxUid];
      [v11 addObject:v16];
    }
  }
  v17 = [(MailboxListViewControllerBase *)self account];
  unsigned int v18 = [v17 supportsMailboxEditing];

  if (v18)
  {
    v19 = [(MailboxListViewControllerMail *)self editButtonItem];
    v20 = [(MailboxListViewControllerMail *)self navigationItem];
    [v20 setRightBarButtonItem:v19];
  }
  else
  {
    v19 = [(MailboxListViewControllerMail *)self navigationItem];
    [v19 setRightBarButtonItem:0];
  }

  v21 = [(MailboxListViewControllerMail *)self tableView];
  +[MailboxTableCell defaultRowHeight];
  [v21 setEstimatedRowHeight:];

  v22 = [(MailboxListViewControllerMail *)self mf_updatePreferredContentSizeBasedOnTableView];
  [(MailboxListViewControllerMail *)self setTableViewObserver:v22];
}

- (void)viewWillReappear:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MailboxListViewControllerBase *)self account];

  if (!v5)
  {
    id v6 = objc_alloc_init(MailboxListViewingContext);
    id v7 = +[UIApplication sharedApplication];
    id v8 = [v7 selectedAccounts];

    if ((unint64_t)[v8 count] >= 2)
    {
      id v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10045A210(v9);
      }
    }
    id v10 = [v8 anyObject];
    [(MailboxListViewingContext *)v6 setAccount:v10];

    [(MailboxListViewControllerBase *)self setViewingContext:v6];
    [(MailboxListViewControllerBase *)self viewWillFirstAppear:v3];
  }
  v11.receiver = self;
  v11.super_class = (Class)MailboxListViewControllerMail;
  [(MailboxListViewControllerBase *)&v11 viewWillReappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MailboxListViewControllerMail;
  [(MailboxListViewControllerBase *)&v4 viewDidAppear:a3];
  [(MailboxListViewControllerMail *)self mf_updateAlertSuppressionContextsForReason:@"mailbox list appeared"];
  HIBYTE(self->_mlvcmDelegate) = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MailboxListViewControllerMail;
  [(MailboxListViewControllerBase *)&v6 viewWillDisappear:a3];
  HIBYTE(self->_mlvcmDelegate) = 0;
  objc_super v4 = [(MailboxListViewControllerMail *)self tableView];
  BOOL v5 = [v4 refreshControl];
  [v5 endRefreshing];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MailboxListViewControllerMail;
  [(MailboxListViewControllerMail *)&v5 viewDidDisappear:0];
  [(MailboxListViewControllerMail *)self setIsRefreshing:0];
  objc_super v4 = [(MailboxListViewControllerMail *)self parentViewController];

  if (!v4) {
    [(MailboxListViewControllerMail *)self unloadViewIfReloadable];
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MailboxListViewControllerMail;
  [(MailboxListViewControllerBase *)&v6 viewDidLoad];
  BOOL v3 = [(MailboxListViewControllerMail *)self tableView];
  if (self->_alignAccessories)
  {
    id v4 = objc_alloc_init((Class)UIRefreshControl);
    [v4 addTarget:self action:"pulledToRefresh:" forControlEvents:4096];
    [v3 _setRefreshControl:v4];
  }
  [v3 setSeparatorStyle:1];
  objc_super v5 = +[UIColor tableBackgroundColor];
  [v3 setBackgroundColor:v5];

  [v3 setContentInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  [v3 setSelectionFollowsFocus:0];
}

- (void)applicationWillSuspend
{
  v5.receiver = self;
  v5.super_class = (Class)MailboxListViewControllerMail;
  [(MailboxListViewControllerMail *)&v5 applicationWillSuspend];
  BOOL v3 = [(MailboxListViewControllerMail *)self navigationController];
  id v4 = [v3 visibleViewController];

  if (v4 == self) {
    [(MailboxListViewControllerMail *)self setEditing:0 animated:0];
  }
}

- (void)newMailboxClicked:(id)a3
{
}

- (id)mailboxForIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4 && [v4 row] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [v5 row];
    id v8 = [(MailboxListViewControllerMail *)self mailboxes];
    id v9 = [v8 objectAtIndex:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)indexPathForMailbox:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MailboxListViewControllerMail *)self mailboxes];
  id v6 = [v5 indexOfObject:v4];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = +[NSIndexPath indexPathForRow:v6 inSection:0];
  }

  return v7;
}

- (void)didSelectMailbox:(id)a3 changed:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (([*(id *)((char *)self + 55) containsObject:v8] & 1) == 0)
  {
    if (![*(id *)((char *)&self->_disabledMailboxes + 7) count]
      || (+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 mailboxType]),
          id v9 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v10 = [*(id *)((char *)&self->_disabledMailboxes + 7) containsObject:v9],
          v9,
          (v10 & 1) == 0))
    {
      if ([(MailboxListViewControllerMail *)self isEditing])
      {
        if (objc_msgSend(v8, "mv_isEditable")) {
          [(MailboxListViewControllerMail *)self showMailboxEditingControllerWithMailbox:v8];
        }
      }
      else
      {
        objc_super v11 = [(MailboxListViewControllerBase *)self mailboxSelectionTarget];

        if (v11)
        {
          v12.receiver = self;
          v12.super_class = (Class)MailboxListViewControllerMail;
          [(MailboxListViewControllerBase *)&v12 didSelectMailbox:v8 changed:v6 animated:v5];
        }
      }
    }
  }
}

- (void)mailboxEditingControllerDidFinish:(id)a3
{
  id v4 = [(MailboxListViewControllerMail *)self presentedViewController];

  if (v4)
  {
    [(MailboxListViewControllerMail *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v6 = [(MailboxListViewControllerMail *)self navigationController];
    id v5 = [v6 popViewControllerAnimated:1];
  }
}

- (void)showMailboxEditingControllerWithMailbox:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    [v4 account];
  }
  else {
  uint64_t v6 = [(MailboxListViewControllerBase *)self account];
  }
  id v7 = (void *)v6;
  if (v6)
  {
    uint64_t v13 = v6;
    id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  }
  else
  {
    id v9 = +[UIApplication sharedApplication];
    unsigned __int8 v10 = [v9 accountsProvider];
    objc_super v11 = [v10 displayedAccounts];
    id v8 = [v11 allObjects];
  }
  objc_super v12 = [[MailboxEditingController alloc] initWithMailbox:v5 account:v7 validAccounts:v8];
  [(MailboxEditingController *)v12 setDelegate:self];
  [(MailboxListViewControllerMail *)self showViewController:v12 sender:self];
}

- (id)indexPathForSelection
{
  BOOL v3 = [(MailboxListViewControllerBase *)self selectedMailbox];

  if (v3)
  {
    id v4 = [(MailboxListViewControllerBase *)self selectedMailbox];
    id v5 = [(MailboxListViewControllerMail *)self indexPathForMailbox:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (CGRect)rectOfMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxListViewControllerMail *)self tableView];
  [v5 contentOffset];
  [v5 setContentOffset:0];
  uint64_t v6 = [(MailboxListViewControllerMail *)self indexPathForMailbox:v4];
  if (v6)
  {
    [v5 rectForRowAtIndexPath:v6];
    double v8 = v7;
    CGFloat y = v9;
    double v12 = v11;
    CGFloat height = v13;
    float v15 = sub_100216CA0((int)[v4 level]);
    double v16 = v15;
    double x = v8 + v16;
    double width = v12 - v16;
  }
  else
  {
    double x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.double width = v21;
  result.origin.CGFloat y = v20;
  result.origin.double x = v19;
  return result;
}

- (id)cellForMailbox:(id)a3
{
  id v4 = [(MailboxListViewControllerMail *)self indexPathForMailbox:a3];
  if (v4)
  {
    id v5 = [(MailboxListViewControllerMail *)self tableView];
    uint64_t v6 = [v5 cellForRowAtIndexPath:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setShowsDisclosure:(BOOL)a3
{
  *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xFE | a3;
}

- (void)setShowsRefreshControl:(BOOL)a3
{
  self->_alignAccessories = a3;
}

- (void)disableMailboxes:(id)a3
{
  id v4 = a3;
  id v5 = *(void **)((char *)self + 55);
  id v8 = v4;
  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableSet);
    double v7 = *(void **)((char *)self + 55);
    *(void *)((char *)self + 55) = v6;

    id v5 = *(void **)((char *)self + 55);
    id v4 = v8;
  }
  [v5 unionSet:v4];
}

- (void)disableMailboxTypes:(id)a3
{
  id v4 = a3;
  id v5 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
  id v8 = v4;
  if (!v5)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    double v7 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
    *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7) = v6;

    id v5 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
    id v4 = v8;
  }
  [v5 unionSet:v4];
}

- (void)enableMailboxTypes:(id)a3
{
  id v5 = a3;
  id v4 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
  if (v4) {
    [v4 minusSet:v5];
  }
}

- (void)setHideInbox:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 48);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    if (a3) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 48) = v3 & 0xFD | v6;
    id v8 = +[NSNumber numberWithInt:7];
    +[NSSet setWithObject:v8];
    if (v4) {
      double v7 = {;
    }
      [(MailboxListViewControllerMail *)self disableMailboxTypes:v7];
    }
    else {
      double v7 = {;
    }
      [(MailboxListViewControllerMail *)self enableMailboxTypes:v7];
    }
  }
}

- (void)_reloadIfOutboxChanged:(id)a3
{
  id v8 = a3;
  BOOL v4 = +[MailAccount outboxMailboxUid];
  if (v4 && (*((unsigned char *)&self->super + 8) & 1) == 0)
  {
    id v5 = [v8 objectForKey:MailMessageStoreChangedMailboxesKey];
    if ([v5 containsObject:v4])
    {
      [(MailboxListViewControllerBase *)self _loadMailboxes:1];

      goto LABEL_9;
    }
    char v6 = [v8 objectForKey:MailMessageStoreMessageKey];
    double v7 = [v6 valueForKey:@"mailbox"];

    if ([v7 containsObject:v4]) {
      [(MailboxListViewControllerBase *)self _loadMailboxes];
    }
  }
  *(CFAbsoluteTime *)((char *)&self->_editingToolbarItems + 7) = CFAbsoluteTimeGetCurrent();
LABEL_9:
}

- (void)_queueReloadIfOutboxChanged:(id)a3
{
  id v6 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = *(double *)((char *)&self->_editingToolbarItems + 7);
  if (Current - v5 <= 1.0)
  {
    if (!HIBYTE(self->_lastCheckedOutbox))
    {
      [(MailboxListViewControllerMail *)self performSelector:"_reloadIfOutboxChanged:" withObject:v6 afterDelay:v5 + 1.0 - Current];
      HIBYTE(self->_lastCheckedOutbox) = 1;
    }
  }
  else
  {
    [(MailboxListViewControllerMail *)self _reloadIfOutboxChanged:v6];
    HIBYTE(self->_lastCheckedOutbox) = 0;
  }
}

- (void)messageStoreChanged:(id)a3
{
  id v4 = [a3 userInfo];
  -[MailboxListViewControllerMail performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "_queueReloadIfOutboxChanged:");
}

- (void)mailAccountsChanged:(id)a3
{
  id v5 = a3;
  if (+[NSThread isMainThread])
  {
    id v6 = [(MailboxListViewControllerBase *)self account];

    if (v6)
    {
      double v7 = [(MailboxListViewControllerBase *)self account];
      id v8 = [v7 uniqueID];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      double v9 = +[UIApplication sharedApplication];
      unsigned __int8 v10 = [v9 accountsProvider];
      double v11 = [v10 displayedAccounts];

      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v19;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v11);
            }
            float v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if ([v15 isActive])
            {
              double v16 = [v15 uniqueID];
              unsigned int v17 = [v8 isEqualToString:v16];

              if (v17)
              {
                id v12 = v15;
                goto LABEL_15;
              }
            }
          }
          id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      [(MailboxListViewControllerMail *)self setAccount:v12];
      [(MailboxListViewControllerBase *)self _loadMailboxes:1];
    }
  }
  else
  {
    [(MailboxListViewControllerMail *)self performSelectorOnMainThread:a2 withObject:v5 waitUntilDone:0];
  }
}

- (void)pendingMailboxesChanged:(id)a3
{
}

- (void)contentSizeCategoryChanged:(id)a3
{
  +[MailboxTableCell invalidateCachedLayoutInformation];
  id v4 = [(MailboxListViewControllerMail *)self tableView];
  +[MailboxTableCell defaultRowHeight];
  [v4 setRowHeight:];

  id v5 = [(MailboxListViewControllerMail *)self tableView];
  [v5 reloadData];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(MailboxListViewControllerMail *)self mailboxes];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  double v7 = [(MailboxListViewControllerMail *)self mailboxForIndexPath:a4];
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"MailboxCellReuse"];
  if (!v8)
  {
    id v8 = [[MailboxTableCell alloc] initWithStyle:3 reuseIdentifier:@"MailboxCellReuse"];
    double v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [(MailboxTableCell *)v8 setPreferredSubtitleFont:v9];

    [(MailboxTableCell *)v8 setAccessibilityIdentifier:MSAccessibilityIdentifierMailMoveMessageViewMailboxListControllerCell];
  }
  if (v7)
  {
    unsigned __int8 v10 = +[NSSet setWithObject:v7];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }
  [(MailboxTableCell *)v8 setLegacyMailboxes:v10 showUnreadCount:1];
  [v8 setDisabledForEditing:[v7 mv_isEditable] ^ 1];
  double v11 = [(MailboxListViewControllerMail *)self filteredMailboxes];
  id v12 = [v11 getObject];
  id v13 = [v12 count];

  if (v13)
  {
    uint64_t v14 = [(MailboxListViewControllerMail *)self displayPathForMailbox:v7];
    [(MailboxTableCell *)v8 setSubtitle:v14];
    float v15 = (void *)v14;
    [(MailboxTableCell *)v8 setFlattenHierarchy:1];
  }
  else
  {
    float v15 = 0;
  }
  double v16 = [(MailboxListViewControllerBase *)self selectedMailbox];
  if (v16 == v7)
  {
  }
  else
  {
    if (!v7 || ([*(id *)((char *)self + 55) containsObject:v7] & 1) != 0)
    {

LABEL_13:
      [(MailboxTableCell *)v8 setCellEnabled:0];
      goto LABEL_16;
    }
    unsigned int v17 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
    long long v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 type]);
    LODWORD(v17) = [v17 containsObject:v18];

    if (v17) {
      goto LABEL_13;
    }
  }
LABEL_16:
  unsigned int v19 = [v7 isStore];
  unsigned int v20 = [v7 mv_isEditable];
  long long v21 = v8;
  double v22 = v21;
  if (*((unsigned char *)self + 48))
  {
    [(MailboxTableCell *)v21 setAccessoryType:v19];
    [(MailboxTableCell *)v22 setEditingAccessoryType:v20];
  }

  return v22;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [UIApp preferredContentSizeCategory:a3, a4];
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    return UITableViewAutomaticDimension;
  }

  +[MailboxTableCell defaultRowHeight];
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerMail setEditing:animated:](&v23, "setEditing:animated:");
  double v7 = +[UIApplication sharedApplication];
  id v8 = [v7 accountsProvider];
  unsigned int v9 = [v8 isDisplayingMultipleAccounts];

  if (v9)
  {
    unsigned __int8 v10 = [(MailboxListViewControllerMail *)self navigationItem];
    [v10 setHidesBackButton:v5 animated:v4];
  }
  if (v5) {
    [(MailboxListViewControllerMail *)self focus:v4];
  }
  else {
    [(MailboxListViewControllerMail *)self unfocus:v4];
  }
  if ([(MailboxListViewControllerMail *)self isEditing])
  {
    double v11 = (void **)((char *)&self->_defaultToolbarItems + 7);
    id v12 = *(NSArray **)((char *)&self->_defaultToolbarItems + 7);
    if (!v12)
    {
      id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
      id v14 = objc_alloc((Class)UIBarButtonItem);
      float v15 = +[NSBundle bundleForClass:objc_opt_class()];
      double v16 = [v15 localizedStringForKey:@"NEW_MAILBOX" value:&stru_100619928 table:@"Main"];
      id v17 = [v14 initWithTitle:v16 style:0 target:self action:"newMailboxClicked:"];

      v24[0] = v13;
      v24[1] = v17;
      uint64_t v18 = +[NSArray arrayWithObjects:v24 count:2];
      unsigned int v19 = *v11;
      *double v11 = (void *)v18;
LABEL_16:

      id v12 = *v11;
    }
  }
  else
  {
    double v11 = (void **)((char *)&self->_disabledMailboxTypes + 7);
    id v12 = *(NSMutableSet **)((char *)&self->_disabledMailboxTypes + 7);
    if (!v12)
    {
      id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
      id v17 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
      unsigned int v19 = [(MailboxListViewControllerMail *)self scene];
      if ((+[UIDevice mf_isPad] & 1) == 0
        && [v19 conformsToProtocol:&OBJC_PROTOCOL___ComposeCapable]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v20 = [v19 newComposeButtonItem];
        v26[0] = v13;
        v26[1] = v17;
        v26[2] = v20;
        long long v21 = +[NSArray arrayWithObjects:v26 count:3];
        [(MailboxListViewControllerMail *)self setToolbarItems:v21];
      }
      else
      {
        v25[0] = v13;
        v25[1] = v17;
        id v20 = +[NSArray arrayWithObjects:v25 count:2];
        [(MailboxListViewControllerMail *)self setToolbarItems:v20];
      }

      goto LABEL_16;
    }
  }
  id v22 = v12;
  [(MailboxListViewControllerMail *)self setToolbarItems:v22 animated:v4];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [(MailboxListViewControllerMail *)self setSelectedSourceType:0];
  BOOL v5 = [(MailboxListViewControllerMail *)self mailboxForIndexPath:v6];
  if (v5) {
    [(MailboxListViewControllerBase *)self setSelectedMailbox:v5 animated:1];
  }
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

+ (int64_t)tableViewStyle
{
  return 0;
}

- (id)_ntsMailboxesForAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MailChangeManager sharedChangeManager];
  id v6 = [v5 allMailboxUidsSortedWithSpecialsAtTopForAccount:v4 includingLocals:1 client:self outbox:0];

  return v6;
}

- (void)shouldReloadMailboxesWithOutbox:(id)a3
{
  id v9 = a3;
  if (+[NSThread isMainThread])
  {
    *((unsigned char *)&self->super + 8) |= 1u;
    BOOL v5 = +[MailChangeManager sharedChangeManager];
    id v6 = [(MailboxListViewControllerBase *)self account];
    double v7 = [v5 allMailboxUidsSortedWithSpecialsAtTopForAccount:v6 includingLocals:1 client:self outbox:v9];
    [(MailboxListViewControllerBase *)self setSortedMailboxes:v7];

    *((unsigned char *)&self->super + 8) &= ~1u;
    id v8 = [(MailboxListViewControllerMail *)self tableView];
    [v8 reloadData];
  }
  else
  {
    [(MailboxListViewControllerMail *)self performSelectorOnMainThread:a2 withObject:v9 waitUntilDone:0];
  }
}

- (BOOL)shouldHideInbox
{
  return (*((unsigned __int8 *)self + 48) >> 1) & 1;
}

- (BOOL)shouldHideNotesForAccount:(id)a3
{
  return [a3 isSyncingNotes];
}

- (id)mailboxes
{
  char v3 = [(MailboxListViewControllerMail *)self filteredMailboxes];
  id v4 = [v3 getObject];

  if ([v4 count])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(MailboxListViewControllerBase *)self sortedMailboxes];
  }
  id v6 = v5;

  return v6;
}

- (void)filterMailboxesContainingText:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxListViewControllerBase *)self sortedMailboxes];
  id v6 = [v5 copy];

  double v7 = (char *)[(MailboxListViewControllerMail *)self currentMailboxFilterID] + 1;
  [(MailboxListViewControllerMail *)self setCurrentMailboxFilterID:v7];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = [(MailboxListViewControllerMail *)self mailboxFilterScheduler];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000EE1DC;
  v11[3] = &unk_100607A90;
  objc_copyWeak(v14, &location);
  id v9 = v4;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  v14[1] = v7;
  [v8 performBlock:v11];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (id)displayPathForMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parent];
  unsigned __int8 v6 = [v5 isRootMailbox];

  if (v6)
  {
    double v7 = 0;
  }
  else
  {
    id v8 = [(MailboxListViewControllerMail *)self mailboxDisplayPathCache];
    id v9 = [v4 uniqueId];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000EE6F4;
    v11[3] = &unk_100607AB8;
    id v12 = v4;
    id v13 = self;
    double v7 = [v8 objectForKey:v9 generator:v11];
  }

  return v7;
}

- (unint64_t)selectedSourceType
{
  return *(void *)(&self->_isRefreshing + 4);
}

- (void)setSelectedSourceType:(unint64_t)a3
{
  *(void *)(&self->_isRefreshing + 4) = a3;
}

- (MailScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_selectedSourceType + 7));

  return (MailScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (EFCancelable)tableViewObserver
{
  return *(EFCancelable **)((char *)&self->_scene + 7);
}

- (void)setTableViewObserver:(id)a3
{
}

- (EFLocked)filteredMailboxes
{
  return *(EFCancelable **)((char *)&self->_tableViewObserver + 7);
}

- (void)setFilteredMailboxes:(id)a3
{
}

- (int64_t)currentMailboxFilterID
{
  return *(int64_t *)((char *)&self->_filteredMailboxes + 7);
}

- (void)setCurrentMailboxFilterID:(int64_t)a3
{
  *(EFLocked **)((char *)&self->_filteredMailboxes + 7) = (EFLocked *)a3;
}

- (EFLazyCache)mailboxDisplayPathCache
{
  return *(EFLazyCache **)((char *)&self->_currentMailboxFilterID + 7);
}

- (void)setMailboxDisplayPathCache:(id)a3
{
}

- (EFScheduler)mailboxFilterScheduler
{
  return *(EFLazyCache **)((char *)&self->_mailboxDisplayPathCache + 7);
}

- (void)setMailboxFilterScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_mailboxDisplayPathCache + 7), 0);
  objc_storeStrong((id *)((char *)&self->_currentMailboxFilterID + 7), 0);
  objc_storeStrong((id *)((char *)&self->_tableViewObserver + 7), 0);
  objc_storeStrong((id *)((char *)&self->_scene + 7), 0);
  objc_destroyWeak((id *)((char *)&self->_selectedSourceType + 7));
  objc_destroyWeak((id *)(&self->_queuedOutboxCheck + 7));
  objc_storeStrong((id *)((char *)&self->_defaultToolbarItems + 7), 0);
  objc_storeStrong((id *)((char *)&self->_disabledMailboxTypes + 7), 0);
  objc_storeStrong((id *)((char *)&self->_disabledMailboxes + 7), 0);

  objc_storeStrong((id *)((char *)self + 55), 0);
}

@end