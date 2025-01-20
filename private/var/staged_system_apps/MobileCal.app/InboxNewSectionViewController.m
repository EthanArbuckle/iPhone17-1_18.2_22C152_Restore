@interface InboxNewSectionViewController
- (BOOL)_canEnableRefresh;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isFocusBannerSection:(int64_t)a3;
- (BOOL)isIdentityChooserSection:(int64_t)a3;
- (BOOL)shouldShowFocusBanner;
- (BOOL)shouldShowIdentityChooser;
- (BOOL)viewIsVisible;
- (CGSize)preferredContentSize;
- (InboxNewSectionViewController)initWithModel:(id)a3;
- (InboxNewSectionViewControllerDelegate)inboxNewSectionDelegate;
- (NSArray)allGroups;
- (NSArray)visibleGroups;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_eventForIndexPath:(id)a3;
- (id)_groupForIndexPath:(id)a3;
- (id)_groupForSection:(int64_t)a3;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)noContentStringForInboxTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)firstGroupSection;
- (int64_t)focusBannerSection;
- (int64_t)identityChooserSection;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)destination;
- (void)_delegateShouldClose;
- (void)_focusConfigurationChanged:(id)a3;
- (void)_pulledToRefresh:(id)a3;
- (void)_refreshIfNeeded;
- (void)_selectedOccurrencesChanged:(id)a3;
- (void)_updateGroupVisibility;
- (void)accountRefreshFinished:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)focusBannerTableViewCellToggled:(id)a3;
- (void)inboxTableViewGroupController:(id)a3 addedRows:(id)a4 removedRows:(id)a5 updatedRows:(id)a6;
- (void)inboxTableViewGroupController:(id)a3 inspectEvent:(id)a4;
- (void)inboxTableViewGroupController:(id)a3 requestsReloadOfRow:(int64_t)a4;
- (void)inboxTableViewGroupController:(id)a3 viewCommentsForEvent:(id)a4;
- (void)inboxTableViewGroupController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5;
- (void)inboxWillDismiss;
- (void)loadView;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)refresh:(id)a3;
- (void)setAllGroups:(id)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setInboxNewSectionDelegate:(id)a3;
- (void)setViewIsVisible:(BOOL)a3;
- (void)setVisibleGroups:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation InboxNewSectionViewController

