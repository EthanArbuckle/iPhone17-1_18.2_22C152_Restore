@interface MailboxListViewControllerBase
+ (int64_t)tableViewStyle;
- (BOOL)shouldHideInbox;
- (BOOL)shouldHideNotesForAccount:(id)a3;
- (MFMailboxUid)selectedMailbox;
- (MailAccount)account;
- (MailboxListViewControllerBase)init;
- (NSArray)sortedMailboxes;
- (id)_ntsMailboxesForAccount:(id)a3;
- (id)indexPathForMailbox:(id)a3;
- (id)indexPathForSelection;
- (id)mailboxForIndexPath:(id)a3;
- (id)mailboxSelectionTarget;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_loadMailboxes;
- (void)_loadMailboxes:(BOOL)a3;
- (void)_loadMailboxesAfterMailboxListingChanged;
- (void)_loadMailboxesForcibly:(id)a3;
- (void)_popToMailboxListViewController;
- (void)dealloc;
- (void)didSelectMailbox:(id)a3 changed:(BOOL)a4 animated:(BOOL)a5;
- (void)mailboxListingChanged:(id)a3;
- (void)preventNextScrollbarFlash;
- (void)setAccount:(id)a3;
- (void)setMailboxSelectionTarget:(id)a3;
- (void)setSelectedMailbox:(id)a3;
- (void)setSelectedMailbox:(id)a3 animated:(BOOL)a4;
- (void)setSelectedMailbox:(id)a3 forceChange:(BOOL)a4 animated:(BOOL)a5;
- (void)setSortedMailboxes:(id)a3;
- (void)setViewingContext:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillFirstAppear:(BOOL)a3;
- (void)viewWillReappear:(BOOL)a3;
@end

@implementation MailboxListViewControllerBase

+ (int64_t)tableViewStyle
{
}

- (MailboxListViewControllerBase)init
{
  id v3 = [(id)objc_opt_class() tableViewStyle];
  v7.receiver = self;
  v7.super_class = (Class)MailboxListViewControllerBase;
  v4 = [(MailboxListViewControllerBase *)&v7 initWithStyle:v3];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"mailboxListingChanged:" name:AccountMailboxListingDidChange object:0];
  }
  return v4;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MailboxListViewControllerBase;
  [(MailboxListViewControllerBase *)&v4 dealloc];
}

- (void)setAccount:(id)a3
{
  v5 = (MailAccount *)a3;
  if (self->_account != v5)
  {
    objc_storeStrong((id *)&self->_account, a3);
    [(MailboxListViewControllerBase *)self setSortedMailboxes:0];
  }
}

