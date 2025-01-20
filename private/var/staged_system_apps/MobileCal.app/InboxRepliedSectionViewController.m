@interface InboxRepliedSectionViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isFocusBannerSection:(int64_t)a3;
- (BOOL)needsRefresh;
- (BOOL)shouldShowFocusBanner;
- (CGSize)preferredContentSize;
- (InboxRepliedSectionViewController)initWithModel:(id)a3;
- (InboxRepliedSectionViewControllerDelegate)inboxRepliedSectionDelegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_eventForIndexPath:(id)a3 cache:(id)a4;
- (id)_eventForItem:(id)a3;
- (id)_eventForOccurrenceInfo:(id)a3;
- (id)_itemForIndexPath:(id)a3 cache:(id)a4;
- (id)_notificationForIndexPath:(id)a3 cache:(id)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)eventStoreForCell:(id)a3;
- (id)noContentStringForInboxTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)title;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)destination;
- (void)_eventStoreChanged:(id)a3;
- (void)_focusConfigurationChanged:(id)a3;
- (void)_identityChanged:(id)a3;
- (void)_localeChanged:(id)a3;
- (void)_refreshIfNeeded;
- (void)_savePendingComments;
- (void)_saveStatus:(int64_t)a3 forItemAtIndexPath:(id)a4;
- (void)_selectedOccurrencesChanged:(id)a3;
- (void)_updateCell:(id)a3 atIndexPath:(id)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)focusBannerTableViewCellToggled:(id)a3;
- (void)inboxWillDismiss;
- (void)loadView;
- (void)messageCell:(id)a3 committedComment:(id)a4;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)performAction:(int64_t)a3 forCell:(id)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6;
- (void)setDestination:(unint64_t)a3;
- (void)setInboxRepliedSectionDelegate:(id)a3;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation InboxRepliedSectionViewController

- (InboxRepliedSectionViewController)initWithModel:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)InboxRepliedSectionViewController;
  v6 = [(InboxRepliedSectionViewController *)&v21 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    v7->_needsRefresh = 1;
    uint64_t v8 = objc_opt_new();
    pendingComments = v7->_pendingComments;
    v7->_pendingComments = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    organizerNames = v7->_organizerNames;
    v7->_organizerNames = (NSMutableDictionary *)v10;

    +[CalendarMessageCell defaultRowHeight];
    v7->_minimumContentHeight = v12 * 4.5;
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mobilecal.inbox.replied.notificationsQ", 0);
    notificationQ = v7->_notificationQ;
    v7->_notificationQ = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.mobilecal.inbox.replied.namesQ", 0);
    organizerNamesQ = v7->_organizerNamesQ;
    v7->_organizerNamesQ = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.mobilecal.inbox.replied.prefetchQ", 0);
    prefetchQ = v7->_prefetchQ;
    v7->_prefetchQ = (OS_dispatch_queue *)v17;

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v7 selector:"_eventStoreChanged:" name:EKEventStoreChangedNotification object:0];
    [v19 addObserver:v7 selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
    [v19 addObserver:v7 selector:"_identityChanged:" name:CUIKCalendarModelIdentityChangedNotification object:v5];
    [v19 addObserver:v7 selector:"_focusConfigurationChanged:" name:CUIKCalendarModelFocusModeConfigurationChangedNotification object:v5];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(InboxRepliedSectionViewController *)self view];
  [v3 removeInteraction:self->_contextMenuInteraction];

  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = 0;

  v5.receiver = self;
  v5.super_class = (Class)InboxRepliedSectionViewController;
  [(InboxRepliedSectionViewController *)&v5 dealloc];
}

- (void)setDestination:(unint64_t)a3
{
  if (self->_destination != a3)
  {
    self->_destination = a3;
    id v3 = [(InboxRepliedSectionViewController *)self tableView];
    [v3 reloadData];
  }
}

