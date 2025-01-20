@interface MFTransferStackViewController
+ (id)log;
- (BOOL)isStackControllerVisible;
- (BOOL)stackController:(id)a3 isDataLoadedForItem:(id)a4 inView:(id)a5;
- (BOOL)wantsDesktopClassNavigationBar;
- (CGRect)_stackItemRect;
- (CNContactStore)contactStore;
- (ConversationViewController)conversationViewController;
- (MFTransferStackControllerDataSource)dataSource;
- (MFTransferStackViewController)initWithScene:(id)a3;
- (MailSplitViewController)mailSplitViewController;
- (MessageDisplayCapable)scene;
- (MessageListSelectionModel)messageListSelectionModel;
- (StackController)stackController;
- (UIColor)conversationColor;
- (UIEdgeInsets)stackContainerViewEdgeInsetsForStackController:(id)a3;
- (_MFStackContainerView)stackContainerView;
- (id)_titleForTransferOptions:(unint64_t)a3;
- (id)splitViewController;
- (id)stackContainerViewForStackController:(id)a3;
- (id)stackController:(id)a3 viewForItem:(id)a4;
- (unint64_t)transferOptions;
- (void)_messageContentRepresentationRequestForItemWithItemID:(id)a3 completionHandler:(id)a4;
- (void)_splitViewStateChanged:(id)a3;
- (void)_updateBackgroundColor;
- (void)_updateDisplayModeButtonItemForDisplayMode:(int64_t)a3 isCollapsed:(BOOL)a4;
- (void)_updateDisplayModeButtonItemForDisplayMode:(int64_t)a3 isCollapsed:(BOOL)a4 isShowingTitle:(BOOL)a5;
- (void)_updateStackController;
- (void)_updateTitleAnimated:(BOOL)a3;
- (void)_updateTitleForDisplayMode:(int64_t)a3 animated:(BOOL)a4;
- (void)addStackedItemsWithItemIDs:(id)a3;
- (void)dealloc;
- (void)displayStackedViewsForItemsWithIDs:(id)a3;
- (void)removeStackedItemsWithItemIDs:(id)a3;
- (void)removeStackedViewsAnimated:(BOOL)a3 completion:(id)a4;
- (void)setContactStore:(id)a3;
- (void)setConversationColor:(id)a3;
- (void)setConversationViewController:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIsStackControllerVisible:(BOOL)a3;
- (void)setMessageListSelectionModel:(id)a3;
- (void)setScene:(id)a3;
- (void)setStackContainerView:(id)a3;
- (void)setTransferOptions:(unint64_t)a3;
- (void)stackContainerViewDidBecomeInvisible:(id)a3;
- (void)stackContainerViewWillBecomeVisible:(id)a3;
- (void)stackController:(id)a3 loadDataForItem:(id)a4 inView:(id)a5;
- (void)stackController:(id)a3 willDisplayView:(id)a4 forItem:(id)a5;
- (void)stackController:(id)a3 willRemoveViewForItem:(id)a4;
- (void)stackControllerDidStopStackingViews:(id)a3;
- (void)stackControllerWillStartStackingViews:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForDisplayMode:(int64_t)a3 isCollapsed:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MFTransferStackViewController

