@interface MailboxPickerOutlineController
+ (id)log;
- (BOOL)_selectFavoriteItem:(id)a3 indexPath:(id)a4 animated:(BOOL)a5;
- (BOOL)_shouldShowMailStatus;
- (BOOL)_shouldShowToolbar:(BOOL)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)didNotifyExtendedLaunchTracker;
- (BOOL)forceReloadMessageListViewController;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isRefreshing;
- (BOOL)isReordering;
- (BOOL)mailboxCollectionHelper:(id)a3 shouldDisableForEditingCellForMailbox:(id)a4;
- (BOOL)mailboxCollectionHelperShouldUpdateMailboxSelection:(id)a3;
- (BOOL)mailboxCollectionHelperSplitViewControllerIsCollapsed:(id)a3;
- (BOOL)needsReloadOnAppearance;
- (BOOL)selectFavoriteItem:(id)a3 animated:(BOOL)a4;
- (BOOL)selectFavoriteItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (BOOL)shouldShowSubtitle;
- (BOOL)showingPopoverViewController;
- (EFCancelable)mailboxesObserverToken;
- (EMDiagnosticsHelper)diagnosticsHelper;
- (FavoriteItemSelectionTarget)favoriteItemSelectionTarget;
- (FavoritesManager)favoritesManager;
- (MFAccountsProvider)accountsProvider;
- (MailMainScene)scene;
- (MailStatusViewController)mailStatusViewController;
- (MailboxPickerCollectionHelper)collectionHelper;
- (MailboxPickerDragDropHelper)dragDropHelper;
- (MailboxPickerOutlineController)initWithMainScene:(id)a3 favoritesManager:(id)a4 accountsProvider:(id)a5;
- (MessageListContainerViewController)messageListContainerViewController;
- (NSArray)editingToolbarItems;
- (NSArray)suggestedFavoriteItems;
- (UIBarButtonItem)composeButtonItem;
- (UIBarButtonItem)editButtonItem;
- (UIBarButtonItem)shelfButtonItem;
- (UICollectionView)collectionView;
- (UILongPressGestureRecognizer)interactiveMoveGestureRecognizer;
- (UIRefreshControl)refreshControl;
- (id)_configuredSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)displayedAccountsForMailboxCollectionHelper:(id)a3;
- (id)favoriteItemsMatchingItemURLStrings:(id)a3;
- (id)favoriteItemsMatchingName:(id)a3;
- (id)mailboxPickerDragDropHelper:(id)a3 favoriteItemAtIndexPath:(id)a4;
- (id)mailboxPickerDragDropHelper:(id)a3 mailboxForMailboxUid:(id)a4;
- (id)mailboxQualifier;
- (id)mailboxRepository;
- (id)viewDidAppearBlock;
- (id)watchedMailboxes;
- (void)_configureCollectionView;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_detailViewControllerConfigurationChanged:(id)a3;
- (void)_dismissCustomViewController:(id)a3;
- (void)_dismissEditViewControllers;
- (void)_editButtonTapped:(id)a3;
- (void)_escapeShortcutInvoked:(id)a3;
- (void)_popToMailboxPickerController:(BOOL)a3 andPushMessageListViewControllerIfNecessaryAnimated:(BOOL)a4;
- (void)_presentMailboxEditControllerForAccount:(id)a3 mailbox:(id)a4 animated:(BOOL)a5;
- (void)_presentMessageListViewControllerForMailboxes:(id)a3 animated:(BOOL)a4;
- (void)_presentViewControllerInPopover:(id)a3 animated:(BOOL)a4 block:(id)a5;
- (void)_presentViewControllerInPopover:(id)a3 barButtonItem:(id)a4 animated:(BOOL)a5;
- (void)_presentViewControllerInPopover:(id)a3 sourceView:(id)a4 animated:(BOOL)a5;
- (void)_registerNotifications;
- (void)_sharedMailboxControllerBadgeCountDidChange:(id)a3;
- (void)_shelfButtonTapped:(id)a3;
- (void)_significantTimeChange:(id)a3;
- (void)_updateBackButtonTitle;
- (void)_updateNavigationBarItems;
- (void)_updateNavigationBarItemsEditing:(BOOL)a3;
- (void)_updateToolbarItems:(BOOL)a3;
- (void)_updateToolbarItemsEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)_useSplitViewControllerToShowViewController:(id)a3 animated:(BOOL)a4;
- (void)_vipSendersDidChange:(id)a3;
- (void)_watchedMailboxesDidChange:(id)a3;
- (void)applicationWillSuspend;
- (void)editFavoritesControllerDidFinish:(id)a3;
- (void)handleInteractiveMoveGesture:(id)a3;
- (void)mailStatus:(id)a3 didChangeState:(int64_t)a4;
- (void)mailStatusViewControllerUndoButtonTapped:(id)a3;
- (void)mailboxCollectionHelper:(id)a3 wantsToPopToMailboxPicker:(BOOL)a4 andPushMessageListViewControllerIfNecessaryAnimated:(BOOL)a5;
- (void)mailboxCollectionHelper:(id)a3 wantsToPresentMailboxEditControllerForMailbox:(id)a4 animated:(BOOL)a5;
- (void)mailboxCollectionHelper:(id)a3 wantsToSelectMailbox:(id)a4 account:(id)a5 animated:(BOOL)a6;
- (void)mailboxCollectionHelper:(id)a3 wantsToShowCustomViewController:(id)a4 animated:(BOOL)a5 sourceViewBlock:(id)a6;
- (void)mailboxCollectionHelperDidTapDetailsDisclosure:(id)a3 sender:(id)a4;
- (void)mailboxCollectionHelperWantsToShowAddFavoritesController:(id)a3 sourceView:(id)a4;
- (void)mailboxEditingControllerDidFinish:(id)a3;
- (void)messageListViewController:(id)a3 didSelectFavorite:(id)a4;
- (void)messageListViewController:(id)a3 setEditing:(BOOL)a4 animated:(BOOL)a5;
- (void)newMailboxClicked:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)pulledToRefresh:(id)a3;
- (void)selectCombinedMailbox:(id)a3;
- (void)selectMailbox:(id)a3;
- (void)setAccountsProvider:(id)a3;
- (void)setCollectionHelper:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setComposeButtonItem:(id)a3;
- (void)setDiagnosticsHelper:(id)a3;
- (void)setDidNotifyExtendedLaunchTracker:(BOOL)a3;
- (void)setDisplayMessageOnReload:(id)a3;
- (void)setDragDropHelper:(id)a3;
- (void)setEditButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingToolbarItems:(id)a3;
- (void)setFavoritesManager:(id)a3;
- (void)setForceReloadMessageListViewController:(BOOL)a3;
- (void)setInteractiveMoveGestureRecognizer:(id)a3;
- (void)setIsRefreshing:(BOOL)a3;
- (void)setIsReordering:(BOOL)a3;
- (void)setMailStatusViewController:(id)a3;
- (void)setMailboxesObserverToken:(id)a3;
- (void)setMessageListContainerViewController:(id)a3;
- (void)setNeedsReloadOnAppearance:(BOOL)a3;
- (void)setRefreshControl:(id)a3;
- (void)setScene:(id)a3;
- (void)setShelfButtonItem:(id)a3;
- (void)setViewDidAppearBlock:(id)a3;
- (void)showVIPSettingsAnimated:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForSplitViewCollapseStateChanged:(BOOL)a3;
- (void)updateIsRefreshingForState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MailboxPickerOutlineController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MailboxPickerOutlineController;
  [(MailboxPickerOutlineController *)&v5 viewDidLoad];
  uint64_t v3 = MSAccessibilityIdentifierFilterCardMailboxPicker;
  v4 = [(MailboxPickerOutlineController *)self view];
  [v4 setAccessibilityIdentifier:v3];

  [(MailboxPickerOutlineController *)self setNeedsReloadOnAppearance:1];
  [(MailboxPickerOutlineController *)self _configureCollectionView];
}