- (void)loadView
{
  uint64_t v8 = -[InboxTableView initWithFrame:style:]([InboxTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(InboxTableView *)v8 setRowHeight:UITableViewAutomaticDimension];
  [(InboxTableView *)v8 setListViewDelegate:self];
  [(InboxTableView *)v8 setPrefetchDataSource:self];
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(InboxTableView *)v8 registerClass:v3 forCellReuseIdentifier:v4];
  [(InboxRepliedSectionViewController *)self setTableView:v8];
  objc_super v5 = (UIInteraction *)[objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = v5;

  v7 = [(InboxRepliedSectionViewController *)self view];
  [v7 addInteraction:self->_contextMenuInteraction];
}

- (id)title
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Replied" value:&stru_1001D6918 table:0];

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)InboxRepliedSectionViewController;
  [(InboxRepliedSectionViewController *)&v5 viewWillAppear:a3];
  id lastDisplayedFocusMode = self->_lastDisplayedFocusMode;
  if (lastDisplayedFocusMode != [(CUIKCalendarModel *)self->_model focusFilterMode]) {
    self->_needsRefresh = 1;
  }
  [(InboxRepliedSectionViewController *)self _refreshIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)InboxRepliedSectionViewController;
  [(InboxRepliedSectionViewController *)&v6 viewDidAppear:a3];
  self->_viewIsVisible = 1;
  if (+[ApplicationTester testingSessionStarted])
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"InboxRepliedSectionViewController_ViewDidAppearNotification" object:self];
  }
  if (self->_destination == 2)
  {
    objc_super v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_selectedOccurrencesChanged:" name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:self->_model];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)InboxRepliedSectionViewController;
  [(InboxRepliedSectionViewController *)&v7 viewWillDisappear:a3];
  if (self->_destination == 2)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:self->_model];
  }
  selectionTimer = self->_selectionTimer;
  if (selectionTimer)
  {
    [(NSTimer *)selectionTimer invalidate];
    objc_super v6 = self->_selectionTimer;
    self->_selectionTimer = 0;
  }
  self->_viewIsVisible = 0;
}

- (CGSize)preferredContentSize
{
  [(InboxRepliedSectionViewController *)self _refreshIfNeeded];
  id v3 = [(InboxRepliedSectionViewController *)self tableView];
  EKUIContainedControllerIdealWidth();
  [v3 sizeThatFits:];
  double minimumContentHeight = v4;

  if (self->_minimumContentHeight >= minimumContentHeight) {
    double minimumContentHeight = self->_minimumContentHeight;
  }
  self->_double minimumContentHeight = minimumContentHeight;
  EKUIWidthForWindowSizeParadigm();
  double v7 = v6;
  EKUIGoldenRatioPhi();
  double v9 = minimumContentHeight / v8;
  EKUIContainedControllerIdealWidth();
  if (v9 < v10) {
    double v10 = v9;
  }
  if (v7 >= v10) {
    double v10 = v7;
  }
  double v11 = minimumContentHeight;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  id v4 = a3;
  if (self->_currentSelectedEvent && !self->_selectionTimer)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10012C6D4;
    v7[3] = &unk_1001D5B00;
    v7[4] = self;
    objc_super v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v7 block:0.15];
    selectionTimer = self->_selectionTimer;
    self->_selectionTimer = v5;
  }
}

- (void)_focusConfigurationChanged:(id)a3
{
  self->_needsRefresh = 1;
  if (self->_viewIsVisible) {
    [(InboxRepliedSectionViewController *)self _refreshIfNeeded];
  }
}

- (BOOL)shouldShowFocusBanner
{
  return [(CUIKCalendarModel *)self->_model focusFilterMode] != 0;
}