- (MFTransferStackViewController)initWithScene:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFTransferStackViewController;
  v5 = [(MFTransferStackViewController *)&v16 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = objc_alloc_init(StackController);
    stackController = v6->_stackController;
    v6->_stackController = v7;

    [(StackController *)v6->_stackController setDelegate:v6];
    [(StackController *)v6->_stackController setDataSource:v6];
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contentRequests = v6->_contentRequests;
    v6->_contentRequests = v9;

    uint64_t v11 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.transferStack.messagePreview"];
    messageLoadScheduler = v6->_messageLoadScheduler;
    v6->_messageLoadScheduler = (EFScheduler *)v11;

    uint64_t v13 = +[UIColor mailTransferConversationViewBackgroundColor];
    conversationColor = v6->_conversationColor;
    v6->_conversationColor = (UIColor *)v13;
  }
  return v6;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)MFTransferStackViewController;
  [(MFTransferStackViewController *)&v23 viewDidLoad];
  id v3 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v3 configureWithDefaultBackground];
  id v4 = [(MFTransferStackViewController *)self navigationItem];
  [v4 setScrollEdgeAppearance:v3];

  v5 = [_MFStackContainerView alloc];
  v6 = [(MFTransferStackViewController *)self view];
  [v6 bounds];
  v7 = -[_MFStackContainerView initWithFrame:](v5, "initWithFrame:");
  stackContainerView = self->_stackContainerView;
  self->_stackContainerView = v7;

  v9 = +[UIColor clearColor];
  [(_MFStackContainerView *)self->_stackContainerView setBackgroundColor:v9];

  [(_MFStackContainerView *)self->_stackContainerView setDelegate:self];
  v10 = [(MFTransferStackViewController *)self view];
  [v10 addSubview:self->_stackContainerView];

  [(_MFStackContainerView *)self->_stackContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v11 = [(MFTransferStackViewController *)self view];
  v12 = self->_stackContainerView;
  CFStringRef v26 = @"_container";
  v27 = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v14 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_container]|" options:0 metrics:0 views:v13];
  [v11 addConstraints:v14];

  v15 = [(MFTransferStackViewController *)self view];
  objc_super v16 = self->_stackContainerView;
  CFStringRef v24 = @"_container";
  v25 = v16;
  v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v18 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_container]|" options:0 metrics:0 views:v17];
  [v15 addConstraints:v18];

  v19 = +[UIColor _dimmingViewColor];
  v20 = [(MFTransferStackViewController *)self view];
  [v20 setBackgroundColor:v19];

  v21 = [(MFTransferStackViewController *)self view];
  [v21 setUserInteractionEnabled:0];

  v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"_splitViewStateChanged:" name:@"MailSplitViewControllerViewStateChangedNotification" object:0];
}

- (void)setDataSource:(id)a3
{
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F7048;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699DA0 != -1) {
    dispatch_once(&qword_100699DA0, block);
  }
  v2 = (void *)qword_100699D98;

  return v2;
}

- (void)displayStackedViewsForItemsWithIDs:(id)a3
{
  id v13 = a3;
  id v12 = [(NSMutableOrderedSet *)self->_stackedItemIDs mutableCopy];
  [v12 removeObjectsInArray:v13];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v12;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v9 = [(NSMutableDictionary *)self->_contentRequests objectForKeyedSubscript:v8];
        [v9 cancel];
        [(NSMutableDictionary *)self->_contentRequests removeObjectForKey:v8];
      }
      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v10 = (NSMutableOrderedSet *)[objc_alloc((Class)NSMutableOrderedSet) initWithArray:v13];
  stackedItemIDs = self->_stackedItemIDs;
  self->_stackedItemIDs = v10;

  [(MFTransferStackViewController *)self _updateStackController];
  [(MFTransferStackViewController *)self _updateBackgroundColor];
}

- (void)removeStackedViewsAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  if ([(StackController *)self->_stackController hasStackedItems])
  {
    if (v6)
    {
      id v7 = [v6 copy];
      id removeStackedViewsAnimationCompletionBlock = self->_removeStackedViewsAnimationCompletionBlock;
      self->_id removeStackedViewsAnimationCompletionBlock = v7;
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001F73B0;
    v9[3] = &unk_1006058A8;
    v9[4] = self;
    BOOL v10 = a3;
    +[UIView animateWithDuration:v9 animations:0.3];
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

- (void)addStackedItemsWithItemIDs:(id)a3
{
  id v4 = a3;
  -[NSMutableOrderedSet addObjectsFromArray:](self->_stackedItemIDs, "addObjectsFromArray:");
  [(MFTransferStackViewController *)self _updateStackController];
  [(MFTransferStackViewController *)self _updateBackgroundColor];
}

- (void)removeStackedItemsWithItemIDs:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_contentRequests, "objectForKeyedSubscript:", v8, (void)v10);
        if (([v9 isFinished] & 1) == 0) {
          [v9 cancel];
        }
        [(NSMutableDictionary *)self->_contentRequests removeObjectForKey:v8];
        [(NSMutableOrderedSet *)self->_stackedItemIDs removeObject:v8];
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(MFTransferStackViewController *)self _updateStackController];
  [(MFTransferStackViewController *)self _updateBackgroundColor];
}