- (BOOL)mailboxCollectionHelperSplitViewControllerIsCollapsed:(id)a3
{
  uint64_t v3 = [(MailboxPickerOutlineController *)self splitViewController];
  unsigned __int8 v4 = [v3 isCollapsed];

  return v4;
}

- (BOOL)_shouldShowMailStatus
{
  v2 = [(MailboxPickerOutlineController *)self splitViewController];
  unsigned __int8 v3 = [v2 isCollapsed];

  return v3;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A5A0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006995D8 != -1) {
    dispatch_once(&qword_1006995D8, block);
  }
  v2 = (void *)qword_1006995D0;

  return v2;
}

- (MailMainScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailMainScene *)WeakRetained;
}

- (UIBarButtonItem)composeButtonItem
{
  unsigned __int8 v3 = [(MailboxPickerOutlineController *)self scene];
  unsigned __int8 v4 = v3;
  if (!self->_composeButtonItem
    && [v3 conformsToProtocol:&OBJC_PROTOCOL___ComposeCapable]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_super v5 = (UIBarButtonItem *)[v4 newComposeButtonItem];
    composeButtonItem = self->_composeButtonItem;
    self->_composeButtonItem = v5;
  }
  v7 = self->_composeButtonItem;

  return v7;
}

- (BOOL)_shouldShowToolbar:(BOOL)a3
{
  if (a3) {
    return 1;
  }
  objc_super v5 = [(MailboxPickerOutlineController *)self splitViewController];
  if ([v5 isCollapsed])
  {
    v6 = [(MailboxPickerOutlineController *)self navigationController];
    v7 = [v6 topViewController];
    BOOL v3 = v7 == self;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_registerNotifications
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_sharedMailboxControllerBadgeCountDidChange:" name:SharedMailboxControllerBadgeCountDidChangeNotification object:0];
  BOOL v3 = +[VIPManager defaultInstance];
  [v4 addObserver:self selector:"_vipSendersDidChange:" name:EMVIPsDidChangeNotification object:v3];

  [v4 addObserver:self selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  [v4 addObserver:self selector:"_significantTimeChange:" name:UIApplicationSignificantTimeChangeNotification object:0];
  [v4 addObserver:self selector:"_detailViewControllerConfigurationChanged:" name:UIViewControllerShowDetailTargetDidChangeNotification object:0];
}

- (void)_detailViewControllerConfigurationChanged:(id)a3
{
  objc_super v5 = +[MailboxPickerOutlineController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v7, 0x16u);
  }
  [(MailboxPickerOutlineController *)self _updateNavigationBarItems];
  [(MailboxPickerOutlineController *)self _updateToolbarItems:1];
}

- (EMDiagnosticsHelper)diagnosticsHelper
{
  diagnosticsHelper = self->_diagnosticsHelper;
  if (!diagnosticsHelper)
  {
    id v4 = objc_alloc((Class)EMDiagnosticsHelper);
    objc_super v5 = [(MailboxPickerOutlineController *)self scene];
    v6 = [v5 daemonInterface];
    int v7 = (EMDiagnosticsHelper *)[v4 initWithDaemonInterface:v6];
    v8 = self->_diagnosticsHelper;
    self->_diagnosticsHelper = v7;

    diagnosticsHelper = self->_diagnosticsHelper;
  }

  return diagnosticsHelper;
}

- (void)_updateNavigationBarItemsEditing:(BOOL)a3
{
  id v5 = [(MailboxPickerOutlineController *)self editButtonItem];
  +[UIBarButtonItem mf_configureMultiBarButtonItem:usingStyle:](UIBarButtonItem, "mf_configureMultiBarButtonItem:usingStyle:");

  id v6 = [(MailboxPickerOutlineController *)self editButtonItem];
  id v4 = [(MailboxPickerOutlineController *)self navigationItem];
  [v4 setRightBarButtonItem:v6];
}

- (UIBarButtonItem)editButtonItem
{
  editButtonItem = self->_editButtonItem;
  if (!editButtonItem)
  {
    id v4 = +[UIBarButtonItem mf_newMultiBarButtonItemWithTarget:self action:"_editButtonTapped:"];
    id v5 = self->_editButtonItem;
    self->_editButtonItem = v4;

    editButtonItem = self->_editButtonItem;
  }

  return editButtonItem;
}

- (BOOL)showingPopoverViewController
{
  BOOL v3 = [(MailboxPickerOutlineController *)self presentedViewController];
  id v4 = [v3 popoverPresentationController];

  id v5 = [v4 barButtonItem];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = [(MailboxPickerOutlineController *)self editingToolbarItems];
  int v7 = [v4 barButtonItem];
  unsigned __int8 v8 = [v6 containsObject:v7];

  if (v8)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
LABEL_4:
    v10 = [v4 sourceView];
    v11 = [(MailboxPickerOutlineController *)self view];
    unsigned __int8 v9 = [v10 isDescendantOfView:v11];
  }
  return v9;
}

- (void)_presentMessageListViewControllerForMailboxes:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(MailboxPickerOutlineController *)self messageListContainerViewController];
  if ([v6 isEditing]) {
    [v6 setEditing:0];
  }
  [v6 setMailboxes:v9 forceReload:[self forceReloadMessageListViewController]];
  [(MailboxPickerOutlineController *)self setForceReloadMessageListViewController:0];
  int v7 = [(MailboxPickerOutlineController *)self scene];
  unsigned __int8 v8 = [v7 splitViewController];
  [v8 showMessageListViewController:1 animated:v4 completion:0];
}

- (void)_popToMailboxPickerController:(BOOL)a3 andPushMessageListViewControllerIfNecessaryAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    id v6 = [(MailboxPickerOutlineController *)self navigationController];
    int v7 = [v6 topViewController];

    if (v7 == self)
    {
      v10 = [(MailboxPickerOutlineController *)self splitViewController];
      unsigned __int8 v11 = [v10 isCollapsed];

      if ((v11 & 1) == 0)
      {
        v12 = [(MailboxPickerOutlineController *)self splitViewController];
        v13 = (char *)[v12 displayMode];

        if ((unint64_t)(v13 - 5) <= 1)
        {
          v14 = +[MailboxPickerOutlineController log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = _UISplitViewControllerDisplayModeDescription();
            *(_DWORD *)buf = 138412290;
            v22 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Hiding mailbox picker. UISplitViewControllerDisplayMode: %@", buf, 0xCu);
          }
          v16 = +[EFScheduler mainThreadScheduler];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_1000FB810;
          v20[3] = &unk_1006047A0;
          v20[4] = self;
          id v17 = [v16 afterDelay:v20 performBlock:0.25];
        }
      }
    }
    else
    {
      unsigned __int8 v8 = [(MailboxPickerOutlineController *)self navigationController];
      id v9 = [v8 popToViewController:self animated:v4];
    }
  }
  v18 = [(MailboxPickerOutlineController *)self collectionHelper];
  v19 = [v18 mailboxesForMessageList];
  [(MailboxPickerOutlineController *)self _presentMessageListViewControllerForMailboxes:v19 animated:v4];
}

