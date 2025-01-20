@interface COSSockPuppetAppListController
- (BOOL)showsOnGizmoEnabled;
- (COSSockPuppetAppListController)init;
- (id)addShowOnWatchSectionToSpecifiers:(id)a3;
- (id)bundle;
- (id)customSpecifiers;
- (id)deleteAppOnGizmoSpecifier;
- (id)device;
- (id)puppetAppShows:(id)a3;
- (id)showOnWatchSpecifier;
- (id)specifiers;
- (id)systemPolicy;
- (void)_resetAfterAppDeletionResponse:(int64_t)a3;
- (void)_resetAfterSockPuppetResponseWithState:(int64_t)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)deleteAppAlert:(id)a3;
- (void)deleteAppOnGizmo:(id)a3;
- (void)launchTestFlight:(id)a3;
- (void)presentACError:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)recheckWatchAppInstallState:(int64_t)a3;
- (void)restrictShowOnWatchSpecifierIfNecessary:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setPuppetAppShows:(id)a3 specifier:(id)a4;
- (void)updateInstallStateForApplication:(id)a3 installState:(int64_t)a4;
@end

@implementation COSSockPuppetAppListController

- (COSSockPuppetAppListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSSockPuppetAppListController;
  v2 = [(COSSockPuppetAppListController *)&v6 init];
  if (v2)
  {
    v3 = +[ACXDeviceConnection sharedDeviceConnection];
    [v3 addObserver:v2];

    v4 = +[MCProfileConnection sharedConnection];
    [v4 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[ACXDeviceConnection sharedDeviceConnection];
  [v3 removeObserver:self];

  v4 = +[MCProfileConnection sharedConnection];
  [v4 removeObserver:self];

  v5 = +[LSApplicationWorkspace defaultWorkspace];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)COSSockPuppetAppListController;
  [(COSSockPuppetAppListController *)&v6 dealloc];
}

- (id)customSpecifiers
{
  return 0;
}

- (BOOL)showsOnGizmoEnabled
{
  return 1;
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  uint64_t v4 = PSAppSettingsBundleIDKey;
  v5 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSAppSettingsBundleIDKey];
  unsigned int v6 = sub_100032CB0(v5);

  uint64_t v63 = v4;
  v7 = [*(id *)&v2->PSAppListController_opaque[v3] propertyForKey:v4];
  id v71 = 0;
  id v8 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v7 allowPlaceholder:0 error:&v71];
  id v9 = v71;
  if (v9)
  {
    v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v74 = v7;
      __int16 v75 = 2112;
      id v76 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error while retrieving application record %@ with error %@", buf, 0x16u);
    }
  }
  if (v8)
  {
    v11 = [v8 URL];
    v12 = v11;
    if (v11)
    {
      [v11 URLByAppendingPathComponent:@"Settings-Watch.bundle"];
      v14 = unsigned int v13 = v6;
      v15 = +[NSBundle bundleWithURL:v14];

      unsigned int v6 = v13;
      [*(id *)&v2->PSAppListController_opaque[v3] setProperty:v15 forKey:PSAppSettingsBundleKey];
    }
  }
  v70.receiver = v2;
  v70.super_class = (Class)COSSockPuppetAppListController;
  v16 = [(COSSockPuppetAppListController *)&v70 specifiers];
  id v17 = [v16 mutableCopy];

  v18 = [*(id *)&v2->PSAppListController_opaque[v3] propertyForKey:@"COSSockPuppetWatchKitVersionKey"];
  v19 = v18;
  if (v18 && ([v18 isEqualToString:@"1.0"] & 1) == 0)
  {
    unsigned int v52 = v6;
    v56 = v7;
    v57 = v19;
    uint64_t v62 = v3;
    id v54 = v8;
    id v55 = v9;
    v20 = v2;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v53 = v17;
    id obj = v17;
    id v21 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v67;
      uint64_t v24 = PSDefaultsKey;
      uint64_t v25 = PSKeyNameKey;
      uint64_t v60 = PSContainerBundleIDKey;
      uint64_t v61 = PSIsPerGizmoKey;
      uint64_t v59 = PSAppGroupBundleIDKey;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v67 != v23) {
            objc_enumerationMutation(obj);
          }
          v27 = *(char **)(*((void *)&v66 + 1) + 8 * i);
          uint64_t v28 = [v27 propertyForKey:v24];
          uint64_t v29 = [v27 propertyForKey:v25];
          if (v28 | v29)
          {
            [v27 setProperty:&__kCFBooleanTrue forKey:v61];
            v30 = sub_10001EDAC(*(void **)&v20->PSAppListController_opaque[v62]);
            [v27 setProperty:v30 forKey:v24];

            [v27 setProperty:0 forKey:v60];
            [v27 setProperty:0 forKey:v59];
            *(void *)&v27[OBJC_IVAR___PSSpecifier_setter] = "setPreferenceValue:specifier:";
          }
          if (objc_msgSend(objc_msgSend(v27, "detailControllerClass"), "isSubclassOfClass:", objc_opt_class()))
          {
            [v27 setDetailControllerClass:objc_opt_class()];
            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v65[2] = sub_10001EE4C;
            v65[3] = &unk_100243A90;
            v65[4] = v27;
            v65[5] = v20;
            v31 = objc_retainBlock(v65);
            ((void (*)(void *, uint64_t))v31[2])(v31, v63);
            ((void (*)(void *, const __CFString *))v31[2])(v31, @"COSSockPuppetAppBundleIDKey");
            ((void (*)(void *, const __CFString *))v31[2])(v31, @"COSSockPuppetWatchKitVersionKey");
            ((void (*)(void *, const __CFString *))v31[2])(v31, @"COSSockPuppetAppTeamIDKey");
          }
        }
        id v22 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v22);
    }

    v2 = v20;
    id v9 = v55;
    v7 = v56;
    id v17 = v53;
    id v8 = v54;
    uint64_t v3 = v62;
    v19 = v57;
    unsigned int v6 = v52;
  }
  v32 = [*(id *)&v2->PSAppListController_opaque[v3] propertyForKey:PSIsThirdPartyDetailKey];
  unsigned __int8 v33 = [v32 BOOLValue];

  if ((v33 & 1) == 0)
  {
    v34 = [*(id *)&v2->PSAppListController_opaque[v3] propertyForKey:@"COSSockPuppetInstallationState"];
    v35 = (char *)[v34 integerValue];

    if ((unint64_t)(v35 - 3) < 0xFFFFFFFFFFFFFFFELL) {
      unsigned int v36 = v6;
    }
    else {
      unsigned int v36 = 0;
    }
    if (v36 == 1)
    {
      v37 = +[NSBundle mainBundle];
      v38 = [v37 localizedStringForKey:@"TESTFLIGHT_APP_INSTRUCTION" value:&stru_100249230 table:@"Localizable"];

      v58 = v19;
      if ((sub_100032AF0() & 1) == 0)
      {
        v39 = +[NSBundle mainBundle];
        uint64_t v40 = [v39 localizedStringForKey:@"TESTFLIGHT_APP_INSTALL_INSTRUCTION" value:&stru_100249230 table:@"Localizable"];

        v38 = (void *)v40;
      }
      v41 = +[PSSpecifier preferenceSpecifierNamed:v38 target:v2 set:0 get:0 detail:0 cell:13 edit:0];
      v42 = +[UIImage imageNamed:@"tf-icon"];
      [v41 setButtonAction:"launchTestFlight:"];
      v43 = NSStringFromSelector("launchTestFlight:");
      [v41 setProperty:v43 forKey:PSButtonActionKey];

      [v41 setProperty:v42 forKey:PSIconImageKey];
      [v17 insertObject:v41 atIndex:0];

      v19 = v58;
      goto LABEL_34;
    }
    if ([(COSSockPuppetAppListController *)v2 showsOnGizmoEnabled] && v35 != (char *)3)
    {
      [(COSSockPuppetAppListController *)v2 addShowOnWatchSectionToSpecifiers:v17];
      v38 = v17;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
    }
  }
  v44 = [(COSSockPuppetAppListController *)v2 customSpecifiers];
  if ([v44 count])
  {
    v45 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v44 count]);
    [v17 insertObjects:v44 atIndexes:v45];
  }
  v46 = [*(id *)&v2->PSAppListController_opaque[v3] propertyForKey:PSIDKey];
  unsigned int v47 = [v46 isEqualToString:@"VICTORY_ROW_ID"];

  if (v47)
  {
    v48 = +[LSApplicationWorkspace defaultWorkspace];
    [v48 addObserver:v2];
  }
  uint64_t v49 = BPSRemoveCapabilityIncompatibleSpecifiersFromArray();
  v50 = *(void **)&v2->PSAppListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&v2->PSAppListController_opaque[OBJC_IVAR___PSListController__specifiers] = v49;

  return v17;
}

- (id)addShowOnWatchSectionToSpecifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OBJC_IVAR___PSViewController__specifier;
  unsigned int v6 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSSockPuppetInstallationState"];
  id v7 = [v6 integerValue];

  id v8 = [*(id *)&self->PSAppListController_opaque[v5] propertyForKey:@"applicationMode"];
  unint64_t v9 = (unint64_t)[v8 integerValue];

  id v10 = objc_alloc((Class)LSApplicationRecord);
  uint64_t v11 = PSAppSettingsBundleIDKey;
  v12 = [*(id *)&self->PSAppListController_opaque[v5] propertyForKey:PSAppSettingsBundleIDKey];
  id v30 = 0;
  id v13 = [v10 initWithBundleIdentifier:v12 allowPlaceholder:0 error:&v30];
  id v14 = v30;

  if (v14)
  {
    v15 = pbb_bridge_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [*(id *)&self->PSAppListController_opaque[v5] propertyForKey:v11];
      *(_DWORD *)buf = 138412546;
      v32 = v16;
      __int16 v33 = 2112;
      id v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Error while retrieving application record %@ with error %@", buf, 0x16u);
    }
  }
  id v17 = [*(id *)&self->PSAppListController_opaque[v5] propertyForKey:@"locallyAvailable"];
  if ([v17 BOOLValue])
  {
    int v18 = 0;
  }
  else
  {
    v19 = [v13 applicationState];
    unsigned int v20 = [v19 isInstalled];

    int v18 = v20 ^ 1;
  }

  if (v7 == (id)2) {
    int v21 = v18;
  }
  else {
    int v21 = 0;
  }
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    int v22 = v21;
  }
  else {
    int v22 = 0;
  }
  uint64_t v23 = +[PSSpecifier groupSpecifierWithID:@"SHOW_ON_GIZMO_GROUP_ID"];
  if (v7 == (id)4)
  {
    uint64_t v24 = +[NSBundle mainBundle];
    uint64_t v25 = v24;
    CFStringRef v26 = @"GIZMO_APP_UNINSTALLING";
  }
  else
  {
    if (v7 != (id)1)
    {
      v27 = 0;
      goto LABEL_21;
    }
    uint64_t v24 = +[NSBundle mainBundle];
    uint64_t v25 = v24;
    CFStringRef v26 = @"GIZMO_APP_INSTALLING";
  }
  v27 = [v24 localizedStringForKey:v26 value:&stru_100249230 table:@"Localizable"];

  if (v27) {
    [(COSSockPuppetAppListController *)self recheckWatchAppInstallState:v7];
  }
