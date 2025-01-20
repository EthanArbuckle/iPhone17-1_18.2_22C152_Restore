@interface InboxSwitcherViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGSize)preferredContentSize;
- (InboxSwitcherViewController)initWithModel:(id)a3 destination:(unint64_t)a4;
- (InboxSwitcherViewControllerDelegate)switcherDelegate;
- (UISegmentedControl)segmentedControl;
- (id)_showViewControllerAtIndex:(int64_t)a3;
- (id)_viewControllerForIndex:(int64_t)a3;
- (id)showNewSection;
- (id)showRepliedSection;
- (unint64_t)destination;
- (void)_setDoneButtonState;
- (void)attemptDisplayReviewPrompt;
- (void)identityDidChange:(id)a3;
- (void)inboxNewSectionViewController:(id)a3 inspectEvent:(id)a4;
- (void)inboxNewSectionViewController:(id)a3 shouldCloseAnimated:(BOOL)a4;
- (void)inboxNewSectionViewController:(id)a3 viewCommentsForEvent:(id)a4;
- (void)inboxNewSectionViewController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5;
- (void)inboxRepliedSectionViewController:(id)a3 inspectEvent:(id)a4;
- (void)inboxWillDismiss;
- (void)loadView;
- (void)segmentedControlValueChanged:(id)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setSwitcherDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation InboxSwitcherViewController

- (InboxSwitcherViewController)initWithModel:(id)a3 destination:(unint64_t)a4
{
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)InboxSwitcherViewController;
  v8 = [(InboxSwitcherViewController *)&v22 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, a3);
    v9->_destination = a4;
    id v10 = objc_alloc((Class)UISegmentedControl);
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"New" value:&stru_1001D6918 table:0];
    v23[0] = v12;
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"Replied" value:&stru_1001D6918 table:0];
    v23[1] = v14;
    v15 = +[NSArray arrayWithObjects:v23 count:2];
    v16 = (UISegmentedControl *)[v10 initWithItems:v15];
    segmentedControl = v9->_segmentedControl;
    v9->_segmentedControl = v16;

    [(UISegmentedControl *)v9->_segmentedControl setSelectedSegmentIndex:0];
    [(UISegmentedControl *)v9->_segmentedControl addTarget:v9 action:"segmentedControlValueChanged:" forControlEvents:4096];
    [(UISegmentedControl *)v9->_segmentedControl sizeToFit];
    if (v9->_destination != 2)
    {
      v18 = v9->_segmentedControl;
      v19 = [(InboxSwitcherViewController *)v9 navigationItem];
      [v19 setTitleView:v18];
    }
    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v9 selector:"identityDidChange:" name:CUIKCalendarModelIdentityChangedNotification object:0];
  }
  return v9;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
  -[InboxNewSectionViewController setDestination:](self->_newSectionViewController, "setDestination:");
  [(InboxRepliedSectionViewController *)self->_repliedSectionViewController setDestination:a3];
  if (self->_destination == 2)
  {
    v5 = [(InboxSwitcherViewController *)self navigationItem];
    [v5 setTitleView:0];

    v6 = [(InboxSwitcherViewController *)self navigationItem];
    [v6 setTitle:0];

    id v7 = +[UIColor secondarySystemBackgroundColor];
    v8 = [(InboxRepliedSectionViewController *)self->_repliedSectionViewController tableView];
    [v8 setPreferredBackgroundColor:v7];

    +[UIColor secondarySystemBackgroundColor];
  }
  else
  {
    segmentedControl = self->_segmentedControl;
    id v10 = [(InboxSwitcherViewController *)self navigationItem];
    [v10 setTitleView:segmentedControl];

    v11 = +[UIColor systemBackgroundColor];
    v12 = [(InboxRepliedSectionViewController *)self->_repliedSectionViewController tableView];
    [v12 setPreferredBackgroundColor:v11];

    +[UIColor systemBackgroundColor];
  v13 = };
  v14 = [(InboxRepliedSectionViewController *)self->_repliedSectionViewController tableView];
  [v14 setBackgroundColor:v13];

  [(InboxSwitcherViewController *)self _setDoneButtonState];
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [v3 setAutoresizingMask:18];
  [(InboxSwitcherViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)InboxSwitcherViewController;
  [(InboxSwitcherViewController *)&v4 viewDidLoad];
  id v3 = [(InboxSwitcherViewController *)self _showViewControllerAtIndex:0];
  [(InboxSwitcherViewController *)self _setDoneButtonState];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)InboxSwitcherViewController;
  id v7 = a4;
  -[InboxSwitcherViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BF3F0;
  v8[3] = &unk_1001D2E40;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)_setDoneButtonState
{
  p_switcherDelegate = &self->_switcherDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_switcherDelegate);
    id v7 = [v6 inboxSwitcherViewControllerRightBarButtonItem:self];

    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Setting the following right bar button item our delegate returned: [%@]", (uint8_t *)&v10, 0xCu);
    }
    objc_super v9 = [(InboxSwitcherViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v7];
  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)InboxSwitcherViewController;
  -[InboxSwitcherViewController viewWillAppear:](&v6, "viewWillAppear:");
  char v5 = [(InboxSwitcherViewController *)self navigationController];
  [v5 setToolbarHidden:1 animated:1];

  [(UIViewController *)self->_currentViewController beginAppearanceTransition:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InboxSwitcherViewController;
  [(InboxSwitcherViewController *)&v4 viewDidAppear:a3];
  [(UIViewController *)self->_currentViewController endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)InboxSwitcherViewController;
  -[InboxSwitcherViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  [(UIViewController *)self->_currentViewController beginAppearanceTransition:0 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InboxSwitcherViewController;
  [(InboxSwitcherViewController *)&v4 viewDidDisappear:a3];
  [(UIViewController *)self->_currentViewController endAppearanceTransition];
}

- (CGSize)preferredContentSize
{
  [(UIViewController *)self->_currentViewController preferredContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)inboxNewSectionViewController:(id)a3 shouldCloseAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  p_switcherDelegate = &self->_switcherDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_switcherDelegate);
    [v8 inboxSwitcherViewController:self shouldCloseAnimated:v4];
  }
}