- (BOOL)isFocusBannerSection:(int64_t)a3
{
  BOOL result = [(InboxRepliedSectionViewController *)self shouldShowFocusBanner];
  if (a3) {
    return 0;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(InboxRepliedSectionViewController *)self shouldShowFocusBanner]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(InboxRepliedSectionViewController *)self isFocusBannerSection:a4]) {
    return 1;
  }
  occurrenceInfos = self->_occurrenceInfos;

  return [(NSArray *)occurrenceInfos count];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", [v5 section]))
  {
    if (!self->_focusBannerCell)
    {
      double v6 = (EKUIFocusBannerTableViewCell *)[objc_alloc((Class)EKUIFocusBannerTableViewCell) initWithReuseIdentifier:@"FocusBanner"];
      focusBannerCell = self->_focusBannerCell;
      self->_focusBannerCell = v6;

      [(EKUIFocusBannerTableViewCell *)self->_focusBannerCell setSelectionStyle:0];
      [(EKUIFocusBannerTableViewCell *)self->_focusBannerCell setDelegate:self];
    }
    [(EKUIFocusBannerTableViewCell *)self->_focusBannerCell setOn:[(CUIKCalendarModel *)self->_model focusFilterMode] == (id)1];
    if (self->_destination == 2) {
      +[UIBackgroundConfiguration listSidebarCellConfiguration];
    }
    else {
    dispatch_queue_t v15 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
    }
    [(EKUIFocusBannerTableViewCell *)self->_focusBannerCell setBackgroundConfiguration:v15];

    double v11 = self->_focusBannerCell;
  }
  else
  {
    double v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    double v10 = [(InboxRepliedSectionViewController *)self tableView];
    double v11 = [v10 dequeueReusableCellWithIdentifier:v9 forIndexPath:v5];

    double v12 = [(InboxRepliedSectionViewController *)self view];
    dispatch_queue_t v13 = [v12 window];

    EKUIPushFallbackSizingContextWithViewHierarchy();
    [(InboxRepliedSectionViewController *)self _updateCell:v11 atIndexPath:v5];
    EKUIPopFallbackSizingContextWithViewHierarchy();
    [(EKUIFocusBannerTableViewCell *)v11 setDestination:[(InboxRepliedSectionViewController *)self destination]];
    v14 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Loading cell at index path: [%@]", (uint8_t *)&v17, 0xCu);
    }
  }

  return v11;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v5 = a4;
  double v6 = self;
  objc_sync_enter(v6);
  double v7 = v6->_itemCache;
  objc_sync_exit(v6);

  prefetchQ = v6->_prefetchQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012CBFC;
  block[3] = &unk_1001D2EE0;
  id v12 = v5;
  dispatch_queue_t v13 = v6;
  v14 = v7;
  double v9 = v7;
  id v10 = v5;
  dispatch_async(prefetchQ, block);
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  if (-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(a4, "section", a3)))
  {
    return UITableViewAutomaticDimension;
  }

  +[CalendarMessageCell defaultRowHeight];
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Index path selected: [%@]", (uint8_t *)&v14, 0xCu);
  }
  if (!-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", [v7 section]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inboxRepliedSectionDelegate);

    if (WeakRetained)
    {
      id v10 = [(InboxRepliedSectionViewController *)self _eventForIndexPath:v7 cache:self->_itemCache];
      if (v10)
      {
        double v11 = kCalUILogInboxHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 138412290;
          id v15 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Requesting from our delegate that the following event should be inspected: [%@]", (uint8_t *)&v14, 0xCu);
        }
        id v12 = objc_loadWeakRetained((id *)&self->_inboxRepliedSectionDelegate);
        [v12 inboxRepliedSectionViewController:self inspectEvent:v10];

        if (self->_destination == 2) {
          objc_storeStrong((id *)&self->_currentSelectedEvent, v10);
        }
      }
    }
    else
    {
      dispatch_queue_t v13 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No delegate found.  Will not request that event be inspected.", (uint8_t *)&v14, 2u);
      }
    }
  }
}

- (void)inboxWillDismiss
{
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)InboxRepliedSectionViewController;
  [(InboxRepliedSectionViewController *)&v4 dismissViewControllerAnimated:a3 completion:a4];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = [(InboxRepliedSectionViewController *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(InboxRepliedSectionViewController *)self view];
  id v12 = [(InboxRepliedSectionViewController *)self tableView];
  [v11 convertPoint:v12 toView:v8];
  double v14 = v13;
  double v16 = v15;

  int v17 = [(InboxRepliedSectionViewController *)self tableView];
  id v18 = [v17 indexPathForRowAtPoint:v14, v16];

  uint64_t v19 = [(InboxRepliedSectionViewController *)self _eventForIndexPath:v18 cache:self->_itemCache];
  v20 = (void *)v19;
  objc_super v21 = 0;
  if (v18 && v19)
  {
    objc_storeStrong((id *)&self->_indexPathForRowWithContextMenu, v18);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10012D2EC;
    v26[3] = &unk_1001D2830;
    id v27 = v20;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10012D358;
    v23[3] = &unk_1001D5B50;
    v23[4] = self;
    id v24 = v18;
    id v25 = v27;
    objc_super v21 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v26 actionProvider:v23];
  }

  return v21;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  targetedPreview = self->_targetedPreview;
  self->_targetedPreview = 0;
  id v7 = a3;

  double v8 = [(InboxRepliedSectionViewController *)self tableView];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = [(InboxRepliedSectionViewController *)self tableView];
  double v14 = [v13 indexPathForRowAtPoint:v10, v12];

  if (v14)
  {
    double v15 = [(InboxRepliedSectionViewController *)self tableView];
    double v16 = [v15 cellForRowAtIndexPath:v14];

    int v17 = (UITargetedPreview *)[objc_alloc((Class)UITargetedPreview) initWithView:v16];
    id v18 = self->_targetedPreview;
    self->_targetedPreview = v17;
  }
  uint64_t v19 = self->_targetedPreview;

  return v19;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v6 = self->_targetedPreview;
  targetedPreview = self->_targetedPreview;
  self->_targetedPreview = 0;

  return v6;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = [v6 previewViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = [v6 previewViewController];
  }
  else
  {
    double v8 = 0;
  }

  double v9 = [v8 event];
  [v8 willCommitPreview];
  if (v9)
  {
    double v10 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      double v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Requesting from our delegate that the following event should be inspected: [%@]", buf, 0xCu);
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10012D7E8;
    v11[3] = &unk_1001D28A8;
    v11[4] = self;
    id v12 = v9;
    [v6 addAnimations:v11];
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  self->_indexPathForRowWithContextMenu = 0;
  _objc_release_x1();
}

