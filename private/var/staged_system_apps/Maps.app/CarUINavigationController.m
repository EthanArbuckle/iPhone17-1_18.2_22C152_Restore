@interface CarUINavigationController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (id)preferredFocusEnvironments;
- (void)setNeedsFocusUpdate;
@end

@implementation CarUINavigationController

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v6 = 1;
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 allowedPressTypes];
    unsigned __int8 v5 = [v4 containsObject:&off_1013A9EE0];

    if (v5) {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)setNeedsFocusUpdate
{
  v4.receiver = self;
  v4.super_class = (Class)CarUINavigationController;
  [(CarUINavigationController *)&v4 setNeedsFocusUpdate];
  v2 = +[CarDisplayController sharedInstance];
  id v3 = [v2 chromeViewController];
  [v3 setNeedsFocusUpdate];
}

- (id)preferredFocusEnvironments
{
  v7.receiver = self;
  v7.super_class = (Class)CarUINavigationController;
  id v3 = [(CarUINavigationController *)&v7 preferredFocusEnvironments];
  if ([(CarUINavigationController *)self isNavigationBarHidden])
  {
    objc_super v4 = +[NSPredicate predicateWithBlock:&stru_101312D28];
    uint64_t v5 = [v3 filteredArrayUsingPredicate:v4];

    id v3 = (void *)v5;
  }

  return v3;
}

@end