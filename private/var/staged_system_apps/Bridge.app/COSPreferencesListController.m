@interface COSPreferencesListController
- (BOOL)_newSystemAppSpecifiers:(id)a3 sameAs:(id)a4;
- (BOOL)reloadingSpecifiersUpdatesSearchModel;
- (BOOL)reloadsWhenBecomingActive;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (COSPreferencesListController)init;
- (COSSystemAppsSettingsManager)systemAppsSettingsManager;
- (NSMutableArray)systemAppSpecifiers;
- (PSController)categoryController;
- (id)additionalSpecifiers;
- (id)generalViewController;
- (id)hardcodedSpecifiers;
- (id)localizedPrefsStringForString:(id)a3;
- (id)settingsBundleDirectory;
- (id)settingsFileName;
- (id)specifierForBundle:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)title;
- (int64_t)indexOfGeneralController;
- (int64_t)navigationItemLargeTitleDisplayMode;
- (void)_decorateInsertAndReloadSystemAppSpecifiers:(id)a3;
- (void)_decorateSpecifierForLazyIconLoading:(id)a3;
- (void)_removeSystemAppSpecifierFromCache:(id)a3;
- (void)_showControllerFromSpecifier:(id)a3;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)insertContiguousSpecifiers:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)launchBridgeSetup:(id)a3;
- (void)loadSystemAppSpecifiers:(id)a3;
- (void)removeSystemAppSpecifiers:(id)a3;
- (void)selectGeneralCategory;
- (void)selectGeneralCategoryForced:(BOOL)a3;
- (void)selectGeneralCategoryForced:(BOOL)a3 showController:(BOOL)a4;
- (void)setSystemAppSpecifiers:(id)a3;
- (void)suppressControllerAnimationForExpiry;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation COSPreferencesListController

- (COSPreferencesListController)init
{
  v8.receiver = self;
  v8.super_class = (Class)COSPreferencesListController;
  v2 = [(COSPreferencesListController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    if ([(COSPreferencesListController *)v2 reloadsWhenBecomingActive])
    {
      v4 = +[NSNotificationCenter defaultCenter];
      [v4 addObserver:v3 selector:"becomeActive:" name:@"com.apple.PreferencesApp.willBecomeActive" object:0];
    }
    if ((sub_10000F71C() & 1) == 0)
    {
      v5 = [[COSSystemAppsSettingsManager alloc] initWithDelegate:v3];
      systemAppsSettingsManager = v3->_systemAppsSettingsManager;
      v3->_systemAppsSettingsManager = v5;
    }
  }
  return v3;
}

- (void)loadSystemAppSpecifiers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BA60;
  v5[3] = &unk_100243908;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (BOOL)_newSystemAppSpecifiers:(id)a3 sameAs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [v5 objectAtIndexedSubscript:v8];
        v10 = [v9 identifier];
        v11 = [v6 objectAtIndexedSubscript:v8];
        v12 = [v11 identifier];
        unsigned __int8 v13 = [v10 isEqualToString:v12];

        if ((v13 & 1) == 0) {
          break;
        }
        ++v8;
      }
      while (v8 < (unint64_t)[v5 count]);
    }
    else
    {
      unsigned __int8 v13 = 1;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)COSPreferencesListController;
  [(COSPreferencesListController *)&v7 viewDidAppear:a3];
  id v4 = [(COSPreferencesListController *)self splitViewController];
  id v5 = [v4 view];
  [v5 setUserInteractionEnabled:1];

  id v6 = dispatch_get_global_queue(-2, 0);
  dispatch_async(v6, &stru_100244C10);

  [(COSPreferencesListController *)self createPrequeuedPSTableCells:3];
  if ([(COSPreferencesListController *)self _isRegularWidth])
  {
    if (!self->_didFirstLoad)
    {
      [(COSPreferencesListController *)self selectGeneralCategoryForced:0 showController:0];
      self->_didFirstLoad = 1;
    }
  }
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  id v4 = a3;
  if (*(void *)&self->super.BPSListController_opaque[OBJC_IVAR___PSListController__specifiers]
    && ([(COSPreferencesListController *)self specifierForID:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    id v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "-[COSPreferencesListController shouldDeferPushForSpecifierID:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@: YES", (uint8_t *)&v9, 0x16u);
    }
    BOOL v7 = 1;
  }
  else
  {
    id v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "-[COSPreferencesListController shouldDeferPushForSpecifierID:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@: NO", (uint8_t *)&v9, 0x16u);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (NSMutableArray)systemAppSpecifiers
{
  return self->_systemAppSpecifiers;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)COSPreferencesListController;
  id v5 = [(COSPreferencesListController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(COSPreferencesListController *)self splitViewController];
    [v5 setForceHideDisclosureIndicator:[v6 isCollapsed] ^ 1];
  }

  return v5;
}