- (void)_saveStatus:(int64_t)a3 forItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(InboxRepliedSectionViewController *)self tableView];
  double v8 = [v7 cellForRowAtIndexPath:v6];

  double v9 = [v8 notification];
  v41 = [(CUIKCalendarModel *)self->_model eventStore];
  double v10 = [v9 eventFromEventStore:];
  [v8 setShowsCommentPrompt:0 animated:0 initialValue:0];
  if (a3)
  {
    [v10 setParticipationStatus:a3];
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v11 = [v10 hasRecurrenceRules];
  }
  pendingComments = self->_pendingComments;
  double v13 = [v9 URL];
  double v14 = [(NSMutableDictionary *)pendingComments objectForKeyedSubscript:v13];

  if (v14)
  {
    double v15 = self->_pendingComments;
    double v16 = [v9 URL];
    [(NSMutableDictionary *)v15 removeObjectForKey:v16];

    int v17 = [v10 responseComment];
    uint64_t v18 = +[CUIKNotificationDescriptionGenerator stringWithAutoCommentRemoved:v17];

    if (v18) {
      uint64_t v19 = (__CFString *)v18;
    }
    else {
      uint64_t v19 = &stru_1001D6918;
    }
    if (([v14 isEqualToString:v19] & 1) == 0)
    {
      v39 = v9;
      if (![v14 length])
      {

        double v14 = 0;
      }
      v20 = [v10 proposedStartDate];
      objc_super v21 = [v10 timeZone];
      v22 = +[CUIKNotificationDescriptionGenerator comment:v14 withInsertedAutoCommentForDate:v20 timeZone:v21];
      [v10 setResponseComment:v22];

      double v9 = v39;
    }
  }
  v23 = [(InboxRepliedSectionViewController *)self EKUI_editor];
  id v42 = 0;
  unsigned __int8 v24 = [v23 saveEvent:v10 span:v11 error:&v42];
  id v25 = v42;
  if (v24)
  {
    v36 = [(InboxRepliedSectionViewController *)self tableView];
    [v36 indexPathForCell:v8];
    v26 = v40 = v9;
    id v27 = [v26 row];
    +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, [v26 section]);
    v28 = v38 = v8;
    [v36 moveRowAtIndexPath:v26 toIndexPath:v28];
    id v37 = v25;
    v29 = (NSArray *)[(NSArray *)self->_occurrenceInfos mutableCopy];
    v30 = [(NSArray *)v29 objectAtIndex:v27];
    [(NSArray *)v29 removeObjectAtIndex:v27];
    [(NSArray *)v29 insertObject:v30 atIndex:0];
    occurrenceInfos = self->_occurrenceInfos;
    self->_occurrenceInfos = v29;
    v32 = v29;

    [(NSMutableArray *)self->_itemCache removeObjectAtIndex:v27];
    itemCache = self->_itemCache;
    v34 = +[NSNull null];
    [(NSMutableArray *)itemCache insertObject:v34 atIndex:0];

    id v25 = v37;
    [(InboxRepliedSectionViewController *)self _updateCell:v38 atIndexPath:v28];

    double v8 = v38;
    double v9 = v40;
  }
  else
  {
    v35 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v25;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Error saving new invitation status: %@", buf, 0xCu);
    }
  }
}