- (MailboxPickerOutlineController)initWithMainScene:(id)a3 favoritesManager:(id)a4 accountsProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MailboxPickerOutlineController;
  unsigned __int8 v11 = [(MailboxPickerOutlineController *)&v23 initWithNibName:0 bundle:0];
  if (v11)
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"MAILBOXES" value:&stru_100619928 table:@"Main"];
    [(MailboxPickerOutlineController *)v11 setTitle:v13];

    objc_storeStrong((id *)&v11->_accountsProvider, a5);
    objc_storeWeak((id *)&v11->_scene, v8);
    objc_storeStrong((id *)&v11->_favoritesManager, a4);
    v14 = +[UIApplication sharedApplication];
    v15 = [v14 daemonInterface];
    v16 = [v15 outgoingMessageRepository];

    id v17 = [MailStatusViewController alloc];
    v18 = [v8 daemonInterface];
    v19 = [v18 mailboxRepository];
    v20 = [(MailStatusViewController *)v17 initWithMailboxRepository:v19 outgoingMessageRepository:v16 scene:v8];
    mailStatusViewController = v11->_mailStatusViewController;
    v11->_mailStatusViewController = v20;

    [(MailboxPickerOutlineController *)v11 _registerNotifications];
    [(MailboxPickerOutlineController *)v11 _updateBackButtonTitle];
  }
  return v11;
}

- (void)_updateToolbarItemsEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3)
  {
    v16 = [(MailboxPickerOutlineController *)self mailStatusViewController];
    id v17 = [v16 mailStatusBarButtonItem];

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000079B8;
    v38[3] = &unk_100608168;
    v38[4] = self;
    v18 = objc_retainBlock(v38);
    v19 = [(MailboxPickerOutlineController *)self splitViewController];
    unsigned int v20 = [v19 isCollapsed];

    unsigned int v21 = [(MailboxPickerOutlineController *)self _shouldShowMailStatus];
    if ((v20 & v21) == 1)
    {
      v22 = +[UIBarButtonItem mf_newFixedSpaceItem];
      v46[0] = v22;
      objc_super v23 = +[UIBarButtonItem mf_newFlexibleSpaceItem];
      v46[1] = v23;
      v46[2] = v17;
      v24 = +[UIBarButtonItem mf_newFlexibleSpaceItem];
      v46[3] = v24;
      v25 = [(MailboxPickerOutlineController *)self composeButtonItem];
      v46[4] = v25;
      v26 = +[NSArray arrayWithObjects:v46 count:5];

      uint64_t v27 = ((void (*)(void *, void *))v18[2])(v18, v26);
    }
    else
    {
      if (!v20)
      {
        if (!v21)
        {
          v15 = (NSArray *)&__NSArray0__struct;
          goto LABEL_11;
        }
        uint64_t v34 = +[UIBarButtonItem mf_newFlexibleSpaceItem];
        v44[0] = v34;
        v44[1] = v17;
        v35 = +[UIBarButtonItem mf_newFlexibleSpaceItem];
        v44[2] = v35;
        v15 = +[NSArray arrayWithObjects:v44 count:3];

        v26 = (void *)v34;
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      v28 = +[UIBarButtonItem mf_newFixedSpaceItem];
      v45[0] = v28;
      v29 = +[UIBarButtonItem mf_newFlexibleSpaceItem];
      v45[1] = v29;
      v30 = [(MailboxPickerOutlineController *)self composeButtonItem];
      v45[2] = v30;
      v26 = +[NSArray arrayWithObjects:v45 count:3];

      uint64_t v27 = ((void (*)(void *, void *))v18[2])(v18, v26);
    }
    v15 = (NSArray *)v27;
    goto LABEL_10;
  }
  editingToolbarItems = self->_editingToolbarItems;
  if (!editingToolbarItems)
  {
    id v8 = objc_alloc((Class)UIBarButtonItem);
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"NEW_MAILBOX" value:&stru_100619928 table:@"Main"];
    id v11 = [v8 initWithTitle:v10 style:0 target:self action:"newMailboxClicked:"];

    v12 = +[UIBarButtonItem mf_newFlexibleSpaceItem];
    v43[0] = v12;
    v43[1] = v11;
    v13 = +[NSArray arrayWithObjects:v43 count:2];
    v14 = self->_editingToolbarItems;
    self->_editingToolbarItems = v13;

    editingToolbarItems = self->_editingToolbarItems;
  }
  v15 = editingToolbarItems;
LABEL_12:
  v31 = +[MailboxPickerOutlineController log];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = self;
    __int16 v41 = 1024;
    BOOL v42 = v5;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: set toolbar items - editing:%d", buf, 0x12u);
  }

  [(MailboxPickerOutlineController *)self setToolbarItems:v15 animated:v4];
  if (v4)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10005789C;
    v36[3] = &unk_1006058A8;
    v36[4] = self;
    BOOL v37 = v5;
    +[UIView performWithoutAnimation:v36];
  }
  else
  {
    unsigned int v32 = [(MailboxPickerOutlineController *)self _shouldShowToolbar:v5];
    v33 = [(MailboxPickerOutlineController *)self navigationController];
    [v33 setToolbarHidden:v32 ^ 1];
  }
}

- (void)_configureCollectionView
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v3 = [CustomCompositionalLayout alloc];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100028198;
  v32[3] = &unk_100607280;
  objc_copyWeak(&v33, &location);
  BOOL v4 = [(CustomCompositionalLayout *)v3 initWithSectionProvider:v32];
  BOOL v5 = [[MailboxPickerDragDropHelper alloc] initWithDelegate:self];
  [(MailboxPickerOutlineController *)self setDragDropHelper:v5];

  id v6 = objc_alloc((Class)UICollectionView);
  int v7 = [(MailboxPickerOutlineController *)self view];
  [v7 bounds];
  id v8 = [v6 initWithFrame:v4];

  [v8 setAutoresizingMask:18];
  id v9 = [(MailboxPickerOutlineController *)self traitCollection];
  id v10 = +[UIColor mailMailboxPickerBackgroundColorForTraitCollection:v9];
  [v8 setBackgroundColor:v10];

  [v8 setAlwaysBounceVertical:1];
  id v11 = [(MailboxPickerOutlineController *)self dragDropHelper];
  [v8 setDropDelegate:v11];

  [v8 setSpringLoaded:1];
  [v8 setAllowsMultipleSelectionDuringEditing:1];
  [v8 setAccessibilityIdentifier:MSAccessibilityIdentifierMailboxList];
  [v8 _setDelaysUserInitiatedItemSelection:1];
  v12 = [(MailboxPickerOutlineController *)self view];
  [v12 addSubview:v8];

  [(MailboxPickerOutlineController *)self setCollectionView:v8];
  id v13 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handleInteractiveMoveGesture:"];
  [(MailboxPickerOutlineController *)self setInteractiveMoveGestureRecognizer:v13];

  v14 = [(MailboxPickerOutlineController *)self interactiveMoveGestureRecognizer];
  [v14 setDelegate:self];

  v15 = [(MailboxPickerOutlineController *)self collectionView];
  v16 = [(MailboxPickerOutlineController *)self interactiveMoveGestureRecognizer];
  [v15 addGestureRecognizer:v16];

  id v17 = [MailboxPickerCollectionHelper alloc];
  v18 = [(MailboxPickerOutlineController *)self favoritesManager];
  v19 = +[UIApplication sharedApplication];
  unsigned int v20 = [v19 focusController];
  unsigned int v21 = [(MailboxPickerOutlineController *)self scene];
  v22 = +[MailboxPickerOutlineController log];
  objc_super v23 = [(MailboxPickerCollectionHelper *)v17 initWithCollectionView:v8 favoritesManager:v18 focusController:v20 scene:v21 logClient:v22];

  [(MailboxPickerOutlineController *)self setCollectionHelper:v23];
  [(MailboxPickerCollectionHelper *)v23 setDelegate:self];
  [v8 setDelegate:v23];
  id v24 = objc_alloc_init((Class)UIRefreshControl);
  [(MailboxPickerOutlineController *)self setRefreshControl:v24];

  v25 = [(MailboxPickerOutlineController *)self refreshControl];
  [v25 addTarget:self action:"pulledToRefresh:" forEvents:4096];

  v26 = [(MailboxPickerOutlineController *)self refreshControl];
  uint64_t v27 = [(MailboxPickerOutlineController *)self collectionView];
  [v27 setRefreshControl:v26];

  v28 = [(MailboxPickerOutlineController *)self messageListContainerViewController];
  v29 = NSStringFromSelector("mailboxes");
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000F9F98;
  v31[3] = &unk_1006080F0;
  v31[4] = self;
  v30 = [v28 ef_observeKeyPath:v29 options:1 autoCancelToken:1 usingBlock:v31];
  [(MailboxPickerOutlineController *)self setMailboxesObserverToken:v30];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (UILongPressGestureRecognizer)interactiveMoveGestureRecognizer
{
  return self->_interactiveMoveGestureRecognizer;
}