- (void)insertContiguousSpecifiers:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)COSPreferencesListController;
  [(COSPreferencesListController *)&v10 insertContiguousSpecifiers:a3 atIndex:a4 animated:a5];
  id v6 = [(COSPreferencesListController *)self specifierIDPendingPush];
  BOOL v7 = [(COSPreferencesListController *)self specifierForID:v6];

  if (v7)
  {
    objc_super v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(COSPreferencesListController *)self specifierIDPendingPush];
      *(_DWORD *)buf = 136315394;
      id v12 = "-[COSPreferencesListController insertContiguousSpecifiers:atIndex:animated:]";
      __int16 v13 = 2112;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Pending url specifier has been inserted. Handling url for %@", buf, 0x16u);
    }
    [(COSPreferencesListController *)self handlePendingURL];
  }
}

- (id)specifierForBundle:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(COSPreferencesListController *)self specifiers];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = PSAppSettingsBundleIDKey;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 propertyForKey:v9];
        __int16 v13 = [v12 lastPathComponent];

        if (v13 && ([v13 isEqualToString:v4] & 1) != 0)
        {
          id v14 = v11;

          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

- (void)_decorateInsertAndReloadSystemAppSpecifiers:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [a3 reverseObjectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [(COSPreferencesListController *)self _decorateSpecifierForLazyIconLoading:v9];
        [(COSPreferencesListController *)self insertSpecifier:v9 afterSpecifierID:@"APPLE_APP_GROUP_ID" animated:1];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_decorateSpecifierForLazyIconLoading:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PSLazyIconAppID;
  id v10 = v3;
  id v5 = [v3 propertyForKey:PSLazyIconAppID];

  if (!v5)
  {
    id v6 = +[NSNumber numberWithBool:1];
    [v10 setProperty:v6 forKey:PSLazyIconLoading];

    uint64_t v7 = BPSWatchAppBundleIDForSettingsBundleSpecifier();
    [v10 setProperty:v7 forKey:v4];
    uint64_t v8 = BPSIsIconForBundleIDRemote();
    if (([v8 BOOLValue] & 1) == 0)
    {
      uint64_t v9 = BPSLocalIconName();
      [v10 setProperty:v9 forKey:@"squareIconName"];
    }
    [v10 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
}

- (id)specifiers
{
  id v3 = (id *)&self->super.BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = *v3;
  if (!*v3)
  {
    v116 = [(COSPreferencesListController *)self bundle];
    id v121 = 0;
    id v5 = [(COSPreferencesListController *)self settingsFileName];
    id v6 = +[NSMutableArray array];
    uint64_t v7 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    uint64_t v8 = (void *)v7;
    id obj = v6;
    if (v5)
    {
      v109 = v3;
      v110 = (void *)v7;
      id v9 = objc_alloc((Class)NSMutableDictionary);
      id v10 = [v116 resourcePath];
      v112 = v5;
      long long v11 = [v10 stringByAppendingPathComponent:v5];
      long long v12 = [v11 stringByAppendingPathExtension:@"plist"];
      id v13 = [v9 initWithContentsOfFile:v12];

      id v14 = objc_alloc((Class)NSMutableArray);
      v15 = [v13 objectForKey:@"items"];
      id v16 = [v14 initWithArray:v15];

      long long v17 = *(void **)&self->super.BPSListController_opaque[OBJC_IVAR___PSListController__bundleControllers];
      *(void *)buf = 0;
      id v18 = v17;
      v108 = v16;
      [v13 setObject:v16 forKey:@"items"];
      long long v19 = [v13 objectForKey:@"title"];
      id v120 = v18;
      v100 = SpecifiersFromPlist();
      id v20 = v120;

      v21 = [(COSPreferencesListController *)self settingsFileName];
      uint64_t v22 = +[NSString stringWithFormat:@"%@-tinker", v21];

      id v23 = objc_alloc((Class)NSMutableDictionary);
      v24 = [v116 resourcePath];
      v107 = (void *)v22;
      v25 = [v24 stringByAppendingPathComponent:v22];
      v26 = [v25 stringByAppendingPathExtension:@"plist"];
      id v27 = [v23 initWithContentsOfFile:v26];

      v28 = [v13 objectForKey:@"title"];
      v29 = [v28 stringByAppendingString:@"-tinker"];
      id v119 = v20;
      v106 = v27;
      uint64_t v30 = SpecifiersFromPlist();
      id v31 = v119;

      v105 = (void *)v30;
      [v100 addObjectsFromArray:v30, &v119];
      v32 = [(COSPreferencesListController *)self settingsFileName];
      uint64_t v33 = +[NSString stringWithFormat:@"%@-sting", v32];

      id v34 = objc_alloc((Class)NSMutableDictionary);
      v35 = [v116 resourcePath];
      v104 = (void *)v33;
      v36 = [v35 stringByAppendingPathComponent:v33];
      v37 = [v36 stringByAppendingPathExtension:@"plist"];
      id v38 = [v34 initWithContentsOfFile:v37];

      v39 = [v13 objectForKey:@"title"];
      v40 = [v39 stringByAppendingString:@"-sting"];
      id v118 = v31;
      v103 = v38;
      v41 = SpecifiersFromPlist();
      id v42 = v118;

      id v43 = [v100 indexOfSpecifierWithID:@"GENERAL_GROUP_ID" &v118];
      if ([v41 count] && objc_msgSend(v100, "count") && v43)
      {
        v44 = [v41 objectAtIndexedSubscript:0];
        v45 = +[NSBundle mainBundle];
        v46 = [v44 name];
        v47 = [v45 localizedStringForKey:v46 value:&stru_100249230 table:@"Localizable-N199"];
        [v44 setName:v47];

        [v100 insertObject:v44 atIndex:v43];
      }
      v102 = v41;
      v48 = [(COSPreferencesListController *)self settingsFileName];
      uint64_t v49 = +[NSString stringWithFormat:@"%@-elton", v48];

      id v50 = objc_alloc((Class)NSMutableDictionary);
      v51 = [v116 resourcePath];
      v101 = (void *)v49;
      v52 = [v51 stringByAppendingPathComponent:v49];
      v53 = [v52 stringByAppendingPathExtension:@"plist"];
      id v54 = [v50 initWithContentsOfFile:v53];

      v55 = v13;
      v56 = [v13 objectForKey:@"title"];
      v57 = [v56 stringByAppendingString:@"-elton"];
      id v117 = v42;
      v58 = SpecifiersFromPlist();
      id v59 = v117;

      id v60 = [v100 indexOfSpecifierWithID:@"ACCESSIBILITY" &v117];
      if ([v58 count] && objc_msgSend(v100, "count") && v60)
      {
        v61 = [v58 objectAtIndexedSubscript:0];
        v62 = +[NSBundle mainBundle];
        [v61 name];
        v64 = id v63 = v59;
        v65 = [v62 localizedStringForKey:v64 value:&stru_100249230 table:@"Localizable-elton"];
        [v61 setName:v65];

        id v59 = v63;
        v55 = v13;

        [v100 insertObject:v61 atIndex:v60];
      }
      [(COSPreferencesListController *)self setTitle:*(void *)buf];
      [(COSPreferencesListController *)self setSpecifierID:v121];
      id v6 = obj;
      [obj addObjectsFromArray:v100];

      id v3 = v109;
      uint64_t v8 = v110;
      id v5 = v112;
    }
    if ((sub_10000F71C() & 1) == 0)
    {
      v66 = +[PSSpecifier emptyGroupSpecifier];
      [v66 setIdentifier:@"APPLE_APP_GROUP_ID"];
      [v6 addObject:v66];
      v67 = [(COSPreferencesListController *)self systemAppSpecifiers];

      if (v67)
      {
        v68 = [(COSPreferencesListController *)self systemAppSpecifiers];
        [v6 addObjectsFromArray:v68];
      }
      if (v8)
      {
        v69 = [(COSPreferencesListController *)self systemAppsSettingsManager];
        [v69 buildSystemAppSettings];
      }
    }
    if (sub_100008380()
      && (+[NSFileManager defaultManager],
          v70 = objc_claimAutoreleasedReturnValue(),
          unsigned int v71 = [v70 fileExistsAtPath:@"/AppleInternal/Library/NanoPreferenceBundles/General/CompanionSetupSettings.bundle"], v70, v71))
    {
      if (sub_10000F71C() & 1) != 0 || (sub_10000F634())
      {
        char v72 = 1;
      }
      else
      {
        v133[0] = PSTitleKey;
        v133[1] = PSTableCellClassKey;
        v134[0] = @"Internal Settings";
        v134[1] = @"PSLinkCell";
        v133[2] = PSBundlePathKey;
        v133[3] = PSBundleHasIconKey;
        v134[2] = @"CompanionSetupSettings";
        v134[3] = kCFBooleanTrue;
        v133[4] = PSBundleIsControllerKey;
        v133[5] = PSSearchNanoInternalSettingsBundlePath;
        v134[4] = kCFBooleanTrue;
        v134[5] = kCFBooleanTrue;
        v133[6] = PSIDKey;
        v134[6] = @"INTERNAL_SETTINGS";
        v114 = +[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:7];
        v130 = v114;
        CFStringRef v131 = @"items";
        char v72 = 1;
        v92 = +[NSArray arrayWithObjects:&v130 count:1];
        v132 = v92;
        +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
        v94 = v93 = v5;
        +[NSBundle mainBundle];
        v96 = v95 = v8;
        v97 = SpecifiersFromPlist();

        uint64_t v8 = v95;
        id v5 = v93;

        v98 = [v97 specifierForID:@"INTERNAL_SETTINGS"];
        [v98 setProperty:@"CompanionInternalSettings" forKey:PSSpecifierSearchPlistKey];

        v99 = +[PSSpecifier emptyGroupSpecifier];
        [v97 insertObject:v99 atIndex:0];

        [obj addObjectsFromArray:v97];
      }
    }
    else
    {
      char v72 = 0;
    }
    int HasCellularDataCapability = BPSDeviceHasCellularDataCapability();
    v74 = +[NSFileManager defaultManager];
    unsigned int v75 = [v74 fileExistsAtPath:@"/AppleInternal/Library/NanoPreferenceBundles/General/Carrier Settings.bundle"];

    v76 = pbb_setup_log();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = HasCellularDataCapability;
      __int16 v128 = 1024;
      unsigned int v129 = v75;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Cellular Capable: %d Carrier Settings %d", buf, 0xEu);
    }

    v77 = obj;
    if ((HasCellularDataCapability & v75) == 1 && ([UIApp launchedToTest] & 1) == 0)
    {
      v111 = v8;
      v113 = v5;
      if ((v72 & 1) == 0)
      {
        v78 = +[PSSpecifier emptyGroupSpecifier];
        [obj addObject:v78];
      }
      v125[0] = PSTitleKey;
      v125[1] = PSTableCellClassKey;
      v126[0] = @"Carrier Settings";
      v126[1] = @"PSLinkCell";
      v125[2] = PSBundlePathKey;
      v125[3] = PSBundleHasIconKey;
      v126[2] = @"Carrier Settings";
      v126[3] = kCFBooleanTrue;
      v125[4] = PSBundleIsControllerKey;
      v125[5] = PSSearchNanoInternalSettingsBundlePath;
      v126[4] = kCFBooleanTrue;
      v126[5] = kCFBooleanTrue;
      v125[6] = PSIDKey;
      v126[6] = @"CARRIER_SETTINGS";
      v79 = +[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:7];
      v122 = v79;
      CFStringRef v123 = @"items";
      v80 = +[NSArray arrayWithObjects:&v122 count:1];
      v124 = v80;
      v81 = +[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
      v82 = +[NSBundle mainBundle];
      v83 = SpecifiersFromPlist();

      v84 = [v83 specifierForID:@"CARRIER_SETTINGS"];
      v85 = +[UIImage imageNamed:@"CarrierSettings"];
      v86 = BPSCreateRoundedGizmoAppIconForSquareImage();
      [v84 setProperty:v86 forKey:PSIconImageKey];

      v77 = obj;
      [v84 setProperty:@"Carrier Settings" forKey:PSSpecifierSearchPlistKey];
      [obj addObjectsFromArray:v83];

      uint64_t v8 = v111;
      id v5 = v113;
    }
    objc_storeStrong(v3, v77);
    v87 = [(COSPreferencesListController *)self additionalSpecifiers];
    if ([v87 count]) {
      [v77 addObjectsFromArray:v87];
    }
    if (PBShouldOfferBetterTogetherFlow())
    {
      v88 = pbb_bridge_log();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Running in demo mode; disabling Passcode row",
          buf,
          2u);
      }

      v89 = [v77 specifierForID:@"PASSCODE_ID"];
      [v89 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    }
    id v90 = *v3;
    id *v3 = v77;

    [(COSPreferencesListController *)self reindexIfNeeded];
    id v4 = *v3;
  }

  return v4;
}

- (void)setSystemAppSpecifiers:(id)a3
{
}

- (int64_t)navigationItemLargeTitleDisplayMode
{
  return 0;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COSPreferencesListController;
  [(COSPreferencesListController *)&v4 dealloc];
}

- (void)suppressControllerAnimationForExpiry
{
  self->_suppressControllerAnimationForExpiry = 1;
}

- (id)title
{
  return 0;
}

- (id)settingsFileName
{
  return 0;
}

- (id)settingsBundleDirectory
{
  return 0;
}

- (BOOL)reloadsWhenBecomingActive
{
  return 0;
}

- (id)additionalSpecifiers
{
  return 0;
}

- (id)hardcodedSpecifiers
{
  return 0;
}

- (void)removeSystemAppSpecifiers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000616E0;
  v5[3] = &unk_100243908;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)_removeSystemAppSpecifierFromCache:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(COSPreferencesListController *)self systemAppSpecifiers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 identifier];
        unsigned int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v12 = [(COSPreferencesListController *)self systemAppSpecifiers];
  [v12 removeObject:v6];
}

