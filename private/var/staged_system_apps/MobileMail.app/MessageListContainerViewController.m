@interface MessageListContainerViewController
- (BOOL)canHandleAction:(SEL)a3 withMailMenuCommand:(id)a4;
- (BOOL)isEditing;
- (BOOL)isMessageListViewControllerVisible:(id)a3;
- (BOOL)isSearchViewControllerEditing;
- (BOOL)shouldRouteActionToConversation:(SEL)a3 withCommand:(id)a4;
- (BOOL)shouldShowPreparingSearch;
- (BOOL)showingPopoverViewController;
- (ConversationViewController)conversationViewController;
- (EMDiagnosticsHelper)diagnosticsHelper;
- (EMMessageListItem)senderSpecificMessageListItem;
- (FavoritesShortcutsProvider)favoritesShortcutsProvider;
- (MFAccountsProvider)accountsProvider;
- (MSBucketBarConfigurationController)bucketBarConfigurationController;
- (MailMainScene)scene;
- (MailboxPickerDelegate)mailboxPickerDelegate;
- (MessageListContainerViewController)initWithMainScene:(id)a3 mailboxes:(id)a4 accountsProvider:(id)a5 favoritesShortcutsProvider:(id)a6 contactStore:(id)a7 diagnosticsHelper:(id)a8 mailboxPickerDelegate:(id)a9;
- (MessageListContainerViewController)senderSpecificMessageListContainerViewController;
- (MessageListViewController)messageListViewController;
- (NSArray)mailboxes;
- (UIBarButtonItem)composeButtonItem;
- (double)preferredFocusBarHeight;
- (double)previousPaletteWidth;
- (id)_updateContentForMode:(int64_t)a3;
- (id)captureRestorationState;
- (id)mf_preferredTitle;
- (id)scrollableHintBlock;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)updateScrollableHintBlock;
- (int64_t)_modeForBucket:(int64_t)a3;
- (int64_t)mode;
- (unint64_t)paletteConfiguration;
- (void)_didReceivePreferredFontChangedNotification:(id)a3;
- (void)_updatePaletteWithForce:(BOOL)a3;
- (void)focusBannerView:(id)a3 stateDidChange:(BOOL)a4;
- (void)messageListViewController:(id)a3 didRestoreStateWithMailboxes:(id)a4;
- (void)messageListViewController:(id)a3 updateLayoutMarginsForFocusBannerView:(NSDirectionalEdgeInsets)a4;
- (void)messageListViewControllerRequiresPaletteUpdate:(id)a3 disableFocusFilter:(BOOL)a4;
- (void)messageListViewControllerRequiresPaletteUpdate:(id)a3 enableSearchPreparing:(BOOL)a4;
- (void)restoreState:(id)a3;
- (void)resumeRefreshAnimationIfNecessary;
- (void)setAccountsProvider:(id)a3;
- (void)setConversationViewController:(id)a3;
- (void)setDiagnosticsHelper:(id)a3;
- (void)setFavoritesShortcutsProvider:(id)a3;
- (void)setFiltersEnabled:(BOOL)a3;
- (void)setMailboxPickerDelegate:(id)a3;
- (void)setMailboxes:(id)a3 forceReload:(BOOL)a4;
- (void)setMailboxes:(id)a3 senderSpecificMessageListItem:(id)a4 bucket:(int64_t)a5 mode:(int64_t)a6 forceReload:(BOOL)a7;
- (void)setMessageListViewController:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setPaletteConfiguration:(unint64_t)a3;
- (void)setPreferredFocusBarHeight:(double)a3;
- (void)setPreviousPaletteWidth:(double)a3;
- (void)setScene:(id)a3;
- (void)setScrollableHintBlock:(id)a3;
- (void)setSenderSpecificMessageListContainerViewController:(id)a3;
- (void)setSenderSpecificMessageListItem:(id)a3;
- (void)setShouldShowPreparingSearch:(BOOL)a3;
- (void)setUpdateScrollableHintBlock:(id)a3;
- (void)suspendRefreshAnimationIfNecessary;
- (void)toggleFilters;
- (void)updateForSplitViewControllerHidingMessageList;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation MessageListContainerViewController

- (void)resumeRefreshAnimationIfNecessary
{
  sub_100044E8C(self, [(MessageListContainerViewController *)self mode]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 resumeRefreshAnimationIfNecessary];
}

