@interface CalendarsViewController
- (BOOL)canDismiss;
- (BOOL)isModalInPresentation;
- (BOOL)prefersForcedModalShowViewController;
- (CUIKCalendarModel)model;
- (CalendarsViewController)initWithModel:(id)a3 destination:(unint64_t)a4;
- (NSSet)unselectedCalendarsForFocusMode;
- (UINavigationController)embeddedNavigationController;
- (id)backgroundColor;
- (id)centeredCalendar;
- (id)displayedEditor;
- (id)doneBlock;
- (id)preservedState;
- (id)refreshCalendarsButtonPressed;
- (unint64_t)focusFilterMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_identityChanged:(id)a3;
- (void)_saveFilterAndNotifyWithReason:(id)a3;
- (void)_updateChooserForFocusMode;
- (void)calendarChooserCollapsedSectionIdentifiersDidChange:(id)a3;
- (void)calendarChooserDidFinish:(id)a3;
- (void)calendarChooserSelectedIdentityDidChange:(id)a3;
- (void)calendarChooserSelectionDidChange:(id)a3;
- (void)calendarChooserUpdatedToolbarItems;
- (void)centerOnCalendar:(id)a3;
- (void)dealloc;
- (void)focusModeConfigurationChanged:(id)a3;
- (void)loadView;
- (void)openAddRegularCalendarWithTitle:(id)a3;
- (void)restorePresentedViewControllers:(id)a3 startIndex:(unint64_t)a4 presenter:(id)a5;
- (void)restorePreservedState:(id)a3;
- (void)selectedCalendarsChanged:(id)a3;
- (void)setDoneBlock:(id)a3;
- (void)setEmbeddedNavigationController:(id)a3;
- (void)setFocusFilterMode:(unint64_t)a3;
- (void)setModel:(id)a3;
- (void)showAddSubscribedCalendarWithURL:(id)a3;
- (void)showCalendar:(id)a3 enableDoneInitially:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CalendarsViewController

- (CalendarsViewController)initWithModel:(id)a3 destination:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CalendarsViewController;
  v8 = [(CalendarsViewController *)&v12 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, a3);
    v9->_destination = a4;
    if (a4 == 2)
    {
      v10 = +[NSNotificationCenter defaultCenter];
      [v10 addObserver:v9 selector:"_identityChanged:" name:CUIKCalendarModelIdentityChangedNotification object:v7];
    }
  }

  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CalendarsViewController;
  [(CalendarsViewController *)&v4 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(CalendarsViewController *)self view];
  int IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();

  if (IsRegularInViewHierarchy) {
    return 30;
  }
  else {
    return 26;
  }
}

- (void)viewWillLayoutSubviews
{
  id v5 = [(CalendarsViewController *)self backgroundColor];
  v3 = [(CalendarsViewController *)self view];
  [v3 setBackgroundColor:v5];
  objc_super v4 = [v3 mainView];
  [v4 setBackgroundColor:v5];
}