- (void)_savePendingComments
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(InboxRepliedSectionViewController *)v2 shouldShowFocusBanner];
  itemCache = v2->_itemCache;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10012DDD0;
  v5[3] = &unk_1001D5FF0;
  v5[4] = v2;
  v5[5] = v3;
  [(NSMutableArray *)itemCache enumerateObjectsUsingBlock:v5];
  objc_sync_exit(v2);

  [(NSMutableDictionary *)v2->_pendingComments removeAllObjects];
}

- (void)performAction:(int64_t)a3 forCell:(id)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  BOOL v7 = a5;
  id v11 = a4;
  id v12 = a6;
  if (v7)
  {
    v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"InboxRepliedSectionViewController.m" lineNumber:549 description:@"Applies to all should not ever be enabled for the replied section"];
  }
  double v13 = (void *)kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    double v14 = v13;
    double v15 = CalendarMessageCellStringForButtonAction(a3);
    int v34 = 138412546;
    v35 = v15;
    __int16 v36 = 2112;
    id v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Action [%@] performed for cell: [%@].", (uint8_t *)&v34, 0x16u);
  }
  double v16 = [v11 notification];
  int v17 = [(CUIKCalendarModel *)self->_model eventStore];
  uint64_t v18 = [v16 eventFromEventStore:v17];
  uint64_t v19 = v18;
  if (v18)
  {
    [v18 setInvitationStatus:0];
    if (a3 == 1)
    {
      uint64_t v20 = 2;
    }
    else
    {
      if (a3 != 4)
      {
        if (a3 == 2) {
          uint64_t v20 = 4;
        }
        else {
          uint64_t v20 = 0;
        }
        goto LABEL_22;
      }
      if ([v19 allowsResponseCommentModifications])
      {
        v22 = +[CUIKPreferences sharedPreferences];
        id v23 = [v22 promptForCommentWhenDeclining];

        if (v23 == (id)2
          || v23 == (id)1
          && ([v19 calendar],
              unsigned __int8 v24 = objc_claimAutoreleasedReturnValue(),
              [v24 source],
              id v25 = objc_claimAutoreleasedReturnValue(),
              unsigned int v26 = [v25 wantsCommentPromptWhenDeclining],
              v25,
              v24,
              v26))
        {
          id v27 = [v19 responseComment];
          v28 = +[CUIKNotificationDescriptionGenerator stringWithAutoCommentRemoved:v27];

          if (!v28) {
            v28 = &stru_1001D6918;
          }
          pendingComments = self->_pendingComments;
          v30 = [v16 URL];
          [(NSMutableDictionary *)pendingComments setObject:v28 forKeyedSubscript:v30];

          [v11 setShowsCommentPrompt:1 animated:1 initialValue:v28];
          goto LABEL_23;
        }
      }
      uint64_t v20 = 3;
    }
LABEL_22:
    v31 = [(InboxRepliedSectionViewController *)self tableView];
    v32 = [v31 indexPathForCell:v11];
    [(InboxRepliedSectionViewController *)self _saveStatus:v20 forItemAtIndexPath:v32];

    goto LABEL_23;
  }
  objc_super v21 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
  {
    int v34 = 138412546;
    v35 = v17;
    __int16 v36 = 2112;
    id v37 = v16;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Could not find event in event store [%@] that corresponds with notification: [%@].", (uint8_t *)&v34, 0x16u);
  }
LABEL_23:
}

- (void)messageCell:(id)a3 committedComment:(id)a4
{
  pendingComments = self->_pendingComments;
  id v6 = a4;
  id v8 = [a3 notification];
  BOOL v7 = [v8 URL];
  [(NSMutableDictionary *)pendingComments setObject:v6 forKeyedSubscript:v7];
}

- (id)eventStoreForCell:(id)a3
{
  return [(CUIKCalendarModel *)self->_model eventStore];
}

- (id)noContentStringForInboxTableView:(id)a3
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"No Events You’ve Replied To" value:&stru_1001D6918 table:0];

  return v4;
}