- (void)_updateStackController
{
  if ([(MFTransferStackViewController *)self isStackControllerVisible])
  {
    id v3 = [(MFTransferStackViewController *)self dataSource];
    id v4 = [(NSMutableOrderedSet *)self->_stackedItemIDs array];
    id v5 = [v3 transferStackViewController:self itemIDsToDisplayFromItemIDs:v4];

    [(StackController *)self->_stackController displayStackedViewsForItems:v5 animated:1];
  }
}

- (BOOL)wantsDesktopClassNavigationBar
{
  return +[UINavigationBar mf_canUseDesktopClassNavigationBar];
}

- (ConversationViewController)conversationViewController
{
  p_conversationViewController = &self->_conversationViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_conversationViewController);
  if (!WeakRetained)
  {
    id v5 = [(MFTransferStackViewController *)self mailSplitViewController];
    uint64_t v6 = [v5 messageDetailNavController];
    WeakRetained = [v6 conversationViewController];

    objc_storeWeak((id *)p_conversationViewController, WeakRetained);
  }

  return (ConversationViewController *)WeakRetained;
}

- (id)_titleForTransferOptions:(unint64_t)a3
{
  char v3 = a3;
  if ((a3 & 2) != 0)
  {
    if ((a3 & 1) == 0)
    {
      id v7 = [(NSMutableDictionary *)self->_contentRequests count];
      uint64_t v8 = +[NSBundle mainBundle];
      id v5 = v8;
      if (v7 == (id)1) {
        [v8 localizedStringForKey:@"SINGLE_MESSAGE_MOVE_TITLE" value:&stru_100619928 table:@"Main"];
      }
      else {
        [v8 localizedStringForKey:@"MULTIPE_MESSAGES_MOVE_TITLE" value:&stru_100619928 table:@"Main"];
      }
      goto LABEL_5;
    }
    id v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"SINGLE_MESSAGE_MOVE_TITLE" value:&stru_100619928 table:@"Main"];
  }
  else
  {
    if ((a3 & 0x10) == 0)
    {
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      if ((v3 & 0x20) != 0) {
        [v4 localizedStringForKey:@"MESSAGE_SELECTION_TRASH_TITLE" value:&stru_100619928 table:@"Main"];
      }
      else {
        [v4 localizedStringForKey:@"MESSAGE_SELECTION_TITLE" value:&stru_100619928 table:@"Main"];
      }
      uint64_t v6 = LABEL_5:;
      goto LABEL_13;
    }
    id v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"MESSAGE_SELECTION_ARCHIVE_TITLE" value:&stru_100619928 table:@"Main"];
  }
LABEL_13:
  v9 = (void *)v6;

  return v9;
}

- (void)_updateTitleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFTransferStackViewController *)self splitViewController];
  -[MFTransferStackViewController _updateTitleForDisplayMode:animated:](self, "_updateTitleForDisplayMode:animated:", [v5 displayMode], v3);
}