- (InboxNewSectionViewController)initWithModel:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)InboxNewSectionViewController;
  v6 = [(InboxNewSectionViewController *)&v22 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    p_model = &v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    +[CalendarMessageCell defaultRowHeight];
    v7->_minimumContentHeight = v9 * 4.5;
    v10 = [(InboxNotificationsGroupController *)[InboxInvitationsGroupController alloc] initWithModel:*p_model delegate:v7];
    v24[0] = v10;
    v11 = [(InboxNotificationsGroupController *)[InboxInviteeResponsesGroupController alloc] initWithModel:*p_model delegate:v7];
    v24[1] = v11;
    v12 = [(InboxNotificationsGroupController *)[InboxSharedCalendarGroupController alloc] initWithModel:*p_model delegate:v7];
    v24[2] = v12;
    v13 = [(InboxNotificationsGroupController *)[InboxSuggestionsGroupController alloc] initWithModel:*p_model delegate:v7];
    v24[3] = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:v24 count:4];
    allGroups = v7->_allGroups;
    v7->_allGroups = (NSArray *)v14;

    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v16 = +[NSArray arrayWithObjects:v23 count:2];
    objc_initWeak(&location, v7);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001174DC;
    v19[3] = &unk_1001D2620;
    objc_copyWeak(&v20, &location);
    id v17 = [(InboxNewSectionViewController *)v7 registerForTraitChanges:v16 withHandler:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (void)_refreshIfNeeded
{
  self->_isRefreshing = 1;
  v3 = [(InboxNewSectionViewController *)self visibleGroups];
  id v4 = [v3 count];

  [(InboxNewSectionViewController *)self _updateGroupVisibility];
  id v5 = [(InboxNewSectionViewController *)self visibleGroups];
  id v6 = [v5 count];

  id v10 = [(InboxNewSectionViewController *)self tableView];
  [v10 reloadData];
  if (v6)
  {
    [v10 setShowNoContentString:0];
  }
  else
  {
    if ([(InboxNewSectionViewController *)self shouldShowIdentityChooser]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [(InboxNewSectionViewController *)self shouldShowFocusBanner] ^ 1;
    }
    [v10 setShowNoContentString:v9];
    if (v4)
    {
      [(InboxNewSectionViewController *)self _delegateShouldClose];
      goto LABEL_10;
    }
  }
  v7 = [(InboxNewSectionViewController *)self view];
  int IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();

  if (IsRegularInViewHierarchy)
  {
    [(InboxNewSectionViewController *)self preferredContentSize];
    -[InboxNewSectionViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
LABEL_10:
  self->_isRefreshing = 0;
}

- (void)_updateGroupVisibility
{
  v3 = objc_opt_new();
  id v4 = [(InboxNewSectionViewController *)self allGroups];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100117750;
  v7[3] = &unk_1001D5A38;
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v7];

  id v6 = +[NSArray arrayWithArray:v5];
  [(InboxNewSectionViewController *)self setVisibleGroups:v6];
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
  id v4 = [(InboxNewSectionViewController *)self allGroups];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100117844;
  v5[3] = &unk_1001D5A58;
  BOOL v6 = a3;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (void)inboxWillDismiss
{
  +[CalendarMessageCell emptyAuthorCache];
  allGroups = self->_allGroups;

  [(NSArray *)allGroups enumerateObjectsUsingBlock:&stru_1001D5A98];
}

- (void)dealloc
{
  v3 = [(InboxNewSectionViewController *)self view];
  [v3 removeInteraction:self->_contextMenuInteraction];

  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = 0;

  v5.receiver = self;
  v5.super_class = (Class)InboxNewSectionViewController;
  [(InboxNewSectionViewController *)&v5 dealloc];
}

- (void)loadView
{
  v3 = -[InboxTableView initWithFrame:style:]([InboxTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(InboxTableView *)v3 setListViewDelegate:self];
  [(InboxTableView *)v3 setPrefetchDataSource:self];
  [(InboxNewSectionViewController *)self setTableView:v3];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)InboxNewSectionViewController;
  [(InboxNewSectionViewController *)&v6 viewDidLoad];
  v3 = (UIInteraction *)[objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = v3;

  objc_super v5 = [(InboxNewSectionViewController *)self view];
  [v5 addInteraction:self->_contextMenuInteraction];
}

- (BOOL)_canEnableRefresh
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v2 = [(CUIKCalendarModel *)self->_model eventStore];
  v3 = [v2 sources];

  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v8 sourceType] && objc_msgSend(v8, "sourceType") != (id)5)
        {
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          uint64_t v9 = [v8 calendarsForEntityType:0];
          id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v17;
            while (2)
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v17 != v12) {
                  objc_enumerationMutation(v9);
                }
                if ([*(id *)(*((void *)&v16 + 1) + 8 * (void)j) allowEvents])
                {

                  BOOL v14 = 1;
                  goto LABEL_22;
                }
              }
              id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
      BOOL v14 = 0;
    }
    while (v5);
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_22:

  return v14;
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)InboxNewSectionViewController;
  -[InboxNewSectionViewController viewWillAppear:](&v13, "viewWillAppear:");
  id v5 = [(InboxNewSectionViewController *)self refreshControl];
  if (!v5)
  {
    if (![(InboxNewSectionViewController *)self _canEnableRefresh]) {
      goto LABEL_5;
    }
    id v5 = objc_alloc_init((Class)UIRefreshControl);
    [v5 addTarget:self action:"_pulledToRefresh:" forControlEvents:4096];
    uint64_t v6 = [(InboxNewSectionViewController *)self tableView];
    [v6 _setRefreshControl:v5];

    [(InboxNewSectionViewController *)self setRefreshControl:v5];
  }