- (void)_localeChanged:(id)a3
{
  id v4 = a3;
  id v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] received the following notification: [%@].", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012E460;
  block[3] = &unk_1001D2740;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_eventStoreChanged:(id)a3
{
  id v4 = a3;
  id v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] received the following notification: [%@]", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012E5AC;
  block[3] = &unk_1001D2740;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_identityChanged:(id)a3
{
  id v4 = a3;
  id v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] received the following notification: [%@]", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012E6F8;
  block[3] = &unk_1001D2740;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_refreshIfNeeded
{
  if (self->_needsRefresh)
  {
    uint64_t v3 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Kicking off a refresh for [%@]", buf, 0xCu);
    }
    v29 = self;
    id v4 = self;
    objc_sync_enter(v4);
    id v5 = [(CUIKCalendarModel *)v4->_model eventStore];
    v30 = [v5 inboxRepliedSectionItems];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10012EB04;
    v31[3] = &unk_1001D6018;
    v31[4] = v4;
    id v6 = +[NSPredicate predicateWithBlock:v31];
    uint64_t v7 = [v30 filteredArrayUsingPredicate:v6];
    occurrenceInfos = v4->_occurrenceInfos;
    v4->_occurrenceInfos = (NSArray *)v7;

    __int16 v9 = [(NSArray *)v4->_occurrenceInfos count];
    id v10 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v9];
    itemCache = v4->_itemCache;
    v4->_itemCache = v10;

    id v12 = +[NSNull null];
    if (v9)
    {
      double v13 = v9;
      do
      {
        [(NSMutableArray *)v4->_itemCache addObject:v12];
        double v13 = (InboxRepliedSectionViewController *)((char *)v13 - 1);
      }
      while (v13);
    }
    double v14 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Number of replied events after refresh: [%lu]", buf, 0xCu);
    }
    if ([(NSMutableDictionary *)v4->_pendingComments count])
    {
      double v15 = [(NSMutableDictionary *)v4->_pendingComments allKeys];
      id v16 = [v15 mutableCopy];

      unsigned int v17 = [(InboxRepliedSectionViewController *)v4 shouldShowFocusBanner];
      if (v9)
      {
        uint64_t v18 = 0;
        uint64_t v19 = (char *)&v9[-1]._inboxRepliedSectionDelegate + 7;
        uint64_t v20 = v17;
        do
        {
          objc_super v21 = +[NSIndexPath indexPathForRow:v18 inSection:v20];
          v22 = [(InboxRepliedSectionViewController *)v4 _notificationForIndexPath:v21 cache:v4->_itemCache];

          id v23 = [v22 URL];
          [v16 removeObject:v23];

          BOOL v24 = [v16 count] == 0;
          char v26 = v19 == v18++ || v24;
        }
        while ((v26 & 1) == 0);
      }
      [(NSMutableDictionary *)v4->_pendingComments removeObjectsForKeys:v16];
    }
    objc_sync_exit(v4);

    id v27 = [(InboxRepliedSectionViewController *)v4 tableView];
    [v27 reloadData];
    if ([(NSArray *)v4->_occurrenceInfos count]) {
      uint64_t v28 = 0;
    }
    else {
      uint64_t v28 = [(InboxRepliedSectionViewController *)v4 shouldShowFocusBanner] ^ 1;
    }
    [v27 setShowNoContentString:v28];
    v4->_id lastDisplayedFocusMode = (unint64_t)[(CUIKCalendarModel *)v4->_model focusFilterMode];
    v29->_needsRefresh = 0;
  }
}

- (void)_updateCell:(id)a3 atIndexPath:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", [v9 section]))
  {
    id v10 = [(InboxRepliedSectionViewController *)self _notificationForIndexPath:v9 cache:self->_itemCache];
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = sub_10012EF5C;
    v31 = sub_10012EF6C;
    id v32 = 0;
    organizerNamesQ = self->_organizerNamesQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012EF74;
    block[3] = &unk_1001D3A90;
    char v26 = &v27;
    void block[4] = self;
    id v12 = v10;
    id v25 = v12;
    dispatch_sync(organizerNamesQ, block);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setOrganizerName:v28[5]];
    }
    double v13 = [v8 authorView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v15 = [v8 authorView];
      id v16 = [(InboxRepliedSectionViewController *)self tableView];
      unsigned __int8 v17 = [v16 isTracking];
      if (v17)
      {
        int v18 = 0;
        uint64_t v19 = 1;
      }
      else
      {
        id v4 = [(InboxRepliedSectionViewController *)self tableView];
        if ([v4 isScrollAnimating])
        {
          int v18 = 0;
          uint64_t v19 = 1;
        }
        else
        {
          id v5 = [(InboxRepliedSectionViewController *)self tableView];
          if ([v5 isDecelerating])
          {
            int v18 = 1;
            uint64_t v19 = 1;
          }
          else
          {
            uint64_t v19 = (uint64_t)[UIApp isRunningTest];
            int v18 = 1;
          }
        }
      }
      [v15 setLoadContactsAsynchronously:v19];
      if (v18) {

      }
      if ((v17 & 1) == 0) {
    }
      }
    [v8 setDelegate:self];
    [v8 setNotification:v12];
    pendingComments = self->_pendingComments;
    objc_super v21 = [v8 notification];
    v22 = [v21 URL];
    id v23 = [(NSMutableDictionary *)pendingComments objectForKeyedSubscript:v22];

    [v8 setShowsCommentPrompt:v23 != 0 animated:0 initialValue:v23];
    _Block_object_dispose(&v27, 8);
  }
}

