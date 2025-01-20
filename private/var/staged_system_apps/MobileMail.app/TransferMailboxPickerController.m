@interface TransferMailboxPickerController
+ (id)log;
- (BOOL)canDismiss;
- (BOOL)shouldAutorotate;
- (BOOL)shouldSnapshot;
- (EMMailboxPrediction)mailboxPrediction;
- (MailAccount)account;
- (MailScene)scene;
- (NSSet)sourceAccounts;
- (TransferMailboxContext)currentTransferContext;
- (TransferMailboxPickerAnimationDelegate)animationDelegate;
- (TransferMailboxPickerController)initWithItems:(id)a3 scene:(id)a4;
- (double)_navigationBarAndPaletteMaxY;
- (double)_navigationBarMaxY;
- (double)_yOffsetMaximum;
- (id)_sendersFromItems:(id)a3;
- (id)_sourceMailboxesFromItems:(id)a3;
- (id)_subjectFromItems:(id)a3 totalMessageCount:(int64_t)a4;
- (id)contentScrollView;
- (id)didFinish;
- (id)willTransferMessages;
- (void)_cancel:(id)a3;
- (void)_didReceiveTargetDetailChangedNotification:(id)a3;
- (void)_setPaletteVisible:(BOOL)a3;
- (void)accountList:(id)a3 didCancel:(BOOL)a4;
- (void)accountList:(id)a3 didSelectAccount:(id)a4;
- (void)animateMessageToCell:(id)a3;
- (void)animateMessageToPoint:(CGPoint)a3 inView:(id)a4 completion:(id)a5;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)dismiss;
- (void)mailAccountsDidChange:(id)a3;
- (void)mailboxList:(id)a3 didSelectMailbox:(id)a4;
- (void)messageAnimationDidStop;
- (void)restoreScrollOffset;
- (void)saveScrollOffset;
- (void)setAccount:(id)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setCurrentTransferContext:(id)a3;
- (void)setDidFinish:(id)a3;
- (void)setMailboxPrediction:(id)a3;
- (void)setScene:(id)a3;
- (void)setWillTransferMessages:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateTitle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TransferMailboxPickerController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021F4F0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699F38 != -1) {
    dispatch_once(&qword_100699F38, block);
  }
  v2 = (void *)qword_100699F30;

  return v2;
}

- (TransferMailboxPickerController)initWithItems:(id)a3 scene:(id)a4
{
  id v7 = a3;
  id obj = a4;
  v45 = v7;
  if (!v7)
  {
    v43 = +[NSAssertionHandler currentHandler];
    [v43 handleFailureInMethod:a2, self, @"TransferMailboxPickerController.m", 102, @"Invalid parameter not satisfying: %@", @"nil != items" object file lineNumber description];
  }
  v55.receiver = self;
  v55.super_class = (Class)TransferMailboxPickerController;
  v8 = [(TransferMailboxPickerController *)&v55 init];
  if (v8)
  {
    v46 = +[NSMutableSet set];
    uint64_t v9 = [v7 sortedArrayUsingComparator:&stru_10060E0B8];
    sortedMessages = v8->_sortedMessages;
    v8->_sortedMessages = (NSArray *)v9;

    v8->_totalMessageCount = 0;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v52;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v52 != v13) {
            objc_enumerationMutation(v11);
          }
          v8->_totalMessageCount += (int64_t)[*(id *)(*((void *)&v51 + 1) + 8 * i) count];
        }
        id v12 = [v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v12);
    }

    objc_storeWeak((id *)&v8->_scene, obj);
    uint64_t v15 = [(TransferMailboxPickerController *)v8 _sendersFromItems:v11];
    senders = v8->_senders;
    v8->_senders = (NSArray *)v15;

    uint64_t v17 = [(TransferMailboxPickerController *)v8 _subjectFromItems:v11 totalMessageCount:v8->_totalMessageCount];
    subject = v8->_subject;
    v8->_subject = (NSString *)v17;

    uint64_t v19 = [(TransferMailboxPickerController *)v8 _sourceMailboxesFromItems:v11];
    sourceMailboxes = v8->_sourceMailboxes;
    v8->_sourceMailboxes = (NSSet *)v19;

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v21 = v8->_sourceMailboxes;
    id v22 = [(NSSet *)v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v48;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)j) account];
          if (v25)
          {
            [v46 addObject:v25];
          }
          else
          {
            v26 = +[EFAutoBugCaptureReporter sharedReporter];
            [v26 reportIssueType:@"TransferMailboxPickerController" description:@"account is nil"];
          }
        }
        id v22 = [(NSSet *)v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v22);
    }

    if ((unint64_t)[v46 count] < 2) {
      goto LABEL_27;
    }
    *((unsigned char *)v8 + 80) |= 1u;
    v27 = +[NSUserDefaults standardUserDefaults];
    v28 = [v27 stringForKey:@"LastTransferAccount"];

    v29 = +[LocalAccount localAccount];
    v30 = [v29 uniqueID];
    unsigned int v31 = [v28 isEqualToString:v30];

    if (v31)
    {
      account = +[NSUserDefaults standardUserDefaults];
      [account removeObjectForKey:@"LastTransferAccount"];
    }
    else
    {
      if (!v28) {
        goto LABEL_27;
      }
      uint64_t v33 = +[MailAccount accountWithUniqueId:v28];
      account = v8->_account;
      v8->_account = (MailAccount *)v33;
    }