LABEL_5:
  v7 = [(InboxNewSectionViewController *)self navigationController];
  id v8 = [v7 view];
  uint64_t v9 = [v8 window];

  if (v9)
  {
    EKUIPushFallbackSizingContextWithViewHierarchy();
    [(InboxNewSectionViewController *)self _refreshIfNeeded];
    EKUIPopFallbackSizingContextWithViewHierarchy();
  }
  else
  {
    [(InboxNewSectionViewController *)self _refreshIfNeeded];
  }
  allGroups = self->_allGroups;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100117D9C;
  v11[3] = &unk_1001D5AB8;
  BOOL v12 = a3;
  [(NSArray *)allGroups enumerateObjectsUsingBlock:v11];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)InboxNewSectionViewController;
  [(InboxNewSectionViewController *)&v7 viewDidAppear:a3];
  [(InboxNewSectionViewController *)self setViewIsVisible:1];
  if (self->_destination == 2)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_selectedOccurrencesChanged:" name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:self->_model];
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_focusConfigurationChanged:" name:CUIKCalendarModelFocusModeConfigurationChangedNotification object:self->_model];

  if (+[ApplicationTester testingSessionStarted])
  {
    uint64_t v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"InboxNewSectionViewController_ViewDidAppearNotification" object:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)InboxNewSectionViewController;
  [(InboxNewSectionViewController *)&v7 viewWillDisappear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  selectionTimer = self->_selectionTimer;
  if (selectionTimer)
  {
    [(NSTimer *)selectionTimer invalidate];
    uint64_t v6 = self->_selectionTimer;
    self->_selectionTimer = 0;
  }
  [(InboxNewSectionViewController *)self setViewIsVisible:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InboxNewSectionViewController;
  [(InboxNewSectionViewController *)&v4 viewDidDisappear:a3];
  [(NSArray *)self->_allGroups enumerateObjectsUsingBlock:&stru_1001D5AD8];
}

- (CGSize)preferredContentSize
{
  if (!self->_isRefreshing) {
    [(InboxNewSectionViewController *)self _refreshIfNeeded];
  }
  v3 = [(InboxNewSectionViewController *)self tableView];
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
    v7[2] = sub_10011813C;
    v7[3] = &unk_1001D5B00;
    void v7[4] = self;
    id v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v7 block:0.15];
    selectionTimer = self->_selectionTimer;
    self->_selectionTimer = v5;
  }
}

- (void)_focusConfigurationChanged:(id)a3
{
  id v3 = [(InboxNewSectionViewController *)self tableView];
  [v3 reloadData];
}

- (int64_t)focusBannerSection
{
  return 0;
}

- (BOOL)isFocusBannerSection:(int64_t)a3
{
  BOOL v5 = [(InboxNewSectionViewController *)self shouldShowFocusBanner];
  if (v5) {
    LOBYTE(v5) = [(InboxNewSectionViewController *)self focusBannerSection] == a3;
  }
  return v5;
}

- (int64_t)identityChooserSection
{
  return [(InboxNewSectionViewController *)self shouldShowFocusBanner];
}

- (BOOL)isIdentityChooserSection:(int64_t)a3
{
  BOOL v5 = [(InboxNewSectionViewController *)self shouldShowIdentityChooser];
  if (v5) {
    LOBYTE(v5) = [(InboxNewSectionViewController *)self identityChooserSection] == a3;
  }
  return v5;
}

- (int64_t)firstGroupSection
{
  unsigned int v3 = [(InboxNewSectionViewController *)self shouldShowFocusBanner];
  unsigned int v4 = [(InboxNewSectionViewController *)self shouldShowIdentityChooser];
  int64_t v5 = 1;
  if (v3) {
    int64_t v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return v3;
  }
}

- (BOOL)shouldShowIdentityChooser
{
  unsigned int v3 = [(CUIKCalendarModel *)self->_model containsDelegateSources];
  if (v3) {
    LOBYTE(v3) = self->_destination != 2;
  }
  return v3;
}

