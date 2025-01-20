@interface InboxViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)canDismiss;
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons;
- (BOOL)prefersForcedModalShowViewController;
- (CGSize)preferredContentSize;
- (InboxSwitcherViewController)switcherViewController;
- (InboxViewController)initWithModel:(id)a3 destination:(unint64_t)a4;
- (InboxViewControllerDelegate)delegate;
- (id)displayedDetailViewControllers;
- (id)doneBlock;
- (id)inboxSwitcherViewControllerRightBarButtonItem:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissMessagesViewController;
- (void)_dismissMessagesViewControllerWithCompletion:(id)a3;
- (void)_inspectEvent:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 proposedTimeAttendee:(id)a6;
- (void)_pushDetailViewControllerForEvent:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 proposedTimeAttendee:(id)a6;
- (void)attemptDisplayReviewPrompt;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)inboxSwitcherViewController:(id)a3 inspectEvent:(id)a4;
- (void)inboxSwitcherViewController:(id)a3 shouldCloseAnimated:(BOOL)a4;
- (void)inboxSwitcherViewController:(id)a3 viewCommentsForEvent:(id)a4;
- (void)inboxSwitcherViewController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setDoneBlock:(id)a3;
- (void)showEvent:(id)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation InboxViewController

- (InboxViewController)initWithModel:(id)a3 destination:(unint64_t)a4
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)InboxViewController;
  v9 = [(InboxViewController *)&v12 initWithNibName:0 bundle:0];
  if (v9)
  {
    if (!v8)
    {
      v11 = +[NSAssertionHandler currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"InboxViewController.m", 52, @"Invalid parameter not satisfying: %@", @"model != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_model, a3);
    v9->_destination = a4;
  }

  return v9;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(InboxViewController *)self view];
  int IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();

  if (IsRegularInViewHierarchy) {
    return 30;
  }
  else {
    return 2;
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
  v3 = [[InboxSwitcherViewController alloc] initWithModel:self->_model destination:self->_destination];
  switcherViewController = self->_switcherViewController;
  self->_switcherViewController = v3;

  [(InboxSwitcherViewController *)self->_switcherViewController setSwitcherDelegate:self];
  v5 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
  embeddedNavigationController = self->_embeddedNavigationController;
  self->_embeddedNavigationController = v5;

  [(UINavigationController *)self->_embeddedNavigationController pushViewController:self->_switcherViewController animated:0];
  [(InboxViewController *)self addChildViewController:self->_embeddedNavigationController];
  [(UINavigationController *)self->_embeddedNavigationController didMoveToParentViewController:self];
  id v8 = objc_alloc_init(InboxView);
  v7 = [(UINavigationController *)self->_embeddedNavigationController view];
  [(InboxView *)v8 addSubview:v7];

  [(InboxViewController *)self setView:v8];
}

- (CGSize)preferredContentSize
{
  [(UINavigationController *)self->_embeddedNavigationController preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)InboxViewController;
  [(InboxViewController *)&v9 viewDidAppear:a3];
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear", buf, 0xCu);
  }
  if (+[ApplicationTester testingSessionStarted])
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"InboxViewController_ViewDidAppearNotification" object:self];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)InboxViewController;
  [(InboxViewController *)&v8 viewDidDisappear:a3];
  if (self->_wantsDisplayReviewPrompt)
  {
    self->_wantsDisplayReviewPrompt = 0;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      [v7 attemptDisplayReviewPrompt];
    }
  }
}

- (void)viewWillLayoutSubviews
{
  id v12 = [(InboxViewController *)self view];
  [v12 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UINavigationController *)self->_embeddedNavigationController view];
  [v11 setFrame:v4, v6, v8, v10];
}

- (BOOL)prefersForcedModalShowViewController
{
  return 1;
}

