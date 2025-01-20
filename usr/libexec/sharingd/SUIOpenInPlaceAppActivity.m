@interface SUIOpenInPlaceAppActivity
- (BOOL)_activitySupportsPromiseURLs;
- (BOOL)_supportsOpenInPlace;
- (id)activityTitle;
- (id)ss_activityTypeToReportToHost;
- (void)performActivity;
@end

@implementation SUIOpenInPlaceAppActivity

- (id)activityTitle
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(SUIOpenInAppActivity *)self applicationProxy];
    v4 = [v3 localizedName];
  }
  else
  {
    v3 = sub_100233570();
    v5 = [v3 localizedStringForKey:@"OPEN_IN_APP_ACTIVITY_TITLE" value:@"Open in" table:@"Localizable"];
    v6 = [(SUIOpenInAppActivity *)self applicationProxy];
    v7 = [v6 localizedName];
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);
  }

  return v4;
}

- (id)ss_activityTypeToReportToHost
{
  return @"com.apple.UIKit.activity.RemoteOpenInApplication-InPlace";
}

- (void)performActivity
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001BD3E8;
  v2[3] = &unk_1008CA6A8;
  v2[4] = self;
  [(SUIOpenInAppActivity *)self performLaunchServicesInPlaceOpenWithCompletion:v2];
}

- (BOOL)_activitySupportsPromiseURLs
{
  return [(SUIOpenInAppActivity *)self openInPlaceWillHandlePromiseURLs];
}

- (BOOL)_supportsOpenInPlace
{
  return 1;
}

@end