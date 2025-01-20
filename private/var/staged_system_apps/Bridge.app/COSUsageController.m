@interface COSUsageController
+ (id)capacityBarCategoriesForUsageData:(id)a3;
+ (id)prettyUsageString:(float)a3;
- (BOOL)usageDataFailed;
- (BOOL)usageDataPending;
- (COSUsageController)init;
- (NSMutableArray)bundleUsages;
- (NSSManager)nssManager;
- (NSSUsageData)usageData;
- (id)appUsage:(id)a3;
- (id)dash;
- (id)specifiers;
- (void)initControls;
- (void)setBundleUsages:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setUsageData:(id)a3;
- (void)setUsageDataFailed:(BOOL)a3;
- (void)setUsageDataPending:(BOOL)a3;
@end

@implementation COSUsageController

- (COSUsageController)init
{
  v15.receiver = self;
  v15.super_class = (Class)COSUsageController;
  v2 = [(COSUsageController *)&v15 init];
  if (v2)
  {
    v3 = (NSSManager *)[objc_alloc((Class)NSSManager) initWithQueue:&_dispatch_main_q];
    nssManager = v2->_nssManager;
    v2->_nssManager = v3;

    uint64_t v5 = objc_opt_new();
    usageData = v2->_usageData;
    v2->_usageData = (NSSUsageData *)v5;

    v7 = +[NSThread currentThread];
    v8 = +[NSThread mainThread];

    if (v7 == v8)
    {
      v2->_usageDataPending = 1;
      objc_initWeak(&location, v2);
      v9 = v2->_nssManager;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000439C4;
      v11[3] = &unk_100244560;
      objc_copyWeak(&v13, &location);
      v12 = v2;
      [(NSSManager *)v9 getUsageData:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    [(COSUsageController *)v2 initControls];
  }
  return v2;
}

- (void)initControls
{
  id v4 = [(COSUsageController *)self navigationItem];
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"TITLE" value:&stru_100249230 table:@"Usage"];
  [v4 setTitle:v3];
}

- (id)specifiers
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"APPLE_WATCH" value:&stru_100249230 table:@"Usage"];
  v36 = +[PSCapacityBarCell specifierWithTitle:v3];

  if (self->_usageDataFailed)
  {
    id v4 = &__kCFBooleanTrue;
    uint64_t v5 = &PSCapacityBarHideLegendKey;
    v6 = v36;
  }
  else
  {
    v6 = v36;
    if (self->_usageDataPending)
    {
      uint64_t v5 = &PSCapacityBarHideLegendKey;
      v7 = &__kCFBooleanTrue;
      v8 = &PSCapacityBarForceLoadingKey;
    }
    else
    {
      [v36 setProperty:&__kCFBooleanTrue forKey:PSCapacityBarShowOtherDataLegendKey];
      uint64_t v5 = &PSCapacityBarForceLoadingKey;
      v7 = &__kCFBooleanFalse;
      v8 = &PSCapacityBarHideLegendKey;
    }
    [v36 setProperty:v7 forKey:*v8];
    id v4 = &__kCFBooleanFalse;
  }
  [v6 setProperty:v4 forKey:*v5];
  v9 = +[UIColor systemLightGrayColor];
  [v36 setProperty:v9 forKey:PSCapacityBarOtherDataColorKey];

  id v10 = objc_alloc_init((Class)PSCapacityBarData);
  [v10 setCapacity:[self->_usageData capacityInBytes]];
  v34 = v10;
  [v10 setBytesUsed:[self->_usageData usedStorageInBytes]];
  v11 = +[COSUsageController capacityBarCategoriesForUsageData:self->_usageData];
  [v10 setCategories:v11];

  [v36 setProperty:v10 forKey:PSCapacityBarDataKey];
  v38 = +[NanoResourceGrabber sharedInstance];
  v12 = +[UIScreen mainScreen];
  id v13 = [v12 traitCollection];
  [v13 displayScale];
  if (v14 <= 2.0) {
    int v15 = 47;
  }
  else {
    int v15 = 48;
  }
  unsigned int v37 = v15;

  v41 = objc_opt_new();
  id v35 = objc_alloc_init((Class)NSMutableArray);
  [v35 addObject:v36];
  v16 = +[PSSpecifier emptyGroupSpecifier];
  [v35 addObject:v16];

  v17 = self;
  if (self->_usageDataPending)
  {
    v18 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0);
    [v35 addObject:v18];

    v17 = self;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = [(NSSUsageData *)v17->_usageData appBundleUsage];
  id v19 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v50;
    uint64_t v39 = PSIconImageKey;
    uint64_t v40 = PSPrioritizeValueTextDisplayKey;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v50 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v23 = [v22 size];
        if ((uint64_t)[v23 userTotal] >= 1000000)
        {
          v24 = [v22 bundleIdentifier];
          v25 = [v22 name];
          v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:"appUsage:" detail:objc_opt_class() cell:2 edit:0];

          [v26 setProperty:&__kCFBooleanTrue forKey:v40];
          [v26 setUserInfo:v22];
          [v26 setIdentifier:v24];
          if ([v24 isEqualToString:@"com.apple.MobileAddressBook"])
          {
            v27 = BPSLocalIconName();
            v28 = +[UIImage imageNamed:v27];

            v29 = BPSCreateRoundedGizmoAppIconForSquareImage();

            [v26 setProperty:v29 forKey:v39];
          }
          else
          {
            v30 = PSBlankIconImage();
            [v26 setProperty:v30 forKey:v39];

            objc_initWeak(&location, self);
            id v31 = &_dispatch_main_q;
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_100044350;
            v44[3] = &unk_100244588;
            objc_copyWeak(&v47, &location);
            id v45 = v26;
            id v46 = v24;
            [v38 getIconForBundleID:v46 iconVariant:v37 queue:&_dispatch_main_q block:v44 timeout:-1.0];

            objc_destroyWeak(&v47);
            objc_destroyWeak(&location);
          }
          v32 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v23 userTotal]);
          [v26 setProperty:v32 forKey:@"TOTAL_SIZE"];

          [v41 addObject:v26];
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v19);
  }

  [v41 sortUsingComparator:&stru_1002445C8];
  [v35 addObjectsFromArray:v41];
  objc_storeStrong((id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers], v35);

  return v35;
}