- (void)loadView
{
  id v19 = [(CalendarsViewController *)self model];
  id v3 = objc_alloc((Class)EKCalendarChooser);
  if (self->_destination == 2) {
    uint64_t v4 = 1000;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = [v19 eventStore];
  v6 = [v19 sourceForSelectedIdentity];
  *(_WORD *)((char *)&v18 + 1) = 257;
  LOBYTE(v18) = self->_destination != 2;
  id v7 = [v3 initWithSelectionStyle:1 displayStyle:v4 entityType:0 forEvent:0 eventStore:v5 limitedToSource:v6 showIdentityChooser:v18 showDelegateSetupCell:0 showAccountStatus:0];

  if (self->_destination == 2)
  {
    [(CalendarsViewController *)self addChildViewController:v7];
    p_chooser = (id *)&self->_chooser;
  }
  else
  {
    v9 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
    p_chooser = (id *)&self->_embeddedNavigationController;
    embeddedNavigationController = self->_embeddedNavigationController;
    self->_embeddedNavigationController = v9;

    [(CalendarsViewController *)self addChildViewController:self->_embeddedNavigationController];
  }
  [*p_chooser didMoveToParentViewController:self];
  if (v7)
  {
    v11 = [v19 selectedCalendarsIgnoringFocus];
    [v7 setSelectedCalendars:v11];

    [v7 setDelegate:self];
    objc_super v12 = [v19 collapsedSectionIdentifiers];
    [v7 setCollapsedSectionIdentifiers:v12];

    [v7 setShowsDoneButton:self->_destination == 0];
    [v7 setAllowsPullToRefresh:1];
    [v7 setShowsDeclinedEventsSetting:[v19 invitationBearingStoresExistForEvents]];
    [v7 setShowsCompletedRemindersSetting:1];
    [v7 setShowDetailAccessories:1];
    objc_storeStrong((id *)&self->_chooser, v7);
    [(CalendarsViewController *)self _updateChooserForFocusMode];
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"selectedCalendarsChanged:" name:CUIKCalendarModelFilterChangedNotification object:v19];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:self selector:"focusModeConfigurationChanged:" name:CUIKCalendarModelFocusModeConfigurationChangedNotification object:v19];
  }
  v15 = -[RootView initWithFrame:]([CalendarsView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  chooser = self->_embeddedNavigationController;
  if (!chooser) {
    chooser = self->_chooser;
  }
  v17 = [chooser view];
  [(RootView *)v15 setMainView:v17];
  [(CalendarsViewController *)self setView:v15];
}

- (void)_updateChooserForFocusMode
{
  id v3 = [(CUIKCalendarModel *)self->_model unselectedCalendarsForFocusMode];
  BOOL v4 = v3 != 0;

  chooser = self->_chooser;

  [(EKCalendarChooser *)chooser setDisableCalendarsUnselectedByFocus:v4];
}

- (void)calendarChooserUpdatedToolbarItems
{
  if (!self->_embeddedNavigationController)
  {
    id v3 = [(EKCalendarChooser *)self->_chooser toolbarItems];
    [(CalendarsViewController *)self setToolbarItems:v3 animated:1];
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CalendarsViewController;
  [(CalendarsViewController *)&v6 viewDidLoad];
  embeddedNavigationController = self->_embeddedNavigationController;
  if (!embeddedNavigationController) {
    embeddedNavigationController = self->_chooser;
  }
  BOOL v4 = [embeddedNavigationController view];
  id v5 = [(CalendarsViewController *)self backgroundColor];
  [v4 setBackgroundColor:v5];
}

- (BOOL)isModalInPresentation
{
  id v3 = [(CalendarsViewController *)self embeddedNavigationController];
  BOOL v4 = [v3 presentedViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 viewControllers];
    objc_super v6 = [v5 firstObject];
    unsigned __int8 v7 = [v6 isModalInPresentation];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CalendarsViewController;
    unsigned __int8 v7 = [(CalendarsViewController *)&v9 isModalInPresentation];
  }

  return v7;
}

- (void)showCalendar:(id)a3 enableDoneInitially:(BOOL)a4
{
}

- (void)selectedCalendarsChanged:(id)a3
{
  id v5 = [(CalendarsViewController *)self model];
  BOOL v4 = [v5 selectedCalendarsIgnoringFocus];
  [(EKCalendarChooser *)self->_chooser setSelectedCalendars:v4];
}

- (void)focusModeConfigurationChanged:(id)a3
{
  [(CalendarsViewController *)self _updateChooserForFocusMode];
  chooser = self->_chooser;

  [(EKCalendarChooser *)chooser focusModeConfigurationChanged];
}

- (void)_identityChanged:(id)a3
{
  chooser = self->_chooser;
  id v5 = [(CalendarsViewController *)self model];
  BOOL v4 = [v5 sourceForSelectedIdentity];
  [(EKCalendarChooser *)chooser identityChanged:v4];
}

- (void)calendarChooserSelectionDidChange:(id)a3
{
  model = self->_model;
  id v5 = a3;
  objc_super v6 = [(CUIKCalendarModel *)model sourceForSelectedIdentity];
  unsigned __int8 v7 = [v5 selectedCalendars];

  [(CUIKCalendarModel *)model updateSourceForSelectedIdentity:v6 selectedCalendars:v7];

  [(CalendarsViewController *)self _saveFilterAndNotifyWithReason:@"calendar chooser selection changed"];
}

- (void)calendarChooserSelectedIdentityDidChange:(id)a3
{
  model = self->_model;
  id v5 = [a3 sourceForSelectedIdentity];
  [(CUIKCalendarModel *)model updateSourceForSelectedIdentity:v5 selectedCalendars:0];

  [(CalendarsViewController *)self _saveFilterAndNotifyWithReason:@"calendar chooser selected identity changed"];
}

- (void)calendarChooserCollapsedSectionIdentifiersDidChange:(id)a3
{
  id v4 = [a3 collapsedSectionIdentifiers];
  [(CUIKCalendarModel *)self->_model setCollapsedSectionIdentifiers:v4];
}

- (void)_saveFilterAndNotifyWithReason:(id)a3
{
  model = self->_model;
  id v5 = a3;
  id v6 = [(CUIKCalendarModel *)model selectedCalendarsIgnoringFocus];
  [(CUIKCalendarModel *)self->_model setSelectedCalendarsAndRequestPreferenceSave:v6 reason:v5];
}

- (id)refreshCalendarsButtonPressed
{
  CalAnalyticsSendEvent();
  id v3 = objc_alloc((Class)EKAccountRefresher);
  id v4 = [(CalendarsViewController *)self model];
  id v5 = [v4 eventStore];
  id v6 = [v3 initWithEventStore:v5];

  [v6 refresh];

  return v6;
}

- (unint64_t)focusFilterMode
{
  return (unint64_t)[(CUIKCalendarModel *)self->_model focusFilterMode];
}

- (void)setFocusFilterMode:(unint64_t)a3
{
}

- (NSSet)unselectedCalendarsForFocusMode
{
  return (NSSet *)[(CUIKCalendarModel *)self->_model unselectedCalendarsForFocusMode];
}

- (void)calendarChooserDidFinish:(id)a3
{
  [(CalendarsViewController *)self _saveFilterAndNotifyWithReason:@"calendar chooser dismissed"];
  id v4 = [(CalendarsViewController *)self embeddedNavigationController];
  id v5 = [v4 popViewControllerAnimated:0];

  id v6 = [(CalendarsViewController *)self doneBlock];

  if (v6)
  {
    unsigned __int8 v7 = [(CalendarsViewController *)self doneBlock];
    ((void (**)(void, CalendarsViewController *, void))v7)[2](v7, self, 0);

    [(CalendarsViewController *)self setDoneBlock:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CalendarsViewController *)self _saveFilterAndNotifyWithReason:@"calendarsviewcontroller dismissed"];
  v5.receiver = self;
  v5.super_class = (Class)CalendarsViewController;
  [(CalendarsViewController *)&v5 viewDidDisappear:v3];
}

- (BOOL)prefersForcedModalShowViewController
{
  return 1;
}

- (id)centeredCalendar
{
  return [(EKCalendarChooser *)self->_chooser centeredCalendar];
}

- (void)centerOnCalendar:(id)a3
{
}

- (void)showAddSubscribedCalendarWithURL:(id)a3
{
}

- (void)openAddRegularCalendarWithTitle:(id)a3
{
}

- (id)displayedEditor
{
  return [(EKCalendarChooser *)self->_chooser displayedEditor];
}

- (id)preservedState
{
  BOOL v3 = objc_alloc_init(CalendarsViewControllerPreservedState);
  id v4 = [(EKCalendarChooser *)self->_chooser centeredCalendar];
  [(CalendarsViewControllerPreservedState *)v3 setCenteredCalendar:v4];

  objc_super v5 = [(EKCalendarChooser *)self->_chooser displayedEditor];
  [(CalendarsViewControllerPreservedState *)v3 setDisplayedEditor:v5];

  id v6 = +[NSMutableArray array];
  uint64_t v7 = [(CalendarsViewController *)self presentedViewController];
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (NSClassFromString(@"MFMessageComposeViewController"), (objc_opt_isKindOfClass() & 1) != 0)
        || (NSClassFromString(@"_UIContextMenuActionsOnlyViewController"), (objc_opt_isKindOfClass() & 1) != 0)
        || (NSClassFromString(@"DDParsecCollectionViewController"), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_super v9 = [v8 presentingViewController];
        [v9 dismissViewControllerAnimated:0 completion:0];

        uint64_t v10 = [v8 presentedViewController];
      }
      else
      {
        v11 = objc_alloc_init(PresentedViewControllerState);
        [(PresentedViewControllerState *)v11 setViewController:v8];
        objc_super v12 = [v8 popoverPresentationController];
        v13 = [v12 sourceView];
        [(PresentedViewControllerState *)v11 setSourceView:v13];

        v14 = [v8 popoverPresentationController];
        -[PresentedViewControllerState setArrowDirection:](v11, "setArrowDirection:", [v14 permittedArrowDirections]);

        [v6 addObject:v11];
        uint64_t v10 = [v8 presentedViewController];

        v8 = v11;
      }

      v8 = (void *)v10;
    }
    while (v10);
  }
  if ([v6 count])
  {
    v15 = (char *)[v6 count];
    v16 = v15 - 1;
    if (v15 != (char *)1)
    {
      v17 = 0;
      do
      {
        uint64_t v18 = v17;
        id v19 = [v6 objectAtIndex:v16];
        v17 = [v19 viewController];

        v20 = [v17 presentingViewController];
        [v20 dismissViewControllerAnimated:0 completion:0];

        --v16;
      }
      while (v16);
    }
    [(CalendarsViewControllerPreservedState *)v3 setPresentedViewControllersState:v6];
  }

  return v3;
}

