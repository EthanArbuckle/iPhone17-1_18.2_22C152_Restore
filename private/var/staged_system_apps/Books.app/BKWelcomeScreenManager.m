@interface BKWelcomeScreenManager
+ (double)transitionDuration;
+ (id)sharedManager;
- (BKSlideTransition)defaultSlideAnimator;
- (BKWelcomeScreenManager)initWithItems:(id)a3 isRTL:(BOOL)a4;
- (BOOL)didShowWelcome;
- (BOOL)moreScreensComing;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BSUIWelcomeScreenItem)currentItem;
- (CGSize)preferredContentSizeForNavigationController:(id)a3;
- (NSArray)items;
- (NSMapTable)viewControllers;
- (NSString)tabIdentifierToShow;
- (UINavigationController)navigationController;
- (UIViewController)lastViewController;
- (double)transitionDuration:(id)a3;
- (id)completion;
- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4;
- (id)nextItemHavingWelcomeScreenToShow;
- (id)nextItemHavingWelcomeScreenToShowAfterItem:(id)a3;
- (id)welcomeScreenViewControllerFromItem:(id)a3;
- (void)_presentTheNextViewController;
- (void)_sequenceFinished;
- (void)_setupViewControllers;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)dealloc;
- (void)finishCurrentItem;
- (void)runWithCompletion:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDefaultSlideAnimator:(id)a3;
- (void)setTabIdentifierToShow:(id)a3;
@end

@implementation BKWelcomeScreenManager

- (void)_sequenceFinished
{
  v3 = BSUIWelcomeScreenLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_sequenceFinished", v7, 2u);
  }

  v4 = [(BKWelcomeScreenManager *)self completion];

  if (v4)
  {
    uint64_t v5 = [(BKWelcomeScreenManager *)self completion];
    v6 = [(BKWelcomeScreenManager *)self tabIdentifierToShow];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    uint64_t v5 = BSUIWelcomeScreenLog();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1007ED740((os_log_t)v5);
    }
  }
}

- (id)completion
{
  return self->_completion;
}

- (NSString)tabIdentifierToShow
{
  return self->_tabIdentifierToShow;
}

- (void)setCompletion:(id)a3
{
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BSUIWelcomeScreenLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "runWithCompletion: Start", buf, 2u);
  }

  if (v4)
  {
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_100078B08;
    v10 = &unk_100A48AA8;
    v11 = self;
    id v12 = v4;
    v6 = self;
    [(BKWelcomeScreenManager *)v6 setCompletion:&v7];
    [(BKWelcomeScreenManager *)v6 _setupViewControllers];
  }
}

- (id)nextItemHavingWelcomeScreenToShow
{
  v3 = +[UIApplication sharedApplication];
  unsigned __int8 v4 = [v3 launchedToTest];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    v6 = [(BKWelcomeScreenManager *)self currentItem];
    uint64_t v5 = [(BKWelcomeScreenManager *)self nextItemHavingWelcomeScreenToShowAfterItem:v6];
  }

  return v5;
}

- (BKWelcomeScreenManager)initWithItems:(id)a3 isRTL:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BKWelcomeScreenManager;
  v7 = [(BKWelcomeScreenManager *)&v18 init];
  if (v7)
  {
    uint64_t v8 = (NSArray *)[v6 copy];
    items = v7->_items;
    v7->_items = v8;

    uint64_t v10 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
    viewControllers = v7->_viewControllers;
    v7->_viewControllers = (NSMapTable *)v10;

    currentItem = v7->_currentItem;
    v7->_currentItem = 0;

    uint64_t v13 = +[BKSlideTransition transitionWithDirection:!v4];
    defaultSlideAnimator = v7->_defaultSlideAnimator;
    v7->_defaultSlideAnimator = (BKSlideTransition *)v13;

    tabIdentifierToShow = v7->_tabIdentifierToShow;
    v7->_tabIdentifierToShow = 0;

    lastViewController = v7->_lastViewController;
    v7->_lastViewController = 0;

    objc_storeWeak(&qword_100B4A520, v7);
  }

  return v7;
}

- (BOOL)didShowWelcome
{
  return self->_didShowWelcome;
}

- (void)dealloc
{
  id completion = self->_completion;
  self->_id completion = 0;

  v4.receiver = self;
  v4.super_class = (Class)BKWelcomeScreenManager;
  [(BKWelcomeScreenManager *)&v4 dealloc];
}