LABEL_27:
    v34 = v8->_account;
    if (!v34 || ([(MailAccount *)v34 isActive] & 1) == 0)
    {
      uint64_t v35 = [v46 anyObject];
      v36 = v8->_account;
      v8->_account = (MailAccount *)v35;
    }
    v37 = (NSSet *)[v46 copy];
    sourceAccounts = v8->_sourceAccounts;
    v8->_sourceAccounts = v37;

    v39 = [[MFMessageScreenshotGenerator alloc] initWithScene:obj];
    screenshotGenerator = v8->_screenshotGenerator;
    v8->_screenshotGenerator = v39;

    v41 = +[NSNotificationCenter defaultCenter];
    [v41 addObserver:v8 selector:"mailAccountsDidChange:" name:ECMailAccountsDidChangeNotification object:0];
    [v41 addObserver:v8 selector:"_didReceiveTargetDetailChangedNotification:" name:UIViewControllerShowDetailTargetDidChangeNotification object:0];
  }
  return v8;
}

- (void)dealloc
{
  [(MailboxListViewControllerMail *)self->_mailboxListController removeFromParentViewController];
  v3.receiver = self;
  v3.super_class = (Class)TransferMailboxPickerController;
  [(TransferMailboxPickerController *)&v3 dealloc];
}

- (void)mailAccountsDidChange:(id)a3
{
  if (self) {
    sub_100221580(self, 0, 0);
  }
}

- (id)contentScrollView
{
  v2 = [(MailboxListViewControllerMail *)self->_mailboxListController tableView];
  [v2 setAccessibilityIdentifier:MSAccessibilityIdentifierMailMoveMessageViewMailboxListController];

  return v2;
}

- (void)updateTitle
{
  objc_super v3 = +[NSBundle mainBundle];
  id v8 = [v3 localizedStringForKey:@"MAILBOXES" value:&stru_100619928 table:@"Main"];

  v4 = [(MailAccount *)self->_account displayName];
  if ([v4 length])
  {
    id v5 = v4;

    id v8 = v5;
  }
  v6 = [(TransferMailboxPickerController *)self title];
  unsigned __int8 v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0) {
    [(TransferMailboxPickerController *)self setTitle:v8];
  }
}

- (double)_yOffsetMaximum
{
  v2 = [(MailboxListViewControllerMail *)self->_mailboxListController tableView];
  [v2 contentSize];
  double v4 = v3;
  [v2 bounds];
  double v6 = v4 - v5;

  return v6;
}

- (void)saveScrollOffset
{
  if (!qword_100699F28)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    double v4 = (void *)qword_100699F28;
    qword_100699F28 = (uint64_t)v3;
  }
  double v5 = [(MailboxListViewControllerMail *)self->_mailboxListController tableView];
  [v5 contentOffset];
  double v7 = v6;

  [(TransferMailboxPickerController *)self _yOffsetMaximum];
  if (v7 >= v8) {
    double v7 = INFINITY;
  }
  uint64_t v9 = [(MailboxListViewControllerBase *)self->_mailboxListController account];
  id v14 = [v9 uniqueID];

  id v11 = v14;
  if (v14)
  {
    id v12 = (void *)qword_100699F28;
    *(float *)&double v10 = v7;
    uint64_t v13 = +[NSNumber numberWithFloat:v10];
    [v12 setObject:v13 forKey:v14];

    id v11 = v14;
  }
}