- (id)mailboxForIndexPath:(id)a3
{
  id v5 = a3;
  [(MailboxListViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MailboxListViewControllerBase mailboxForIndexPath:]", "MailboxListViewControllerBase.m", 58, "0");
}

- (id)indexPathForMailbox:(id)a3
{
  id v5 = a3;
  [(MailboxListViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MailboxListViewControllerBase indexPathForMailbox:]", "MailboxListViewControllerBase.m", 62, "0");
}

- (void)preventNextScrollbarFlash
{
  self->_preventNextScrollbarFlash = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_preventNextScrollbarFlash)
  {
    id v5 = [(MailboxListViewControllerBase *)self tableView];
    [v5 setScrollEnabled:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)MailboxListViewControllerBase;
  [(MailboxListViewControllerBase *)&v7 viewDidAppear:v3];
  if (self->_preventNextScrollbarFlash)
  {
    v6 = [(MailboxListViewControllerBase *)self tableView];
    [v6 setScrollEnabled:1];

    self->_preventNextScrollbarFlash = 0;
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MailboxListViewControllerBase;
  [(MailboxListViewControllerBase *)&v4 viewDidLoad];
  BOOL v3 = [(MailboxListViewControllerBase *)self tableView];
  [v3 setAllowsSelectionDuringEditing:1];
}

- (void)setViewingContext:(id)a3
{
  id v6 = a3;
  objc_super v4 = [v6 account];
  [(MailboxListViewControllerBase *)self setAccount:v4];

  id v5 = [v6 selectionTarget];
  objc_storeWeak(&self->_mailboxSelectionTarget, v5);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(MailboxListViewControllerBase *)self isReappearing])
  {
    [(MailboxListViewControllerBase *)self viewWillReappear:v3];
  }
  else
  {
    [(MailboxListViewControllerBase *)self viewWillFirstAppear:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)MailboxListViewControllerBase;
  [(MailboxListViewControllerBase *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MailboxListViewControllerBase;
  [(MailboxListViewControllerBase *)&v6 viewWillDisappear:a3];
  self->_interactiveTransitionWasCancelled = 0;
  objc_super v4 = [(MailboxListViewControllerBase *)self transitionCoordinator];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EA5BC;
  v5[3] = &unk_100606048;
  v5[4] = self;
  [v4 notifyWhenInteractionChangesUsingBlock:v5];
}

- (void)viewWillFirstAppear:(BOOL)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_loadMailboxes" object:0];
  [(MailboxListViewControllerBase *)self setSortedMailboxes:0];
  [(MailboxListViewControllerBase *)self _loadMailboxes];
  id v5 = +[MFInvocationQueue sharedInvocationQueue];
  objc_super v4 = +[MFMonitoredInvocation mf_invocationWithSelector:"fetchMailboxListImplicit" target:self->_account];
  [v5 addInvocation:v4];
}

- (void)viewWillReappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MailboxListViewControllerBase *)self _loadMailboxes];
  id v8 = [(MailboxListViewControllerBase *)self selectedMailbox];
  if (v8)
  {
    id v5 = [(MailboxListViewControllerBase *)self presentedViewController];
    if (v5) {
      goto LABEL_3;
    }
    BOOL interactiveTransitionWasCancelled = self->_interactiveTransitionWasCancelled;

    if (!interactiveTransitionWasCancelled)
    {
      id v8 = [(MailboxListViewControllerBase *)self indexPathForSelection];
      if (!v8) {
        goto LABEL_4;
      }
      id v5 = [(MailboxListViewControllerBase *)self tableView];
      if (![v5 numberOfSections]) {
        [v5 reloadData];
      }
      [v5 scrollToRowAtIndexPath:v8 atScrollPosition:0 animated:0];
      [v5 selectRowAtIndexPath:v8 animated:0 scrollPosition:0];
      [v5 deselectRowAtIndexPath:v8 animated:v3];
LABEL_3:

LABEL_4:
    }
  }
  id v9 = +[MFInvocationQueue sharedInvocationQueue];
  objc_super v7 = +[MFMonitoredInvocation mf_invocationWithSelector:"fetchMailboxListImplicit" target:self->_account];
  [v9 addInvocation:v7];
}

- (void)setSelectedMailbox:(id)a3
{
}

- (void)setSelectedMailbox:(id)a3 animated:(BOOL)a4
{
}

- (void)setSelectedMailbox:(id)a3 forceChange:(BOOL)a4 animated:(BOOL)a5
{
  objc_super v7 = (MFMailboxUid *)a3;
  if (self->_selectedMailbox != v7) {
    objc_storeStrong((id *)&self->_selectedMailbox, a3);
  }
  -[MailboxListViewControllerBase didSelectMailbox:changed:animated:](self, "didSelectMailbox:changed:animated:");
}

- (void)didSelectMailbox:(id)a3 changed:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a4;
  id v8 = a3;
  objc_super v7 = [(MailboxListViewControllerBase *)self mailboxSelectionTarget];
  if (v8 && v7 && v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 mailboxList:self didSelectMailbox:v8];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [(MailboxListViewControllerBase *)self mailboxForIndexPath:a4];
  -[MailboxListViewControllerBase setSelectedMailbox:forceChange:animated:](self, "setSelectedMailbox:forceChange:animated:");
}