- (id)localizedPrefsStringForString:(id)a3
{
  return 0;
}

- (PSController)categoryController
{
  v2 = [(COSPreferencesListController *)self splitViewController];
  id v3 = [v2 containerNavigationController];

  id v4 = [v3 viewControllers];
  id v5 = [v4 firstObject];

  return (PSController *)v5;
}

- (void)launchBridgeSetup:(id)a3
{
  id v3 = +[UIApplication sharedApplication];
  [v3 presentSetupFlowAnimated:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [(COSPreferencesListController *)self specifierAtIndex:[(COSPreferencesListController *)self indexForIndexPath:a4]];
  [(COSPreferencesListController *)self _showControllerFromSpecifier:v5];
}

- (int64_t)indexOfGeneralController
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)selectGeneralCategory
{
}

- (void)selectGeneralCategoryForced:(BOOL)a3
{
}

- (void)selectGeneralCategoryForced:(BOOL)a3 showController:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(COSPreferencesListController *)self indexPathForIndex:[(COSPreferencesListController *)self indexOfGeneralController]];
  uint64_t v8 = (void *)v7;
  unsigned int v11 = (void *)v7;
  if (!v7 || a3)
  {
    if (!v7) {
      goto LABEL_9;
    }
    uint64_t v9 = OBJC_IVAR___PSListController__table;
  }
  else
  {
    uint64_t v9 = OBJC_IVAR___PSListController__table;
    id v10 = [(COSPreferencesListController *)self tableView:*(void *)&self->super.BPSListController_opaque[OBJC_IVAR___PSListController__table] willSelectRowAtIndexPath:v7];

    uint64_t v8 = v11;
    if (v10 != v11) {
      goto LABEL_9;
    }
  }
  [*(id *)&self->super.BPSListController_opaque[v9] selectRowAtIndexPath:v8 animated:0 scrollPosition:0];
  uint64_t v8 = v11;
  if (v4)
  {
    [(COSPreferencesListController *)self tableView:*(void *)&self->super.BPSListController_opaque[v9] didSelectRowAtIndexPath:v11];
    uint64_t v8 = v11;
  }
