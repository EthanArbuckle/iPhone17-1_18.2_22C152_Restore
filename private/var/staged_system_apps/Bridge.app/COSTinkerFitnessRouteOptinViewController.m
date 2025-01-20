@interface COSTinkerFitnessRouteOptinViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)wantsLightenBlendedScreen;
- (COSTinkerFitnessRouteOptinViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)learnMoreButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)selectedOptinChoice:(BOOL)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSTinkerFitnessRouteOptinViewController

+ (BOOL)controllerNeedsToRun
{
  v3 = [UIApp setupController];
  unsigned int v4 = [v3 didAllowTinkerLocationPermissions];

  if (v4)
  {
    v5 = [UIApp activeWatch];
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"7664BE48-77C3-48E5-BEE7-7EB383BA163C"];
    LOBYTE(v4) = [v5 supportsCapability:v6];

    if ((v4 & 1) == 0)
    {
      v7 = pbb_bridge_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = a1;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping (%@); Paired Watch does not have capability",
          (uint8_t *)&v9,
          0xCu);
      }
    }
  }
  else
  {
    v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = a1;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Skipping (%@); Location permissions were denied earlier",
        (uint8_t *)&v9,
        0xCu);
      LOBYTE(v4) = 0;
    }
  }

  return v4;
}

- (COSTinkerFitnessRouteOptinViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSTinkerFitnessRouteOptinViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSTinkerFitnessRouteOptinViewController *)v2 setStyle:74];
  }
  return v3;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"ROUTE_GPS_TITLE" value:&stru_100249230 table:@"BrooklynLocalizable-n75"];

  return v3;
}

- (id)detailString
{
  v2 = [UIApp setupController];
  v3 = [v2 tinkerUserName];
  unsigned int v4 = [v3 localizedCapitalizedString];

  objc_super v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"ROUTE_GPS_DETAIL_TINKER_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);

  return v7;
}

- (id)imageResource
{
  v2 = [UIApp activeWatch];
  v3 = sub_10005F39C(v2);

  return v3;
}

- (void)selectedOptinChoice:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [UIApp bridgeController];
  [v5 tellGizmoToSetFitnessRouteTrackingEnabled:v3];

  id v6 = [(COSTinkerFitnessRouteOptinViewController *)self delegate];
  [v6 buddyControllerDone:self];
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (void)alternateButtonPressed:(id)a3
{
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"ROUTE_GPS_ACCEPT" value:&stru_100249230 table:@"BrooklynLocalizable-n75"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"ROUTE_GPS_DECLINE" value:&stru_100249230 table:@"BrooklynLocalizable-n75"];

  return v3;
}

- (id)learnMoreButtonTitle
{
  return 0;
}

- (id)detailTitleString
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"WHAT_IS_ROUTE_GPS" value:&stru_100249230 table:@"BrooklynLocalizable-n75"];

  return v3;
}

@end