- (void)mailboxCollectionHelper:(id)a3 wantsToSelectMailbox:(id)a4 account:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = [(MailboxPickerOutlineController *)self navigationController];
  id v9 = [v8 topViewController];

  if (v9 != self)
  {
    id v10 = [(MailboxPickerOutlineController *)self navigationController];
    id v11 = [v10 popToViewController:self animated:v6];
  }
  [(MailboxPickerOutlineController *)self _updateBackButtonTitle];
  v12 = [(MailboxPickerOutlineController *)self collectionHelper];
  [v12 updateMailboxSelectionAnimated:0 scrollToSelected:1];

  [(MailboxPickerOutlineController *)self _popToMailboxPickerController:1 andPushMessageListViewControllerIfNecessaryAnimated:v6];
}

- (void)_updateBackButtonTitle
{
  BOOL v3 = [(MailboxPickerOutlineController *)self accountsProvider];
  unsigned int v4 = [v3 isDisplayingMultipleAccounts];

  if (!v4) {
    goto LABEL_3;
  }
  BOOL v5 = [(FavoritesManager *)self->_favoritesManager lastSelectedItem];
  BOOL v6 = [v5 account];

  id v9 = [v6 displayName];

  if (!v9)
  {
LABEL_3:
    int v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v7 localizedStringForKey:@"MAILBOXES_BACK_BUTTON" value:&stru_100619928 table:@"Main"];
  }
  id v8 = [(MailboxPickerOutlineController *)self navigationItem];
  [v8 setBackButtonTitle:v9];
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (MessageListContainerViewController)messageListContainerViewController
{
  messageListContainerViewController = self->_messageListContainerViewController;
  if (!messageListContainerViewController)
  {
    unsigned int v4 = [FavoritesShortcutsProvider alloc];
    BOOL v5 = +[UIApplication sharedApplication];
    BOOL v6 = [v5 mailboxProvider];
    int v7 = [(MailboxPickerOutlineController *)self favoritesManager];
    id v8 = sub_10000B294((id *)&v4->super.isa, v6, v7);

    id v9 = [MessageListContainerViewController alloc];
    id v10 = [(MailboxPickerOutlineController *)self scene];
    id v11 = [(MailboxPickerOutlineController *)self accountsProvider];
    v12 = [(MailboxPickerOutlineController *)self diagnosticsHelper];
    id v13 = [(MessageListContainerViewController *)v9 initWithMainScene:v10 mailboxes:0 accountsProvider:v11 favoritesShortcutsProvider:v8 contactStore:0 diagnosticsHelper:v12 mailboxPickerDelegate:self];
    v14 = self->_messageListContainerViewController;
    self->_messageListContainerViewController = v13;

    [(MailboxPickerOutlineController *)self favoritesManager];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100016880;
    v20[3] = &unk_100608118;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = v15;
    [(MessageListContainerViewController *)self->_messageListContainerViewController setScrollableHintBlock:v20];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000FA000;
    v18[3] = &unk_1006080F0;
    id v16 = v15;
    id v19 = v16;
    [(MessageListContainerViewController *)self->_messageListContainerViewController setUpdateScrollableHintBlock:v18];

    messageListContainerViewController = self->_messageListContainerViewController;
  }

  return messageListContainerViewController;
}

- (FavoritesManager)favoritesManager
{
  return self->_favoritesManager;
}

- (id)_configuredSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  int v7 = [v6 traitCollection];
  unsigned int v8 = [v7 mf_useSplitViewStyling];

  id v9 = objc_alloc((Class)UICollectionLayoutListConfiguration);
  if (v8) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 2;
  }
  id v11 = [v9 initWithAppearance:v10];
  v12 = [(MailboxPickerOutlineController *)self collectionHelper];
  id v13 = [v12 sectionTypeForIndex:a3];

  if ((unint64_t)v13 < 2) {
    char v14 = 1;
  }
  else {
    char v14 = v8;
  }
  if ((v14 & 1) == 0) {
    [v11 setHeaderMode:2];
  }
  id v15 = +[NSCollectionLayoutSection sectionWithListConfiguration:v11 layoutEnvironment:v6];
  [v15 contentInsets];
  double v18 = v17;
  double v20 = v19;
  double v21 = v16;
  double v23 = v22;
  if (v13 == (id)3)
  {
    id v24 = [(MailboxPickerOutlineController *)self collectionView];
    v25 = (char *)[v24 numberOfSections] - 1;

    if (v25 == (char *)a3) {
      double v16 = v21;
    }
    else {
      double v16 = 0.0;
    }
    if (v25 != (char *)a3) {
      double v18 = 0.0;
    }
  }
  else if (v13 == (id)2)
  {
    double v16 = 10.0;
  }
  [v15 setContentInsets:v18, v20, v16, v23];

  return v15;
}

- (MailboxPickerCollectionHelper)collectionHelper
{
  return self->_collectionHelper;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)updateForSplitViewCollapseStateChanged:(BOOL)a3
{
  if (!a3)
  {
    BOOL v5 = [(MailboxPickerOutlineController *)self favoritesManager];
    id v6 = [v5 lastSelectedItem];

    if (v6)
    {
      int v7 = [(MailboxPickerOutlineController *)self collectionHelper];
      unsigned int v8 = [v7 indexPathForItem:v6];

      id v9 = [(MailboxPickerOutlineController *)self collectionView];
      if (objc_msgSend(v9, "mf_isIndexPathValid:", v8))
      {
        [v9 scrollToItemAtIndexPath:v8 atScrollPosition:0 animated:0];
        dispatch_time_t v10 = dispatch_time(0, 0);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1000FBEFC;
        v13[3] = &unk_100604618;
        char v14 = v9;
        id v15 = v8;
        dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v13);

        id v11 = v14;
      }
      else
      {
        id v11 = +[MailboxPickerOutlineController log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          double v17 = v12;
          __int16 v18 = 2114;
          double v19 = v8;
          __int16 v20 = 2114;
          double v21 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - invalid lastSelectedIndexPath:%{public}@ for collectionView:%{public}@", buf, 0x20u);
        }
      }
    }
  }
}

