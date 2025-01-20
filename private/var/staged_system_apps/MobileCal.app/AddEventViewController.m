@interface AddEventViewController
+ (id)editOrAddViewControllerForEventOrIntegrationWithEvent:(id)a3 model:(id)a4 creationMethod:(unint64_t)a5 eventEditViewDelegate:(id)a6;
- (AddEventDelegate)addEventDelegate;
- (AddEventViewController)initWithModel:(id)a3 event:(id)a4;
- (AddEventViewController)initWithModel:(id)a3 eventStartDate:(id)a4;
- (AddEventViewController)initWithModel:(id)a3 eventTitle:(id)a4 startDate:(id)a5 endDate:(id)a6 location:(id)a7;
- (BOOL)allDay;
- (BOOL)canDismiss;
- (BOOL)canManagePresentationStyle;
- (BOOL)displayingRootView;
- (BOOL)hasReminderCalendar;
- (BOOL)hasUnsavedChanges;
- (BOOL)ignoreUnsavedChanges;
- (BOOL)isModalInPresentation;
- (BOOL)prefersForcedModalShowViewController;
- (BOOL)presentedOverWholeApp;
- (BOOL)showEventWhenAdded;
- (BOOL)wantsManagement;
- (BOOL)willPresentDialogOnSave;
- (CGSize)preferredContentSize;
- (EKCalendar)calendarToMakeVisibleOnSave;
- (EKCalendarDate)exactEventStartDate;
- (EKEvent)event;
- (EKEventOrIntegrationEditViewDelegate)internalEditViewDelegate;
- (NSString)suggestionKey;
- (id)_eventEditorForTestingOnly;
- (id)backgroundColor;
- (id)configuration;
- (id)currentManager;
- (id)currentRootViewController;
- (id)doneBlock;
- (id)pasteboardManager;
- (id)segmentedControl;
- (unint64_t)eventCreationMethod;
- (unint64_t)supportedInterfaceOrientations;
- (void)addItemViewControllerManager:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)attemptDisplayReviewPrompt;
- (void)cancelEditing;
- (void)completeAndSaveWithContinueBlock:(id)a3;
- (void)configureAppearanceForSplitDayView;
- (void)didAttemptToDismiss;
- (void)loadViewController;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)replaceSavedEvent:(id)a3;
- (void)selectSegmentIndex:(unint64_t)a3;
- (void)setAddEventDelegate:(id)a3;
- (void)setAllDay:(BOOL)a3;
- (void)setDoneBlock:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventCreationMethod:(unint64_t)a3;
- (void)setExactEventStartDate:(id)a3;
- (void)setIgnoreUnsavedChanges:(BOOL)a3;
- (void)setInternalEditViewDelegate:(id)a3;
- (void)setPresentedOverWholeApp:(BOOL)a3;
- (void)setShowEventWhenAdded:(BOOL)a3;
- (void)setSuggestionKey:(id)a3;
- (void)setupManagers;
- (void)setupNavigationItemFor:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AddEventViewController

+ (id)editOrAddViewControllerForEventOrIntegrationWithEvent:(id)a3 model:(id)a4 creationMethod:(unint64_t)a5 eventEditViewDelegate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v9 isNew])
  {
    v12 = [[AddEventViewController alloc] initWithModel:v10 event:v9];
    [(AddEventViewController *)v12 setEventCreationMethod:a5];
    [(AddEventViewController *)v12 setInternalEditViewDelegate:v11];
  }
  else
  {
    v12 = +[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:v9 creationMethod:a5 eventEditViewDelegate:v11];
  }

  return v12;
}

- (AddEventViewController)initWithModel:(id)a3 eventStartDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AddEventViewController;
  id v9 = [(AddEventViewController *)&v12 initWithNibName:0 bundle:0];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_model, a3);
    objc_storeStrong((id *)&v10->_eventStartDate, a4);
    [(AddEventViewController *)v10 _setClipUnderlapWhileTransitioning:1];
    [(AddEventViewController *)v10 setupManagers];
  }

  return v10;
}