- (void)_updateTitleForDisplayMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(MFTransferStackViewController *)self splitViewController];
  uint64_t v8 = [(MFTransferStackViewController *)self traitCollection];
  unsigned int v9 = +[UINavigationBar mf_shouldUseDesktopClassNavigationBarForTraitCollection:v8];

  if (v9)
  {
    [(MFTransferStackViewController *)self setTitle:0];
  }
  else
  {
    long long v10 = [(MFTransferStackViewController *)self _titleForTransferOptions:[(MFTransferStackViewController *)self transferOptions]];
    long long v11 = v10;
    if (a3 == 5 || a3 == 3)
    {
      long long v12 = [[BarLabelItem alloc] initWithTitle:v10 style:1];
      long long v13 = [(MFTransferStackViewController *)self view];
      [v13 frame];
      double v15 = v14;
      [v7 primaryColumnWidth];
      double v17 = v16;

      v18 = [(BarLabelItem *)v12 customView];
      [v18 frame];
      double v20 = v19;

      id v21 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
      [v21 setWidth:(v15 - v17 - v20) * 0.5];
      v25[0] = v21;
      v25[1] = v12;
      v22 = +[NSArray arrayWithObjects:v25 count:2];

      id v23 = 0;
    }
    else
    {
      id v23 = v10;
      v22 = &__NSArray0__struct;
    }
    [(MFTransferStackViewController *)self setTitle:v23];
    CFStringRef v24 = [(MFTransferStackViewController *)self navigationItem];
    [v24 setRightBarButtonItems:v22 animated:v4];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController viewWillAppear:](&v6, "viewWillAppear:");
  [(MFTransferStackViewController *)self setIsStackControllerVisible:1];
  [(MFTransferStackViewController *)self stackContainerViewEdgeInsetsForStackController:self->_stackController];
  [(_MFStackContainerView *)self->_stackContainerView setLayoutInsets:"setLayoutInsets:"];
  [(_MFStackContainerView *)self->_stackContainerView setNeedsLayout];
  [(MFTransferStackViewController *)self _updateStackController];
  [(MFTransferStackViewController *)self _updateTitleAnimated:v3];
  id v5 = [(MFTransferStackViewController *)self splitViewController];
  -[MFTransferStackViewController _updateDisplayModeButtonItemForDisplayMode:[v5 displayMode] isCollapsed:[v5 isCollapsed]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFTransferStackViewController;
  [(MFTransferStackViewController *)&v5 viewDidAppear:a3];
  BOOL v4 = [(MFTransferStackViewController *)self stackController];
  [v4 updateStackedViewsFrame];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFTransferStackViewController;
  [(MFTransferStackViewController *)&v6 viewDidDisappear:a3];
  BOOL v4 = [(MFTransferStackViewController *)self conversationViewController];
  objc_super v5 = [v4 barItemsManager];
  [v5 setShowSupplementaryButtonItem:0];

  [v4 _updateBarButtonsAnimated:0 force:1];
  [(MFTransferStackViewController *)self setIsStackControllerVisible:0];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MFTransferStackViewController;
  [(MFTransferStackViewController *)&v4 viewDidLayoutSubviews];
  if ([(MFTransferStackViewController *)self isStackControllerVisible])
  {
    BOOL v3 = [(MFTransferStackViewController *)self stackController];
    [v3 updateStackedViewsFrame];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  -[MFTransferStackViewController _updateTitleAnimated:](self, "_updateTitleAnimated:", [v7 isAnimated]);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFTransferStackViewController;
  [(MFTransferStackViewController *)&v7 traitCollectionDidChange:v4];
  objc_super v5 = [(MFTransferStackViewController *)self traitCollection];
  id v6 = [v5 horizontalSizeClass];

  if (v6 == (id)2) {
    [(MFTransferStackViewController *)self _updateStackController];
  }
}

- (void)_updateBackgroundColor
{
  if ([(NSMutableOrderedSet *)self->_stackedItemIDs count]) {
    +[UIColor mailTransferStackViewBackgroundColor];
  }
  else {
  id v4 = +[UIColor _dimmingViewColor];
  }
  BOOL v3 = [(MFTransferStackViewController *)self view];
  [v3 setBackgroundColor:v4];
}

- (void)updateForDisplayMode:(int64_t)a3 isCollapsed:(BOOL)a4
{
  [(MFTransferStackViewController *)self _updateDisplayModeButtonItemForDisplayMode:a3 isCollapsed:a4 isShowingTitle:0];

  [(MFTransferStackViewController *)self _updateTitleForDisplayMode:a3 animated:1];
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MFTransferStackViewController;
  [(MFTransferStackViewController *)&v4 dealloc];
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_super v4 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    objc_super v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (id)splitViewController
{
  v8.receiver = self;
  v8.super_class = (Class)MFTransferStackViewController;
  BOOL v3 = [(MFTransferStackViewController *)&v8 splitViewController];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(MFTransferStackViewController *)self presentingViewController];
    id v5 = [v6 splitViewController];
  }

  return v5;
}