- (id)_ntsMailboxesForAccount:(id)a3
{
  id v5 = a3;
  [(MailboxListViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MailboxListViewControllerBase _ntsMailboxesForAccount:]", "MailboxListViewControllerBase.m", 172, "0");
}

- (void)_loadMailboxes
{
}

- (void)_loadMailboxesForcibly:(id)a3
{
  id v13 = a3;
  if (!+[NSThread isMainThread]) {
    __assert_rtn("-[MailboxListViewControllerBase _loadMailboxesForcibly:]", "MailboxListViewControllerBase.m", 180, "[NSThread isMainThread]");
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (([v13 BOOLValue] & 1) == 0)
  {
    id v5 = [(MailboxListViewControllerBase *)self sortedMailboxes];
    if ([v5 count])
    {
      double v6 = Current - *(double *)&qword_1006995B8;

      if (v6 <= 5.0) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  qword_1006995B8 = *(void *)&Current;
  *((unsigned char *)self + 8) |= 1u;
  objc_super v7 = [(MailboxListViewControllerBase *)self _ntsMailboxesForAccount:self->_account];
  [(MailboxListViewControllerBase *)self setSortedMailboxes:v7];

  [(MailboxListViewControllerBase *)self _loadExtraMailboxes];
  id v8 = [(MailboxListViewControllerBase *)self selectedMailbox];
  if (v8)
  {
    id v9 = [(MailboxListViewControllerBase *)self sortedMailboxes];
    v10 = [(MailboxListViewControllerBase *)self selectedMailbox];
    unsigned __int8 v11 = [v9 containsObject:v10];

    if ((v11 & 1) == 0) {
      [(MailboxListViewControllerBase *)self setSelectedMailbox:0];
    }
  }
  *((unsigned char *)self + 8) &= ~1u;
  v12 = [(MailboxListViewControllerBase *)self tableView];
  [v12 reloadData];

LABEL_11:
}

- (void)_loadMailboxes:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  if (+[NSThread isMainThread]) {
    [(MailboxListViewControllerBase *)self _loadMailboxesForcibly:v4];
  }
  else {
    [(MailboxListViewControllerBase *)self performSelectorOnMainThread:"_loadMailboxesForcibly:" withObject:v4 waitUntilDone:0];
  }
}

- (void)_popToMailboxListViewController
{
  if (+[NSThread isMainThread])
  {
    id v5 = [(MailboxListViewControllerBase *)self navigationController];
    id v4 = [v5 popToViewController:self animated:1];
  }
  else
  {
    [(MailboxListViewControllerBase *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)_loadMailboxesAfterMailboxListingChanged
{
}

- (void)mailboxListingChanged:(id)a3
{
  id v15 = a3;
  if ((*((unsigned char *)self + 8) & 1) == 0)
  {
    id v4 = [v15 object];
    id v5 = [v4 account];
    double v6 = v5;
    if (!v4
      || self->_account == v5
      || (+[LocalAccount localAccount],
          objc_super v7 = (MailAccount *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7 == v6))
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_loadMailboxesAfterMailboxListingChanged" object:0];
      [(MailboxListViewControllerBase *)self performSelector:"_loadMailboxesAfterMailboxListingChanged" withObject:0 afterDelay:0.3];
    }
    *((unsigned char *)self + 8) &= ~1u;
  }
  id v8 = [(MailboxListViewControllerBase *)self selectedMailbox];
  if (v8)
  {
    id v9 = [(MailboxListViewControllerBase *)self navigationController];
    v10 = [v9 topViewController];
    if (v10 != self)
    {
      unsigned __int8 v11 = [(MailboxListViewControllerBase *)self isEditing];

      if (v11) {
        goto LABEL_15;
      }
      v12 = [v15 userInfo];
      id v9 = [v12 objectForKey:@"OldChildren"];

      id v13 = [v15 userInfo];
      v14 = [v13 objectForKey:@"NewChildren"];

      if ([v9 containsObject:v8]
        && ([(MailboxListViewControllerBase *)v14 containsObject:v8] & 1) == 0)
      {
        [(MailboxListViewControllerBase *)self _popToMailboxListViewController];
      }
      self = v14;
    }
  }
LABEL_15:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(MailboxListViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MailboxListViewControllerBase tableView:cellForRowAtIndexPath:]", "MailboxListViewControllerBase.m", 249, "0");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(MailboxListViewControllerBase *)self sortedMailboxes];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (BOOL)shouldHideInbox
{
  return 0;
}

- (BOOL)shouldHideNotesForAccount:(id)a3
{
  return 0;
}

- (id)indexPathForSelection
{
  BOOL v3 = [(MailboxListViewControllerBase *)self selectedMailbox];
  if (v3)
  {
    id v4 = [(MailboxListViewControllerBase *)self selectedMailbox];
    id v5 = [(MailboxListViewControllerBase *)self indexPathForMailbox:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MailAccount)account
{
  return self->_account;
}

- (MFMailboxUid)selectedMailbox
{
  return self->_selectedMailbox;
}

- (NSArray)sortedMailboxes
{
  return self->_sortedMailboxes;
}

- (void)setSortedMailboxes:(id)a3
{
}

- (id)mailboxSelectionTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_mailboxSelectionTarget);

  return WeakRetained;
}

- (void)setMailboxSelectionTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_mailboxSelectionTarget);
  objc_storeStrong((id *)&self->_sortedMailboxes, 0);
  objc_storeStrong((id *)&self->_selectedMailbox, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end