- (void)restoreScrollOffset
{
  id v3 = (void *)qword_100699F28;
  double v4 = [(MailboxListViewControllerBase *)self->_mailboxListController account];
  double v5 = [v4 uniqueID];
  id v16 = [v3 objectForKey:v5];

  double v6 = [(MailboxListViewControllerMail *)self->_mailboxListController tableView];
  if (v16)
  {
    [v16 floatValue];
    float v8 = v7;
    [(TransferMailboxPickerController *)self _yOffsetMaximum];
    double v10 = v9;
    [(TransferMailboxPickerController *)self _navigationBarAndPaletteMaxY];
    double v12 = v8;
    if (v10 <= v8) {
      double v12 = v10;
    }
    double v13 = v12 + v11;
    if (v13 >= 0.0) {
      double v14 = v13;
    }
    else {
      double v14 = 0.0;
    }
  }
  else
  {
    double v14 = 0.0;
  }
  [v6 contentInset];
  [v6 setContentOffset:0.0, v14 - v15];
}

- (double)_navigationBarMaxY
{
  id v3 = [(TransferMailboxPickerController *)self scene];
  double v4 = [v3 statusBarManager];
  [v4 statusBarFrame];
  double Height = CGRectGetHeight(v10);

  double v6 = [(TransferMailboxPickerController *)self navigationController];
  float v7 = [v6 navigationBar];
  [v7 bounds];
  double v8 = Height + 0.0 + CGRectGetHeight(v11);

  return v8;
}

- (double)_navigationBarAndPaletteMaxY
{
  [(TransferMailboxPickerController *)self _navigationBarMaxY];
  return result;
}

- (id)_sendersFromItems:(id)a3
{
  id v16 = a3;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v16;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) senderList];
        CGRect v10 = [v9 firstObject];
        CGRect v11 = [v10 emailAddressValue];

        double v12 = [v11 displayName];
        if (![v12 length])
        {
          uint64_t v13 = [v11 simpleAddress];

          double v12 = (void *)v13;
        }
        if ([v12 length])
        {
          if (!v12) {
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v14 = +[MUILocalizedMessageListStrings noSenderPlaceholder];

          double v12 = (void *)v14;
          if (!v14) {
            goto LABEL_14;
          }
        }
        if (([v4 containsObject:v12] & 1) == 0)
        {
          [v3 addObject:v12];
          [v4 addObject:v12];
        }
LABEL_14:
      }
      id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_subjectFromItems:(id)a3 totalMessageCount:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 != 1)
  {
    CGRect v10 = +[NSNumberFormatter ef_formatUnsignedInteger:a4 withGrouping:1];
    uint64_t v13 = +[NSBundle mainBundle];
    CGRect v11 = [v13 localizedStringForKey:@"N_MESSAGES" value:&stru_100619928 table:@"Main"];

    id v9 = [objc_alloc((Class)NSString) initWithFormat:v11, v10];
    goto LABEL_6;
  }
  uint64_t v7 = [v5 lastObject];
  double v8 = [v7 subject];
  id v9 = [v8 subjectString];

  if (!v9 || ![v9 length])
  {
    CGRect v10 = +[NSBundle mainBundle];
    CGRect v11 = [v10 localizedStringForKey:@"NO_SUBJECT" value:&stru_100619928 table:@"Main"];
    id v12 = [v11 copy];

    id v9 = v12;
LABEL_6:
  }

  return v9;
}

- (id)_sourceMailboxesFromItems:(id)a3
{
  id v14 = a3;
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v14;
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v8 = +[UIApplication sharedApplication];
        id v9 = [v8 mailboxProvider];
        CGRect v10 = [v7 mailboxes];
        CGRect v11 = [v10 ef_mapSelector:@"objectID"];
        id v12 = [v9 legacyMailboxesForObjectIDs:v11];
        [v3 addObjectsFromArray:v12];
      }
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  return v3;
}