- (AddEventViewController)initWithModel:(id)a3 event:(id)a4
{
  id v7 = a4;
  id v8 = [(AddEventViewController *)self initWithModel:a3 eventStartDate:0];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_event, a4);
    if ([v7 isReminderIntegrationEvent])
    {
      if ([(NSArray *)v9->_managers count] >= 2) {
        v9->_selectedIndex = 1;
      }
    }
  }

  return v9;
}

- (AddEventViewController)initWithModel:(id)a3 eventTitle:(id)a4 startDate:(id)a5 endDate:(id)a6 location:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = [(AddEventViewController *)self initWithModel:a3 eventStartDate:a5];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_eventTitle, a4);
    objc_storeStrong((id *)&v17->_eventEndDate, a6);
    objc_storeStrong((id *)&v17->_eventLocation, a7);
  }

  return v17;
}

- (void)setupManagers
{
  id v14 = objc_alloc_init((Class)NSMutableArray);
  v3 = [[AddEventViewControllerManager alloc] initWithCalendarModel:self->_model];
  [(AddEventViewControllerManager *)v3 setAddItemViewControllerManagerDelegate:self];
  [v14 addObject:v3];
  if ([(AddEventViewController *)self hasReminderCalendar]
    && (+[EKAppProtectionUtils isReminderAppLocked] & 1) == 0)
  {
    v4 = [[_TtC9MobileCal32AddReminderViewControllerManager alloc] initWithModel:self->_model];
    [(AddReminderViewControllerManager *)v4 setAddItemViewControllerManagerDelegate:self];
    [v14 addObject:v4];
  }
  v5 = (NSArray *)[v14 copy];
  managers = self->_managers;
  self->_managers = v5;

  NSUInteger v7 = [(NSArray *)self->_managers count];
  id v8 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v7];
  preservedViewControllerStacks = self->_preservedViewControllerStacks;
  self->_preservedViewControllerStacks = v8;

  id v10 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v7];
  lastFirstResponders = self->_lastFirstResponders;
  self->_lastFirstResponders = v10;

  for (; v7; --v7)
  {
    [(NSMutableArray *)self->_preservedViewControllerStacks addObject:&__NSArray0__struct];
    objc_super v12 = self->_lastFirstResponders;
    id v13 = +[NSNull null];
    [(NSMutableArray *)v12 addObject:v13];
  }
}

- (BOOL)hasReminderCalendar
{
  v2 = [(CUIKCalendarModel *)self->_model reminderCalendar];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)segmentedControl
{
  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_managers, "count")];
    id v14 = self;
    objc_initWeak(&location, self);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    obj = self->_managers;
    id v5 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) newItemTitle];
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100105D5C;
          v16[3] = &unk_1001D5790;
          objc_copyWeak(v17, &location);
          v17[1] = (char *)i + v6;
          id v10 = +[UIAction actionWithTitle:v9 image:0 identifier:0 handler:v16];

          [v4 addObject:v10];
          objc_destroyWeak(v17);
        }
        id v5 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
        v6 += (uint64_t)i;
      }
      while (v5);
    }

    id v11 = [objc_alloc((Class)UISegmentedControl) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(UISegmentedControl *)v11 setSelectedSegmentIndex:v14->_selectedIndex];
    objc_super v12 = v14->_segmentedControl;
    v14->_segmentedControl = v11;

    objc_destroyWeak(&location);
    segmentedControl = v14->_segmentedControl;
  }

  return segmentedControl;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AddEventViewController;
  [(AddEventViewController *)&v3 viewDidLoad];
  [(AddEventViewController *)self setDelegate:self];
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)AddEventViewController;
  [(AddEventViewController *)&v16 viewDidLayoutSubviews];
  if (self->_segmentedControl)
  {
    objc_super v3 = [(AddEventViewController *)self view];
    [v3 layoutMargins];
    double v5 = v4;
    double v7 = v6;

    id v8 = [(AddEventViewController *)self navigationBar];
    [v8 bounds];
    double v10 = v9;

    double v11 = v10 - v5 - v7;
    objc_super v12 = [(AddEventViewController *)self traitCollection];
    id v13 = [v12 horizontalSizeClass];

    if (v13 == (id)2) {
      double v14 = 366.0;
    }
    else {
      double v14 = v11;
    }
    if (v14 < v11) {
      -[UISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v11, 0.0);
    }
    [(UISegmentedControl *)self->_segmentedControl bounds];
    id v15 = [(AddEventViewController *)self traitCollection];
    [v15 displayScale];
    UIRectRoundToScale();
    -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:");
  }
}