- (void)_setupViewControllers
{
  v3 = [(BKWelcomeScreenManager *)self nextItemHavingWelcomeScreenToShow];
  if (v3)
  {
    objc_storeStrong((id *)&self->_currentItem, v3);
    objc_super v4 = [(BKWelcomeScreenManager *)self welcomeScreenViewControllerFromItem:v3];
    uint64_t v5 = BSUIWelcomeScreenLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_setupViewControllers: showing: %{public}@", buf, 0xCu);
    }

    id v6 = [(BKWelcomeScreenManager *)self navigationController];
    [v6 setNavigationBarHidden:[v3 welcomeScreenShouldDisplayNavigationBar] ^ 1 animated:0];

    v7 = [(BKWelcomeScreenManager *)self navigationController];
    uint64_t v10 = v4;
    uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];
    [v7 setViewControllers:v8 animated:0];

    v9 = [(BKWelcomeScreenManager *)self navigationController];
    [v9 setNeedsUpdateOfSupportedInterfaceOrientations];

    self->_didShowWelcome = 1;
  }
  else
  {
    self->_didShowWelcome = 0;
    [(BKWelcomeScreenManager *)self _sequenceFinished];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabIdentifierToShow, 0);
  objc_storeStrong((id *)&self->_lastViewController, 0);
  objc_storeStrong((id *)&self->_defaultSlideAnimator, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_navigationController, 0);
}

+ (id)sharedManager
{
  id WeakRetained = objc_loadWeakRetained(&qword_100B4A520);

  return WeakRetained;
}

- (UINavigationController)navigationController
{
  navigationController = self->_navigationController;
  if (!navigationController)
  {
    objc_super v4 = objc_alloc_init(BKUpgradeViewController);
    uint64_t v5 = [[BKWelcomeNavigationController alloc] initWithRootViewController:v4];
    [(BKWelcomeNavigationController *)v5 setDelegate:self];
    [(BKWelcomeNavigationController *)v5 setBkDelegate:self];
    [(BKWelcomeNavigationController *)v5 setModalPresentationStyle:2];
    [(BKWelcomeNavigationController *)v5 setModalTransitionStyle:2];
    id v6 = [(BKWelcomeNavigationController *)v5 presentationController];
    [v6 setDelegate:self];

    [(BKWelcomeNavigationController *)v5 setNavigationBarHidden:1 animated:0];
    id v7 = objc_alloc_init((Class)UINavigationBarAppearance);
    [v7 configureWithTransparentBackground];
    uint64_t v8 = [(BKWelcomeNavigationController *)v5 navigationBar];
    [v8 setStandardAppearance:v7];

    v9 = self->_navigationController;
    self->_navigationController = &v5->super;

    navigationController = self->_navigationController;
  }

  return navigationController;
}

- (id)nextItemHavingWelcomeScreenToShowAfterItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKWelcomeScreenManager *)self items];
  id v6 = [v5 indexOfObjectIdenticalTo:v4];

  id v7 = [(BKWelcomeScreenManager *)self items];
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    while (1)
    {
      if (v6 == (id)0x7FFFFFFFFFFFFFFFLL || v9 > (unint64_t)v6)
      {
        v11 = [(BKWelcomeScreenManager *)self items];
        id v12 = [v11 objectAtIndexedSubscript:v9];
        unsigned int v13 = [v12 welcomeScreenShouldShow];

        if (v13) {
          break;
        }
      }
      ++v9;
      v14 = [(BKWelcomeScreenManager *)self items];
      id v15 = [v14 count];

      if (v9 >= (unint64_t)v15) {
        goto LABEL_10;
      }
    }
    v17 = [(BKWelcomeScreenManager *)self items];
    v16 = [v17 objectAtIndexedSubscript:v9];
  }
  else
  {
LABEL_10:
    v16 = 0;
  }

  return v16;
}