- (void)setRefreshControl:(id)a3
{
}

- (void)setNeedsReloadOnAppearance:(BOOL)a3
{
  self->_needsReloadOnAppearance = a3;
}

- (void)setMailboxesObserverToken:(id)a3
{
}

- (void)setInteractiveMoveGestureRecognizer:(id)a3
{
}

- (void)setForceReloadMessageListViewController:(BOOL)a3
{
  self->_forceReloadMessageListViewController = a3;
}

- (void)setDragDropHelper:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
}

- (void)setCollectionHelper:(id)a3
{
}

- (BOOL)mailboxCollectionHelperShouldUpdateMailboxSelection:(id)a3
{
  unsigned int v4 = [(MailboxPickerOutlineController *)self isViewLoaded];
  if (v4) {
    LOBYTE(v4) = ![(MailboxPickerOutlineController *)self showingPopoverViewController];
  }
  return v4;
}

- (MailStatusViewController)mailStatusViewController
{
  return self->_mailStatusViewController;
}

- (BOOL)forceReloadMessageListViewController
{
  return self->_forceReloadMessageListViewController;
}

- (FavoriteItemSelectionTarget)favoriteItemSelectionTarget
{
  [(MailboxPickerOutlineController *)self loadViewIfNeeded];

  return (FavoriteItemSelectionTarget *)[(MailboxPickerOutlineController *)self collectionHelper];
}

- (MailboxPickerDragDropHelper)dragDropHelper
{
  return self->_dragDropHelper;
}

- (void)_updateToolbarItems:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MailboxPickerOutlineController *)self isEditing];

  [(MailboxPickerOutlineController *)self _updateToolbarItemsEditing:v5 animated:v3];
}

- (void)_updateNavigationBarItems
{
  id v3 = [(MailboxPickerOutlineController *)self isEditing];

  [(MailboxPickerOutlineController *)self _updateNavigationBarItemsEditing:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MailboxPickerOutlineController;
  -[MailboxPickerOutlineController viewWillAppear:](&v22, "viewWillAppear:");
  id v6 = +[MailboxPickerOutlineController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v24 = self;
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  if ([(MailboxPickerOutlineController *)self needsReloadOnAppearance])
  {
    [(MailboxPickerOutlineController *)self setNeedsReloadOnAppearance:0];
    unsigned int v8 = [(MailboxPickerOutlineController *)self collectionHelper];
    [v8 reloadDataSource];
  }
  id v9 = [(MailboxPickerOutlineController *)self scene];
  if (![(MailboxPickerOutlineController *)self didNotifyExtendedLaunchTracker])
  {
    dispatch_time_t v10 = [v9 extendedLaunchTracker];
    [v10 observeViewController:self scene:v9];
  }
  [(MailboxPickerOutlineController *)self updateIsRefreshingForState:0];
  if ([(MailboxPickerOutlineController *)self isReappearing]
    && ([v9 isInExpandedEnvironment] & 1) == 0)
  {
    id v11 = [(MailboxPickerOutlineController *)self collectionView];
    v12 = [(MailboxPickerOutlineController *)self transitionCoordinator];
    [v11 mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:v12 animated:1];
  }
  if ([(MailboxPickerOutlineController *)self _shouldShowMailStatus])
  {
    id v13 = [(MailboxPickerOutlineController *)self mailStatusViewController];
    char v14 = [v9 statusMailboxes];
    id v15 = [v14 allObjects];
    [v13 startObservingForVisibleMailboxes:v15 delegate:self filterPredicate:0 label:@"Mailbox picker status"];
  }
  [(MailboxPickerOutlineController *)self _updateToolbarItems:v3];
  [(MailboxPickerOutlineController *)self _updateNavigationBarItems];
  double v16 = [(MailboxPickerOutlineController *)self splitViewController];
  double v17 = [v16 traitCollection];
  if ([v17 horizontalSizeClass] == (id)1)
  {
    __int16 v18 = +[UIApplication sharedApplication];
    BOOL v19 = [v18 applicationState] == 0;

    if (!v19) {
      goto LABEL_17;
    }
    double v16 = +[NSSet set];
    [v9 setSelectedAccounts:v16];
  }
  else
  {
  }
LABEL_17:
  __int16 v20 = [(MailboxPickerOutlineController *)self mailboxRepository];
  [v20 refreshMailboxList:0];

  if (![(MailboxPickerOutlineController *)self didNotifyExtendedLaunchTracker])
  {
    double v21 = [v9 extendedLaunchTracker];
    [v21 didFinishLoadViewController:self scene:v9];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MailboxPickerOutlineController;
  [(MailboxPickerOutlineController *)&v8 viewDidAppear:a3];
  [(MailboxPickerOutlineController *)self mf_updateAlertSuppressionContextsForReason:@"mailbox picker did appear"];
  unsigned int v4 = [(MailboxPickerOutlineController *)self collectionHelper];
  id v5 = [(MailboxPickerOutlineController *)self collectionView];
  [v4 updatedSelectedState:v5];

  uint64_t v6 = [(MailboxPickerOutlineController *)self viewDidAppearBlock];
  int v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    [(MailboxPickerOutlineController *)self setViewDidAppearBlock:0];
  }
}

- (void)applicationWillSuspend
{
  v5.receiver = self;
  v5.super_class = (Class)MailboxPickerOutlineController;
  [(MailboxPickerOutlineController *)&v5 applicationWillSuspend];
  if (![(MailboxPickerOutlineController *)self showingPopoverViewController])
  {
    BOOL v3 = [(MailboxPickerOutlineController *)self messageListContainerViewController];
    unsigned __int8 v4 = [v3 showingPopoverViewController];

    if ((v4 & 1) == 0) {
      [(MailboxPickerOutlineController *)self setEditing:0 animated:0];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MailboxPickerOutlineController;
  [(MailboxPickerOutlineController *)&v10 traitCollectionDidChange:v4];
  objc_super v5 = [(MailboxPickerOutlineController *)self traitCollection];
  uint64_t v6 = +[UIColor mailMailboxPickerBackgroundColorForTraitCollection:v5];
  int v7 = [(MailboxPickerOutlineController *)self collectionView];
  [v7 setBackgroundColor:v6];

  objc_super v8 = [(MailboxPickerOutlineController *)self collectionView];
  id v9 = [v8 collectionViewLayout];
  [v9 invalidateLayout];
}

- (UIBarButtonItem)shelfButtonItem
{
  shelfButtonItem = self->_shelfButtonItem;
  if (!shelfButtonItem)
  {
    id v4 = +[UIImage systemImageNamed:MFImageGlyphShelf];
    objc_super v5 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithImage:v4 style:0 target:self action:"_shelfButtonTapped:"];
    uint64_t v6 = self->_shelfButtonItem;
    self->_shelfButtonItem = v5;

    shelfButtonItem = self->_shelfButtonItem;
  }

  return shelfButtonItem;
}

- (void)_shelfButtonTapped:(id)a3
{
  id v4 = [(MailboxPickerOutlineController *)self scene];
  BOOL v3 = [v4 _sceneIdentifier];
  +[MFBayAdoption requestShelfPresentationForSceneWithIdentifier:v3];
}

- (void)setIsRefreshing:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_main_np() != 1)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MailboxPickerOutlineController.m" lineNumber:349 description:@"Current thread must be main"];
  }
  if (self->_isRefreshing != v3 && !v3)
  {
    self->_isRefreshing = v3;
    id v6 = [(MailboxPickerOutlineController *)self refreshControl];
    [v6 endRefreshing];
  }
}