- (BOOL)shouldShowFocusBanner
{
  return [(CUIKCalendarModel *)self->_model focusFilterMode] != 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unsigned int v4 = [(InboxNewSectionViewController *)self visibleGroups];
  int64_t v5 = (char *)[v4 count];

  double v6 = &v5[[(InboxNewSectionViewController *)self shouldShowIdentityChooser]];
  return (int64_t)&v6[[(InboxNewSectionViewController *)self shouldShowFocusBanner]];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(InboxNewSectionViewController *)self isIdentityChooserSection:a4])
  {
    double v6 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
    double v7 = (char *)[v6 count] + 1;
LABEL_6:

    return (int64_t)v7;
  }
  if (![(InboxNewSectionViewController *)self isFocusBannerSection:a4])
  {
    double v6 = [(InboxNewSectionViewController *)self _groupForSection:a4];
    double v7 = (char *)[v6 numberOfRows];
    goto LABEL_6;
  }
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", [v7 section]))
  {
    double v8 = (EKUIFocusBannerTableViewCell *)objc_opt_new();
    if ([v7 row])
    {
      double v9 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
      double v10 = [v9 objectAtIndex:[v7 row] - 1];

      double v11 = CUIKDisplayedTitleForSource();
      BOOL v12 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
      unsigned int v13 = [v10 isEqual:v12];
    }
    else
    {
      long long v18 = +[NSBundle bundleForClass:objc_opt_class()];
      double v11 = [v18 localizedStringForKey:@"My Calendar" value:&stru_1001D6918 table:0];

      BOOL v12 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
      double v10 = 0;
      unsigned int v13 = v12 == 0;
    }

    long long v19 = [(CUIKCalendarModel *)self->_model eventNotificationReferencesForIdentity:v10];
    id v20 = [v19 count];

    long long v21 = [(EKUIFocusBannerTableViewCell *)v8 titleLabel];
    [v21 setText:v11];

    if (v13) {
      uint64_t v22 = 3;
    }
    else {
      uint64_t v22 = 0;
    }
    [(EKUIFocusBannerTableViewCell *)v8 setAccessoryType:v22];
    long long v23 = [(EKUIFocusBannerTableViewCell *)v8 titleLabel];
    [v23 setEnabled:1];

    if (v20)
    {
      v24 = CUIKLocalizedStringForInteger();
      v25 = [(EKUIFocusBannerTableViewCell *)v8 detailLabel];
      [v25 setText:v24];
    }
    else
    {
      v24 = [(EKUIFocusBannerTableViewCell *)v8 detailLabel];
      [v24 setText:0];
    }

LABEL_22:
    goto LABEL_25;
  }
  if (!-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", [v7 section]))
  {
    double v11 = [(InboxNewSectionViewController *)self _groupForIndexPath:v7];
    id v16 = [v7 row];
    if (([v6 isTracking] & 1) != 0
      || ([v6 isScrollAnimating] & 1) != 0
      || ([v6 isDecelerating] & 1) != 0)
    {
      uint64_t v17 = 1;
    }
    else
    {
      uint64_t v17 = (uint64_t)[UIApp isRunningTest];
    }
    double v8 = [v11 cellForRow:v16 allowAsyncLoading:v17];
    goto LABEL_22;
  }
  if (!self->_focusBannerCell)
  {
    BOOL v14 = (EKUIFocusBannerTableViewCell *)[objc_alloc((Class)EKUIFocusBannerTableViewCell) initWithReuseIdentifier:@"FocusBanner"];
    focusBannerCell = self->_focusBannerCell;
    self->_focusBannerCell = v14;

    [(EKUIFocusBannerTableViewCell *)self->_focusBannerCell setSelectionStyle:0];
    [(EKUIFocusBannerTableViewCell *)self->_focusBannerCell setDelegate:self];
  }
  [(EKUIFocusBannerTableViewCell *)self->_focusBannerCell setOn:[(CUIKCalendarModel *)self->_model focusFilterMode] == (id)1];
  if (self->_destination == 2) {
    +[UIBackgroundConfiguration listSidebarCellConfiguration];
  }
  else {
  v26 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
  }
  [(EKUIFocusBannerTableViewCell *)self->_focusBannerCell setBackgroundConfiguration:v26];

  double v8 = self->_focusBannerCell;
LABEL_25:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(EKUIFocusBannerTableViewCell *)v8 setDestination:[(InboxNewSectionViewController *)self destination]];
  }

  return v8;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", [v10 section])&& !-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v10, "section")))
        {
          double v11 = [(InboxNewSectionViewController *)self _groupForIndexPath:v10];
          [v11 prefetchRow:[v10 row]];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", [v5 section])|| -[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v5, "section")))
  {
    double v6 = UITableViewAutomaticDimension;
  }
  else
  {
    id v7 = [(InboxNewSectionViewController *)self _groupForIndexPath:v5];
    [v7 estimatedHeightForRow:[v5 row]];
    double v6 = v8;
  }
  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", [v5 section]))
  {
    id v6 = v5;
  }
  else if (-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", [v5 section]))
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [(InboxNewSectionViewController *)self _groupForIndexPath:v5];
    if (objc_msgSend(v7, "canSelectRow:", objc_msgSend(v5, "row"))) {
      double v8 = v5;
    }
    else {
      double v8 = 0;
    }
    id v6 = v8;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Index path selected: [%@]", (uint8_t *)&v11, 0xCu);
  }
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", [v7 section]))
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    if ([v7 row])
    {
      double v9 = [(CUIKCalendarModel *)self->_model sortedEnabledDelegates];
      double v10 = [v9 objectAtIndexedSubscript:(char *)[v7 row] - 1];
    }
    else
    {
      double v10 = 0;
    }
    [(CUIKCalendarModel *)self->_model updateSourceForSelectedIdentity:v10 selectedCalendars:0];
    goto LABEL_10;
  }
  if (!-[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", [v7 section]))
  {
    double v10 = [(InboxNewSectionViewController *)self _groupForIndexPath:v7];
    [v10 rowSelected:[v7 row]];
LABEL_10:
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if ([(InboxNewSectionViewController *)self isIdentityChooserSection:a4])
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"View Notifications:" value:&stru_1001D6918 table:0];
  }
  else
  {
    if ([(InboxNewSectionViewController *)self isFocusBannerSection:a4]) {
      goto LABEL_7;
    }
    id v6 = [(InboxNewSectionViewController *)self _groupForSection:a4];
    uint64_t v7 = [v6 titleForHeader];
  }
  double v8 = (void *)v7;

  if (v8)
  {
    double v9 = +[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration];
    [v9 setText:v8];
    id v10 = [objc_alloc((Class)UIListContentView) initWithConfiguration:v9];

    goto LABEL_8;
  }
LABEL_7:
  id v10 = 0;
LABEL_8:

  return v10;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = [(InboxNewSectionViewController *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  int v11 = [(InboxNewSectionViewController *)self view];
  id v12 = [(InboxNewSectionViewController *)self tableView];
  [v11 convertPoint:v12 toView:v8];
  double v14 = v13;
  double v16 = v15;

  uint64_t v17 = [(InboxNewSectionViewController *)self tableView];
  long long v18 = [v17 indexPathForRowAtPoint:v14, v16];

  if (v18)
  {
    long long v19 = [(InboxNewSectionViewController *)self _eventForIndexPath:v18];
    if (v19)
    {
      objc_storeStrong((id *)&self->_indexPathForRowWithContextMenu, v18);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100118FFC;
      v25[3] = &unk_1001D2830;
      id v26 = v19;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100119068;
      v22[3] = &unk_1001D5B50;
      v22[4] = self;
      id v23 = v18;
      id v24 = v26;
      id v20 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v25 actionProvider:v22];
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  targetedPreview = self->_targetedPreview;
  self->_targetedPreview = 0;
  id v7 = a3;

  double v8 = [(InboxNewSectionViewController *)self tableView];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = [(InboxNewSectionViewController *)self tableView];
  double v14 = [v13 indexPathForRowAtPoint:v10, v12];

  if (v14)
  {
    double v15 = [(InboxNewSectionViewController *)self tableView];
    double v16 = [v15 cellForRowAtIndexPath:v14];

    uint64_t v17 = (UITargetedPreview *)[objc_alloc((Class)UITargetedPreview) initWithView:v16];
    long long v18 = self->_targetedPreview;
    self->_targetedPreview = v17;
  }
  long long v19 = self->_targetedPreview;

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
    v11[2] = sub_10011954C;
    v11[3] = &unk_1001D28A8;
    void v11[4] = self;
    id v12 = v9;
    [v6 addAnimations:v11];
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  self->_indexPathForRowWithContextMenu = 0;
  _objc_release_x1();
}

- (id)noContentStringForInboxTableView:(id)a3
{
  unsigned int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v4 = [v3 localizedStringForKey:@"No Invitations" value:&stru_1001D6918 table:0];

  return v4;
}

- (void)inboxTableViewGroupController:(id)a3 addedRows:(id)a4 removedRows:(id)a5 updatedRows:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_viewIsVisible)
  {
    if (self->_reloadsSuspendedUntilRefreshCompletes)
    {
      self->_needReloadWhenRefreshCompletes = 1;
    }
    else
    {
      double v14 = [(InboxNewSectionViewController *)self visibleGroups];
      [(InboxNewSectionViewController *)self _updateGroupVisibility];
      v49 = v14;
      if (v10) {
        uint64_t v15 = (uint64_t)[v14 indexOfObject:v10];
      }
      else {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v16 = [v11 count];
      id v17 = [v12 count];
      id v48 = [v13 count];
      int64_t v18 = [(InboxNewSectionViewController *)self firstGroupSection];
      if (!v17) {
        goto LABEL_9;
      }
      [(InboxNewSectionViewController *)self visibleGroups];
      id v47 = v17;
      uint64_t v19 = v15;
      id v20 = v10;
      id v21 = v13;
      id v22 = v12;
      id v23 = v11;
      v25 = id v24 = v16;
      id v26 = [v25 count];

      id v16 = v24;
      id v11 = v23;
      id v12 = v22;
      id v13 = v21;
      id v10 = v20;
      uint64_t v15 = v19;
      id v17 = v47;
      if (!v26)
      {
        [(InboxNewSectionViewController *)self _delegateShouldClose];
      }
      else
      {
LABEL_9:
        int64_t v27 = v18 + v15;
        if (([v10 hasRows] & 1) != 0 || v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = [(InboxNewSectionViewController *)self tableView];
          id v31 = v30;
          if (v16 || v17 || v48)
          {
            [v30 beginUpdates];

            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_100119BD0;
            v56[3] = &unk_1001D5B78;
            id v57 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v11 count]];
            int64_t v58 = v27;
            id v31 = v57;
            [v11 enumerateIndexesUsingBlock:v56];
            v32 = [(InboxNewSectionViewController *)self tableView];
            [v32 insertRowsAtIndexPaths:v31 withRowAnimation:6];

            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_100119C34;
            v53[3] = &unk_1001D5B78;
            id v54 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v12 count]];
            int64_t v55 = v27;
            id v33 = v54;
            [v12 enumerateIndexesUsingBlock:v53];
            v34 = [(InboxNewSectionViewController *)self tableView];
            [v34 deleteRowsAtIndexPaths:v33 withRowAnimation:6];

            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_100119C98;
            v50[3] = &unk_1001D5B78;
            id v51 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
            int64_t v52 = v27;
            id v35 = v51;
            [v13 enumerateIndexesUsingBlock:v50];
            v36 = [(InboxNewSectionViewController *)self tableView];
            [v36 reloadRowsAtIndexPaths:v35 withRowAnimation:6];

            v37 = [(InboxNewSectionViewController *)self tableView];
            [v37 endUpdates];
          }
          else
          {
            [v30 reloadData];
          }
        }
        else
        {
          v28 = [(InboxNewSectionViewController *)self tableView];
          v29 = +[NSIndexSet indexSetWithIndex:v27];
          [v28 deleteSections:v29 withRowAnimation:6];
        }
      }
      v38 = [(InboxNewSectionViewController *)self visibleGroups];
      if ([v38 count]
        || [(InboxNewSectionViewController *)self shouldShowIdentityChooser])
      {
        uint64_t v39 = 0;
      }
      else
      {
        uint64_t v39 = [(InboxNewSectionViewController *)self shouldShowFocusBanner] ^ 1;
      }
      v40 = [(InboxNewSectionViewController *)self tableView];
      [v40 setShowNoContentString:v39];

      if (self->_wantsDisplayReviewPrompt)
      {
        if ([v49 count])
        {
          v41 = [(InboxNewSectionViewController *)self visibleGroups];
          id v42 = [v41 count];

          if (!v42)
          {
            self->_wantsDisplayReviewPrompt = 0;
            p_inboxNewSectionDelegate = &self->_inboxNewSectionDelegate;
            id WeakRetained = objc_loadWeakRetained((id *)p_inboxNewSectionDelegate);
            uint64_t v45 = objc_opt_respondsToSelector();

            if (v45)
            {
              id v46 = objc_loadWeakRetained((id *)p_inboxNewSectionDelegate);
              [v46 attemptDisplayReviewPrompt];
            }
          }
        }
      }
    }
  }
}

