@interface COSUnavailableAppsViewController
- (COSUnavailableAppsViewController)init;
- (id)specifiers;
- (void)dealloc;
@end

@implementation COSUnavailableAppsViewController

- (COSUnavailableAppsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSUnavailableAppsViewController;
  v2 = [(COSUnavailableAppsViewController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"reloadForAppChange:" name:@"COSUnavailableAppsChangedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COSUnavailableAppsViewController;
  [(COSUnavailableAppsViewController *)&v4 dealloc];
}

- (id)specifiers
{
  v3 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v21 = OBJC_IVAR___PSListController__specifiers;
    v26 = self;
    objc_super v4 = objc_opt_new();
    objc_super v5 = +[COSSettingsListController unavailableWatchKitApps];
    v6 = +[PSSpecifier groupSpecifierWithID:@"UNAVAILABLE_APP_ID"];
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"UNAVAILABLE_APPS_FOOTER" value:&stru_100249230 table:@"Localizable"];
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    v24 = v4;
    v20 = v6;
    [v4 addObject:v6];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v25 = v5;
    id obj = [v5 allKeys];
    id v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v23 = *(void *)v28;
      uint64_t v11 = ACXApplicationNameKey;
      uint64_t v12 = ACXPluginBundleIdKey;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(obj);
          }
          v14 = [v25 objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * (void)v13)];
          v15 = [v14 objectForKeyedSubscript:v11];
          v16 = [v14 objectForKeyedSubscript:v12];
          v17 = +[PSSpecifier preferenceSpecifierNamed:v15 target:v26 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
          [v17 setProperty:v16 forKey:@"COSUnavailableApplicationBundleID"];
          [v17 setProperty:v14 forKey:@"COSUnavailableApplicationInfoID"];
          [v24 addObject:v17];

          v13 = (char *)v13 + 1;
        }
        while (v10 != v13);
        id v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v10);
    }

    v18 = *(void **)&v26->BPSListController_opaque[v21];
    *(void *)&v26->BPSListController_opaque[v21] = v24;

    v3 = *(void **)&v26->BPSListController_opaque[v21];
  }

  return v3;
}

@end