- (void)pulledToRefresh:(id)a3
{
  if (pthread_main_np() != 1)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MailboxPickerOutlineController.m" lineNumber:362 description:@"Current thread must be main"];
  }
  self->_isRefreshing = 1;
  [(MailboxPickerOutlineController *)self performSelector:"updateIsRefreshingForState:" withObject:0 afterDelay:0.0];
  id v5 = [(MailboxPickerOutlineController *)self mailboxRepository];
  [v5 refreshMailboxList:1];
}

- (id)mailboxRepository
{
  v2 = [(MailboxPickerOutlineController *)self scene];
  BOOL v3 = [v2 daemonInterface];
  id v4 = [v3 mailboxRepository];

  return v4;
}

- (BOOL)selectFavoriteItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  return [(MailboxPickerOutlineController *)self _selectFavoriteItem:0 indexPath:a3 animated:a4];
}

- (BOOL)selectFavoriteItem:(id)a3 animated:(BOOL)a4
{
  return [(MailboxPickerOutlineController *)self _selectFavoriteItem:a3 indexPath:0 animated:a4];
}

- (BOOL)_selectFavoriteItem:(id)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  objc_super v10 = [(MailboxPickerOutlineController *)self favoritesManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000FA644;
  v14[3] = &unk_100608140;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  double v17 = self;
  BOOL v19 = a5;
  __int16 v18 = &v20;
  [v10 performTransaction:v14];

  LOBYTE(v8) = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return (char)v8;
}

- (void)setDisplayMessageOnReload:(id)a3
{
  id v6 = a3;
  id v4 = [(MailboxPickerOutlineController *)self messageListContainerViewController];
  id v5 = [v4 messageListViewController];
  [v5 setMessageToDisplayOnReload:v6];

  [(MailboxPickerOutlineController *)self setForceReloadMessageListViewController:1];
}

- (void)showVIPSettingsAnimated:(BOOL)a3
{
  id v5 = +[SharedMailboxController sharedInstanceForSourceType:1];
  id v4 = [(MailboxPickerOutlineController *)self collectionHelper];
  [v5 presentFromSelectionTarget:v4 item:0 accessoryTapped:1 animated:0];
}

- (void)selectMailbox:(id)a3
{
  id v5 = a3;
  id v4 = [(MailboxPickerOutlineController *)self favoriteItemSelectionTarget];
  [v4 selectMailbox:v5 item:0 animated:0];
}

- (void)selectCombinedMailbox:(id)a3
{
  id v5 = a3;
  id v4 = [(MailboxPickerOutlineController *)self favoriteItemSelectionTarget];
  [v4 selectCombinedMailbox:v5];
}

- (NSArray)suggestedFavoriteItems
{
  v2 = [(MailboxPickerOutlineController *)self favoritesManager];
  BOOL v3 = [v2 suggestedFavoriteItems];

  return (NSArray *)v3;
}

- (id)favoriteItemsMatchingName:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxPickerOutlineController *)self favoritesManager];
  id v6 = [v5 itemsMatchingName:v4];

  return v6;
}

- (id)favoriteItemsMatchingItemURLStrings:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxPickerOutlineController *)self favoritesManager];
  id v6 = [v5 itemsMatchingItemURLStrings:v4];

  return v6;
}

- (id)watchedMailboxes
{
  return self->_watchedMailboxes;
}

- (void)newMailboxClicked:(id)a3
{
}

- (void)_editButtonTapped:(id)a3
{
  uint64_t v4 = [(MailboxPickerOutlineController *)self isEditing] ^ 1;

  [(MailboxPickerOutlineController *)self setEditing:v4 animated:1];
}

- (void)_sharedMailboxControllerBadgeCountDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = +[MailboxPickerOutlineController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10045A4A4((uint64_t)v4, v8, (uint64_t)[v5 sourceType], v6);
  }

  id v7 = [(MailboxPickerOutlineController *)self collectionHelper];
  [v7 updateCellForSourceType:[v5 sourceType]];
}

- (void)_vipSendersDidChange:(id)a3
{
  id v4 = a3;
  id v5 = +[MailboxPickerOutlineController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10045A4FC((uint64_t)v4, v5);
  }

  id v6 = [(MailboxPickerOutlineController *)self collectionHelper];
  [v6 updateCellForSourceType:1];
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  id v4 = +[SharedMailboxController sharedInstanceForSourceType:4];
  [v4 invalidateIcon];

  id v5 = +[SharedMailboxController sharedInstanceForSourceType:2];
  [v5 invalidateIcon];

  id v6 = +[SharedMailboxController sharedInstanceForSourceType:3];
  [v6 invalidateIcon];

  id v7 = +[SharedMailboxController sharedInstanceForSourceType:1];
  [v7 invalidateIcon];

  id v8 = +[SharedMailboxController sharedInstanceForSourceType:5];
  [v8 invalidateIcon];

  id v9 = +[SharedMailboxController sharedInstanceForSourceType:6];
  [v9 invalidateIcon];

  id v10 = +[SharedMailboxController sharedInstanceForSourceType:8];
  [v10 invalidateIcon];

  id v11 = +[SharedMailboxController sharedInstanceForSourceType:7];
  [v11 invalidateIcon];

  id v12 = [(MailboxPickerOutlineController *)self collectionHelper];
  [v12 reloadDataSource];
}

- (void)_significantTimeChange:(id)a3
{
  id v7 = a3;
  if (+[NSThread isMainThread])
  {
    id v5 = +[SharedMailboxController sharedInstanceForSourceType:7];
    [v5 invalidateIcon];

    id v6 = [(MailboxPickerOutlineController *)self collectionHelper];
    [v6 reloadDataSource];
  }
  else
  {
    [(MailboxPickerOutlineController *)self performSelectorOnMainThread:a2 withObject:v7 waitUntilDone:0];
  }
}

- (void)_watchedMailboxesDidChange:(id)a3
{
  watchedMailboxes = self->_watchedMailboxes;
  self->_watchedMailboxes = 0;

  id v5 = [(MailboxPickerOutlineController *)self collectionHelper];
  [v5 reloadDataSource];
}

- (void)handleInteractiveMoveGesture:(id)a3
{
  id v14 = a3;
  id v4 = [v14 state];
  id v5 = [v14 view];
  [v14 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [v14 view];
  id v11 = v10;
  switch((unint64_t)v4)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
      if ([(MailboxPickerOutlineController *)self isReordering])
      {
        [v11 cancelInteractiveMovement];
        goto LABEL_9;
      }
      break;
    case 1uLL:
      id v12 = [v10 indexPathForItemAtPoint:v7, v9];
      if (v12) {
        -[MailboxPickerOutlineController setIsReordering:](self, "setIsReordering:", [v11 beginInteractiveMovementForItemAtIndexPath:v12]);
      }

      break;
    case 2uLL:
      if ([(MailboxPickerOutlineController *)self isReordering]) {
        [v11 updateInteractiveMovementTargetPosition:v7, v9];
      }
      break;
    case 3uLL:
      if ([(MailboxPickerOutlineController *)self isReordering])
      {
        [v11 endInteractiveMovement];
        id v13 = [(MailboxPickerOutlineController *)self collectionHelper];
        [v13 updateMailboxSelectionAnimated:1 scrollToSelected:0];

LABEL_9:
        [(MailboxPickerOutlineController *)self setIsReordering:0];
      }
      break;
    default:
      break;
  }
}

- (void)_useSplitViewControllerToShowViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  double v7 = v6;
  if (a4)
  {
    double v8 = [(MailboxPickerOutlineController *)self splitViewController];
    [v8 showViewController:v7 sender:0];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000FB7A4;
    v9[3] = &unk_100604618;
    v9[4] = self;
    id v10 = v6;
    +[UIView performWithoutAnimation:v9];
  }
}

- (void)_presentViewControllerInPopover:(id)a3 barButtonItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000FB95C;
  v9[3] = &unk_100608190;
  id v10 = a4;
  id v8 = v10;
  [(MailboxPickerOutlineController *)self _presentViewControllerInPopover:a3 animated:v5 block:v9];
}

- (void)_presentViewControllerInPopover:(id)a3 sourceView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000FBA2C;
  v9[3] = &unk_100608190;
  id v10 = a4;
  id v8 = v10;
  [(MailboxPickerOutlineController *)self _presentViewControllerInPopover:a3 animated:v5 block:v9];
}

- (void)_presentViewControllerInPopover:(id)a3 animated:(BOOL)a4 block:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v11];
  [v9 setModalPresentationStyle:7];
  id v10 = [v9 popoverPresentationController];
  v8[2](v8, v10);

  [(MailboxPickerOutlineController *)self presentViewController:v9 animated:v6 completion:0];
}

- (void)_presentMailboxEditControllerForAccount:(id)a3 mailbox:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 && v9)
  {
    id v8 = [v9 account];
  }
  if (v8)
  {
    id v27 = v8;
    id v11 = +[NSArray arrayWithObjects:&v27 count:1];
  }
  else
  {
    id v12 = [(MailboxPickerOutlineController *)self favoritesManager];
    double v21 = [v12 accountsCollection];

    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = [v21 items];
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v13);
          }
          double v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v17 isVisible] && objc_msgSend(v17, "type") == (id)1)
          {
            __int16 v18 = [v17 account];
            [v11 addObject:v18];
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }
  }
  BOOL v19 = [[MailboxEditingController alloc] initWithMailbox:v10 account:v8 validAccounts:v11];
  [(MailboxEditingController *)v19 setDelegate:self];
  uint64_t v20 = [(NSArray *)self->_editingToolbarItems lastObject];
  [(MailboxPickerOutlineController *)self _presentViewControllerInPopover:v19 barButtonItem:v20 animated:v5];
}

- (void)_dismissCustomViewController:(id)a3
{
  [(MailboxPickerOutlineController *)self dismissViewControllerAnimated:1 completion:0];
  id v5 = [(MailboxPickerOutlineController *)self collectionView];
  id v4 = [(MailboxPickerOutlineController *)self transitionCoordinator];
  [v5 mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:v4 animated:1];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v5 = [(MailboxPickerOutlineController *)self collectionView];
  id v4 = [(MailboxPickerOutlineController *)self transitionCoordinator];
  [v5 mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:v4 animated:1];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxPickerOutlineController *)self interactiveMoveGestureRecognizer];

  if (v5 == v4)
  {
    double v7 = [(MailboxPickerOutlineController *)self collectionView];
    [v4 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    id v12 = [(MailboxPickerOutlineController *)self collectionView];
    id v13 = [v12 indexPathForItemAtPoint:v9, v11];

    if (v13)
    {
      id v14 = [(MailboxPickerOutlineController *)self collectionHelper];
      unsigned __int8 v6 = [v14 canReorderItemAtIndexPath:v13];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (void)messageListViewController:(id)a3 setEditing:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a4;
  id v10 = [(MailboxPickerOutlineController *)self navigationItem];
  double v7 = [v10 leftBarButtonItem];
  BOOL v8 = !v5;
  [v7 setEnabled:v8];

  id v11 = [(MailboxPickerOutlineController *)self navigationItem];
  double v9 = [v11 rightBarButtonItem];
  [v9 setEnabled:v8];
}

- (void)messageListViewController:(id)a3 didSelectFavorite:(id)a4
{
  id v5 = a4;
  -[MailboxPickerOutlineController _selectFavoriteItem:indexPath:animated:](self, "_selectFavoriteItem:indexPath:animated:");
  [(MailboxPickerOutlineController *)self _updateBackButtonTitle];
}

- (id)displayedAccountsForMailboxCollectionHelper:(id)a3
{
  BOOL v3 = [(MailboxPickerOutlineController *)self accountsProvider];
  id v4 = [v3 displayedAccounts];

  return v4;
}

- (BOOL)mailboxCollectionHelper:(id)a3 shouldDisableForEditingCellForMailbox:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(MailboxPickerOutlineController *)self watchedMailboxes];
  unsigned __int8 v7 = [v6 containsObject:v5];

  return v7;
}

- (void)mailboxCollectionHelperDidTapDetailsDisclosure:(id)a3 sender:(id)a4
{
  id v19 = a4;
  id v5 = [(MailboxPickerOutlineController *)self collectionView];
  [v19 frame];
  double v7 = v6;
  double v9 = v8;
  id v10 = [v19 superview];
  [v5 convertPoint:v10 fromView:v7];
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [v5 indexPathForItemAtPoint:v12, v14];
  id v16 = [(MailboxPickerOutlineController *)self collectionHelper];
  double v17 = [v16 favoriteItemAtIndexPath:v15];

  __int16 v18 = [(MailboxPickerOutlineController *)self collectionHelper];
  [v17 wasSelected:v18 indexPath:v15 accessoryTapped:1 animated:1];
}

- (void)mailboxCollectionHelperWantsToShowAddFavoritesController:(id)a3 sourceView:(id)a4
{
  id v10 = a4;
  id v5 = [EditFavoritesController alloc];
  double v6 = [(MailboxPickerOutlineController *)self accountsProvider];
  double v7 = [(MailboxPickerOutlineController *)self favoritesManager];
  double v8 = [(EditFavoritesController *)v5 initWithAccountsProvider:v6 favoritesManager:v7];

  [(EditFavoritesController *)v8 setDelegate:self];
  double v9 = [(EditFavoritesController *)v8 navigationItem];
  [v9 setHidesBackButton:1];

  [(MailboxPickerOutlineController *)self _presentViewControllerInPopover:v8 sourceView:v10 animated:1];
}

- (void)mailboxCollectionHelper:(id)a3 wantsToPopToMailboxPicker:(BOOL)a4 andPushMessageListViewControllerIfNecessaryAnimated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double v8 = +[NSBundle bundleForClass:objc_opt_class()];
  double v9 = [v8 localizedStringForKey:@"MAILBOXES_BACK_BUTTON" value:&stru_100619928 table:@"Main"];
  id v10 = [(MailboxPickerOutlineController *)self navigationItem];
  [v10 setBackButtonTitle:v9];

  [(MailboxPickerOutlineController *)self setForceReloadMessageListViewController:1];

  [(MailboxPickerOutlineController *)self _popToMailboxPickerController:v6 andPushMessageListViewControllerIfNecessaryAnimated:v5];
}

