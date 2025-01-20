@interface CarSmallWidgetController
+ (Class)chromeViewControllerClass;
+ (Class)fallbackModeControllerClass;
- (id)contextsForCurrentAppState;
@end

@implementation CarSmallWidgetController

+ (Class)chromeViewControllerClass
{
  return (Class)objc_opt_class();
}

+ (Class)fallbackModeControllerClass
{
  return (Class)objc_opt_class();
}

- (id)contextsForCurrentAppState
{
  v3 = objc_alloc_init(CarSmallWidgetBrowsingModeController);
  v4 = +[NSMutableArray arrayWithObject:v3];
  v5 = +[CarDisplayController sharedInstance];
  v6 = [v5 platformController];
  v7 = [v6 currentSession];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[(CarWidgetController *)self sceneType] <= 3)
  {
    v14 = [CarSmallWidgetRouteGeniusModeController alloc];
    v15 = +[CarRouteGeniusService sharedService];
    v16 = [v15 suggestion];
    v13 = [(CarSmallWidgetRouteGeniusModeController *)v14 initWithSuggestion:v16];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    id v8 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    unsigned int v11 = [v10 isCarNavigationCompatible];
    v12 = off_1012D26E8;
    if (!v11) {
      v12 = off_1012D26E0;
    }
    v13 = (CarSmallWidgetRouteGeniusModeController *)objc_alloc_init(*v12);
  }
  [v4 addObject:v13];

LABEL_12:
  v17 = sub_100577F64();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = v4;
    v19 = v18;
    if (v18)
    {
      if ([v18 count])
      {
        v20 = [v19 componentsJoinedByString:@", "];
        v21 = +[NSString stringWithFormat:@"<%p> [%@]", v19, v20];
      }
      else
      {
        v21 = +[NSString stringWithFormat:@"<%p> (empty)", v19];
      }
    }
    else
    {
      v21 = @"<nil>";
    }

    *(_DWORD *)buf = 134349314;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Recreating current app state with modes: %@", buf, 0x16u);
  }
  id v22 = [v4 copy];

  return v22;
}

@end