- (void)_setPaletteVisible:(BOOL)a3
{
  if (a3)
  {
    pickerPalette = self->_pickerPalette;
    if (!pickerPalette)
    {
      uint64_t v5 = -[TransferMailboxPickerPalette initWithFrame:]([TransferMailboxPickerPalette alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      id v6 = self->_pickerPalette;
      self->_pickerPalette = v5;

      pickerPalette = self->_pickerPalette;
    }
    [(TransferMailboxPickerPalette *)pickerPalette setSubject:self->_subject];
    [(TransferMailboxPickerPalette *)self->_pickerPalette setSenders:self->_senders];
    [(TransferMailboxPickerPalette *)self->_pickerPalette setMessageCount:self->_totalMessageCount];
    uint64_t v7 = [(NSArray *)self->_sortedMessages firstObject];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([WeakRetained transferMailboxPickerController:self viewForItem:v7],
          (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(TransferMailboxPickerPalette *)self->_pickerPalette setMessageThumbnailWithView:v9];
    }
    else
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self->_pickerPalette);
      id from = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&from, self->_screenshotGenerator);
      CGRect v11 = [v7 displayMessage];
      id v12 = +[EFScheduler mainThreadScheduler];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100220C1C;
      v25[3] = &unk_10060E108;
      v25[4] = self;
      objc_copyWeak(&v26, &from);
      objc_copyWeak(&v27, &location);
      [v11 onScheduler:v12 addSuccessBlock:v25];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      id v9 = 0;
    }
    uint64_t v13 = [(TransferMailboxPickerController *)self navigationController];
    id v14 = [v13 existingPaletteForEdge:2];

    if (!v14)
    {
      double v15 = self->_pickerPalette;
      long long v16 = [v13 view];
      [v16 frame];
      -[TransferMailboxPickerPalette sizeThatFits:](v15, "sizeThatFits:", v17, v18);
      double v20 = v19;
      double v22 = v21;

      uint64_t v23 = [v13 paletteForEdge:2 size:v20, v22];
      [v23 bounds];
      -[TransferMailboxPickerPalette setFrame:](self->_pickerPalette, "setFrame:");
      [v23 addSubview:self->_pickerPalette];
      [v13 attachPalette:v23 isPinned:0];
    }
  }
  else
  {
    id v24 = [(TransferMailboxPickerController *)self navigationController];
    CGRect v10 = [v24 existingPaletteForEdge:2];
    if (v10) {
      [v24 detachPalette:v10];
    }
  }
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)TransferMailboxPickerController;
  [(TransferMailboxPickerController *)&v31 viewDidLoad];
  id v3 = [(TransferMailboxPickerController *)self scene];
  v30 = v3;
  id v4 = objc_alloc((Class)UIView);
  uint64_t v5 = [v3 mf_window];
  [v5 bounds];
  id v6 = [v4 initWithFrame:];

  [v6 setAutoresizingMask:18];
  [(TransferMailboxPickerController *)self setView:v6];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  [(TransferMailboxPickerController *)self updateTitle];
  mailboxListController = self->_mailboxListController;
  if (!mailboxListController)
  {
    id v12 = [[MailboxListViewControllerMail alloc] initWithScene:v3];
    uint64_t v13 = self->_mailboxListController;
    self->_mailboxListController = v12;

    mailboxListController = self->_mailboxListController;
  }
  [(MailboxListViewControllerMail *)mailboxListController setShowsDisclosure:0];
  [(MailboxListViewControllerMail *)self->_mailboxListController setShowsRefreshControl:0];
  [(TransferMailboxPickerController *)self addChildViewController:self->_mailboxListController];
  id v14 = objc_alloc_init(MailboxListViewingContext);
  [(MailboxListViewingContext *)v14 setAccount:self->_account];
  [(MailboxListViewingContext *)v14 setSelectionTarget:self];
  [(MailboxListViewControllerBase *)self->_mailboxListController setViewingContext:v14];
  id v15 = [(NSSet *)self->_sourceMailboxes mutableCopy];
  v29 = v15;
  long long v16 = [(MailAccount *)self->_account transferDisabledMailboxUids];
  if (v16) {
    [v15 addObjectsFromArray:v16];
  }
  [(MailboxListViewControllerMail *)self->_mailboxListController disableMailboxes:v15];
  double v17 = +[NSNumber numberWithInt:6];
  double v18 = +[NSNumber numberWithInt:106];
  double v19 = +[NSNumber numberWithInt:5];
  double v20 = +[NSNumber numberWithInt:105];
  double v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, v19, v20, 0);

  [(MailboxListViewControllerMail *)self->_mailboxListController disableMailboxTypes:v21];
  double v22 = [(MailboxListViewControllerMail *)self->_mailboxListController view];
  [v22 setFrame:0.0, 0.0, v8, v10];
  [v6 addSubview:v22];
  [(MailboxListViewControllerMail *)self->_mailboxListController didMoveToParentViewController:self];
  id v23 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
  [v23 setSearchResultsUpdater:self];
  [v23 setHidesNavigationBarDuringPresentation:1];
  [v23 setObscuresBackgroundDuringPresentation:0];
  id v24 = _EFLocalizedString();
  v25 = [v23 searchBar];
  [v25 setPlaceholder:v24];

  id v26 = [v23 searchBar];
  id v27 = [v26 searchTextField];
  [v27 setAccessibilityIdentifier:MSAccessibilityIdentifierMailMoveMessageViewMailboxListControllerSearchTextField];

  v28 = [(TransferMailboxPickerController *)self navigationItem];
  [v28 setSearchController:v23];

  [(TransferMailboxPickerController *)self setDefinesPresentationContext:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController viewWillAppear:](&v11, "viewWillAppear:");
  [(MailboxListViewControllerMail *)self->_mailboxListController viewWillAppear:v3];
  id v5 = objc_alloc((Class)UIBarButtonItem);
  id v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
  id v8 = [v5 initWithTitle:v7 style:0 target:self action:"_cancel:"];

  double v9 = [(TransferMailboxPickerController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  double v10 = [(TransferMailboxPickerController *)self scene];
  -[TransferMailboxPickerController _setPaletteVisible:](self, "_setPaletteVisible:", [v10 isInExpandedEnvironment] ^ 1);

  [(TransferMailboxPickerController *)self restoreScrollOffset];
}

- (void)_didReceiveTargetDetailChangedNotification:(id)a3
{
  id v4 = [(TransferMailboxPickerController *)self scene];
  -[TransferMailboxPickerController _setPaletteVisible:](self, "_setPaletteVisible:", [v4 isInExpandedEnvironment] ^ 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController viewDidAppear:](&v5, "viewDidAppear:");
  [(MailboxListViewControllerMail *)self->_mailboxListController viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController viewWillDisappear:](&v5, "viewWillDisappear:");
  [(TransferMailboxPickerController *)self saveScrollOffset];
  [(MailboxListViewControllerMail *)self->_mailboxListController viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController viewDidDisappear:](&v5, "viewDidDisappear:");
  [(MailboxListViewControllerMail *)self->_mailboxListController viewDidDisappear:v3];
}

- (BOOL)shouldSnapshot
{
  return 0;
}

- (BOOL)canDismiss
{
  return 0;
}

- (void)dismiss
{
}

- (void)_cancel:(id)a3
{
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)animateMessageToCell:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_tableCell, a3);
  [(MailboxTableCell *)self->_tableCell destinationPointForAnimation];
  double v8 = v7;
  double v9 = v6;
  if (v7 == CGPointZero.x && v6 == CGPointZero.y) {
    goto LABEL_12;
  }
  objc_super v11 = [(TransferMailboxPickerController *)self view];
  [v11 setUserInteractionEnabled:0];

  id v12 = [(TransferMailboxPickerController *)self scene];
  unsigned int v13 = [v12 isInExpandedEnvironment];

  if (v13)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100221F00;
    v47[3] = &unk_1006047A0;
    v47[4] = self;
    -[TransferMailboxPickerController animateMessageToPoint:inView:completion:](self, "animateMessageToPoint:inView:completion:", v5, v47, v8, v9);
    goto LABEL_14;
  }
  id v14 = [(TransferMailboxPickerPalette *)self->_pickerPalette messageThumbnailView];

  if (!v14)
  {
LABEL_12:
    sub_100221580(self, 1, 0);
    goto LABEL_14;
  }
  id v15 = [(TransferMailboxPickerPalette *)self->_pickerPalette messageThumbnailView];
  animatedView = self->_animatedView;
  self->_animatedView = v15;

  id v17 = [(UIView *)self->_animatedView superview];
  for (i = v17; ; i = (void *)v22)
  {
    double v19 = [i superview];
    if (!v19) {
      break;
    }
    double v20 = [i superview];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      break;
    }
    uint64_t v22 = [i superview];
  }
  [(UIView *)self->_animatedView frame];
  [i convertRect:v17 fromView:];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  -[UIView setFrame:](self->_animatedView, "setFrame:");
  [i addSubview:self->_animatedView];
  [i convertPoint:self->_tableCell fromView:v8];
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  Mutable = CGPathCreateMutable();
  CGFloat v36 = v26 + round(v30 * 0.5);
  CGPathMoveToPoint(Mutable, 0, v24 + round(v28 * 0.5), v36);
  CGPathAddQuadCurveToPoint(Mutable, 0, v32, v36, v32, v34);
  v37 = +[CAKeyframeAnimation animation];
  [v37 setKeyPath:@"position"];
  [v37 setKeyTimes:&off_10062B4B0];
  [v37 setPath:Mutable];
  UIAnimationDragCoefficient();
  [v37 setDuration:v38 * 0.5];
  [v37 setCalculationMode:kCAAnimationLinear];
  [v37 setFillMode:kCAFillModeForwards];
  [v37 setRemovedOnCompletion:0];
  CGPathRelease(Mutable);
  v39 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  v40 = +[CAValueFunction functionWithName:kCAValueFunctionRotateZ];
  [v39 setValueFunction:v40];

  [v39 setFromValue:&off_10062B6B8];
  [v39 setToValue:&off_10062B6D8];
  UIAnimationDragCoefficient();
  [v39 setDuration:v41 * 0.5];
  v42 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  [v39 setTimingFunction:v42];

  [v39 setAdditive:1];
  [v39 setFillMode:kCAFillModeForwards];
  [v39 setRemovedOnCompletion:0];
  v43 = +[CAAnimationGroup animation];
  v48[0] = v37;
  v48[1] = v39;
  v44 = +[NSArray arrayWithObjects:v48 count:2];
  [v43 setAnimations:v44];

  UIAnimationDragCoefficient();
  [v43 setDuration:v45 * 0.5];
  [v43 setFillMode:kCAFillModeForwards];
  [v43 setRemovedOnCompletion:0];
  [v43 setDelegate:self];
  v46 = [(UIView *)self->_animatedView layer];
  [v46 addAnimation:v43 forKey:0];