LABEL_21:
  [v23 setProperty:v27 forKey:PSFooterTextGroupKey];
  [v4 insertObject:v23 atIndex:0];
  if (v22)
  {
    uint64_t v28 = [(COSSockPuppetAppListController *)self deleteAppOnGizmoSpecifier];
    [v28 setIdentifier:@"DELETE_ON_GIZMO"];
  }
  else
  {
    uint64_t v28 = [(COSSockPuppetAppListController *)self showOnWatchSpecifier];
  }
  [v4 insertObject:v28 atIndex:1];

  return v4;
}

- (void)recheckWatchAppInstallState:(int64_t)a3
{
  uint64_t v5 = +[ACXDeviceConnection sharedDeviceConnection];
  unsigned int v6 = sub_10000DCF4();
  id v7 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSSockPuppetAppBundleIDKey"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F2EC;
  v8[3] = &unk_100243AB8;
  v8[4] = self;
  v8[5] = a3;
  [v5 applicationIsInstalledOnPairedDevice:v6 withBundleID:v7 completion:v8];
}

- (id)showOnWatchSpecifier
{
  uint64_t v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"SHOWS_ON_GIZMO_%@" value:&stru_100249230 table:@"Localizable"];
  uint64_t v5 = +[NSBundle mainBundle];
  unsigned int v6 = [v5 localizedStringForKey:@"APPLE_WATCH_ALL_STRING" value:&stru_100249230 table:@"Localizable"];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setPuppetAppShows:specifier:" get:"puppetAppShows:" detail:0 cell:6 edit:0];

  [v8 setIdentifier:@"SHOWS_ON_GIZMO"];
  [(COSSockPuppetAppListController *)self restrictShowOnWatchSpecifierIfNecessary:v8];

  return v8;
}

