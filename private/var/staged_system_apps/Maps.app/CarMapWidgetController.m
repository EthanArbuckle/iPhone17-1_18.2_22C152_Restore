@interface CarMapWidgetController
+ (Class)chromeViewControllerClass;
+ (Class)fallbackModeControllerClass;
- (id)chromeDeactivationToken;
- (id)contextsForCurrentAppState;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setChromeDeactivationToken:(id)a3;
@end

@implementation CarMapWidgetController

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
  v3 = objc_alloc_init(CarMapWidgetMapBrowsingModeController);
  v4 = +[NSMutableArray arrayWithObject:v3];
  v5 = +[CarDisplayController sharedInstance];
  v6 = [v5 platformController];
  v7 = [v6 currentSession];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[(CarWidgetController *)self sceneType] <= 3)
  {
    v17 = [CarMapWidgetRouteGeniusModeController alloc];
    v18 = +[CarRouteGeniusService sharedService];
    v19 = [v18 suggestion];
    v20 = [(CarBasicRouteGeniusModeController *)v17 initWithSuggestion:v19];

LABEL_15:
    [v4 addObject:v20];

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    objc_opt_class();
    id v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
    id v10 = v9;

    unsigned int v11 = [v10 isCarNavigationCompatible];
    if (v11)
    {
      if ((id)[(CarWidgetController *)self sceneType] == (id)7)
      {
        v12 = [(CarWidgetController *)self chromeViewController];
        v13 = [v12 view];
        v14 = [v13 window];
        id v15 = [v14 _car_hybridInstrumentClusterLayout];

        v16 = off_1012D2698;
        if (!v15) {
          v16 = off_1012D26E8;
        }
      }
      else
      {
        v16 = off_1012D26B0;
      }
      v20 = (CarMapWidgetRouteGeniusModeController *)objc_alloc_init(*v16);
      goto LABEL_15;
    }
  }
LABEL_16:
  v21 = sub_100577D9C();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = v4;
    v23 = v22;
    if (v22)
    {
      if ([v22 count])
      {
        v24 = [v23 componentsJoinedByString:@", "];
        v25 = +[NSString stringWithFormat:@"<%p> [%@]", v23, v24];
      }
      else
      {
        v25 = +[NSString stringWithFormat:@"<%p> (empty)", v23];
      }
    }
    else
    {
      v25 = @"<nil>";
    }

    *(_DWORD *)buf = 134349314;
    v29 = self;
    __int16 v30 = 2112;
    v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Recreating current app state with modes: %@", buf, 0x16u);
  }
  id v26 = [v4 copy];

  return v26;
}

- (void)sceneWillEnterForeground:(id)a3
{
  id chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_id chromeDeactivationToken = 0;
  id v5 = a3;

  v6.receiver = self;
  v6.super_class = (Class)CarMapWidgetController;
  [(CarWidgetController *)&v6 sceneWillEnterForeground:v5];
}

- (void)sceneDidEnterBackground:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CarMapWidgetController;
  [(CarWidgetController *)&v7 sceneDidEnterBackground:a3];
  v4 = [(CarWidgetController *)self chromeViewController];
  id v5 = [v4 acquireChromeDeactivationTokenForReason:@"CarPlay Dashboard backgrounded"];
  id chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_id chromeDeactivationToken = v5;
}

- (id)chromeDeactivationToken
{
  return self->_chromeDeactivationToken;
}

- (void)setChromeDeactivationToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end