- (void)_splitViewStateChanged:(id)a3
{
  id v13 = a3;
  id v5 = [v13 object];
  id v6 = [(MFTransferStackViewController *)self splitViewController];

  if (v5 == v6)
  {
    objc_super v7 = [v13 userInfo];
    objc_super v8 = [v7 objectForKeyedSubscript:@"MailSplitViewControllerNewDisplayModeKey"];
    uint64_t v9 = [v7 objectForKeyedSubscript:@"MailSplitViewControllerIsCollapsedKey"];
    long long v10 = (void *)v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      long long v12 = +[NSAssertionHandler currentHandler];
      [v12 handleFailureInMethod:a2, self, @"MFTransferStackViewController.m", 491, @"Notification is missing information: %@, %@", v8, v10 object file lineNumber description];
    }
    -[MFTransferStackViewController updateForDisplayMode:[v8 integerValue] isCollapsed:[v10 BOOLValue]];
  }
}

- (MailSplitViewController)mailSplitViewController
{
  v2 = [(MFTransferStackViewController *)self splitViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  objc_super v4 = v3;

  return v4;
}

- (void)_updateDisplayModeButtonItemForDisplayMode:(int64_t)a3 isCollapsed:(BOOL)a4
{
}

- (void)_updateDisplayModeButtonItemForDisplayMode:(int64_t)a3 isCollapsed:(BOOL)a4 isShowingTitle:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v17 = [(MFTransferStackViewController *)self mailSplitViewController];
  if (+[UINavigationBar mf_canUseDesktopClassNavigationBar])
  {
    unsigned int v9 = a3 == 1 || v6;
    if (v17) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    BOOL v11 = [(MFTransferStackViewController *)self conversationViewController];
    long long v12 = [v11 barItemsManager];
    [v12 setShowSupplementaryButtonItem:v10];

    id v13 = [(MFTransferStackViewController *)self traitCollection];
    unsigned int v14 = +[UINavigationBar mf_shouldUseDesktopClassNavigationBarForTraitCollection:v13];

    if (v14) {
      [v11 _updateBarButtonsAnimated:1 withDisplayMode:a3 isCollapsed:v6 isShowingTitle:v5];
    }
  }
  else
  {
    BOOL v15 = !v6;
    if (a3 == 1) {
      BOOL v15 = 0;
    }
    if (v15 || !v17)
    {
      BOOL v11 = [(MFTransferStackViewController *)self navigationItem];
      [v11 setLeftBarButtonItem:0];
    }
    else
    {
      BOOL v11 = [v17 supplementaryButtonItem];
      double v16 = [(MFTransferStackViewController *)self navigationItem];
      [v16 setLeftBarButtonItem:v11];
    }
  }
}

- (CGRect)_stackItemRect
{
  BOOL v3 = [(MFTransferStackViewController *)self view];
  [v3 bounds];

  [(MFTransferStackViewController *)self stackContainerViewEdgeInsetsForStackController:self->_stackController];

  UIRectInset();
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)stackContainerViewForStackController:(id)a3
{
  return self->_stackContainerView;
}

