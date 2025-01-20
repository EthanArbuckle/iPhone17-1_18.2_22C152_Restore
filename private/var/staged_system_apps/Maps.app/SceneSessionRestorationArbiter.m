@interface SceneSessionRestorationArbiter
+ (id)activityForSceneSession:(id)a3;
@end

@implementation SceneSessionRestorationArbiter

+ (id)activityForSceneSession:(id)a3
{
  id v3 = a3;
  v4 = [v3 stateRestorationActivity];

  if (v4)
  {
    id v5 = [v3 stateRestorationActivity];
    goto LABEL_13;
  }
  v6 = [v3 role];
  unsigned int v7 = [v6 isEqualToString:UIWindowSceneSessionRoleApplication];

  if (v7)
  {
    id v5 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Maps.Restore"];
    CFStringRef v19 = @"MapsActivity";
    v8 = +[MapsActivity mapsActivityPerDefault];
    v9 = [v8 data];
    v20 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    [v5 setUserInfo:v10];

LABEL_5:
    goto LABEL_13;
  }
  v11 = [v3 role];
  if ([v11 isEqualToString:_UIWindowSceneSessionRoleCarPlay])
  {
    v12 = [v3 scene];

    if (!v12)
    {
      v13 = +[NSUserDefaults standardUserDefaults];
      uint64_t v14 = [v13 BOOLForKey:@"NavigationUserActivityPendingDeletion"];

      if ((v14 & 1) == 0)
      {
        v15 = +[NSUserDefaults standardUserDefaults];
        v8 = [v15 objectForKey:@"NavigationUserActivityDefault"];

        if (v8)
        {
          id v5 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Maps.Restore"];
          CFStringRef v17 = @"MapsActivity";
          v18 = v8;
          v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
          [v5 setUserInfo:v9];
          goto LABEL_5;
        }
      }
    }
  }
  else
  {
  }
  id v5 = 0;
LABEL_13:

  return v5;
}

@end