LABEL_14:
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
}

- (void)messageAnimationDidStop
{
  BOOL v3 = [(UIView *)self->_animatedView layer];
  [v3 removeAllAnimations];

  [(UIView *)self->_animatedView removeFromSuperview];
  animatedView = self->_animatedView;
  self->_animatedView = 0;

  uint64_t v30 = 0;
  double v31 = (double *)&v30;
  uint64_t v32 = 0x4010000000;
  double v33 = &unk_100591BFD;
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  long long v34 = v5;
  long long v35 = v5;
  [(MailboxTableCell *)self->_tableCell frame];
  *(void *)&long long v34 = v6;
  *((void *)&v34 + 1) = v7;
  *(void *)&long long v35 = v8;
  *((void *)&v35 + 1) = v9;
  double v10 = [(MailboxTableCell *)self->_tableCell superview];
  lastSuperview = self->_lastSuperview;
  self->_lastSuperview = v10;

  id v12 = [(TransferMailboxPickerController *)self view];
  [v12 convertPoint:self->_lastSuperview fromView:v31[4], v31[5]];
  unsigned int v13 = v31;
  *((void *)v31 + 4) = v14;
  *((void *)v13 + 5) = v15;

  long long v16 = [(TransferMailboxPickerController *)self traitCollection];
  unsigned __int8 v17 = [v16 mf_useSplitViewStyling];

  if ((v17 & 1) == 0)
  {
    id v18 = objc_alloc((Class)UIImageView);
    double v19 = UIImageGetTableSelectionBackground();
    double v20 = (UIImageView *)[v18 initWithImage:v19];
    backstop = self->_backstop;
    self->_backstop = v20;

    -[UIImageView setFrame:](self->_backstop, "setFrame:", v31[4], v31[5], v31[6], v31[7]);
    uint64_t v22 = [(TransferMailboxPickerController *)self view];
    [v22 addSubview:self->_backstop];
  }
  [(MailboxTableCell *)self->_tableCell setSeparatorStyle:0];
  -[MailboxTableCell setFrame:](self->_tableCell, "setFrame:", v31[4], v31[5], v31[6], v31[7]);
  double v23 = [(TransferMailboxPickerController *)self view];
  [v23 addSubview:self->_tableCell];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100222208;
  v28[3] = &unk_10060E130;
  unsigned __int8 v29 = v17;
  v28[4] = self;
  v28[5] = &v30;
  double v24 = objc_retainBlock(v28);
  UIAnimationDragCoefficient();
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002224C4;
  v26[3] = &unk_1006049C8;
  unsigned __int8 v27 = v17;
  v26[4] = self;
  v26[5] = &v30;
  +[UIView animateWithDuration:v26 animations:v24 completion:v25 * 0.1];

  _Block_object_dispose(&v30, 8);
}

