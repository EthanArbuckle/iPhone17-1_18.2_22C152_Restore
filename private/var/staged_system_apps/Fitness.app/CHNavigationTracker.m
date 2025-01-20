@interface CHNavigationTracker
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (CHNavigationTracker)initWithTabBarController:(id)a3 fitnessAppContext:(id)a4;
- (UITabBarController)tabBarController;
- (id)_viewControllerAtIndex:(int64_t)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
@end

@implementation CHNavigationTracker

- (CHNavigationTracker)initWithTabBarController:(id)a3 fitnessAppContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHNavigationTracker;
  v9 = [(CHNavigationTracker *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabBarController, a3);
    [(UITabBarController *)v10->_tabBarController setDelegate:v10];
    v10->_tabIndexBeingDeselected = -1;
    objc_storeStrong((id *)&v10->_fitnessAppContext, a4);
  }

  return v10;
}

- (id)_viewControllerAtIndex:(int64_t)a3
{
  if (a3 < 0
    || ([(UITabBarController *)self->_tabBarController viewControllers],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        (unint64_t)v6 <= a3))
  {
    id v8 = 0;
  }
  else
  {
    id v7 = [(UITabBarController *)self->_tabBarController viewControllers];
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 selectedIndex];
  v9 = [v7 viewControllers];

  id v10 = [v9 indexOfObject:v6];
  if (v8 == v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 performSelector:"scrollToTop"];
  }
  self->_tabIndexBeingDeselected = (int64_t)v8;

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a4;
  int64_t tabIndexBeingDeselected = self->_tabIndexBeingDeselected;
  id v8 = [a3 viewControllers];
  id v9 = [v8 indexOfObject:v6];

  _HKInitializeLogging();
  id v10 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134217984;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[CHNav] Tab index selected: %ld", (uint8_t *)&v16, 0xCu);
  }
  if ((id)tabIndexBeingDeselected == v9)
  {
    id v11 = [(CHFitnessAppContext *)self->_fitnessAppContext seymourNavigationController];
    if (v11 == v6) {
      [(CHFitnessAppContext *)self->_fitnessAppContext seymourTabSelectedWithSelection:2];
    }
  }
  else
  {
    id v11 = [(CHNavigationTracker *)self _viewControllerAtIndex:tabIndexBeingDeselected];
    uint64_t v12 = [(CHFitnessAppContext *)self->_fitnessAppContext seymourNavigationController];
    v13 = (void *)v12;
    if ((id)v12 == v6)
    {
      [(CHFitnessAppContext *)self->_fitnessAppContext seymourTabSelectedWithSelection:1];
      v14 = +[NSUserDefaults standardUserDefaults];
      v15 = +[DiscoverySheetConstants hasVisitedSeymourTabKey];
      [v14 setBool:1 forKey:v15];
    }
    else if ((id)v12 == v11)
    {
      [(CHFitnessAppContext *)self->_fitnessAppContext seymourTabDeselected];
    }
  }
}

- (UITabBarController)tabBarController
{
  return self->_tabBarController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);

  objc_storeStrong((id *)&self->_tabBarController, 0);
}

@end