@interface MainViewController
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)canManagePresentationStyle;
- (BOOL)disableRotationTimings;
- (BOOL)eventViewControllerShowsInlinePreview;
- (BOOL)handlesNotifyOnExtendedLaunchCompletion;
- (BOOL)isDateVisible:(id)a3;
- (BOOL)performModalDialogsIfNeededWithContinue:(id)a3;
- (BOOL)prefersShowingViewControllersOnNavigationStack;
- (BOOL)requiresSelfAsEventEditorDelegate;
- (BOOL)shouldAdaptEventViewControllers;
- (BOOL)shouldInvalidateManagedNavigationControllerOnPresentationDismissal;
- (BOOL)shouldJournalMainViewControllerParent;
- (BOOL)shouldModallyPresentFirstShownViewController;
- (BOOL)wantsManagement;
- (CUIKCalendarModel)model;
- (Class)managedNavigationControllerType;
- (MainViewController)initWithWindow:(id)a3 model:(id)a4;
- (UINavigationController)managedNavigationController;
- (UIWindow)window;
- (id)EKUI_viewHierarchy;
- (id)_shownViewControllerWithClass:(Class)a3;
- (id)augmentEventDetailsContext:(id)a3;
- (id)existingPalette;
- (id)preferredPreSizeClassTransitionSelectedDate;
- (id)sceneTitle;
- (id)shownContactViewController;
- (id)shownEventEditViewController;
- (id)shownEventViewController;
- (id)shownExpandedReminderStackViewController;
- (id)targetViewControllerForAction:(SEL)a3 sender:(id)a4;
- (id)testingRotationDidEndNotificationName;
- (id)testingRotationWillStartNotificationName;
- (int64_t)intendedSizeClass;
- (void)_setManagedNavigationControllerModalPresentationDelegates;
- (void)attemptDisplayReviewPrompt;
- (void)dealloc;
- (void)extendedLaunchCompletedByViewType:(int)a3;
- (void)invalidateManagedNavigationController;
- (void)reconfigureViewController:(id)a3;
- (void)selectDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
- (void)setDisableRotationTimings:(BOOL)a3;
- (void)setSceneTitleNeedsUpdate;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionToSizeDidEnd;
- (void)transitionToSizeWillStart;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MainViewController

- (void)extendedLaunchCompletedByViewType:(int)a3
{
  if (a3 >= 5) {
    *(void *)&a3 = -1;
  }
  else {
    uint64_t v4 = a3;
  }
  v5 = +[NSNumber numberWithInteger:*(void *)&a3];
  id v7 = +[NSDictionary dictionaryWithObject:v5 forKey:@"_MainViewControllerExtendedLaunchDidCompleteNotification_CalendarContentViewType_Key"];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"MainViewControllerDidCompleteExtendedLaunchNotification" object:self userInfo:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MainViewController;
  [(MainViewController *)&v5 viewDidAppear:a3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009B20;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(MainViewController *)self setSceneTitleNeedsUpdate];
}

- (void)setSceneTitleNeedsUpdate
{
  if (EKUIDeviceCanTransform())
  {
    v3 = [(MainViewController *)self window];
    id v5 = [v3 windowScene];

    if (v5)
    {
      uint64_t v4 = +[NSNotificationCenter defaultCenter];
      [v4 postNotificationName:@"_CalendarWindowSceneTitleRequiresUpdateNotification" object:v5];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  if (a3)
  {
    [(MainViewController *)self setEkui_futureTraitCollection:0];
  }
  else
  {
    v6 = [(MainViewController *)self parentViewController];
    id v7 = [v6 ekui_futureTraitCollection];
    [(MainViewController *)self setEkui_futureTraitCollection:v7];

    v8 = [(MainViewController *)self parentViewController];
    v9 = [v8 ekui_futureTraitCollection];
    [(MainViewController *)self setupUIForTraitCollection:v9];
  }
  v10.receiver = self;
  v10.super_class = (Class)MainViewController;
  [(MainViewController *)&v10 traitCollectionDidChange:v5];
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  return (UIWindow *)WeakRetained;
}

- (id)shownEventEditViewController
{
  v3 = [(MainViewController *)self viewControllerToShowFrom];
  uint64_t v4 = [v3 presentedViewController];

  if (!v4)
  {
    uint64_t v4 = [(MainViewController *)self presentedViewController];
  }
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___EKEventOrIntegrationEditView]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)targetViewControllerForAction:(SEL)a3 sender:(id)a4
{
  if (NSSelectorFromString(@"showViewController:sender:animated:completion:") == a3
    || "showViewController:sender:" == a3)
  {
    if ([(MainViewController *)self prefersShowingViewControllersOnNavigationStack])
    {
      goto LABEL_9;
    }
    uint64_t v7 = [(MainViewController *)self ekui_futureTraitCollection];
    if (!v7
      || (v8 = (void *)v7,
          [(MainViewController *)self ekui_futureTraitCollection],
          v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 horizontalSizeClass],
          v9,
          v8,
          v10 == (id)1))
    {
LABEL_9:
      v11 = [(MainViewController *)self navigationController];
    }
    else
    {
      v11 = [(MainViewController *)self managedNavigationController];
    }
  }
  else
  {
    v11 = self;
  }

  return v11;
}

