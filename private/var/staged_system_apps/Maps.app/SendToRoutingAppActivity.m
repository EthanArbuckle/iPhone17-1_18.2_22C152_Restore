@interface SendToRoutingAppActivity
+ (BOOL)isActivityForType:(id)a3;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation SendToRoutingAppActivity

+ (BOOL)isActivityForType:(id)a3
{
  return [@"com.apple.Maps.RoutingAppsActivity" isEqualToString:a3];
}

- (id)activityImage
{
  v2 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:20.0];
  v3 = +[UIImage _systemImageNamed:@"appstore" withConfiguration:v2];

  return v3;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Routing Apps [Share sheet]" value:@"localized string not found" table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.Maps.RoutingAppsActivity";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
}

@end