- (id)dash
{
  return +[NSString stringWithFormat:@"%C", 8212];
}

- (id)appUsage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 propertyForKey:@"TOTAL_SIZE"];
  v6 = v5;
  if (!v5 || [v5 integerValue] == (id)-1)
  {
    uint64_t v12 = [(COSUsageController *)self dash];
  }
  else
  {
    v7 = [v4 propertyForKey:@"TOTAL_SIZE"];
    [v7 floatValue];
    int v9 = v8;

    id v10 = objc_opt_class();
    LODWORD(v11) = v9;
    uint64_t v12 = [v10 prettyUsageString:v11];
  }
  id v13 = (void *)v12;

  return v13;
}

+ (id)prettyUsageString:(float)a3
{
  if (a3 > 0.0)
  {
    id v4 = NSLocalizedFileSizeDescription();
  }
  else
  {
    v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"NO_DATA" value:&stru_100249230 table:@"Usage"];
  }

  return v4;
}

+ (id)capacityBarCategoriesForUsageData:(id)a3
{
  id v29 = a3;
  v3 = +[NSMutableArray array];
  v36[0] = NSCategoryAppsKey;
  id v4 = +[UIColor systemPinkColor];
  v37[0] = v4;
  v36[1] = NSCategoryPhotosKey;
  uint64_t v5 = +[UIColor systemYellowColor];
  v37[1] = v5;
  v36[2] = NSCategoryMessagesKey;
  v6 = +[UIColor systemGreenColor];
  v37[2] = v6;
  v36[3] = NSCategoryBooksKey;
  v7 = +[UIColor systemOrangeColor];
  v37[3] = v7;
  v36[4] = NSCategoryMediaKey;
  int v8 = +[UIColor systemPurpleColor];
  v37[4] = v8;
  v36[5] = NSCategoryMailKey;
  int v9 = +[UIColor systemBlueColor];
  v37[5] = v9;
  v36[6] = NSCategoryCloudDriveKey;
  id v10 = +[UIColor systemTealColor];
  v37[6] = v10;
  v36[7] = NSCategorySystemKey;
  double v11 = +[UIColor systemDarkMidGrayColor];
  v37[7] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:8];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v29 categories];
  id v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v18 = [v17 categoryIdentifier];
        id v19 = [v17 name];
        if (!v19)
        {
          uint64_t v20 = +[NSBundle mainBundle];
          v21 = [v17 categoryIdentifier];
          id v19 = [v20 localizedStringForKey:v21 value:&stru_100249230 table:@"Usage"];
        }
        id v22 = objc_alloc((Class)PSCapacityBarCategory);
        v23 = [v12 objectForKeyedSubscript:v18];
        v24 = [v17 size];
        id v25 = [v22 initWithIdentifier:v18 title:v19 color:v23 bytes:[v24 userTotal]];

        [v3 addObject:v25];
      }
      id v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  v26 = v3;
  v27 = [v3 sortedArrayUsingComparator:&stru_100244608];

  return v27;
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (NSMutableArray)bundleUsages
{
  return self->_bundleUsages;
}

- (void)setBundleUsages:(id)a3
{
}

- (NSSUsageData)usageData
{
  return self->_usageData;
}

- (void)setUsageData:(id)a3
{
}

- (BOOL)usageDataPending
{
  return self->_usageDataPending;
}

- (void)setUsageDataPending:(BOOL)a3
{
  self->_usageDataPending = a3;
}

- (BOOL)usageDataFailed
{
  return self->_usageDataFailed;
}

- (void)setUsageDataFailed:(BOOL)a3
{
  self->_usageDataFailed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageData, 0);
  objc_storeStrong((id *)&self->_bundleUsages, 0);

  objc_storeStrong((id *)&self->_nssManager, 0);
}

@end