- (void)inboxTableViewGroupController:(id)a3 inspectEvent:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);

  if (WeakRetained)
  {
    if (v6)
    {
      double v8 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Requesting from our delegate that an event should be inspected.", buf, 2u);
      }
      id v9 = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);
      [v9 inboxNewSectionViewController:self inspectEvent:v6];

      if (self->_destination == 2) {
        objc_storeStrong((id *)&self->_currentSelectedEvent, a4);
      }
    }
  }
  else
  {
    id v10 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "No delegate found.  Will not request that event be inspected.", v11, 2u);
    }
  }
}

- (void)inboxTableViewGroupController:(id)a3 viewCommentsForEvent:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);

  if (v7 && WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);
    [v6 inboxNewSectionViewController:self viewCommentsForEvent:v7];
  }
}

- (void)inboxTableViewGroupController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);

  if (v7 && WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);
    [v9 inboxNewSectionViewController:self viewProposedTimeForAttendee:v10 onEvent:v7];
  }
}

- (void)inboxTableViewGroupController:(id)a3 requestsReloadOfRow:(int64_t)a4
{
  id v6 = a3;
  if (self->_viewIsVisible)
  {
    if (self->_reloadsSuspendedUntilRefreshCompletes)
    {
      self->_needReloadWhenRefreshCompletes = 1;
    }
    else
    {
      id v15 = v6;
      id v7 = [(InboxNewSectionViewController *)self visibleGroups];
      double v8 = (char *)[v7 indexOfObject:v15];
      id v9 = &v8[[(InboxNewSectionViewController *)self firstGroupSection]];

      id v10 = +[NSIndexPath indexPathForRow:a4 inSection:v9];
      id v11 = [(InboxNewSectionViewController *)self tableView];
      [v11 beginUpdates];

      id v12 = [(InboxNewSectionViewController *)self tableView];
      id v13 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, 0);
      [v12 reloadRowsAtIndexPaths:v13 withRowAnimation:100];

      double v14 = [(InboxNewSectionViewController *)self tableView];
      [v14 endUpdates];

      id v6 = v15;
    }
  }
}