- (id)deleteAppOnGizmoSpecifier
{
  uint64_t v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"DELETE_ON_GIZMO" value:&stru_100249230 table:@"Localizable"];
  uint64_t v5 = +[NSString stringWithFormat:v4];
  unsigned int v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v6 setIdentifier:@"DELETE_ON_GIZMO"];
  [v6 setButtonAction:"deleteAppAlert:"];

  return v6;
}

- (void)deleteAppAlert:(id)a3
{
  id v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"DELETE_ON_GIZMO_ALERT_TITLE" value:&stru_100249230 table:@"Localizable"];
  unsigned int v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"DELETE_ON_GIZMO_MESSAGE" value:&stru_100249230 table:@"Localizable"];
  id v8 = +[NSString stringWithFormat:v7];
  unint64_t v9 = +[UIAlertController alertControllerWithTitle:v5 message:v8 preferredStyle:1];

  id v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 localizedStringForKey:@"DELETE_ON_GIZMO_ALERT_CONFIRM" value:&stru_100249230 table:@"Localizable"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001F980;
  v16[3] = &unk_100243AE0;
  v16[4] = self;
  v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v16];

  id v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"DELETE_ON_GIZMO_ALERT_CANCEL" value:&stru_100249230 table:@"Localizable"];
  v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:&stru_100243B20];

  [v9 addAction:v12];
  [v9 addAction:v15];
  [(COSSockPuppetAppListController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)deleteAppOnGizmo:(id)a3
{
  uint64_t v4 = OBJC_IVAR___PSViewController__specifier;
  uint64_t v5 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:BPSNotificationAppBBSectionInfo];
  unsigned int v6 = [v5 sectionID];

  id v7 = [(COSSockPuppetAppListController *)self device];
  id v8 = +[ACXDeviceConnection sharedDeviceConnection];
  unint64_t v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [*(id *)&self->PSAppListController_opaque[v4] name];
    *(_DWORD *)buf = 138412546;
    int v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleting %@ on Gizmo with watch bundle id: %@", buf, 0x16u);
  }
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10001FBEC;
  int v18 = &unk_100243B48;
  id v19 = v6;
  unsigned int v20 = self;
  id v11 = v6;
  [v8 removeApplication:v11 fromPairedDevice:v7 completionWithError:&v15];
  v12 = [(COSSockPuppetAppListController *)self specifierForID:@"SHOW_ON_GIZMO_GROUP_ID", v15, v16, v17, v18];
  id v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"GIZMO_APP_UNINSTALLING" value:&stru_100249230 table:@"Localizable"];
  [v12 setProperty:v14 forKey:PSFooterTextGroupKey];

  [(COSSockPuppetAppListController *)self reloadSpecifier:v12 animated:0];
}