- (UIEdgeInsets)stackContainerViewEdgeInsetsForStackController:(id)a3
{
  double v4 = [(MFTransferStackViewController *)self scene];
  double v5 = [v4 statusBarManager];
  [v5 statusBarFrame];
  double Height = CGRectGetHeight(v15);

  double v7 = [(MFTransferStackViewController *)self navigationController];
  objc_super v8 = [v7 navigationBar];
  [v8 frame];
  double v10 = v9;

  double v11 = Height + v10;
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)stackController:(id)a3 viewForItem:(id)a4
{
  double v5 = [(MFTransferStackViewController *)self scene];
  double v6 = [_MFStackWrapperView alloc];
  [(MFTransferStackViewController *)self _stackItemRect];
  double v7 = -[_MFStackWrapperView initWithFrame:](v6, "initWithFrame:");
  id v8 = objc_alloc((Class)MFMessageContentView);
  [(_MFStackWrapperView *)v7 bounds];
  id v9 = [v8 initWithFrame:];
  [v9 setMessageBlockingReason:4];
  [v9 setShowsBanners:0];
  double v10 = +[UIApplication sharedApplication];
  double v11 = [v10 mailboxProvider];
  [v9 setMailboxProvider:v11];

  double v12 = [v5 daemonInterface];
  [v9 setDaemonInterface:v12];

  double v13 = [v5 brandIndicatorProvider];
  [v9 setBrandIndicatorProvider:v13];

  double v14 = +[UIApplication sharedApplication];
  CGRect v15 = [v14 accountsProvider];

  double v16 = [MFConversationItemHeaderBlock alloc];
  id v17 = [(MFTransferStackViewController *)self contactStore];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v21 = -[MFConversationItemHeaderBlock initWithFrame:contactStore:accountsProvider:](v16, "initWithFrame:contactStore:accountsProvider:", v17, v15, CGRectZero.origin.x, y, width, height);

  [(MFConversationItemHeaderBlock *)v21 setDisplayOptions:2];
  v22 = [v9 headerView];
  [v22 addHeaderBlock:v21 animated:0];

  id v23 = -[MessageHeaderSubjectBlock initWithFrame:]([MessageHeaderSubjectBlock alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  CFStringRef v24 = [v9 headerView];
  [v24 addHeaderBlock:v23 animated:0];

  [(_MFStackWrapperView *)v7 addWrappedView:v9];
  v25 = [(MFTransferStackViewController *)self traitCollection];
  CFStringRef v26 = [(MFTransferStackViewController *)self view];
  [v26 layoutMargins];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  v35 = [(MFTransferStackViewController *)self view];
  [v35 safeAreaInsets];
  v40 = +[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", v25, [v5 interfaceOrientation], v28, v30, v32, v34, v36, v37, v38, v39);

  [v9 setLayoutMargins:v28, v30, v32, v34];
  [v9 setDisplayMetrics:v40];

  return v7;
}

- (void)_messageContentRepresentationRequestForItemWithItemID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, void *))a4;
  id v8 = [(NSMutableDictionary *)self->_contentRequests objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_contentRequests objectForKeyedSubscript:v6];
    v7[2](v7, v9);
  }
  else
  {
    double v10 = +[MFTransferStackViewController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request display message for message: %{public}@", buf, 0xCu);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    double v11 = [(MFTransferStackViewController *)self dataSource];
    double v12 = [v11 transferStackViewController:self displayMessageForMessageListItemWithItemID:v6];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001F9190;
    v20[3] = &unk_10060D5E0;
    id v13 = v6;
    id v21 = v13;
    double v14 = [v12 map:v20];
    CGRect v15 = +[EFScheduler mainThreadScheduler];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001F9260;
    v16[3] = &unk_10060D608;
    objc_copyWeak(&v19, (id *)buf);
    id v17 = v13;
    v18 = v7;
    [v14 onScheduler:v15 addSuccessBlock:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)stackController:(id)a3 isDataLoadedForItem:(id)a4 inView:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(NSMutableDictionary *)self->_contentRequests objectForKeyedSubscript:v7];
    double v10 = [v9 message];
    unsigned __int8 v11 = [v10 isAvailableLocally];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)stackController:(id)a3 loadDataForItem:(id)a4 inView:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v7 conformsToProtocol:&OBJC_PROTOCOL___EMCollectionItemID])
    {
      id v10 = v7;
      unsigned __int8 v11 = +[MFTransferStackViewController log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Load data for message: %{public}@", buf, 0xCu);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1001F964C;
      v15[3] = &unk_10060D630;
      id v16 = v9;
      double v12 = v10;
      id v17 = v12;
      [(MFTransferStackViewController *)self _messageContentRepresentationRequestForItemWithItemID:v12 completionHandler:v15];
    }
    else
    {
      double v12 = self;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = (objc_class *)objc_opt_class();
        double v14 = NSStringFromClass(v13);
        sub_10045D6D8(v14, buf, v12);
      }
    }
  }
}