- (void)setMailboxes:(id)a3 forceReload:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = sub_1000165CC(self, v7, 0);
  [(MessageListContainerViewController *)self setMailboxes:v7 senderSpecificMessageListItem:0 bucket:v6 mode:[(MessageListContainerViewController *)self _modeForBucket:v6] forceReload:v4];
}

- (BOOL)isEditing
{
  id v2 = [(MessageListContainerViewController *)self childViewControllers];
  v3 = [v2 firstObject];
  unsigned __int8 v4 = [v3 isEditing];

  return v4;
}

- (void)setMailboxes:(id)a3 senderSpecificMessageListItem:(id)a4 bucket:(int64_t)a5 mode:(int64_t)a6 forceReload:(BOOL)a7
{
  BOOL v7 = a7;
  v18 = (NSArray *)a3;
  id v13 = a4;
  mailboxes = self->_mailboxes;
  if (mailboxes != v18) {
    objc_storeStrong((id *)&self->_mailboxes, a3);
  }
  [(MessageListContainerViewController *)self setMode:a6];
  [(MessageListContainerViewController *)self setSenderSpecificMessageListItem:v13];
  [(MessageListContainerViewController *)self setShouldShowPreparingSearch:0];
  v15 = [(MessageListContainerViewController *)self _updateContentForMode:a6];
  v16 = [(MessageListContainerViewController *)self conversationViewController];
  [v16 setDelegate:v15];

  [v15 setMailboxes:v18 senderSpecificMessageListItem:v13 bucket:a5 forceReload:v7];
  [(MessageListContainerViewController *)self _updatePaletteWithForce:mailboxes != v18];
  v17 = [(MessageListContainerViewController *)self navigationItem];
  [v15 configureNavigationItem:v17 forViewController:self];

  [(MessageListContainerViewController *)self mf_updateAlertSuppressionContextsForReason:@"Message list mailboxes did change"];
}

- (id)_updateContentForMode:(int64_t)a3
{
  unsigned __int8 v4 = sub_100044E8C(self, a3);
  v5 = [(MessageListContainerViewController *)self childViewControllers];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    BOOL v7 = [(MessageListContainerViewController *)self childViewControllers];
    id v8 = [v7 count];

    if (v8)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v9 = [(MessageListContainerViewController *)self childViewControllers];
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v21;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            [v13 willMoveToParentViewController:0];
            v14 = [v13 view];
            [v14 removeFromSuperview];

            [v13 removeFromParentViewController];
            [v13 didMoveToParentViewController:0];
            if ([v13 conformsToProtocol:&OBJC_PROTOCOL___NavigationItemConfigurable])
            {
              v15 = [(MessageListContainerViewController *)self navigationItem];
              [v13 invalidateNavigationItem:v15 forViewController:self];
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v10);
      }
    }
    [v4 willMoveToParentViewController:self];
    [(MessageListContainerViewController *)self addChildViewController:v4];
    v16 = [v4 view];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(MessageListContainerViewController *)self view];
    [v17 addSubview:v16];

    v18 = [(MessageListContainerViewController *)self view];
    [v16 mf_pinToView:v18 usingLayoutMargins:0];

    [v4 didMoveToParentViewController:self];
  }

  return v4;
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MessageListContainerViewController;
  [(MessageListContainerViewController *)&v7 viewDidLayoutSubviews];
  v3 = [(MessageListContainerViewController *)self view];
  [v3 frame];
  double Width = CGRectGetWidth(v8);

  [(MessageListContainerViewController *)self previousPaletteWidth];
  double v6 = Width - v5;
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  if (v6 >= 2.22044605e-16)
  {
    [(MessageListContainerViewController *)self setPreviousPaletteWidth:Width];
    [(MessageListContainerViewController *)self _updatePaletteWithForce:1];
  }
}

- (double)previousPaletteWidth
{
  return self->_previousPaletteWidth;
}

- (MSBucketBarConfigurationController)bucketBarConfigurationController
{
  return self->_bucketBarConfigurationController;
}