- (id)systemPolicy
{
  return 0;
}

- (void)_resetAfterSockPuppetResponseWithState:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001FD9C;
  v3[3] = &unk_1002437D0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_resetAfterAppDeletionResponse:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001FF50;
  v3[3] = &unk_1002437D0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (id)device
{
  v2 = +[UIApplication sharedApplication];
  uint64_t v3 = [v2 activeWatch];

  return v3;
}

- (void)setPuppetAppShows:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OBJC_IVAR___PSViewController__specifier;
  unint64_t v9 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSAppSettingsBundleIDKey];
  unsigned int v10 = sub_100032CB0(v9);

  id v11 = [*(id *)&self->PSAppListController_opaque[v8] propertyForKey:BPSNotificationAppBBSectionInfo];
  v12 = [v11 sectionID];

  id v13 = +[ACXDeviceConnection sharedDeviceConnection];
  id v14 = [(COSSockPuppetAppListController *)self device];
  if ([v6 BOOLValue])
  {
    v15 = pbb_bridge_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[COSSockPuppetAppListController setPuppetAppShows:specifier:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    [*(id *)&self->PSAppListController_opaque[v8] setProperty:&__kCFBooleanTrue forKey:@"COSSockPuppetCurrentState"];
    int HasCapabilityForString = BPSDeviceHasCapabilityForString();
    id v17 = pbb_bridge_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (HasCapabilityForString)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412546;
        v44 = v12;
        __int16 v45 = 2112;
        v46 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Check if app %@ needs update for %@", buf, 0x16u);
      }

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100020648;
      v39[3] = &unk_100243B70;
      v39[4] = self;
      id v40 = v13;
      v41 = v12;
      id v42 = v14;
      [v40 fetchLocallyAvailableApplicationWithBundleID:v41 forPairedDevice:v42 completion:v39];

      id v19 = (char *)v40;
    }
    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "app update check not needed", buf, 2u);
      }

      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100020B88;
      v36[3] = &unk_100243B48;
      v37 = v12;
      v38 = self;
      [v13 installApplication:v37 onPairedDevice:v14 completion:v36];
      id v19 = v37;
    }
  }
  else
  {
    [*(id *)&self->PSAppListController_opaque[v8] setProperty:&__kCFBooleanFalse forKey:@"COSSockPuppetCurrentState"];
    id v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    v32 = sub_100020CD0;
    __int16 v33 = &unk_100243B48;
    id v34 = v12;
    v35 = self;
    [v13 removeApplication:v34 fromPairedDevice:v14 completionWithError:&v30];
    id v19 = v34;
  }

  [*(id *)&self->PSAppListController_opaque[v8] setProperty:&__kCFBooleanTrue forKey:@"COSSockPuppetStateChanging"];
  [(COSSockPuppetAppListController *)self restrictShowOnWatchSpecifierIfNecessary:v7];
  unsigned int v20 = [(COSSockPuppetAppListController *)self specifierForID:@"SHOW_ON_GIZMO_GROUP_ID"];
  unsigned int v21 = [v6 BOOLValue];
  int v22 = +[NSBundle mainBundle];
  __int16 v23 = v22;
  if (v21) {
    CFStringRef v24 = @"GIZMO_APP_INSTALLING";
  }
  else {
    CFStringRef v24 = @"GIZMO_APP_UNINSTALLING";
  }
  uint64_t v25 = [v22 localizedStringForKey:v24 value:&stru_100249230 table:@"Localizable" v30, v31, v32, v33];
  [v20 setProperty:v25 forKey:PSFooterTextGroupKey];

  if (v10 && ![v6 BOOLValue])
  {
    if (([v6 BOOLValue] & 1) == 0)
    {
      [v7 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
      [(COSSockPuppetAppListController *)self reloadSpecifier:v7 animated:0];
    }
    CFStringRef v26 = self;
    id v27 = v20;
    uint64_t v28 = 0;
  }
  else
  {
    [(COSSockPuppetAppListController *)self reloadSpecifier:v20 animated:1];
    CFStringRef v26 = self;
    id v27 = v7;
    uint64_t v28 = 1;
  }
  [(COSSockPuppetAppListController *)v26 reloadSpecifier:v27 animated:v28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifiers];
}