- (void)animateMessageToPoint:(CGPoint)a3 inView:(id)a4 completion:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a4;
  uint64_t v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained transferMailboxPickerController:self animateMessageToPoint:v11 inView:v9 x:x y:y];
  }
  else {
    v9[2](v9);
  }
}

- (void)mailboxList:(id)a3 didSelectMailbox:(id)a4
{
  id v9 = a4;
  if (!-[NSSet containsObject:](self->_sourceMailboxes, "containsObject:"))
  {
    if (*((unsigned char *)self + 80))
    {
      long long v5 = +[NSUserDefaults standardUserDefaults];
      uint64_t v6 = [v9 representedAccount];
      uint64_t v7 = [v6 uniqueID];
      [v5 setObject:v7 forKey:@"LastTransferAccount"];
    }
    sub_10022178C(self, v9);
    uint64_t v8 = [(MailboxListViewControllerMail *)self->_mailboxListController cellForMailbox:v9];
    [(TransferMailboxPickerController *)self animateMessageToCell:v8];
  }
}

- (void)accountList:(id)a3 didSelectAccount:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(MailboxListViewControllerMail *)self->_mailboxListController setAccount:v6];
  [(TransferMailboxPickerController *)self setAccount:v6];
  [(TransferMailboxPickerController *)self updateTitle];
  uint64_t v7 = [v9 splitViewController];
  if ([v7 isCollapsed])
  {
    [v7 showColumn:1];
  }
  else
  {
    [(MailboxListViewControllerMail *)self->_mailboxListController viewWillAppear:0];
    [(MailboxListViewControllerMail *)self->_mailboxListController viewDidAppear:0];
  }
  [(TransferMailboxPickerController *)self restoreScrollOffset];
  uint64_t v8 = [(TransferMailboxPickerController *)self navigationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 updatePrompt];
  }
}