- (ConversationViewController)conversationViewController
{
  conversationViewController = self->_conversationViewController;
  if (!conversationViewController)
  {
    unsigned __int8 v4 = [(MessageListContainerViewController *)self scene];
    double v5 = [v4 splitViewController];
    double v6 = [v5 messageDetailNavController];
    objc_super v7 = [v6 conversationViewController];

    if (v7)
    {
      CGRect v8 = v7;
      v9 = self->_conversationViewController;
      self->_conversationViewController = v8;
    }
    else
    {
      id v10 = [ConversationViewController alloc];
      uint64_t v11 = +[UIApplication sharedApplication];
      v12 = [v11 contactStore];
      id v13 = +[UIApplication sharedApplication];
      v14 = [v13 avatarGenerator];
      v15 = [(ConversationViewController *)v10 initWithScene:v4 contactStore:v12 avatarGenerator:v14];
      v16 = self->_conversationViewController;
      self->_conversationViewController = v15;

      v17 = sub_100044E8C(self, [(MessageListContainerViewController *)self mode]);
      [(ConversationViewControllerBase *)self->_conversationViewController setDelegate:v17];

      [(ConversationViewControllerBase *)self->_conversationViewController setIsPrimary:1];
      v9 = [(MessageListContainerViewController *)self diagnosticsHelper];
      [(ConversationViewController *)self->_conversationViewController setDiagnosticsHelper:v9];
    }

    conversationViewController = self->_conversationViewController;
  }

  return conversationViewController;
}

- (MessageListContainerViewController)initWithMainScene:(id)a3 mailboxes:(id)a4 accountsProvider:(id)a5 favoritesShortcutsProvider:(id)a6 contactStore:(id)a7 diagnosticsHelper:(id)a8 mailboxPickerDelegate:(id)a9
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v28.receiver = self;
  v28.super_class = (Class)MessageListContainerViewController;
  v18 = [(MessageListContainerViewController *)&v28 initWithNibName:0 bundle:0];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_scene, a3);
    objc_storeStrong((id *)&v19->_mailboxes, a4);
    objc_storeStrong((id *)&v19->_accountsProvider, a5);
    objc_storeStrong((id *)&v19->_favoritesShortcutsProvider, a6);
    objc_storeStrong((id *)&v19->_diagnosticsHelper, a8);
    objc_storeWeak((id *)&v19->_mailboxPickerDelegate, v17);
    long long v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v19 selector:"_didReceivePreferredFontChangedNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];

    if (EMBlackPearlIsFeatureEnabled())
    {
      long long v21 = +[UIApplication sharedApplication];
      uint64_t v22 = [v21 bucketBarConfigurationController];
      bucketBarConfigurationController = v19->_bucketBarConfigurationController;
      v19->_bucketBarConfigurationController = (MSBucketBarConfigurationController *)v22;
    }
  }

  return v19;
}