- (void)setupNavigationItemFor:(id)a3
{
  id v23 = a3;
  if ([(NSArray *)self->_managers count] >= 2)
  {
    if (!self->_palette)
    {
      double v4 = [(AddEventViewController *)self segmentedControl];
      [v4 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
      double v6 = v5;
      double v8 = v7;
      [v4 setFrame:0.0, 0.0, v5, v7];
      id v9 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, v6, v8 + 12.0];
      [v9 addSubview:v4];
      double v10 = (_UINavigationBarPalette *)[objc_alloc((Class)_UINavigationBarPalette) initWithContentView:v9];
      palette = self->_palette;
      self->_palette = v10;
    }
    id v12 = [(AddEventViewController *)self currentRootViewController];

    if (v12 == v23)
    {
      objc_super v16 = +[NSBundle mainBundle];
      v17 = [v16 localizedStringForKey:@"NewItemNavigationTitle" value:@"New" table:0];
      long long v18 = [v23 navigationItem];
      [v18 setTitle:v17];

      long long v19 = [(AddEventViewController *)self currentManager];
      id v20 = [v19 newItemBackButtonTitle];
      long long v21 = [v23 navigationItem];
      [v21 setBackButtonTitle:v20];

      v22 = self->_palette;
      id v13 = [v23 navigationItem];
      double v14 = v13;
      id v15 = v22;
    }
    else
    {
      id v13 = [v23 navigationItem];
      double v14 = v13;
      id v15 = 0;
    }
    [v13 _setBottomPalette:v15];
  }
}

- (void)selectSegmentIndex:(unint64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    double v5 = [(AddEventViewController *)self currentManager];
    double v6 = [v5 viewController];
    double v7 = [v6 view];

    double v8 = [v7 firstResponder];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && [v8 isDescendantOfView:v7])
    {
      [(NSMutableArray *)self->_lastFirstResponders setObject:v8 atIndexedSubscript:self->_selectedIndex];
    }
    else
    {
      id v9 = +[NSNull null];
      [(NSMutableArray *)self->_lastFirstResponders setObject:v9 atIndexedSubscript:self->_selectedIndex];
    }
    double v10 = [(AddEventViewController *)self view];
    [v10 endEditing:1];

    double v11 = [(AddEventViewController *)self currentManager];
    id v12 = [(AddEventViewController *)self configuration];
    id v13 = [v12 addItemState];
    [v11 updateStateFromUI:v13];

    double v14 = [(AddEventViewController *)self viewControllers];
    [(NSMutableArray *)self->_preservedViewControllerStacks setObject:v14 atIndexedSubscript:self->_selectedIndex];

    self->_selectedIndex = a3;
    id v15 = [(NSMutableArray *)self->_preservedViewControllerStacks objectAtIndexedSubscript:a3];
    if ([v15 count])
    {
      [(NSMutableArray *)self->_preservedViewControllerStacks setObject:&__NSArray0__struct atIndexedSubscript:a3];
    }
    else
    {
      objc_super v16 = [(AddEventViewController *)self currentRootViewController];
      v24 = v16;
      uint64_t v17 = +[NSArray arrayWithObjects:&v24 count:1];

      id v15 = (void *)v17;
    }
    [(AddEventViewController *)self setViewControllers:v15 animated:0];
    long long v18 = [(AddEventViewController *)self currentManager];
    long long v19 = [(AddEventViewController *)self configuration];
    id v20 = [v19 addItemState];
    [v18 updateUIFromState:v20];

    long long v21 = [(NSMutableArray *)self->_lastFirstResponders objectAtIndexedSubscript:self->_selectedIndex];
    v22 = +[NSNull null];

    if (v21 != v22)
    {
      id v23 = [(NSMutableArray *)self->_lastFirstResponders objectAtIndexedSubscript:self->_selectedIndex];
      [v23 becomeFirstResponder];
    }
  }
}