- (void)inboxNewSectionViewController:(id)a3 inspectEvent:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_switcherDelegate);
    [v6 inboxSwitcherViewController:self inspectEvent:v7];
  }
}

- (void)inboxNewSectionViewController:(id)a3 viewCommentsForEvent:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_switcherDelegate);
    [v6 inboxSwitcherViewController:self viewCommentsForEvent:v7];
  }
}

- (void)inboxNewSectionViewController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_switcherDelegate);
    [v9 inboxSwitcherViewController:self viewProposedTimeForAttendee:v10 onEvent:v7];
  }
}

- (void)attemptDisplayReviewPrompt
{
  p_switcherDelegate = &self->_switcherDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_switcherDelegate);
    [v5 attemptDisplayReviewPrompt];
  }
}

- (void)identityDidChange:(id)a3
{
}

- (void)inboxRepliedSectionViewController:(id)a3 inspectEvent:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_switcherDelegate);
    [v6 inboxSwitcherViewController:self inspectEvent:v7];
  }
}

- (id)showNewSection
{
  return [(InboxSwitcherViewController *)self _showViewControllerAtIndex:0];
}

- (id)showRepliedSection
{
  return [(InboxSwitcherViewController *)self _showViewControllerAtIndex:1];
}

- (void)inboxWillDismiss
{
  [(InboxNewSectionViewController *)self->_newSectionViewController inboxWillDismiss];
  repliedSectionViewController = self->_repliedSectionViewController;

  [(InboxRepliedSectionViewController *)repliedSectionViewController inboxWillDismiss];
}

- (void)segmentedControlValueChanged:(id)a3
{
  id v4 = [a3 selectedSegmentIndex];
  id v5 = [(InboxSwitcherViewController *)self _showViewControllerAtIndex:v4];
  CFStringRef v8 = @"section";
  id v6 = +[NSNumber numberWithInteger:v4];
  id v9 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  CalAnalyticsSendEvent();
}