- (void)_updatePaletteWithForce:(BOOL)a3
{
  id v28 = [(MessageListContainerViewController *)self messageListViewController];
  unsigned int v5 = [v28 focusAllowed];

  if ((id)[(MessageListContainerViewController *)self paletteConfiguration] == (id)v5 && !a3) {
    return;
  }
  sub_10001EC38(self);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (self) {
    paletteStackView = self->_paletteStackView;
  }
  else {
    paletteStackView = 0;
  }
  objc_super v7 = paletteStackView;
  if ([(MessageListContainerViewController *)self paletteConfiguration] & 1 | ((v5 & 1) == 0))
  {
    if ([(MessageListContainerViewController *)self paletteConfiguration]) {
      char v11 = v5;
    }
    else {
      char v11 = 1;
    }
    if (v11) {
      goto LABEL_16;
    }
    CGRect v8 = sub_100138CE4(self);
    [v8 setHidden:1];
  }
  else
  {
    CGRect v8 = sub_100138CE4(self);
    v9 = [(UIStackView *)v7 arrangedSubviews];
    unsigned __int8 v10 = [v9 containsObject:v8];

    if (v10) {
      [v8 setHidden:0];
    }
    else {
      [(UIStackView *)v7 addArrangedSubview:v8];
    }
    v12 = [(MessageListContainerViewController *)self messageListViewController];
    [v8 setFocusFilterEnabled:[v12 isFocusFilterEnabled]];
  }
LABEL_16:
  [(MessageListContainerViewController *)self setPaletteConfiguration:v5];
  id v13 = [(MessageListContainerViewController *)self navigationItem];
  v14 = [(UIStackView *)v7 arrangedSubviews];
  id v15 = [v14 count];

  if (v15)
  {
    id v16 = [v13 _bottomPalette];

    id v17 = v29;
    if (v16 != v29)
    {
      [v13 _setBottomPalette:v29];
      v18 = [v29 contentView];
      [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

      v19 = [v29 contentView];
      [v19 mf_pinToView:v29 usingLayoutMargins:0];

      id v17 = v29;
    }
    long long v20 = [v17 contentView];
    [v20 setNeedsLayout];

    long long v21 = [v29 contentView];
    [v21 layoutIfNeeded];

    if (v5)
    {
      uint64_t v22 = sub_100138CE4(self);
      [v22 preferredHeight];
      UIRoundToViewScale();
      double v24 = v23;
      -[MessageListContainerViewController setPreferredFocusBarHeight:](self, "setPreferredFocusBarHeight:");
      double v25 = v24 + 0.0;
    }
    else
    {
      double v25 = 0.0;
      [(MessageListContainerViewController *)self setPreferredFocusBarHeight:0.0];
    }
    id v27 = [v13 _bottomPalette];
    [v27 setPreferredHeight:v25];
  }
  else
  {
    id v26 = [v13 _bottomPalette];

    if (v26) {
      [v13 _setBottomPalette:0];
    }
  }
}

- (unint64_t)paletteConfiguration
{
  return self->_paletteConfiguration;
}

- (void)setPaletteConfiguration:(unint64_t)a3
{
  self->_paletteConfiguration = a3;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (id)mf_preferredTitle
{
  id v2 = sub_100044E8C(self, [(MessageListContainerViewController *)self mode]);
  v3 = [v2 mf_preferredTitle];

  return v3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (MessageListViewController)messageListViewController
{
  messageListViewController = self->_messageListViewController;
  if (!messageListViewController)
  {
    unsigned __int8 v4 = [MessageListViewController alloc];
    unsigned int v5 = [(MessageListContainerViewController *)self scene];
    double v6 = [(MessageListContainerViewController *)self accountsProvider];
    objc_super v7 = [(MessageListContainerViewController *)self favoritesShortcutsProvider];
    CGRect v8 = +[UIApplication sharedApplication];
    v9 = [v8 contactStore];
    unsigned __int8 v10 = [(MessageListContainerViewController *)self diagnosticsHelper];
    char v11 = [(MessageListViewController *)v4 initWithMainScene:v5 mailboxes:0 accountsProvider:v6 favoritesShortcutsProvider:v7 contactStore:v9 diagnosticsHelper:v10];
    v12 = self->_messageListViewController;
    self->_messageListViewController = v11;

    [(MessageListViewController *)self->_messageListViewController setDelegate:self];
    id v13 = [(MessageListContainerViewController *)self mailboxPickerDelegate];
    [(MessageListViewController *)self->_messageListViewController setMailboxPickerDelegate:v13];

    v14 = [(MessageListContainerViewController *)self scrollableHintBlock];
    [(MessageListViewController *)self->_messageListViewController setScrollableHintBlock:v14];

    id v15 = [(MessageListContainerViewController *)self updateScrollableHintBlock];
    [(MessageListViewController *)self->_messageListViewController setUpdateScrollableHintBlock:v15];

    messageListViewController = self->_messageListViewController;
  }

  return messageListViewController;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MessageListContainerViewController;
  [(MessageListContainerViewController *)&v4 viewDidAppear:a3];
  [(MessageListContainerViewController *)self mf_updateAlertSuppressionContextsForReason:@"mailbox content did appear"];
}

- (id)updateScrollableHintBlock
{
  return self->_updateScrollableHintBlock;
}

- (void)setUpdateScrollableHintBlock:(id)a3
{
}

- (void)setShouldShowPreparingSearch:(BOOL)a3
{
  self->_shouldShowPreparingSearch = a3;
}

- (void)setSenderSpecificMessageListItem:(id)a3
{
}

- (void)setScrollableHintBlock:(id)a3
{
}

- (void)setPreviousPaletteWidth:(double)a3
{
  self->_previousPalettedouble Width = a3;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (id)scrollableHintBlock
{
  return self->_scrollableHintBlock;
}

- (MailMainScene)scene
{
  return self->_scene;
}

- (MailboxPickerDelegate)mailboxPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailboxPickerDelegate);

  return (MailboxPickerDelegate *)WeakRetained;
}

- (FavoritesShortcutsProvider)favoritesShortcutsProvider
{
  return self->_favoritesShortcutsProvider;
}

- (EMDiagnosticsHelper)diagnosticsHelper
{
  return self->_diagnosticsHelper;
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (int64_t)_modeForBucket:(int64_t)a3
{
  return 0;
}

- (void)updateForSplitViewControllerHidingMessageList
{
  if (![(MessageListContainerViewController *)self mode])
  {
    id v3 = [(MessageListContainerViewController *)self messageListViewController];
    [v3 updateForSplitViewControllerHidingMessageList];
  }
}

- (void)restoreState:(id)a3
{
  id v5 = a3;
  if (![(MessageListContainerViewController *)self mode])
  {
    objc_super v4 = [(MessageListContainerViewController *)self messageListViewController];
    [v4 restoreState:v5];
  }
}

- (id)captureRestorationState
{
  if ([(MessageListContainerViewController *)self mode])
  {
    id v3 = 0;
  }
  else
  {
    objc_super v4 = [(MessageListContainerViewController *)self messageListViewController];
    id v3 = [v4 captureRestorationState];
  }

  return v3;
}

- (BOOL)showingPopoverViewController
{
  if ([(MessageListContainerViewController *)self mode]) {
    return 0;
  }
  objc_super v4 = [(MessageListContainerViewController *)self messageListViewController];
  unsigned __int8 v3 = [v4 showingPopoverViewController];

  return v3;
}

- (MessageListContainerViewController)senderSpecificMessageListContainerViewController
{
  senderSpecificMessageListContainerViewController = self->_senderSpecificMessageListContainerViewController;
  if (!senderSpecificMessageListContainerViewController)
  {
    objc_super v4 = [MessageListContainerViewController alloc];
    id v5 = [(MessageListContainerViewController *)self scene];
    double v6 = [(MessageListContainerViewController *)self accountsProvider];
    objc_super v7 = [(MessageListContainerViewController *)self favoritesShortcutsProvider];
    CGRect v8 = [(MessageListContainerViewController *)self diagnosticsHelper];
    v9 = [(MessageListContainerViewController *)v4 initWithMainScene:v5 mailboxes:0 accountsProvider:v6 favoritesShortcutsProvider:v7 contactStore:0 diagnosticsHelper:v8 mailboxPickerDelegate:0];
    unsigned __int8 v10 = self->_senderSpecificMessageListContainerViewController;
    self->_senderSpecificMessageListContainerViewController = v9;

    senderSpecificMessageListContainerViewController = self->_senderSpecificMessageListContainerViewController;
  }

  return senderSpecificMessageListContainerViewController;
}

- (void)suspendRefreshAnimationIfNecessary
{
  sub_100044E8C(self, [(MessageListContainerViewController *)self mode]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 suspendRefreshAnimationIfNecessary];
}

- (void)toggleFilters
{
  id v2 = [(MessageListContainerViewController *)self messageListViewController];
  [v2 toggleFilters];
}

- (void)setFiltersEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MessageListContainerViewController *)self messageListViewController];
  [v4 setFiltersEnabled:v3];
}