- (BOOL)prefersShowingViewControllersOnNavigationStack
{
  return 0;
}

- (MainViewController)initWithWindow:(id)a3 model:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MainViewController;
  v8 = [(MainViewController *)&v14 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    if (!v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v8->_window);
      v11 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v11);
      EKUIMultiwindowAssert();
    }
    objc_storeWeak((id *)&v9->_window, v6);
    objc_storeStrong((id *)&v9->_model, a4);
  }

  return v9;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)dealloc
{
  [(EnqueueableManagedNavigationController *)self->_managedNavigationController setSourceViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)MainViewController;
  [(MainViewController *)&v3 dealloc];
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)shouldModallyPresentFirstShownViewController
{
  v2 = [(MainViewController *)self ekui_futureTraitCollection];
  BOOL v3 = [v2 horizontalSizeClass] == (id)2;

  return v3;
}

- (Class)managedNavigationControllerType
{
  return (Class)objc_opt_class();
}

- (UINavigationController)managedNavigationController
{
  managedNavigationController = self->_managedNavigationController;
  if (!managedNavigationController)
  {
    uint64_t v4 = (EnqueueableManagedNavigationController *)objc_alloc_init([(MainViewController *)self managedNavigationControllerType]);
    id v5 = self->_managedNavigationController;
    self->_managedNavigationController = v4;

    id v6 = +[UIColor systemBackgroundColor];
    id v7 = [(EnqueueableManagedNavigationController *)self->_managedNavigationController view];
    [v7 setBackgroundColor:v6];

    [(EnqueueableManagedNavigationController *)self->_managedNavigationController setDefinesPresentationContext:1];
    [(EnqueueableManagedNavigationController *)self->_managedNavigationController setSourceViewController:self];
    [(MainViewController *)self _setManagedNavigationControllerModalPresentationDelegates];
    managedNavigationController = self->_managedNavigationController;
  }

  return (UINavigationController *)managedNavigationController;
}

- (void)_setManagedNavigationControllerModalPresentationDelegates
{
  if ([(MainViewController *)self shouldModallyPresentFirstShownViewController])
  {
    BOOL v3 = self;
  }
  else
  {
    BOOL v3 = 0;
  }
  managedNavigationController = self->_managedNavigationController;

  [(EnqueueableManagedNavigationController *)managedNavigationController setModalPresentationDelegate:v3];
}

- (BOOL)shouldAdaptEventViewControllers
{
  return 1;
}

- (BOOL)shouldJournalMainViewControllerParent
{
  return 1;
}

- (void)invalidateManagedNavigationController
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CF21C;
  v6[3] = &unk_1001D2740;
  v6[4] = self;
  BOOL v3 = objc_retainBlock(v6);
  [(MainViewController *)self managedNavigationControllerWillBeInvalidated];
  uint64_t v4 = [(MainViewController *)self presentedViewController];
  unsigned int v5 = [v4 isEqual:self->_managedNavigationController];

  if (v5) {
    [(MainViewController *)self dismissViewControllerAnimated:0 completion:v3];
  }
  else {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (BOOL)shouldInvalidateManagedNavigationControllerOnPresentationDismissal
{
  return 1;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MainViewController *)self traitCollection];
  id v9 = [v8 horizontalSizeClass];
  if (v9 != [v6 horizontalSizeClass])
  {
    [(MainViewController *)self setEkui_futureTraitCollection:v6];
    goto LABEL_5;
  }
  id v10 = [v8 verticalSizeClass];
  id v11 = [v6 verticalSizeClass];
  [(MainViewController *)self setEkui_futureTraitCollection:v6];
  if (v10 != v11)
  {
LABEL_5:
    [(MainViewController *)self invalidateManagedNavigationController];
    v12.receiver = self;
    v12.super_class = (Class)MainViewController;
    [(MainViewController *)&v12 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
    [(MainViewController *)self setupUIForTraitCollection:v6];
    goto LABEL_6;
  }
  v12.receiver = self;
  v12.super_class = (Class)MainViewController;
  [(MainViewController *)&v12 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
LABEL_6:
}

- (id)shownContactViewController
{
  uint64_t v3 = objc_opt_class();

  return [(MainViewController *)self _shownViewControllerWithClass:v3];
}

- (id)shownExpandedReminderStackViewController
{
  uint64_t v3 = objc_opt_class();

  return [(MainViewController *)self _shownViewControllerWithClass:v3];
}

- (id)shownEventViewController
{
  uint64_t v3 = objc_opt_class();

  return [(MainViewController *)self _shownViewControllerWithClass:v3];
}

- (id)_shownViewControllerWithClass:(Class)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  objc_super v12 = sub_1000CF5E0;
  v13 = sub_1000CF5F0;
  id v14 = 0;
  uint64_t v4 = [(MainViewController *)self viewControllerToShowFrom];
  unsigned int v5 = [v4 viewControllers];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CF5F8;
  v8[3] = &unk_1001D4CB0;
  v8[4] = &v9;
  v8[5] = a3;
  [v5 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)performModalDialogsIfNeededWithContinue:(id)a3
{
  return 0;
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  if ([v12 prefersForcedModalShowViewController])
  {
    id v13 = [(MainViewController *)self presentationStyleOverrideForChildViewControllers];
    if (v13 != (id)-1)
    {
      id v14 = v13;
      v15 = [(MainViewController *)self viewControllerToShowFrom];
      [v15 setModalPresentationStyle:v14];
    }
  }
  id v16 = [(MainViewController *)self viewControllerToShowFrom];
  [v16 showViewController:v12 sender:v11 animated:v6 completion:v10];
}

- (id)augmentEventDetailsContext:(id)a3
{
  if (a3)
  {
    uint64_t v4 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
    [v4 setObject:&__kCFBooleanTrue forKey:EKUIEventDetailsContext_AllowsConferenceItem];
    [v4 setObject:self->_model forKey:EKUIEventDetailsContext_ModelKey];
  }
  else
  {
    v7[0] = EKUIEventDetailsContext_AllowsConferenceItem;
    v7[1] = EKUIEventDetailsContext_ModelKey;
    model = self->_model;
    v8[0] = &__kCFBooleanTrue;
    v8[1] = model;
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  }

  return v4;
}

- (BOOL)eventViewControllerShowsInlinePreview
{
  return 1;
}

- (void)reconfigureViewController:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [(MainViewController *)self eventViewControllerShowsInlinePreview];
    id v5 = v6;
    [v5 setAllowsCalendarPreview:v4];
    [v5 setCalendarPreviewIsInlineDayView:v4];
  }
}