- (id)_viewControllerForIndex:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v5 = 48;
    if (!self->_repliedSectionViewController)
    {
      v11 = [[InboxRepliedSectionViewController alloc] initWithModel:self->_model];
      repliedSectionViewController = self->_repliedSectionViewController;
      self->_repliedSectionViewController = v11;

      [(InboxRepliedSectionViewController *)self->_repliedSectionViewController setInboxRepliedSectionDelegate:self];
      [(InboxRepliedSectionViewController *)self->_repliedSectionViewController setDestination:self->_destination];
      CFStringRef v8 = kCalUILogHandle;
      if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      v13 = self->_repliedSectionViewController;
      int v19 = 138412290;
      int64_t v20 = (int64_t)v13;
      id v10 = "Generated the 'replied' section view controller: [%@]";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v19, 0xCu);
LABEL_10:
      if (self->_destination == 2)
      {
        v14 = +[UIColor secondarySystemBackgroundColor];
        v15 = [*(id *)((char *)&self->super.super.super.isa + v5) tableView];
        [v15 setPreferredBackgroundColor:v14];
      }
    }
LABEL_12:
    id v16 = *(id *)((char *)&self->super.super.super.isa + v5);
    goto LABEL_16;
  }
  if (!a3)
  {
    uint64_t v5 = 40;
    if (!self->_newSectionViewController)
    {
      id v6 = [[InboxNewSectionViewController alloc] initWithModel:self->_model];
      newSectionViewController = self->_newSectionViewController;
      self->_newSectionViewController = v6;

      [(InboxNewSectionViewController *)self->_newSectionViewController setInboxNewSectionDelegate:self];
      [(InboxNewSectionViewController *)self->_newSectionViewController setDestination:self->_destination];
      CFStringRef v8 = kCalUILogHandle;
      if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      id v9 = self->_newSectionViewController;
      int v19 = 138412290;
      int64_t v20 = (int64_t)v9;
      id v10 = "Generated the 'new' section view controller: [%@]";
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  v17 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    int v19 = 134217984;
    int64_t v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not find view controller for index: [%ld]", (uint8_t *)&v19, 0xCu);
  }
  id v16 = 0;
LABEL_16:

  return v16;
}

- (id)_showViewControllerAtIndex:(int64_t)a3
{
  id v4 = [(InboxSwitcherViewController *)self _viewControllerForIndex:a3];
  p_currentViewController = &self->_currentViewController;
  if (self->_currentViewController != v4)
  {
    id v6 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412290;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Preparing to show view controller: [%@]", (uint8_t *)&v17, 0xCu);
    }
    if (*p_currentViewController)
    {
      [(UIViewController *)*p_currentViewController beginAppearanceTransition:0 animated:0];
      id v7 = [(UIViewController *)*p_currentViewController view];
      [v7 removeFromSuperview];

      [(UIViewController *)*p_currentViewController endAppearanceTransition];
      [(UIViewController *)*p_currentViewController removeFromParentViewController];
    }
    [(InboxSwitcherViewController *)self addChildViewController:v4];
    [(UIViewController *)v4 didMoveToParentViewController:self];
    objc_storeStrong((id *)&self->_currentViewController, v4);
    CFStringRef v8 = [(InboxSwitcherViewController *)self view];
    id v9 = [(UIViewController *)v4 view];
    [v8 bounds];
    [v9 setFrame:];
    [v9 setAutoresizingMask:18];
    [(UIViewController *)v4 beginAppearanceTransition:1 animated:0];
    [v8 addSubview:v9];
    [(UIViewController *)v4 endAppearanceTransition];
    if (self->_destination == 2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v8;
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;
      v12 = v11;
      double v13 = 1.0;
      if (v11)
      {
        [v11 contentOffset];
        if (v14 != 0.0) {
          double v13 = 0.0;
        }
      }
      v15 = [(InboxSwitcherViewController *)self navigationItem];
      [v15 _setManualScrollEdgeAppearanceProgress:v13];
    }
    else
    {
      v12 = [(UIViewController *)v4 title];
      [(InboxSwitcherViewController *)self setTitle:v12];
    }
  }

  return v4;
}

- (InboxSwitcherViewControllerDelegate)switcherDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  return (InboxSwitcherViewControllerDelegate *)WeakRetained;
}

- (void)setSwitcherDelegate:(id)a3
{
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_switcherDelegate);
  objc_storeStrong((id *)&self->_repliedSectionViewController, 0);
  objc_storeStrong((id *)&self->_newSectionViewController, 0);
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end