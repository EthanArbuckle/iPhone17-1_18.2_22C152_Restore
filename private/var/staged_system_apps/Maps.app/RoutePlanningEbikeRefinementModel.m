@interface RoutePlanningEbikeRefinementModel
- (BOOL)shouldShowChevron;
- (BOOL)shouldShowHighlighted;
- (CyclePreferences)cyclePreferences;
- (id)titleText;
- (int)buttonPressUsageAction;
@end

@implementation RoutePlanningEbikeRefinementModel

- (CyclePreferences)cyclePreferences
{
  v2 = [(RoutePlanningRefinementModel *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (id)titleText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Route Planning, Cycling] E-Bike filter button", @"localized string not found", 0 value table];

  return v3;
}

- (BOOL)shouldShowHighlighted
{
  v2 = [(RoutePlanningEbikeRefinementModel *)self cyclePreferences];
  unsigned __int8 v3 = [v2 ebike];

  return v3;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (int)buttonPressUsageAction
{
  return 0;
}

@end