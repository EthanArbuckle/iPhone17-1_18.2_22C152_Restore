@interface MapsCarPlayServicesShim
+ (void)openMapsCarPlayApplicationSuspended;
+ (void)openMapsCarPlayApplicationWithCompletion:(id)a3;
@end

@implementation MapsCarPlayServicesShim

+ (void)openMapsCarPlayApplicationWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = sub_1000A930C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "openMapsCarPlayApplicationWithCompletion", buf, 2u);
  }

  v5 = +[FBSOpenApplicationService dashboardService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100705E40;
  v7[3] = &unk_1012F5FE0;
  id v8 = v3;
  id v6 = v3;
  [v5 openApplication:@"com.apple.Maps" withOptions:0 completion:v7];
}

+ (void)openMapsCarPlayApplicationSuspended
{
  uint64_t v5 = FBSOpenApplicationOptionKeyActivateSuspended;
  id v6 = &__kCFBooleanTrue;
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  id v3 = +[FBSOpenApplicationOptions optionsWithDictionary:v2];

  v4 = +[FBSOpenApplicationService dashboardService];
  [v4 openApplication:@"com.apple.Maps" withOptions:v3 completion:&stru_1012F6020];
}

@end