LABEL_9:
}

- (void)_showControllerFromSpecifier:(id)a3
{
  id v5 = [(COSPreferencesListController *)self selectSpecifier:a3];
  if (v5)
  {
    BOOL v4 = [(COSPreferencesListController *)self splitViewController];
    [v4 showInitialViewController:v5];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (id *)&self->super.BPSListController_opaque[OBJC_IVAR___PSViewController__rootController];
  id WeakRetained = objc_loadWeakRetained(v6);
  if ([WeakRetained _isTransitioning])
  {

LABEL_4:
    id v11 = 0;
    goto LABEL_6;
  }
  id v8 = objc_loadWeakRetained(v6);
  uint64_t v9 = [v8 topViewController];
  id v10 = [v9 presentedViewController];

  if (v10) {
    goto LABEL_4;
  }
  id v11 = v5;
LABEL_6:

  return v11;
}

- (id)generalViewController
{
  return 0;
}

- (BOOL)reloadingSpecifiersUpdatesSearchModel
{
  return 1;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(COSPreferencesListController *)self pendingURLResourceDictionary];
    *(_DWORD *)buf = 136315394;
    id v18 = "-[COSPreferencesListController handleURL:withCompletion:]";
    __int16 v19 = 1024;
    BOOL v20 = v9 != 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: handling pending URL: %{BOOL}d", buf, 0x12u);
  }
  id v10 = [(COSPreferencesListController *)self pendingURLResourceDictionary];

  if (v10)
  {
    id v11 = [(COSPreferencesListController *)self pendingURLResourceDictionary];
    unsigned __int8 v12 = [v11 isEqualToDictionary:v6];

    if ((v12 & 1) == 0)
    {
      long long v13 = pbb_bridge_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = "-[COSPreferencesListController handleURL:withCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: pending url dictioanry is different from resource dictionary", buf, 0xCu);
      }
    }
    long long v14 = +[UIApplication sharedApplication];
    id v15 = [v6 mutableCopy];
    [v14 navigateToRootObjectWithURLDictionary:v15 animated:1];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)COSPreferencesListController;
    [(COSPreferencesListController *)&v16 handleURL:v6 withCompletion:v7];
  }
}

- (COSSystemAppsSettingsManager)systemAppsSettingsManager
{
  return self->_systemAppsSettingsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAppSpecifiers, 0);

  objc_storeStrong((id *)&self->_systemAppsSettingsManager, 0);
}

@end