- (id)_itemForIndexPath:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", [v6 section]))
  {
    if (v6)
    {
      id v9 = self;
      objc_sync_enter(v9);
      id v10 = [v6 row];
      id v11 = [v7 objectAtIndex:v10];
      id v12 = +[NSNull null];
      unsigned int v13 = [v12 isEqual:v11];

      if (v13)
      {
        if ((uint64_t)v10 >= (int64_t)[(NSArray *)v9->_occurrenceInfos count])
        {
          id v8 = 0;
        }
        else
        {
          double v14 = [(NSArray *)v9->_occurrenceInfos objectAtIndex:v10];
          id v8 = [[InboxRepliedSectionItem alloc] initWithOccurrenceInfo:v14];
          [v7 replaceObjectAtIndex:v10 withObject:v8];
        }
      }
      else
      {
        id v8 = v11;
      }

      objc_sync_exit(v9);
      goto LABEL_12;
    }
    double v15 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned __int8 v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "nil 'indexPath' provided.  Will not fetch item.", v17, 2u);
    }
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

- (id)_eventForIndexPath:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", [v6 section]))
  {
LABEL_2:
    id v8 = 0;
    goto LABEL_5;
  }
  if (!v6)
  {
    id v11 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "nil 'indexPath' provided.  Will not fetch event.", v12, 2u);
    }
    goto LABEL_2;
  }
  id v9 = [(InboxRepliedSectionViewController *)self _itemForIndexPath:v6 cache:v7];
  id v8 = [(InboxRepliedSectionViewController *)self _eventForItem:v9];

LABEL_5:

  return v8;
}

- (id)_notificationForIndexPath:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_10012EF5C;
  uint64_t v29 = sub_10012EF6C;
  id v30 = 0;
  if (-[InboxRepliedSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", [v6 section]))
  {
    id v8 = 0;
  }
  else
  {
    if (v6)
    {
      id v9 = [(InboxRepliedSectionViewController *)self _itemForIndexPath:v6 cache:v7];
      notificationQ = self->_notificationQ;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10012F550;
      block[3] = &unk_1001D3068;
      id v23 = &v25;
      id v11 = v9;
      id v22 = v11;
      dispatch_sync(notificationQ, block);
      if (!v26[5])
      {
        id v12 = [(InboxRepliedSectionViewController *)self _eventForIndexPath:v6 cache:v7];
        if (v12)
        {
          id v13 = [objc_alloc((Class)EKCalendarEventInvitationNotification) initWithEvent:v12];
          double v14 = (void *)v26[5];
          v26[5] = (uint64_t)v13;

          double v15 = self->_notificationQ;
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10012F59C;
          v18[3] = &unk_1001D3260;
          id v19 = v11;
          uint64_t v20 = &v25;
          dispatch_sync(v15, v18);
        }
      }
    }
    else
    {
      id v16 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "nil 'indexPath' provided.  Will not fetch notification.", buf, 2u);
      }
    }
    id v8 = (id)v26[5];
  }
  _Block_object_dispose(&v25, 8);

  return v8;
}