- (void)stackControllerWillStartStackingViews:(id)a3
{
}

- (void)stackControllerDidStopStackingViews:(id)a3
{
  id removeStackedViewsAnimationCompletionBlock = (void (**)(id, SEL, id))self->_removeStackedViewsAnimationCompletionBlock;
  if (removeStackedViewsAnimationCompletionBlock)
  {
    removeStackedViewsAnimationCompletionBlock[2](removeStackedViewsAnimationCompletionBlock, a2, a3);
    id v5 = self->_removeStackedViewsAnimationCompletionBlock;
    self->_id removeStackedViewsAnimationCompletionBlock = 0;
  }
}

- (void)stackController:(id)a3 willDisplayView:(id)a4 forItem:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    [(MFTransferStackViewController *)self _stackItemRect];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v8 frame];
    v26.origin.x = v18;
    v26.origin.double y = v19;
    v26.size.double width = v20;
    v26.size.double height = v21;
    v25.origin.x = v11;
    v25.origin.double y = v13;
    v25.size.double width = v15;
    v25.size.double height = v17;
    if (!CGRectEqualToRect(v25, v26))
    {
      v22 = [(MFTransferStackViewController *)self stackController];
      [v22 updateStackedViewFrameForItem:v9];
    }
  }
}

- (void)stackController:(id)a3 willRemoveViewForItem:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v8 = v5;
    id v6 = [(NSMutableDictionary *)self->_contentRequests objectForKeyedSubscript:v5];
    id v7 = v6;
    if (v6) {
      [v6 cancel];
    }
    [(NSMutableDictionary *)self->_contentRequests removeObjectForKey:v8];

    id v5 = v8;
  }
}

- (void)stackContainerViewWillBecomeVisible:(id)a3
{
}

- (void)stackContainerViewDidBecomeInvisible:(id)a3
{
}

- (StackController)stackController
{
  return self->_stackController;
}

- (MFTransferStackControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MFTransferStackControllerDataSource *)WeakRetained;
}

- (_MFStackContainerView)stackContainerView
{
  return self->_stackContainerView;
}

- (void)setStackContainerView:(id)a3
{
}

- (MessageListSelectionModel)messageListSelectionModel
{
  return self->_messageListSelectionModel;
}

- (void)setMessageListSelectionModel:(id)a3
{
}

- (unint64_t)transferOptions
{
  return self->_transferOptions;
}

- (void)setTransferOptions:(unint64_t)a3
{
  self->_transferOptions = a3;
}

- (UIColor)conversationColor
{
  return self->_conversationColor;
}

- (void)setConversationColor:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (MessageDisplayCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MessageDisplayCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (BOOL)isStackControllerVisible
{
  return self->_isStackControllerVisible;
}

- (void)setIsStackControllerVisible:(BOOL)a3
{
  self->_isStackControllerVisible = a3;
}

- (void)setConversationViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_conversationViewController);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_conversationColor, 0);
  objc_storeStrong((id *)&self->_messageListSelectionModel, 0);
  objc_storeStrong((id *)&self->_stackContainerView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stackController, 0);
  objc_storeStrong(&self->_removeStackedViewsAnimationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_stackedItemIDs, 0);
  objc_storeStrong((id *)&self->_contentRequests, 0);

  objc_storeStrong((id *)&self->_messageLoadScheduler, 0);
}

@end