- (void)mailboxCollectionHelper:(id)a3 wantsToShowCustomViewController:(id)a4 animated:(BOOL)a5 sourceViewBlock:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  id v11 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_dismissCustomViewController:"];
  double v12 = [v9 navigationItem];
  id v22 = v11;
  double v13 = +[NSArray arrayWithObjects:&v22 count:1];
  [v12 setLeftBarButtonItems:v13 animated:1];

  double v14 = [(MailboxPickerOutlineController *)self scene];
  uint64_t v15 = [v14 splitViewController];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000FC86C;
  v18[3] = &unk_100608230;
  void v18[4] = self;
  id v16 = v9;
  id v19 = v16;
  BOOL v21 = v7;
  id v17 = v10;
  id v20 = v17;
  [v15 showMailboxPickerController:1 animated:v7 completion:v18];
}

- (void)mailboxCollectionHelper:(id)a3 wantsToPresentMailboxEditControllerForMailbox:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  BOOL v7 = [v8 account];
  [(MailboxPickerOutlineController *)self _presentMailboxEditControllerForAccount:v7 mailbox:v8 animated:v5];
}

- (id)mailboxPickerDragDropHelper:(id)a3 favoriteItemAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(MailboxPickerOutlineController *)self collectionHelper];
  BOOL v7 = [v6 favoriteItemAtIndexPath:v5];

  return v7;
}

- (id)mailboxPickerDragDropHelper:(id)a3 mailboxForMailboxUid:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(MailboxPickerOutlineController *)self collectionHelper];
  id v11 = v5;
  BOOL v7 = +[NSArray arrayWithObjects:&v11 count:1];
  id v8 = [v6 createMailboxesFromUids:v7];
  id v9 = [v8 firstObject];

  return v9;
}

- (void)updateIsRefreshingForState:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = [v4 integerValue];
  }
  else
  {
    BOOL v6 = [(MailboxPickerOutlineController *)self mailStatusViewController];
    id v5 = [v6 currentState];
  }
  [(MailboxPickerOutlineController *)self setIsRefreshing:v5 == (id)2];
}

- (id)mailboxQualifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"UNREAD_FORMAT" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (BOOL)shouldShowSubtitle
{
  return 0;
}

- (void)mailStatus:(id)a3 didChangeState:(int64_t)a4
{
  id v5 = +[NSNumber numberWithInteger:a4];
  -[MailboxPickerOutlineController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "updateIsRefreshingForState:");
}

- (void)mailStatusViewControllerUndoButtonTapped:(id)a3
{
  BOOL v3 = +[UIApplication sharedApplication];
  id v4 = [v3 daemonInterface];
  id v5 = [v4 outgoingMessageRepository];

  [v5 cancelLastDelayedMessage:&stru_100608270];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = [(MailboxPickerOutlineController *)self isEditing];
  v11.receiver = self;
  v11.super_class = (Class)MailboxPickerOutlineController;
  [(MailboxPickerOutlineController *)&v11 setEditing:v5 animated:v4];
  if (v7 != v5)
  {
    [(MailboxPickerOutlineController *)self _updateNavigationBarItemsEditing:v5];
    [(MailboxPickerOutlineController *)self _updateToolbarItemsEditing:v5 animated:v4];
    if (v5)
    {
      [(MailboxPickerOutlineController *)self focus:v4];
      id v8 = [(MailboxPickerOutlineController *)self navigationItem];
      id v9 = [v8 leftBarButtonItem];
      [v9 setEnabled:0];
    }
    else
    {
      [(MailboxPickerOutlineController *)self unfocus:v4];
      id v8 = [(MailboxPickerOutlineController *)self navigationItem];
      id v9 = [v8 leftBarButtonItem];
      [v9 setEnabled:1];
    }

    id v10 = [(MailboxPickerOutlineController *)self collectionHelper];
    [v10 setEditing:v5 animated:v4];

    [(MailboxPickerOutlineController *)self _dismissEditViewControllers];
  }
}

- (void)_dismissEditViewControllers
{
  id v7 = [(MailboxPickerOutlineController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v7;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
  BOOL v5 = [v4 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    [(MailboxPickerOutlineController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("_escapeShortcutInvoked:" == a3)
  {
    unsigned __int8 v7 = [(MailboxPickerOutlineController *)self isEditing];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MailboxPickerOutlineController;
    unsigned __int8 v7 = [(MailboxPickerOutlineController *)&v10 canPerformAction:a3 withSender:v6];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)_escapeShortcutInvoked:(id)a3
{
  id v4 = a3;
  if ([(MailboxPickerOutlineController *)self isEditing]) {
    [(MailboxPickerOutlineController *)self _editButtonTapped:v4];
  }
}

- (void)mailboxEditingControllerDidFinish:(id)a3
{
  id v4 = [(MailboxPickerOutlineController *)self presentedViewController];

  if (v4)
  {
    [(MailboxPickerOutlineController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v6 = [(MailboxPickerOutlineController *)self navigationController];
    id v5 = [v6 popViewControllerAnimated:1];
  }
}

- (void)editFavoritesControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxPickerOutlineController *)self presentedViewController];

  if (v5)
  {
    [(MailboxPickerOutlineController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v6 = [(MailboxPickerOutlineController *)self navigationController];
    id v7 = [v6 popViewControllerAnimated:1];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000FD73C;
  v9[3] = &unk_100604618;
  id v10 = v4;
  objc_super v11 = self;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)setMessageListContainerViewController:(id)a3
{
}

- (BOOL)isRefreshing
{
  return self->_isRefreshing;
}

- (BOOL)didNotifyExtendedLaunchTracker
{
  return self->_didNotifyExtendedLaunchTracker;
}

- (void)setDidNotifyExtendedLaunchTracker:(BOOL)a3
{
  self->_didNotifyExtendedLaunchTracker = a3;
}

- (void)setDiagnosticsHelper:(id)a3
{
}

- (void)setAccountsProvider:(id)a3
{
}

- (void)setScene:(id)a3
{
}

- (void)setFavoritesManager:(id)a3
{
}

- (void)setMailStatusViewController:(id)a3
{
}

- (void)setComposeButtonItem:(id)a3
{
}

- (void)setShelfButtonItem:(id)a3
{
}

- (void)setEditButtonItem:(id)a3
{
}

- (NSArray)editingToolbarItems
{
  return self->_editingToolbarItems;
}

- (void)setEditingToolbarItems:(id)a3
{
}

- (BOOL)isReordering
{
  return self->_isReordering;
}

- (void)setIsReordering:(BOOL)a3
{
  self->_isReordering = a3;
}

- (EFCancelable)mailboxesObserverToken
{
  return self->_mailboxesObserverToken;
}

- (BOOL)needsReloadOnAppearance
{
  return self->_needsReloadOnAppearance;
}

- (id)viewDidAppearBlock
{
  return self->_viewDidAppearBlock;
}

- (void)setViewDidAppearBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewDidAppearBlock, 0);
  objc_storeStrong((id *)&self->_mailboxesObserverToken, 0);
  objc_storeStrong((id *)&self->_interactiveMoveGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_dragDropHelper, 0);
  objc_storeStrong((id *)&self->_collectionHelper, 0);
  objc_storeStrong((id *)&self->_editingToolbarItems, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_shelfButtonItem, 0);
  objc_storeStrong((id *)&self->_composeButtonItem, 0);
  objc_storeStrong((id *)&self->_mailStatusViewController, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_diagnosticsHelper, 0);
  objc_storeStrong((id *)&self->_messageListContainerViewController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_watchedMailboxes, 0);
}

@end