- (id)configuration
{
  configuration = self->_configuration;
  if (!configuration)
  {
    event = self->_event;
    if (!event)
    {
      double v5 = self->_model;
      double v6 = [(CUIKCalendarModel *)v5 eventStore];
      double v7 = +[EKEvent eventWithEventStore:v6];

      double v8 = [(CUIKCalendarModel *)v5 defaultCalendarForNewEvents];
      [(EKEvent *)v7 setCalendar:v8];

      if (self->_eventTitle) {
        -[EKEvent setTitle:](v7, "setTitle:");
      }
      if (self->_eventLocation) {
        -[EKEvent setStructuredLocation:](v7, "setStructuredLocation:");
      }
      id v9 = self->_eventStartDate;
      if (!v9)
      {
        id v10 = objc_alloc((Class)EKCalendarDate);
        double v11 = CUIKNowComponents();
        id v12 = [(CUIKCalendarModel *)v5 eventStore];
        id v13 = [v12 timeZone];
        id v9 = (EKCalendarDate *)[v10 initWithDateComponents:v11 timeZone:v13];
      }
      double v14 = [(EKCalendarDate *)v9 date];
      CUIKGetDefaultStartAndEndTimeForDate();
      id v15 = 0;
      id v16 = 0;

      exactEventStartDate = self->_exactEventStartDate;
      if (exactEventStartDate)
      {
        uint64_t v18 = [(EKCalendarDate *)exactEventStartDate date];

        id v15 = (id)v18;
      }
      eventEndDate = self->_eventEndDate;
      v32 = v5;
      if (eventEndDate)
      {
        uint64_t v20 = [(EKCalendarDate *)eventEndDate date];

        id v16 = (id)v20;
      }
      -[EKEvent setStartDate:](v7, "setStartDate:", v15, v32);
      [(EKEvent *)v7 setEndDate:v16];
      [(EKEvent *)v7 setAllDay:self->_allDay];
      long long v21 = [(EKEvent *)v7 calendar];
      v22 = [v21 source];
      id v23 = [v22 defaultAlarmOffset];

      if (v23)
      {
        v24 = +[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:", (double)(int)[v23 intValue]);
        [(EKEvent *)v7 addAlarm:v24];
      }
      v25 = self->_event;
      self->_event = v7;
      v26 = v7;

      event = 0;
    }
    BOOL v27 = event != 0;
    v28 = [[AddItemState alloc] initWithEvent:self->_event];
    [(AddItemState *)v28 setExplicitTime:v27];
    v29 = [[AddItemViewControllerConfiguration alloc] initWithAddItemState:v28];
    [(AddItemViewControllerConfiguration *)v29 setSuggestionKey:self->_suggestionKey];
    [(AddItemViewControllerConfiguration *)v29 setCreationMethod:self->_eventCreationMethod];
    v30 = self->_configuration;
    self->_configuration = v29;

    configuration = self->_configuration;
  }

  return configuration;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(AddEventViewController *)self view];
  int IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();

  if (IsRegularInViewHierarchy) {
    return 26;
  }
  else {
    return 30;
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v7 = [(AddEventViewController *)self presentedViewController];
  NSClassFromString(@"_UIDatePickerNumericKeyboardViewController");
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(AddEventViewController *)self presentedViewController];
    unsigned __int8 v6 = [v5 isBeingDismissed];

    if ((v6 & 1) == 0)
    {
      [(AddEventViewController *)self dismissViewControllerAnimated:0 completion:0];
    }
  }
  else
  {
  }
}

- (void)viewWillLayoutSubviews
{
  id v5 = [(AddEventViewController *)self backgroundColor];
  objc_super v3 = [(AddEventViewController *)self view];
  [v3 setBackgroundColor:v5];
  double v4 = [(AddEventViewController *)self currentManager];
  [v4 setEditorBackgroundColor:v5];
}

- (id)_eventEditorForTestingOnly
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_managers;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        unsigned __int8 v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v6 _eventEditorForTestingOnly:v8];
          id v3 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isModalInPresentation
{
  return ![(AddEventViewController *)self canDismiss];
}

- (BOOL)prefersForcedModalShowViewController
{
  return 1;
}

