@interface MonthViewScaleTest
- (id)notificationName;
- (void)kickOffAnimation;
- (void)setUp;
@end

@implementation MonthViewScaleTest

- (id)notificationName
{
  return @"MonthViewScaleAnimationFinishedNotification";
}

- (void)setUp
{
  v3 = +[CUIKPreferences sharedPreferences];
  [v3 setMonthViewScaleSize:1];

  v4 = [(ApplicationTest *)self application];
  id v7 = [v4 rootNavigationController];

  v5 = [v7 resetToMonthView];
  monthViewController = self->_monthViewController;
  self->_monthViewController = v5;
}

- (void)kickOffAnimation
{
}

- (void).cxx_destruct
{
}

@end