- (void)accountList:(id)a3 didCancel:(BOOL)a4
{
  if (self) {
    sub_100221580(self, 0, 0);
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  mailboxListController = self->_mailboxListController;
  id v5 = [a3 searchBar];
  id v4 = [v5 text];
  [(MailboxListViewControllerMail *)mailboxListController filterMailboxesContainingText:v4];
}

- (id)willTransferMessages
{
  return self->_willTransferMessages;
}

- (void)setWillTransferMessages:(id)a3
{
}

- (id)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(id)a3
{
}

- (TransferMailboxPickerAnimationDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);

  return (TransferMailboxPickerAnimationDelegate *)WeakRetained;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (EMMailboxPrediction)mailboxPrediction
{
  return self->_mailboxPrediction;
}

- (void)setMailboxPrediction:(id)a3
{
}

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSSet)sourceAccounts
{
  return self->_sourceAccounts;
}

- (MailScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (TransferMailboxContext)currentTransferContext
{
  return self->_currentTransferContext;
}

- (void)setCurrentTransferContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransferContext, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_storeStrong(&self->_didFinish, 0);
  objc_storeStrong(&self->_willTransferMessages, 0);
  objc_storeStrong((id *)&self->_mailboxPrediction, 0);
  objc_storeStrong((id *)&self->_backstop, 0);
  objc_storeStrong((id *)&self->_lastSuperview, 0);
  objc_storeStrong((id *)&self->_animatedView, 0);
  objc_storeStrong((id *)&self->_pickerPalette, 0);
  objc_storeStrong((id *)&self->_tableCell, 0);
  objc_storeStrong((id *)&self->_screenshotGenerator, 0);
  objc_storeStrong((id *)&self->_mailboxListController, 0);
  objc_storeStrong((id *)&self->_sourceMailboxes, 0);
  objc_storeStrong((id *)&self->_sourceAccounts, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_senders, 0);

  objc_storeStrong((id *)&self->_sortedMessages, 0);
}

@end