- (BOOL)handlesNotifyOnExtendedLaunchCompletion
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MainViewController;
  -[MainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ([(MainViewController *)self isViewLoaded])
  {
    v8 = [(MainViewController *)self view];
    uint64_t v9 = [v8 window];

    if (v9)
    {
      if (![(MainViewController *)self disableRotationTimings]) {
        [(MainViewController *)self transitionToSizeWillStart];
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000CFA2C;
      v10[3] = &unk_1001D2E40;
      v10[4] = self;
      [v7 animateAlongsideTransition:0 completion:v10];
    }
  }
}

- (void)transitionToSizeWillStart
{
  uint64_t v3 = [(MainViewController *)self testingRotationWillStartNotificationName];
  if (v3 && +[ApplicationTester testingSessionStarted])
  {
    BOOL v4 = +[UIApplication sharedApplication];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000CFB44;
    v5[3] = &unk_1001D28A8;
    id v6 = v3;
    id v7 = self;
    [v4 installCACommitCompletionBlock:v5];
  }
}

- (void)transitionToSizeDidEnd
{
  uint64_t v3 = [(MainViewController *)self testingRotationDidEndNotificationName];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = +[ApplicationTester testingSessionStarted];
    uint64_t v4 = v6;
    if (v3)
    {
      id v5 = +[NSNotificationCenter defaultCenter];
      [v5 postNotificationName:v6 object:self];

      uint64_t v4 = v6;
    }
  }

  _objc_release_x1(v3, v4);
}

- (id)testingRotationWillStartNotificationName
{
  return 0;
}

- (id)testingRotationDidEndNotificationName
{
  return 0;
}

- (id)EKUI_viewHierarchy
{
  p_window = &self->_window;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  uint64_t v4 = objc_loadWeakRetained((id *)p_window);
  if (!WeakRetained)
  {
    id v5 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v5);
    EKUIMultiwindowAssert();

    uint64_t v4 = EKUIMainWindowForMultiwindowError();
  }

  return v4;
}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  return 0;
}

- (id)existingPalette
{
  uint64_t v3 = [(MainViewController *)self navigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(MainViewController *)self navigationController];
    uint64_t v6 = [v5 paletteView];
    id v7 = [v6 containingPalette];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)selectDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5
{
}

- (BOOL)isDateVisible:(id)a3
{
  return 0;
}

- (id)sceneTitle
{
  return 0;
}

- (BOOL)requiresSelfAsEventEditorDelegate
{
  return 0;
}

- (void)attemptDisplayReviewPrompt
{
  id v5 = [(MainViewController *)self window];
  uint64_t v3 = [v5 windowScene];
  uint64_t v4 = [(MainViewController *)self model];
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:v3 calendarModel:v4];
}

- (BOOL)disableRotationTimings
{
  return self->_disableRotationTimings;
}

- (void)setDisableRotationTimings:(BOOL)a3
{
  self->_disableRotationTimings = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_managedNavigationController, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  sub_100037858();

  NSRequestConcreteImplementation();
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  sub_100037858();

  NSRequestConcreteImplementation();
}

- (int64_t)intendedSizeClass
{
  return 0;
}

@end