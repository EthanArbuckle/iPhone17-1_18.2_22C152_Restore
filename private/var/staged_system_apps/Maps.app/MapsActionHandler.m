@interface MapsActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation MapsActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:@"%@Handler", objc_opt_class()];
  Class v8 = NSClassFromString(v7);
  if (v8 != (Class)objc_opt_class())
  {
    id v9 = [v5 analyticsLaunchActionType];
    v10 = +[GEOAPSharedStateData sharedData];
    [v10 setMapLaunchAction:v9];

    +[GEOAPPortal captureUserAction:2090 target:0 value:0];
    v11 = sub_1000A930C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      Class v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "MapsActionHandler : perform Action %@ with class %@", buf, 0x16u);
    }

    [(objc_class *)v8 performSelector:"performAction:inContext:" withObject:v5 withObject:v6];
  }
}

@end