- (void)attemptDisplayReviewPrompt
{
  self->_wantsDisplayReviewPrompt = 1;
}

- (void)refresh:(id)a3
{
  CalAnalyticsSendEvent();
  id v4 = objc_alloc((Class)EKAccountRefresher);
  id v5 = [(CUIKCalendarModel *)self->_model eventStore];
  id v6 = (EKAccountRefresher *)[v4 initWithEventStore:v5];
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = v6;

  [(EKAccountRefresher *)self->_currentAccountRefresher setDelegate:self];
  double v8 = self->_currentAccountRefresher;

  [(EKAccountRefresher *)v8 refresh];
}

- (void)_pulledToRefresh:(id)a3
{
  self->_reloadsSuspendedUntilRefreshCompletes = 1;
  [(InboxNewSectionViewController *)self refresh:a3];
}

- (void)accountRefreshFinished:(id)a3
{
  id v7 = a3;
  self->_reloadsSuspendedUntilRefreshCompletes = 0;
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = 0;

  id v5 = [(InboxNewSectionViewController *)self refreshControl];

  if (v5)
  {
    id v6 = [(InboxNewSectionViewController *)self refreshControl];
    [v6 endRefreshing];
  }
  if ([v7 allAccountsOffline]) {
    +[EKUIAccountErrorDisplayer presentAlertForOfflineErrorUsingViewController:self];
  }
  if (self->_needReloadWhenRefreshCompletes)
  {
    self->_needReloadWhenRefreshCompletes = 0;
    [(InboxNewSectionViewController *)self inboxTableViewGroupController:0 addedRows:0 removedRows:0 updatedRows:0];
  }
}