- (id)backgroundColor
{
  if ([(AddEventViewController *)self isPresentedInsidePopover]) {
    +[UIColor clearColor];
  }
  else {
  v2 = +[UIColor tableViewBackgroundColorOpaque];
  }

  return v2;
}

- (CGSize)preferredContentSize
{
  v2 = [(AddEventViewController *)self currentRootViewController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AddEventViewController;
  [(AddEventViewController *)&v10 viewWillAppear:a3];
  double v4 = [(AddEventViewController *)self viewControllers];
  id v5 = [v4 count];

  if (!v5)
  {
    double v6 = [(AddEventViewController *)self currentRootViewController];
    [(AddEventViewController *)self pushViewController:v6 animated:0];
  }
  double v7 = [(AddEventViewController *)self presentationController];
  double v8 = [v7 delegate];

  if (!v8)
  {
    long long v9 = [(AddEventViewController *)self presentationController];
    [v9 setDelegate:self];
  }
}

- (id)currentManager
{
  unint64_t selectedIndex = self->_selectedIndex;
  NSUInteger v4 = [(NSArray *)self->_managers count];
  managers = self->_managers;
  if (selectedIndex <= v4) {
    [(NSArray *)managers objectAtIndexedSubscript:self->_selectedIndex];
  }
  else {
  double v6 = [(NSArray *)managers lastObject];
  }

  return v6;
}

- (void)loadViewController
{
  id v5 = [(AddEventViewController *)self currentManager];
  double v3 = [(AddEventViewController *)self configuration];
  id v4 = [v5 createViewController:v3];
}

- (id)currentRootViewController
{
  double v3 = [(AddEventViewController *)self currentManager];
  id v4 = [v3 viewController];

  if (!v4)
  {
    [(AddEventViewController *)self loadViewController];
    id v5 = [(AddEventViewController *)self currentManager];
    id v4 = [v5 viewController];
  }

  return v4;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3 = [(AddEventViewController *)self currentManager];
  [v3 presentationControllerDidDismiss];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v3 = [(AddEventViewController *)self currentManager];
  [v3 presentationControllerDidAttemptToDismiss];
}

- (void)replaceSavedEvent:(id)a3
{
}

- (void)addItemViewControllerManager:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(AddEventViewController *)self doneBlock];

  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100107030;
      v20[3] = &unk_1001D57B8;
      id v21 = v6;
      double v8 = objc_retainBlock(v20);
    }
    else
    {
      double v8 = 0;
    }
    long long v9 = [(AddEventViewController *)self doneBlock];
    ((void (**)(void, AddEventViewController *, void *))v9)[2](v9, self, v8);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      id v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_10010703C;
      uint64_t v18 = &unk_1001D57B8;
      id v19 = v6;
      long long v11 = objc_retainBlock(&v15);
    }
    else
    {
      long long v11 = 0;
    }
    [WeakRetained eventEditViewController:self didCompleteWithAction:a4 completionHandler:v11 v15, v16, v17, v18];
LABEL_16:

    goto LABEL_17;
  }
  if (a4 == 1)
  {
    long long v11 = [v6 calendarToMakeVisibleOnSave];
    model = self->_model;
    id v13 = [v11 objectID];
    [(CUIKCalendarModel *)model ensureCalendarVisibleWithId:v13];

    if ([(AddEventViewController *)self showEventWhenAdded])
    {
      double v14 = [(AddEventViewController *)self addEventDelegate];
      [v14 showNewEvent:self->_event];
    }
    if ([v11 sharingStatus]) {
      [(AddEventViewController *)self attemptDisplayReviewPrompt];
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (id)pasteboardManager
{
  return [(CUIKCalendarModel *)self->_model pasteboardManager];
}

- (void)attemptDisplayReviewPrompt
{
  id v5 = [(AddEventViewController *)self view];
  id v3 = [v5 window];
  id v4 = [v3 windowScene];
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:v4 calendarModel:self->_model];
}

- (BOOL)canDismiss
{
  v2 = [(AddEventViewController *)self currentManager];
  unsigned __int8 v3 = [v2 canDismiss];

  return v3;
}

- (BOOL)displayingRootView
{
  unsigned __int8 v3 = [(AddEventViewController *)self visibleViewController];
  id v4 = [(AddEventViewController *)self viewControllers];
  id v5 = [v4 firstObject];
  BOOL v6 = v3 == v5;

  return v6;
}

- (void)didAttemptToDismiss
{
  if ([(AddEventViewController *)self displayingRootView])
  {
    unsigned __int8 v3 = [(AddEventViewController *)self currentManager];
    id v5 = [v3 confirmDismissAlertController];

    id v4 = v5;
    if (v5)
    {
      [(AddEventViewController *)self presentViewController:v5 animated:1 completion:0];
      id v4 = v5;
    }
  }
}

- (void)configureAppearanceForSplitDayView
{
  id v4 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v4 configureWithOpaqueBackground];
  unsigned __int8 v3 = [(AddEventViewController *)self navigationBar];
  [v3 setScrollEdgeAppearance:v4];
}