- (UIBarButtonItem)composeButtonItem
{
  if ([(MessageListContainerViewController *)self mode])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [(MessageListContainerViewController *)self messageListViewController];
    BOOL v3 = [v4 composeButtonItem];
  }

  return (UIBarButtonItem *)v3;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ([(MessageListContainerViewController *)self mode])
  {
    v10.receiver = self;
    v10.super_class = (Class)MessageListContainerViewController;
    uint64_t v7 = [(MessageListContainerViewController *)&v10 targetForAction:a3 withSender:v6];
  }
  else
  {
    uint64_t v7 = [(MessageListContainerViewController *)self messageListViewController];
  }
  CGRect v8 = (void *)v7;

  return v8;
}

- (BOOL)canHandleAction:(SEL)a3 withMailMenuCommand:(id)a4
{
  id v6 = a4;
  if ([(MessageListContainerViewController *)self mode])
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    CGRect v8 = [(MessageListContainerViewController *)self messageListViewController];
    unsigned __int8 v7 = [v8 canHandleAction:a3 withMailMenuCommand:v6];
  }
  return v7;
}

- (BOOL)shouldRouteActionToConversation:(SEL)a3 withCommand:(id)a4
{
  id v6 = a4;
  if ([(MessageListContainerViewController *)self mode])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    CGRect v8 = [(MessageListContainerViewController *)self messageListViewController];
    unsigned __int8 v7 = [v8 shouldRouteActionToConversation:a3 withCommand:v6];
  }
  return v7;
}