- (void)presentACError:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = [v4 domain];
  unsigned __int8 v6 = [v5 isEqualToString:@"ACXUserPresentableErrorDomain"];

  if (v6)
  {
    id v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKey:NSLocalizedFailureReasonErrorKey];
    unint64_t v9 = [v7 objectForKey:NSLocalizedDescriptionKey];
    unsigned int v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      BOOL v18 = v8;
      __int16 v19 = 2112;
      unsigned int v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Presenting application installation error title: \"%@\" description: \"%@\"", buf, 0x16u);
    }

    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      v12 = pbb_bridge_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AppConduit app install error did not have a title and/or a description, userinfo: %@", buf, 0xCu);
      }
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100021078;
      block[3] = &unk_100243B98;
      id v14 = v8;
      id v15 = v9;
      uint64_t v16 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      v12 = v14;
    }
  }
  else
  {
    id v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AppConduit installation error is not presentable: %@", buf, 0xCu);
    }
  }
}

- (id)puppetAppShows:(id)a3
{
  uint64_t v4 = OBJC_IVAR___PSViewController__specifier;
  uint64_t v5 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSSockPuppetStateChanging"];
  unsigned __int8 v6 = v5;
  if (v5 && ([v5 BOOLValue] & 1) != 0)
  {
    id v7 = [*(id *)&self->PSAppListController_opaque[v4] propertyForKey:@"COSSockPuppetCurrentState"];
  }
  else
  {
    uint64_t v8 = [*(id *)&self->PSAppListController_opaque[v4] propertyForKey:@"COSSockPuppetInstallationState"];
    unint64_t v9 = (char *)[v8 integerValue];

    if ((unint64_t)(v9 - 1) >= 2) {
      unsigned int v10 = &__kCFBooleanFalse;
    }
    else {
      unsigned int v10 = &__kCFBooleanTrue;
    }
    id v7 = v10;
  }
  BOOL v11 = v7;

  return v11;
}

- (void)launchTestFlight:(id)a3
{
  if (sub_100032AF0())
  {
    uint64_t v4 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSIDKey];
    sub_100032AFC(v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sub_100032C9C();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  BPSOpenSensitiveURLAsync();
}

- (void)restrictShowOnWatchSpecifierIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(COSSockPuppetAppListController *)self puppetAppShows:v4];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = +[MCProfileConnection sharedConnection];
  unsigned int v8 = [v7 isOnDeviceAppInstallationAllowed];

  unint64_t v9 = +[MCProfileConnection sharedConnection];
  unsigned int v10 = [v9 isAppRemovalAllowed];

  if (v6) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v8;
  }
  id v12 = +[NSNumber numberWithBool:v11];
  [v4 setProperty:v12 forKey:PSEnabledKey];
}