- (id)displayedDetailViewControllers
{
  double v2 = [(UINavigationController *)self->_embeddedNavigationController viewControllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    double v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v9 = +[NSMutableArray array];

          double v5 = (void *)v9;
        }
        if (v5) {
          [v5 addObject:v8];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)inboxSwitcherViewController:(id)a3 shouldCloseAnimated:(BOOL)a4
{
}

- (void)_inspectEvent:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 proposedTimeAttendee:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  long long v12 = [(InboxViewController *)self view];
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy())
  {

LABEL_8:
    [(InboxViewController *)self _pushDetailViewControllerForEvent:v10 animated:v8 showComments:v7 proposedTimeAttendee:v11];
    goto LABEL_9;
  }
  long long v13 = [(InboxViewController *)self view];
  int IsCompact = EKUICurrentHeightSizeClassIsCompact();

  if (IsCompact) {
    goto LABEL_8;
  }
  if ([v10 participationStatus] == (id)3)
  {
    v15 = [(CUIKCalendarModel *)self->_model eventStore];
    unsigned __int8 v16 = [v15 showDeclinedEvents];

    if ((v16 & 1) == 0)
    {
      [(UINavigationController *)self->_embeddedNavigationController _setClipUnderlapWhileTransitioning:1];
      goto LABEL_8;
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004C6DC;
  v17[3] = &unk_1001D2F60;
  v17[4] = self;
  id v18 = v10;
  BOOL v19 = v8;
  BOOL v20 = v7;
  [(InboxViewController *)self _dismissMessagesViewControllerWithCompletion:v17];

LABEL_9:
}

- (void)inboxSwitcherViewController:(id)a3 inspectEvent:(id)a4
{
}

- (void)inboxSwitcherViewController:(id)a3 viewCommentsForEvent:(id)a4
{
}

- (void)inboxSwitcherViewController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5
{
}

- (id)inboxSwitcherViewControllerRightBarButtonItem:(id)a3
{
  if (self->_destination) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismissMessagesViewController"];
  }

  return v3;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  [a3 setDelegate:0, a4];
  id v5 = [(UINavigationController *)self->_embeddedNavigationController popViewControllerAnimated:1];
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 0;
}

- (void)attemptDisplayReviewPrompt
{
  self->_wantsDisplayReviewPrompt = 1;
}

- (BOOL)canDismiss
{
  return 1;
}

- (InboxSwitcherViewController)switcherViewController
{
  return self->_switcherViewController;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4
{
}

- (void)_pushDetailViewControllerForEvent:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 proposedTimeAttendee:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  long long v12 = [v10 calendar];
  id v13 = [v12 type];

  if (v13 != (id)4) {
    goto LABEL_3;
  }
  long long v14 = +[CalContactsProvider defaultProvider];
  v15 = [v10 birthdayContactIdentifier];
  unsigned __int8 v16 = +[CNContactViewController descriptorForRequiredKeys];
  v22 = v16;
  v17 = +[NSArray arrayWithObjects:&v22 count:1];
  id v18 = [v14 unifiedContactWithIdentifier:v15 keysToFetch:v17];

  id v19 = +[CNContactViewController viewControllerForContact:v18];
  BOOL v20 = +[CalContactsProvider defaultProvider];
  v21 = [v20 contactStore];
  [v19 setContactStore:v21];

  [v19 setShouldShowLinkedContacts:1];
  [v19 setDisplayMode:1];
  [v19 setActions:[v19 actions] | 0x400];
  [v19 setAllowsEditing:0];

  if (!v19)
  {
LABEL_3:
    if (v11)
    {
      id v19 = [objc_alloc((Class)EKUIProposedTimeEventViewController) initWithProposedTimeAttendee:v11];
      [v19 setEvent:v10];
      [v19 setDelegate:self];
      BOOL v8 = 1;
    }
    else
    {
      id v19 = (id)objc_opt_new();
      BOOL v8 = 1;
      [v19 setCalendarPreviewIsInlineDayView:1];
      [v19 setEvent:v10];
      [v19 setAllowsEditing:1];
      [v19 setDelegate:self];
      [v19 setAllowsCalendarPreview:1];
      [v19 setShowsDetectedConferenceItem:1];
    }
  }
  [(UINavigationController *)self->_embeddedNavigationController pushViewController:v19 animated:v8];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v19 openAttendeesDetailItem];
    }
  }
}

- (void)_dismissMessagesViewController
{
}

- (void)_dismissMessagesViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(InboxViewController *)self view];
  [v5 endEditing:1];

  [(InboxSwitcherViewController *)self->_switcherViewController inboxWillDismiss];
  id v6 = [(UINavigationController *)self->_embeddedNavigationController popViewControllerAnimated:0];
  if (v4)
  {
    self->_wantsDisplayReviewPrompt = 0;
    BOOL v7 = [(InboxViewController *)self presentingViewController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004CC70;
    v10[3] = &unk_1001D2F88;
    v10[4] = self;
    id v11 = v4;
    [v7 dismissViewControllerAnimated:0 completion:v10];
  }
  else
  {
    BOOL v8 = [(InboxViewController *)self doneBlock];

    if (v8)
    {
      uint64_t v9 = [(InboxViewController *)self doneBlock];
      ((void (**)(void, InboxViewController *, void))v9)[2](v9, self, 0);
    }
  }
}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
}

- (InboxViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (InboxViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_doneBlock, 0);
  objc_storeStrong((id *)&self->_switcherViewController, 0);
  objc_storeStrong((id *)&self->_embeddedNavigationController, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end