- (id)_eventForItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 event];
    if (!v6)
    {
      id v7 = [v5 occurrenceInfo];
      id v6 = [(InboxRepliedSectionViewController *)self _eventForOccurrenceInfo:v7];
      if (v6) {
        [v5 setEvent:v6];
      }
    }
  }
  else
  {
    id v8 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "nil 'item' provided.  Will not fetch event.", v10, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)_eventForOccurrenceInfo:(id)a3
{
  id v4 = a3;
  [v4 date];
  id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v6 = [(CUIKCalendarModel *)self->_model eventStore];
  id v7 = [v4 objectID];
  id v8 = [v6 eventForObjectID:v7 occurrenceDate:v5 checkValid:0];

  if (!v8)
  {
    id v9 = (void *)kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      id v11 = [v4 objectID];
      int v13 = 138543618;
      double v14 = v11;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not fetch event with rowID [%{public}@] and start date: [%{public}@].", (uint8_t *)&v13, 0x16u);
    }
  }

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = 0;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:a3 withSender:v6] & 1) == 0&& "paste:" != a3)
  {
    if ("copy:" == a3)
    {
      indexPathForRowWithContextMenu = self->_indexPathForRowWithContextMenu;
      if (indexPathForRowWithContextMenu)
      {
        uint64_t v9 = [(InboxRepliedSectionViewController *)self _eventForIndexPath:indexPathForRowWithContextMenu cache:self->_itemCache];
        id v10 = (void *)v9;
        if (v9)
        {
          uint64_t v18 = v9;
          id v11 = +[NSArray arrayWithObjects:&v18 count:1];
          uint64_t v12 = 1;
LABEL_12:
          unsigned __int8 v7 = +[CUIKPasteboardUtilities allEventsValidForAction:v12 fromEvents:v11];

LABEL_15:
          goto LABEL_16;
        }
LABEL_14:
        unsigned __int8 v7 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      if ("cut:" != a3)
      {
        v16.receiver = self;
        v16.super_class = (Class)InboxRepliedSectionViewController;
        unsigned __int8 v7 = [(InboxRepliedSectionViewController *)&v16 canPerformAction:a3 withSender:v6];
        goto LABEL_16;
      }
      int v13 = self->_indexPathForRowWithContextMenu;
      if (v13)
      {
        uint64_t v14 = [(InboxRepliedSectionViewController *)self _eventForIndexPath:v13 cache:self->_itemCache];
        id v10 = (void *)v14;
        if (v14)
        {
          uint64_t v17 = v14;
          id v11 = +[NSArray arrayWithObjects:&v17 count:1];
          uint64_t v12 = 0;
          goto LABEL_12;
        }
        goto LABEL_14;
      }
    }
    unsigned __int8 v7 = 0;
  }
LABEL_16:

  return v7;
}

- (void)cut:(id)a3
{
  indexPathForRowWithContextMenu = self->_indexPathForRowWithContextMenu;
  if (indexPathForRowWithContextMenu)
  {
    id v5 = [(InboxRepliedSectionViewController *)self _eventForIndexPath:indexPathForRowWithContextMenu cache:self->_itemCache];
    if (v5)
    {
      id v8 = v5;
      id v6 = [(CUIKCalendarModel *)self->_model pasteboardManager];
      unsigned __int8 v7 = +[NSSet setWithObject:v8];
      [v6 cutEvents:v7 delegate:self];

      id v5 = v8;
    }
  }
}

- (void)copy:(id)a3
{
  indexPathForRowWithContextMenu = self->_indexPathForRowWithContextMenu;
  if (indexPathForRowWithContextMenu)
  {
    id v5 = [(InboxRepliedSectionViewController *)self _eventForIndexPath:indexPathForRowWithContextMenu cache:self->_itemCache];
    if (v5)
    {
      id v8 = v5;
      id v6 = [(CUIKCalendarModel *)self->_model pasteboardManager];
      unsigned __int8 v7 = +[NSSet setWithObject:v8];
      [v6 copyEvents:v7 delegate:self];

      id v5 = v8;
    }
  }
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
}

- (void)focusBannerTableViewCellToggled:(id)a3
{
  if ([a3 on]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  model = self->_model;

  [(CUIKCalendarModel *)model setFocusFilterMode:v4];
}

- (unint64_t)destination
{
  return self->_destination;
}

- (InboxRepliedSectionViewControllerDelegate)inboxRepliedSectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inboxRepliedSectionDelegate);

  return (InboxRepliedSectionViewControllerDelegate *)WeakRetained;
}

- (void)setInboxRepliedSectionDelegate:(id)a3
{
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inboxRepliedSectionDelegate);
  objc_storeStrong((id *)&self->_focusBannerCell, 0);
  objc_storeStrong((id *)&self->_indexPathForRowWithContextMenu, 0);
  objc_storeStrong((id *)&self->_selectionTimer, 0);
  objc_storeStrong((id *)&self->_currentSelectedEvent, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_prefetchQ, 0);
  objc_storeStrong((id *)&self->_organizerNamesQ, 0);
  objc_storeStrong((id *)&self->_notificationQ, 0);
  objc_storeStrong((id *)&self->_organizerNames, 0);
  objc_storeStrong((id *)&self->_pendingComments, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_occurrenceInfos, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end