- (void)updateInstallStateForApplication:(id)a3 installState:(int64_t)a4
{
  id v6 = a3;
  id v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updateInstallStateForApplication:(%@) installState:(%d)", (uint8_t *)&v10, 0x12u);
  }

  unsigned int v8 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSSockPuppetAppBundleIDKey"];
  unsigned int v9 = [v6 isEqualToString:v8];

  if (v9) {
    [(COSSockPuppetAppListController *)self _resetAfterSockPuppetResponseWithState:a4];
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = [(COSSockPuppetAppListController *)self specifierForID:@"SHOWS_ON_GIZMO", a4];
  [(COSSockPuppetAppListController *)self restrictShowOnWatchSpecifierIfNecessary:v5];
  [(COSSockPuppetAppListController *)self reloadSpecifier:v5];
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(COSSockPuppetAppListController *)self device];
  if (v8)
  {
    +[PSRootController setPreferenceValue:v6 specifier:v7];
    uint64_t v9 = OBJC_IVAR___PSViewController__specifier;
    int v10 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSSockPuppetAppBundleIDKey"];
    id v11 = objc_alloc((Class)NPSDomainAccessor);
    __int16 v12 = sub_10001EDAC(*(void **)&self->PSAppListController_opaque[v9]);
    id v13 = [v11 initWithDomain:v12 pairedDevice:v8];

    id v14 = objc_opt_new();
    if (v13)
    {
      id v25 = v7;
      id v26 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = [v13 copyKeyList];
      id v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            unsigned int v21 = [v13 objectForKey:v20];
            if (v21) {
              [v14 setObject:v21 forKeyedSubscript:v20];
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v17);
      }

      id v7 = v25;
      id v6 = v26;
    }
    else
    {
      id v15 = pbb_bridge_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)__int16 v33 = "-[COSSockPuppetAppListController setPreferenceValue:specifier:]";
        *(_WORD *)&v33[8] = 2112;
        *(void *)&v33[10] = v10;
        __int16 v34 = 2112;
        id v35 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: domainAccessor for identifier (%@) is nil! Specifier: %@", buf, 0x20u);
      }
    }

    int v22 = +[ACXDeviceConnection sharedDeviceConnection];
    id v27 = 0;
    [v22 updatePreferencesForApplicationWithIdentifier:v10 preferences:v14 writingToPreferencesLocation:0 forPairedDevice:v8 options:0 error:&v27];
    id v23 = v27;

    if (v23)
    {
      CFStringRef v24 = pbb_bridge_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)__int16 v33 = "-[COSSockPuppetAppListController setPreferenceValue:specifier:]";
        *(_WORD *)&v33[8] = 2112;
        *(void *)&v33[10] = v10;
        __int16 v34 = 2112;
        id v35 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: -updatePreferencesForApplicationWithIdentifier for identifier: (%@) failed with error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    int v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)__int16 v33 = 626;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "-[COSSockPuppetAppListController setPreferenceValue:specifier:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%d %s - Had nil Device!", buf, 0x12u);
    }
  }
}

- (id)bundle
{
  return [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSAppSettingsBundleKey];
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  id v5 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSAppSettingsBundleIDKey];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      int v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!v5
          || ([*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) bundleIdentifier],
              id v11 = objc_claimAutoreleasedReturnValue(),
              unsigned int v12 = [v11 isEqualToString:v5],
              v11,
              v12))
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100021A94;
          block[3] = &unk_1002438A0;
          void block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OBJC_IVAR___PSViewController__specifier;
  id v6 = [*(id *)&self->PSAppListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"COSSockPuppetInstallationState"];
  id v7 = [v6 integerValue];

  if (v7 == (id)2)
  {
    id v8 = [*(id *)&self->PSAppListController_opaque[v5] propertyForKey:PSAppSettingsBundleIDKey];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v16 = v4;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v13) bundleIdentifier:v16];
          unsigned int v15 = [v14 isEqualToString:v8];

          if (v15)
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100021CF0;
            block[3] = &unk_1002438A0;
            void block[4] = self;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v4 = v16;
  }
}

@end