- (BOOL)isSearchViewControllerEditing
{
  if ([(MessageListContainerViewController *)self mode]) {
    return 0;
  }
  id v4 = [(MessageListContainerViewController *)self messageListViewController];
  unsigned __int8 v3 = [v4 isSearchViewControllerEditing];

  return v3;
}

- (void)messageListViewControllerRequiresPaletteUpdate:(id)a3 enableSearchPreparing:(BOOL)a4
{
  [(MessageListContainerViewController *)self setShouldShowPreparingSearch:a4];

  [(MessageListContainerViewController *)self _updatePaletteWithForce:0];
}

- (void)messageListViewControllerRequiresPaletteUpdate:(id)a3 disableFocusFilter:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v4)
  {
    id v6 = sub_100138CE4(self);
    [v6 setFocusFilterEnabled:0];
  }
  [(MessageListContainerViewController *)self _updatePaletteWithForce:0];
}

- (void)messageListViewController:(id)a3 updateLayoutMarginsForFocusBannerView:(NSDirectionalEdgeInsets)a4
{
  double trailing = a4.trailing;
  double bottom = a4.bottom;
  double leading = a4.leading;
  double top = a4.top;
  sub_100138CE4(self);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setDirectionalLayoutMargins:top, leading, bottom, trailing];
}

- (void)messageListViewController:(id)a3 didRestoreStateWithMailboxes:(id)a4
{
}

- (BOOL)isMessageListViewControllerVisible:(id)a3
{
  id v4 = a3;
  sub_100044E8C(self, [(MessageListContainerViewController *)self mode]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(MessageListContainerViewController *)self navigationController];
  id v7 = [v6 viewControllers];
  unsigned __int8 v8 = [v7 containsObject:self];

  if (v5 != v4) {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)focusBannerView:(id)a3 stateDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(MessageListContainerViewController *)self messageListViewController];
  [v5 setFocusFilterEnabled:v4];
}

- (void)_didReceivePreferredFontChangedNotification:(id)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MessageListContainerViewController;
  [(MessageListContainerViewController *)&v4 viewDidDisappear:a3];
  [(MessageListContainerViewController *)self mf_updateAlertSuppressionContextsForReason:@"MessageListViewController did disappear"];
}

- (void)setMailboxPickerDelegate:(id)a3
{
}

- (void)setScene:(id)a3
{
}

- (void)setMessageListViewController:(id)a3
{
}

- (void)setSenderSpecificMessageListContainerViewController:(id)a3
{
}

- (void)setConversationViewController:(id)a3
{
}

- (EMMessageListItem)senderSpecificMessageListItem
{
  return self->_senderSpecificMessageListItem;
}

- (void)setAccountsProvider:(id)a3
{
}

- (void)setFavoritesShortcutsProvider:(id)a3
{
}

- (void)setDiagnosticsHelper:(id)a3
{
}

- (BOOL)shouldShowPreparingSearch
{
  return self->_shouldShowPreparingSearch;
}

- (double)preferredFocusBarHeight
{
  return self->_preferredFocusBarHeight;
}

- (void)setPreferredFocusBarHeight:(double)a3
{
  self->_preferredFocusBarHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarPalette, 0);
  objc_storeStrong((id *)&self->_focusBannerView, 0);
  objc_storeStrong((id *)&self->_paletteStackView, 0);
  objc_storeStrong((id *)&self->_diagnosticsHelper, 0);
  objc_storeStrong((id *)&self->_favoritesShortcutsProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong(&self->_updateScrollableHintBlock, 0);
  objc_storeStrong(&self->_scrollableHintBlock, 0);
  objc_storeStrong((id *)&self->_senderSpecificMessageListItem, 0);
  objc_storeStrong((id *)&self->_bucketBarConfigurationController, 0);
  objc_storeStrong((id *)&self->_conversationViewController, 0);
  objc_storeStrong((id *)&self->_senderSpecificMessageListContainerViewController, 0);
  objc_storeStrong((id *)&self->_messageListViewController, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_scene, 0);

  objc_destroyWeak((id *)&self->_mailboxPickerDelegate);
}

@end