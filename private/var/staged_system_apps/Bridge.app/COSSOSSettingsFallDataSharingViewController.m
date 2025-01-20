@interface COSSOSSettingsFallDataSharingViewController
+ (id)_TCCInfoItems;
+ (id)_displayNameForWatchBundleID:(id)a3;
+ (id)fallDetectionAppIDs;
- (COSSOSSettingsFallDataSharingViewController)init;
- (NSArray)items;
- (NSCache)imageCache;
- (NSMutableDictionary)companionBundleIDToWatchBundleID;
- (id)_generateTCCItems;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchAppIcons;
- (void)_fetchIconForBundleID:(id)a3 atIndex:(unint64_t)a4;
- (void)_togglePrivacySettingForIndexPath:(id)a3;
- (void)dealloc;
- (void)setCompanionBundleIDToWatchBundleID:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setItems:(id)a3;
- (void)switchCellDidChangeValue:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSSOSSettingsFallDataSharingViewController

- (COSSOSSettingsFallDataSharingViewController)init
{
  v28.receiver = self;
  v28.super_class = (Class)COSSOSSettingsFallDataSharingViewController;
  v2 = [(COSSOSSettingsFallDataSharingViewController *)&v28 initWithStyle:2];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    companionBundleIDToWatchBundleID = v2->_companionBundleIDToWatchBundleID;
    v2->_companionBundleIDToWatchBundleID = (NSMutableDictionary *)v3;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v5 = +[COSSettingsListController installedWatchkitApps];
    v6 = [v5 allValues];

    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v12 = [v11 companionAppBundleID];
          if (v12)
          {
            v13 = (void *)v12;
            v14 = [v11 bundleIdentifier];

            if (v14)
            {
              v15 = [v11 bundleIdentifier];
              v16 = v2->_companionBundleIDToWatchBundleID;
              v17 = [v11 companionAppBundleID];
              [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    uint64_t v18 = [(COSSOSSettingsFallDataSharingViewController *)v2 _generateTCCItems];
    items = v2->_items;
    v2->_items = (NSArray *)v18;

    v20 = (NSCache *)objc_alloc_init((Class)NSCache);
    imageCache = v2->_imageCache;
    v2->_imageCache = v20;

    [(COSSOSSettingsFallDataSharingViewController *)v2 _fetchAppIcons];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10004B8FC, @"com.apple.tcc.access.changed", 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.tcc.access.changed", 0);
  v4.receiver = self;
  v4.super_class = (Class)COSSOSSettingsFallDataSharingViewController;
  [(COSSOSSettingsFallDataSharingViewController *)&v4 dealloc];
}

+ (id)fallDetectionAppIDs
{
  v2 = (void *)TCCAccessCopyBundleIdentifiersForService();
  uint64_t v3 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
  objc_super v4 = +[NSSet setWithArray:v2];
  v5 = [v4 setByAddingObjectsFromArray:v3];

  v6 = +[NSMutableSet set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = +[COSSettingsListController installedWatchkitApps];
  id v8 = [v7 allValues];

  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = [v13 bundleIdentifier];

        if (v14)
        {
          v15 = [v13 bundleIdentifier];
          [v6 addObject:v15];
        }
        v16 = [v13 companionAppBundleID];

        if (v16)
        {
          v17 = [v13 companionAppBundleID];
          [v6 addObject:v17];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  [v6 intersectSet:v5];
  id v18 = [v6 copy];

  return v18;
}

+ (id)_TCCInfoItems
{
  uint64_t v2 = TCCAccessCopyInformation();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    objc_super v4 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = [v10 objectForKeyedSubscript:kTCCInfoBundle];

          if (v11) {
            [v4 addObject:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)_generateTCCItems
{
  v53 = +[NSMutableArray array];
  uint64_t v3 = +[NSMutableSet set];
  v52 = self;
  [(id)objc_opt_class() _TCCInfoItems];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v63;
    uint64_t v49 = _kCFBundleDisplayNameKey;
    CFStringRef v48 = kCFBundleNameKey;
    id v7 = &kTCCInfoGranted;
    do
    {
      uint64_t v8 = 0;
      id v50 = v5;
      do
      {
        if (*(void *)v63 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v8);
        id v10 = [v9 objectForKeyedSubscript:*v7, v48];
        uint64_t v11 = [v9 objectForKeyedSubscript:kTCCInfoBundle];

        if (v11)
        {
          uint64_t v12 = CFBundleGetInfoDictionary((CFBundleRef)v11);
          long long v13 = CFBundleGetIdentifier((CFBundleRef)v11);
          long long v14 = [(NSMutableDictionary *)v52->_companionBundleIDToWatchBundleID objectForKeyedSubscript:v13];
          if (v14)
          {
            uint64_t v15 = v6;
            long long v16 = v7;
            [v3 addObject:v13];
            [v3 addObject:v14];
            v17 = +[COSSOSSettingsFallDataSharingViewController _displayNameForWatchBundleID:v14];
            if (!v17)
            {
              id v18 = [v12 objectForKeyedSubscript:v49];
              v19 = v18;
              if (v18)
              {
                id v20 = v18;
              }
              else
              {
                id v20 = [v12 objectForKeyedSubscript:v48];
              }
              v17 = v20;
            }
            long long v21 = -[_COSTCCItem initWithBundleID:displayName:enabled:]([_COSTCCItem alloc], "initWithBundleID:displayName:enabled:", v13, v17, [v10 BOOLValue]);
            [v53 addObject:v21];

            id v7 = v16;
            uint64_t v6 = v15;
            id v5 = v50;
          }
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    }
    while (v5);
  }
  long long v22 = (void *)TCCAccessCopyBundleIdentifiersForService();
  long long v23 = +[NSSet setWithArray:v22];

  long long v24 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
  long long v25 = +[NSSet setWithArray:v24];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v26 = v23;
  id v27 = [v26 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        if (([v3 containsObject:v31] & 1) == 0)
        {
          v32 = +[COSSettingsListController installedWatchkitApps];
          v33 = [v32 objectForKey:v31];

          if (v33)
          {
            v34 = +[COSSOSSettingsFallDataSharingViewController _displayNameForWatchBundleID:v31];
            v35 = [[_COSTCCItem alloc] initWithBundleID:v31 displayName:v34 enabled:1];
            [v53 addObject:v35];
          }
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v28);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v36 = v25;
  id v37 = [v36 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v55;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v55 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
        if (([v3 containsObject:v41] & 1) == 0)
        {
          v42 = +[COSSettingsListController installedWatchkitApps];
          v43 = [v42 objectForKey:v41];

          if (v43)
          {
            v44 = +[COSSOSSettingsFallDataSharingViewController _displayNameForWatchBundleID:v41];
            v45 = [[_COSTCCItem alloc] initWithBundleID:v41 displayName:v44 enabled:0];
            [v53 addObject:v45];
          }
        }
      }
      id v38 = [v36 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v38);
  }

  v46 = [v53 sortedArrayUsingComparator:&stru_1002446E8];

  return v46;
}

- (void)_fetchAppIcons
{
  if ([(NSArray *)self->_items count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [(NSArray *)self->_items objectAtIndexedSubscript:v3];
      companionBundleIDToWatchBundleID = self->_companionBundleIDToWatchBundleID;
      uint64_t v6 = [v4 bundleID];
      id v7 = [(NSMutableDictionary *)companionBundleIDToWatchBundleID objectForKeyedSubscript:v6];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [v4 bundleID];
      }
      id v10 = v9;

      [(COSSOSSettingsFallDataSharingViewController *)self _fetchIconForBundleID:v10 atIndex:v3];
      ++v3;
    }
    while (v3 < [(NSArray *)self->_items count]);
  }
}

- (void)_fetchIconForBundleID:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[UIScreen mainScreen];
  uint64_t v8 = [v7 traitCollection];
  [v8 displayScale];
  if (v9 <= 2.0) {
    uint64_t v10 = 47;
  }
  else {
    uint64_t v10 = 48;
  }

  uint64_t v11 = +[NanoResourceGrabber sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004C548;
  v13[3] = &unk_100244738;
  v13[4] = self;
  id v14 = v6;
  unint64_t v15 = a4;
  id v12 = v6;
  [v11 getIconForBundleID:v12 iconVariant:v10 block:v13 timeout:-1.0];
}

+ (id)_displayNameForWatchBundleID:(id)a3
{
  id v3 = a3;
  id v4 = (id)kCFBundleNameKey;
  id v5 = (__CFString *)_kCFBundleDisplayNameKey;
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, 0);
  id v7 = +[ACXDeviceConnection sharedDeviceConnection];
  uint64_t v8 = +[NSLocale preferredLanguages];
  id v40 = 0;
  id v9 = [v7 copyLocalizedValuesFromAllDevicesForInfoPlistKeys:v6 forAppWithBundleID:v3 fetchingFirstMatchingLocalizationInList:v8 error:&v40];
  id v10 = v40;

  if (v10)
  {
    uint64_t v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v3;
      __int16 v45 = 2112;
      id v46 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error fetching app name for %@, error %@", buf, 0x16u);
    }
    id v12 = 0;
  }
  else
  {
    v30 = v6;
    id v31 = v3;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v29 = v9;
    uint64_t v11 = v9;
    id v13 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v37;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          id v18 = [v11 objectForKeyedSubscript:v17];
          v19 = [v18 objectForKeyedSubscript:v5];

          if (v19)
          {
            long long v25 = [v11 objectForKeyedSubscript:v17];
            id v26 = v25;
            id v27 = v5;
LABEL_25:
            id v12 = [v25 objectForKeyedSubscript:v27];

            goto LABEL_26;
          }
        }
        id v14 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v11 = v11;
    id v12 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v12)
    {
      uint64_t v20 = *(void *)v33;
      while (2)
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v11);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
          long long v23 = [v11 objectForKeyedSubscript:v22];
          long long v24 = [v23 objectForKeyedSubscript:v4];

          if (v24)
          {
            long long v25 = [v11 objectForKeyedSubscript:v22];
            id v26 = v25;
            id v27 = v4;
            goto LABEL_25;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_26:
    id v6 = v30;
    id v3 = v31;
    id v9 = v29;
  }

  return v12;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)COSSOSSettingsFallDataSharingViewController;
  [(COSSOSSettingsFallDataSharingViewController *)&v6 viewDidLoad];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SOS_FALL_DETECTION_DATA_SHARING" value:&stru_100249230 table:@"SOSSettings"];
  [(COSSOSSettingsFallDataSharingViewController *)self setTitle:v4];

  id v5 = [(COSSOSSettingsFallDataSharingViewController *)self tableView];
  [v5 _setSectionHeaderFooterPadding:12.0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_items count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[_COSSOSSwitchTableViewCell reuseID];
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8];

  if (!v9)
  {
    id v10 = [_COSSOSSwitchTableViewCell alloc];
    uint64_t v11 = +[_COSSOSSwitchTableViewCell reuseID];
    id v9 = [(_COSSOSSwitchTableViewCell *)v10 initWithStyle:0 reuseIdentifier:v11 specifier:0];
  }
  [(_COSSOSSwitchTableViewCell *)v9 setDelegate:self];
  items = self->_items;
  id v13 = [v6 item];

  id v14 = [(NSArray *)items objectAtIndexedSubscript:v13];
  uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v14 enabled]);
  [(_COSSOSSwitchTableViewCell *)v9 setValue:v15];

  long long v16 = [v14 displayName];
  uint64_t v17 = [(_COSSOSSwitchTableViewCell *)v9 titleLabel];
  [v17 setText:v16];

  companionBundleIDToWatchBundleID = self->_companionBundleIDToWatchBundleID;
  v19 = [v14 bundleID];
  uint64_t v20 = [(NSMutableDictionary *)companionBundleIDToWatchBundleID objectForKeyedSubscript:v19];
  long long v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [v14 bundleID];
  }
  long long v23 = v22;

  long long v24 = [(NSCache *)self->_imageCache objectForKey:v23];
  long long v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = [(_COSSOSSwitchTableViewCell *)v9 blankIcon];
  }
  id v27 = v26;

  [(_COSSOSSwitchTableViewCell *)v9 setIcon:v27];

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = objc_alloc_init((Class)UITableViewHeaderFooterView);
  id v5 = +[UIListContentConfiguration plainFooterConfiguration];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SOS_FALL_DATA_SHARING_FOOTER" value:&stru_100249230 table:@"SOSSettings"];
  [v5 setText:v7];

  uint64_t v8 = PreferencesTableViewFooterFont();
  id v9 = [v5 textProperties];
  [v9 setFont:v8];

  id v10 = [v5 textProperties];
  [v10 setNumberOfLines:0];

  uint64_t v11 = PreferencesTableViewFooterColor();
  id v12 = [v5 textProperties];
  [v12 setColor:v11];

  [v4 setContentConfiguration:v5];
  id v13 = +[UIBackgroundConfiguration clearConfiguration];
  [v4 setBackgroundConfiguration:v13];

  return v4;
}