- (BOOL)hasUnsavedChanges
{
  v2 = [(AddEventViewController *)self currentManager];
  unsigned __int8 v3 = [v2 hasUnsavedChanges];

  return v3;
}

- (BOOL)willPresentDialogOnSave
{
  v2 = [(AddEventViewController *)self currentManager];
  unsigned __int8 v3 = [v2 willPresentDialogOnSave];

  return v3;
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AddEventViewController *)self currentManager];
  [v5 completeAndSaveWithContinueBlock:v4];
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AddEventViewController *)self currentManager];
  [v4 setIgnoreUnsavedChanges:v3];
}

- (BOOL)ignoreUnsavedChanges
{
  v2 = [(AddEventViewController *)self currentManager];
  unsigned __int8 v3 = [v2 ignoreUnsavedChanges];

  return v3;
}

- (void)cancelEditing
{
  id v2 = [(AddEventViewController *)self currentManager];
  [v2 cancelEditing];
}

- (EKCalendar)calendarToMakeVisibleOnSave
{
  id v2 = [(AddEventViewController *)self currentManager];
  unsigned __int8 v3 = [v2 calendarToMakeVisibleOnSave];

  return (EKCalendar *)v3;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
}

- (BOOL)wantsManagement
{
  return ![(AddEventViewController *)self presentedOverWholeApp];
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (EKEventOrIntegrationEditViewDelegate)internalEditViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);

  return (EKEventOrIntegrationEditViewDelegate *)WeakRetained;
}

- (void)setInternalEditViewDelegate:(id)a3
{
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (BOOL)showEventWhenAdded
{
  return self->_showEventWhenAdded;
}

- (void)setShowEventWhenAdded:(BOOL)a3
{
  self->_showEventWhenAdded = a3;
}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
}

- (EKCalendarDate)exactEventStartDate
{
  return self->_exactEventStartDate;
}

- (void)setExactEventStartDate:(id)a3
{
}

- (NSString)suggestionKey
{
  return self->_suggestionKey;
}

- (void)setSuggestionKey:(id)a3
{
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (AddEventDelegate)addEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addEventDelegate);

  return (AddEventDelegate *)WeakRetained;
}

- (void)setAddEventDelegate:(id)a3
{
}

- (unint64_t)eventCreationMethod
{
  return self->_eventCreationMethod;
}

- (void)setEventCreationMethod:(unint64_t)a3
{
  self->_eventCreationMethod = a3;
}

- (BOOL)presentedOverWholeApp
{
  return self->_presentedOverWholeApp;
}

- (void)setPresentedOverWholeApp:(BOOL)a3
{
  self->_presentedOverWholeApp = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_addEventDelegate);
  objc_storeStrong((id *)&self->_suggestionKey, 0);
  objc_storeStrong((id *)&self->_exactEventStartDate, 0);
  objc_storeStrong(&self->_doneBlock, 0);
  objc_destroyWeak((id *)&self->_editViewDelegate);
  objc_storeStrong((id *)&self->_lastFirstResponders, 0);
  objc_storeStrong((id *)&self->_preservedViewControllerStacks, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_eventLocation, 0);
  objc_storeStrong((id *)&self->_eventTitle, 0);
  objc_storeStrong((id *)&self->_eventEndDate, 0);
  objc_storeStrong((id *)&self->_eventStartDate, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end