- (BOOL)moreScreensComing
{
  v2 = [(BKWelcomeScreenManager *)self nextItemHavingWelcomeScreenToShow];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_presentTheNextViewController
{
  BOOL v3 = [(BKWelcomeScreenManager *)self nextItemHavingWelcomeScreenToShow];
  if (v3)
  {
    id v4 = [(BKWelcomeScreenManager *)self welcomeScreenViewControllerFromItem:v3];
    uint64_t v5 = [(BKWelcomeScreenManager *)self navigationController];
    id v6 = [v5 topViewController];
    lastViewController = self->_lastViewController;
    self->_lastViewController = v6;

    id v8 = BSUIWelcomeScreenLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_presentTheNextViewController: showing: %{public}@", buf, 0xCu);
    }

    unint64_t v9 = [(BKWelcomeScreenManager *)self navigationController];
    [v9 setNavigationBarHidden:[v3 welcomeScreenShouldDisplayNavigationBar] ^ 1 animated:1];

    uint64_t v10 = [(BKWelcomeScreenManager *)self navigationController];
    unsigned int v13 = v4;
    v11 = +[NSArray arrayWithObjects:&v13 count:1];
    [v10 setViewControllers:v11 animated:1];

    id v12 = [(BKWelcomeScreenManager *)self navigationController];
    [v12 setNeedsUpdateOfSupportedInterfaceOrientations];
  }
  else
  {
    [(BKWelcomeScreenManager *)self finishCurrentItem];
    [(BKWelcomeScreenManager *)self _sequenceFinished];
  }
}

- (id)welcomeScreenViewControllerFromItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKWelcomeScreenManager *)self viewControllers];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    objc_initWeak(&location, self);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    unsigned int v13 = sub_10016DF1C;
    v14 = &unk_100A465F0;
    objc_copyWeak(&v15, &location);
    id v6 = [v4 welcomeScreenViewControllerWithCompletion:&v11];
    if (objc_opt_respondsToSelector())
    {
      id v7 = -[BKWelcomeScreenManager nextItemHavingWelcomeScreenToShowAfterItem:](self, "nextItemHavingWelcomeScreenToShowAfterItem:", v4, v11, v12, v13, v14);
      BOOL v8 = v7 == 0;

      [v4 welcomeScreenViewController:v6 configureWithLastScreen:v8];
    }
    [v6 setModalPresentationStyle:2 v11, v12, v13, v14];
    unint64_t v9 = [(BKWelcomeScreenManager *)self viewControllers];
    [v9 setObject:v6 forKey:v4];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)finishCurrentItem
{
  if (objc_opt_respondsToSelector()) {
    [(BSUIWelcomeScreenItem *)self->_currentItem welcomeScreenViewControllerDidDismiss];
  }
  BOOL v3 = [(BKWelcomeScreenManager *)self nextItemHavingWelcomeScreenToShow];
  currentItem = self->_currentItem;
  self->_currentItem = v3;

  lastViewController = self->_lastViewController;
  self->_lastViewController = 0;
}

+ (double)transitionDuration
{
  return 0.3;
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v4 = [(BKWelcomeScreenManager *)self lastViewController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 interactionController];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (double)transitionDuration:(id)a3
{
  +[BKWelcomeScreenManager transitionDuration];
  return result;
}

- (void)animateTransition:(id)a3
{
  id v6 = a3;
  id v4 = [v6 viewControllerForKey:UITransitionContextFromViewControllerKey];
  if (objc_opt_respondsToSelector())
  {
    [v4 animateTransition:v6];
  }
  else
  {
    uint64_t v5 = [(BKWelcomeScreenManager *)self defaultSlideAnimator];
    [v5 animateTransition:v6];
  }
}

- (void)animationEnded:(BOOL)a3
{
  if (a3) {
    [(BKWelcomeScreenManager *)self finishCurrentItem];
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (CGSize)preferredContentSizeForNavigationController:(id)a3
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(BKWelcomeScreenManager *)self items];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 welcomeScreenShouldShow])
        {
          uint64_t v12 = [(BKWelcomeScreenManager *)self welcomeScreenViewControllerFromItem:v11];
          [v12 preferredContentSize];
          if (width < v13) {
            double width = v13;
          }
          if (height < v14) {
            double height = v14;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  double v15 = width;
  double v16 = height;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (NSArray)items
{
  return self->_items;
}

- (NSMapTable)viewControllers
{
  return self->_viewControllers;
}

- (BSUIWelcomeScreenItem)currentItem
{
  return self->_currentItem;
}

- (BKSlideTransition)defaultSlideAnimator
{
  return self->_defaultSlideAnimator;
}

- (void)setDefaultSlideAnimator:(id)a3
{
}

- (UIViewController)lastViewController
{
  return self->_lastViewController;
}

- (void)setTabIdentifierToShow:(id)a3
{
}

@end