- (void)restorePreservedState:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 displayedEditor];
  id v6 = [(CUIKCalendarModel *)self->_model selectedCalendarsIgnoringFocus];
  [(EKCalendarChooser *)self->_chooser setSelectedCalendars:v6];

  chooser = self->_chooser;
  v8 = [v4 centeredCalendar];
  [(EKCalendarChooser *)chooser centerOnCalendar:v8];

  objc_super v9 = self->_chooser;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F1320;
  v12[3] = &unk_1001D2EE0;
  v12[4] = self;
  id v13 = v4;
  id v14 = v5;
  id v10 = v5;
  id v11 = v4;
  [(EKCalendarChooser *)v9 redisplayEditor:v10 completion:v12];
}

- (void)restorePresentedViewControllers:(id)a3 startIndex:(unint64_t)a4 presenter:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 presentedViewControllersState];
  if ((unint64_t)[v10 count] > a4)
  {
    id v11 = [v10 objectAtIndex:a4];
    objc_super v12 = [v11 viewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v12 viewControllers],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v8 displayedEditor],
          id v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = [v13 containsObject:v14],
          v14,
          v13,
          v15))
    {
      [(CalendarsViewController *)self restorePresentedViewControllers:v8 startIndex:a4 + 1 presenter:v9];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v16 = [v11 sourceView];

        if (v16)
        {
          v17 = [v11 sourceView];
          uint64_t v18 = [v12 popoverPresentationController];
          [v18 setSourceView:v17];

          id v19 = [v11 arrowDirection];
          v20 = [v12 popoverPresentationController];
          [v20 setPermittedArrowDirections:v19];
        }
        else
        {
          v25 = [v8 displayedEditor];
          v21 = [v25 navigationController];
          v22 = [v21 view];
          v23 = [v12 popoverPresentationController];
          [v23 setSourceView:v22];
        }
      }
      else
      {
        [v12 setModalPresentationStyle:3];
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000F15F4;
      v26[3] = &unk_1001D36F0;
      id v27 = v12;
      id v28 = v9;
      v29 = self;
      id v30 = v8;
      unint64_t v31 = a4;
      v24 = objc_retainBlock(v26);
      ((void (*)(void))v24[2])();
    }
  }
}

- (id)backgroundColor
{
  return +[UIColor tableViewBackgroundColorOpaque];
}

- (BOOL)canDismiss
{
  v2 = [(CalendarsViewController *)self embeddedNavigationController];
  BOOL v3 = [v2 viewControllers];
  BOOL v4 = [v3 count] == (id)1;

  return v4;
}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (UINavigationController)embeddedNavigationController
{
  return self->_embeddedNavigationController;
}

- (void)setEmbeddedNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedNavigationController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong(&self->_doneBlock, 0);

  objc_storeStrong((id *)&self->_chooser, 0);
}

@end