- (void)switchCellDidChangeValue:(id)a3
{
  id v4 = a3;
  id v5 = [(COSSOSSettingsFallDataSharingViewController *)self tableView];
  id v6 = [v5 indexPathForCell:v4];

  [(COSSOSSettingsFallDataSharingViewController *)self _togglePrivacySettingForIndexPath:v6];
}

- (void)_togglePrivacySettingForIndexPath:(id)a3
{
  if (a3)
  {
    items = self->_items;
    id v5 = a3;
    -[NSArray objectAtIndexedSubscript:](items, "objectAtIndexedSubscript:", [v5 item]);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v12 enabled];
    id v7 = [v12 bundleID];
    int v8 = TCCAccessSetForBundleId();

    if (v8)
    {
      [v12 setEnabled:v6 ^ 1];
      id v6 = (id)(v6 ^ 1);
    }
    id v9 = [(COSSOSSettingsFallDataSharingViewController *)self tableView];
    id v10 = [v9 cellForRowAtIndexPath:v5];

    uint64_t v11 = +[NSNumber numberWithUnsignedChar:v6];
    [v10 setValue:v11];
  }
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSMutableDictionary)companionBundleIDToWatchBundleID
{
  return self->_companionBundleIDToWatchBundleID;
}

- (void)setCompanionBundleIDToWatchBundleID:(id)a3
{
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_companionBundleIDToWatchBundleID, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end