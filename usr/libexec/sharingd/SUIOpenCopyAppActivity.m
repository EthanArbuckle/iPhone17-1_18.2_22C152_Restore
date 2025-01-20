@interface SUIOpenCopyAppActivity
- (BOOL)_activitySupportsPromiseURLs;
- (BOOL)_supportsOpenInPlace;
- (id)activityTitle;
- (id)ss_activityTypeToReportToHost;
- (void)performActivity;
@end

@implementation SUIOpenCopyAppActivity

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
    v5 = [v3 localizedStringForKey:@"COPY_TO_APP_ACTIVITY_TITLE" value:@"Copy to" table:@"Localizable"];
    v6 = [(SUIOpenInAppActivity *)self applicationProxy];
    v7 = [v6 localizedName];
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);
  }

  return v4;
}

- (id)ss_activityTypeToReportToHost
{
  return @"com.apple.UIKit.activity.RemoteOpenInApplication-ByCopy";
}

- (void)performActivity
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001BD578;
  v2[3] = &unk_1008CA6A8;
  v2[4] = self;
  [(SUIOpenInAppActivity *)self performLaunchServicesImportOpenWithCompletion:v2];
}

- (BOOL)_activitySupportsPromiseURLs
{
  return [(SUIOpenInAppActivity *)self openByImportWillHandlePromiseURLs];
}

- (BOOL)_supportsOpenInPlace
{
  return 0;
}

@end