- (id)_eventForIndexPath:(id)a3
{
  id v4 = a3;
  if (-[InboxNewSectionViewController isIdentityChooserSection:](self, "isIdentityChooserSection:", [v4 section])|| -[InboxNewSectionViewController isFocusBannerSection:](self, "isFocusBannerSection:", objc_msgSend(v4, "section")))
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(InboxNewSectionViewController *)self _groupForIndexPath:v4];
    id v5 = [v6 eventForRow:[v4 row]];
  }

  return v5;
}

- (id)_groupForIndexPath:(id)a3
{
  id v4 = [a3 section];

  return [(InboxNewSectionViewController *)self _groupForSection:v4];
}

- (id)_groupForSection:(int64_t)a3
{
  int64_t v4 = a3 - [(InboxNewSectionViewController *)self firstGroupSection];
  id v5 = [(InboxNewSectionViewController *)self visibleGroups];
  id v6 = [v5 count];

  if (v4 >= (uint64_t)v6)
  {
    double v8 = 0;
  }
  else
  {
    id v7 = [(InboxNewSectionViewController *)self visibleGroups];
    double v8 = [v7 objectAtIndexedSubscript:v4];
  }

  return v8;
}

- (void)_delegateShouldClose
{
  p_inboxNewSectionDelegate = &self->_inboxNewSectionDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);

  id v5 = kCalUILogInboxHandle;
  BOOL v6 = os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG);
  if (WeakRetained)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Requesting from our delegate that this view controller be closed.", buf, 2u);
    }
    id v7 = objc_loadWeakRetained((id *)p_inboxNewSectionDelegate);
    [v7 inboxNewSectionViewController:self shouldCloseAnimated:1];
  }
  else if (v6)
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "No delegate found.  Will not request closing.", v8, 2u);
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = 0;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:a3 withSender:v6] & 1) == 0&& "paste:" != a3)
  {
    if ("copy:" == a3)
    {
      if (self->_indexPathForRowWithContextMenu)
      {
        uint64_t v8 = -[InboxNewSectionViewController _eventForIndexPath:](self, "_eventForIndexPath:");
        id v9 = (void *)v8;
        if (v8)
        {
          uint64_t v16 = v8;
          id v10 = +[NSArray arrayWithObjects:&v16 count:1];
          uint64_t v11 = 1;
LABEL_12:
          unsigned __int8 v7 = +[CUIKPasteboardUtilities allEventsValidForAction:v11 fromEvents:v10];

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
        v14.receiver = self;
        v14.super_class = (Class)InboxNewSectionViewController;
        unsigned __int8 v7 = [(InboxNewSectionViewController *)&v14 canPerformAction:a3 withSender:v6];
        goto LABEL_16;
      }
      if (self->_indexPathForRowWithContextMenu)
      {
        uint64_t v12 = -[InboxNewSectionViewController _eventForIndexPath:](self, "_eventForIndexPath:");
        id v9 = (void *)v12;
        if (v12)
        {
          uint64_t v15 = v12;
          id v10 = +[NSArray arrayWithObjects:&v15 count:1];
          uint64_t v11 = 0;
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
  if (self->_indexPathForRowWithContextMenu)
  {
    int64_t v4 = -[InboxNewSectionViewController _eventForIndexPath:](self, "_eventForIndexPath:");
    if (v4)
    {
      id v7 = v4;
      id v5 = [(CUIKCalendarModel *)self->_model pasteboardManager];
      id v6 = +[NSSet setWithObject:v7];
      [v5 cutEvents:v6 delegate:self];

      int64_t v4 = v7;
    }
  }
}

- (void)copy:(id)a3
{
  if (self->_indexPathForRowWithContextMenu)
  {
    int64_t v4 = -[InboxNewSectionViewController _eventForIndexPath:](self, "_eventForIndexPath:");
    if (v4)
    {
      id v7 = v4;
      id v5 = [(CUIKCalendarModel *)self->_model pasteboardManager];
      id v6 = +[NSSet setWithObject:v7];
      [v5 copyEvents:v6 delegate:self];

      int64_t v4 = v7;
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

- (InboxNewSectionViewControllerDelegate)inboxNewSectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inboxNewSectionDelegate);

  return (InboxNewSectionViewControllerDelegate *)WeakRetained;
}

- (void)setInboxNewSectionDelegate:(id)a3
{
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (NSArray)allGroups
{
  return self->_allGroups;
}

- (void)setAllGroups:(id)a3
{
}

- (NSArray)visibleGroups
{
  return self->_visibleGroups;
}

- (void)setVisibleGroups:(id)a3
{
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleGroups, 0);
  objc_storeStrong((id *)&self->_allGroups, 0);
  objc_destroyWeak((id *)&self->_inboxNewSectionDelegate);
  objc_storeStrong((id *)&self->_focusBannerCell, 0);
  objc_storeStrong((id *)&self->_indexPathForRowWithContextMenu, 0);
  objc_storeStrong((id *)&self->_selectionTimer, 0);
  objc_storeStrong((id *)&self->_currentSelectedEvent, 0);
  objc_storeStrong((id *)&self->_currentAccountRefresher, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end