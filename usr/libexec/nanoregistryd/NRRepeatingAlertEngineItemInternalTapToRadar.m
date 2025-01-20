@interface NRRepeatingAlertEngineItemInternalTapToRadar
- (id)alertName;
- (id)nanoRegistryWatchMigrationTapToRadarQueryItems;
- (id)radarDescription;
- (id)radarTitle;
- (id)tapToRadarLaunchURL;
- (void)defaultButtonWasPressed;
@end

@implementation NRRepeatingAlertEngineItemInternalTapToRadar

- (id)tapToRadarLaunchURL
{
  id v3 = objc_alloc_init((Class)NSURLComponents);
  [v3 setScheme:@"tap-to-radar"];
  [v3 setHost:@"new"];
  v4 = [(NRRepeatingAlertEngineItemInternalTapToRadar *)self nanoRegistryWatchMigrationTapToRadarQueryItems];
  [v3 setQueryItems:v4];

  v5 = [v3 URL];

  return v5;
}

- (id)nanoRegistryWatchMigrationTapToRadarQueryItems
{
  id v3 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentName" value:@"NanoRegistry"];
  id v4 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentVersion" value:@"watchOS" v3];
  v14[1] = v4;
  id v5 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentID" value:@"573726"];
  v14[2] = v5;
  id v6 = objc_alloc((Class)NSURLQueryItem);
  v7 = [(NRRepeatingAlertEngineItemInternalTapToRadar *)self radarTitle];
  id v8 = [v6 initWithName:@"Title" value:v7];
  v14[3] = v8;
  id v9 = objc_alloc((Class)NSURLQueryItem);
  v10 = [(NRRepeatingAlertEngineItemInternalTapToRadar *)self radarDescription];
  id v11 = [v9 initWithName:@"Description" value:v10];
  v14[4] = v11;
  v12 = +[NSArray arrayWithObjects:v14 count:5];

  return v12;
}

- (void)defaultButtonWasPressed
{
  id v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Internal Migration Failed Alert default button pressed", v10, 2u);
    }
  }
  id v6 = +[NRRepeatingAlertEngine sharedInstance];
  v7 = [(NRRepeatingAlertEngineItemInternalTapToRadar *)self alertName];
  [v6 resetStateForAlertWithName:v7];

  id v8 = [(NRRepeatingAlertEngineItemInternalTapToRadar *)self tapToRadarLaunchURL];
  id v9 = +[LSApplicationWorkspace defaultWorkspace];
  [v9 openURL:v8 configuration:0 completionHandler:&stru_100169780];
}

- (id)radarTitle
{
  return &stru_10016A1E8;
}

- (id)radarDescription
{
  return &stru_10016A1E8;
}

- (id)alertName
{
  return &stru_10016A1E8;
}

@end