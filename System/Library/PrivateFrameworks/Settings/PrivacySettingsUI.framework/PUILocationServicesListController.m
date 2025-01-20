@interface PUILocationServicesListController
+ (BOOL)isCoreRoutineAuthorized;
+ (BOOL)isLocationRestricted;
+ (void)setCoreRoutineAuthorized:(BOOL)a3;
- (BOOL)_isBundleBlacklisted:(id)a3;
- (BOOL)_isFindMyDeviceSpecifier:(id)a3;
- (BOOL)_shouldEnableLocationSharingSpecifier;
- (BOOL)isLocationSharingEnabled;
- (BOOL)isLocationSharingModificationAllowed;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (NSMutableArray)coalescedImproveMapsServices;
- (NSNumber)locationSharingEnabled;
- (NSOperationQueue)locationSharingOperationQueue;
- (NSString)appClipsCount;
- (PSSpecifier)tribecaSpecifier;
- (PUILocationServicesListController)init;
- (_TtC17PrivacySettingsUI12PUIFMLDevice)locationSharingDevice;
- (_TtC17PrivacySettingsUI19FindMyLocateSession)locationSharingSession;
- (id)accountStore;
- (id)hiddenBundleIdentifiers;
- (id)isEntityAuthorized:(id)a3;
- (id)isLocationServicesEnabled:(id)a3;
- (id)loadSensorKitSpecifiersProvider;
- (id)localizedDisplayNameForBundleID:(id)a3;
- (id)locationDetailSpecifiersForAppsAndBundles;
- (id)locationDetailSpecifiersWithDetailsMatching:(id)a3;
- (id)locationSharingSpecifiers;
- (id)primaryAccount;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)valueForSpecifier:(id)a3;
- (int)locationUsageBasedOnDetails:(id)a3;
- (int)locationUsageForEntity:(id)a3;
- (void)_cancelConfirmDisableForSpecifier:(id)a3;
- (void)_locationSharingSpecifierWasTapped:(id)a3;
- (void)_setEntityAuthorized:(BOOL)a3 specifier:(id)a4;
- (void)_setLocationServicesEnabled:(BOOL)a3;
- (void)dealloc;
- (void)didChangeActiveLocationSharingDevice:(id)a3;
- (void)didUpdateHidingStatus:(BOOL)a3;
- (void)disableAfterLoginConfirmation:(id)a3;
- (void)mainThreadConnectionError:(id)a3;
- (void)mainThreadDidChangeActiveLocationSharingDevice:(id)a3;
- (void)mainThreadDidUpdateHidingStatus:(BOOL)a3;
- (void)profileNotification:(id)a3;
- (void)provideNavigationDonations;
- (void)setAppClipsCount:(id)a3;
- (void)setAuthLevel:(unint64_t)a3 forCell:(id)a4;
- (void)setCoalescedImproveMapsServices:(id)a3;
- (void)setEntityAuthorized:(id)a3 specifier:(id)a4;
- (void)setLocationServicesEnabled:(id)a3 specifier:(id)a4;
- (void)setLocationSharingDevice:(id)a3;
- (void)setLocationSharingEnabled:(id)a3;
- (void)setLocationSharingOperationQueue:(id)a3;
- (void)setLocationSharingSession:(id)a3;
- (void)setSOSEntityAuthorized:(id)a3 specifier:(id)a4;
- (void)setTribecaSpecifier:(id)a3;
- (void)setUsage:(int)a3 forCell:(id)a4;
- (void)showLocationPrivacyPage;
- (void)startLocationStatusUpdates;
- (void)startUpdatingFindMyPreferences;
- (void)stopLocationStatusUpdates;
- (void)updateFindMyFriendsStateBasedOnRestriction;
- (void)updateForApplicationDidBecomeActive:(id)a3;
- (void)updateLocationSharing;
- (void)updateLocationSharingSpecifiersWithReload:(BOOL)a3;
- (void)updateLocationUsage;
- (void)updateMutableStateBasedOnRestriction;
- (void)updateMutableStateForLocationSharing;
- (void)updateRecentlyUsedDate;
- (void)updateSpecifiersForImposedSettings;
- (void)updateSpecifiersForImposedSettingsWithReload:(BOOL)a3;
- (void)updateTribecaText;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation PUILocationServicesListController

- (PUILocationServicesListController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PUILocationServicesListController;
  v2 = [(PUILocationServicesListController *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC17PrivacySettingsUI19FindMyLocateSession);
    locationSharingSession = v2->_locationSharingSession;
    v2->_locationSharingSession = v3;

    [(PUILocationServicesListController *)v2 startUpdatingFindMyPreferences];
    [(PUILocationServicesListController *)v2 updateRecentlyUsedDate];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.settings.PrivacySettingsUI.PUILocationServicesListController.locationServicesAccessQueue", 0);
    locationServicesAccessQueue = v2->locationServicesAccessQueue;
    v2->locationServicesAccessQueue = (OS_dispatch_queue *)v5;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel_updateForApplicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_profileNotification_ name:@"PSProfileConnectionEffectiveSettingsChangedNotification" object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel_updateAppClipsSpecifierCount_ name:@"com.apple.PrivacySettingsUI.LocationAppClipsStateChanged" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2628] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"PSProfileConnectionEffectiveSettingsChangedNotification" object:0];

  dispatch_queue_t v5 = [(PUILocationServicesListController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(PUILocationServicesListController *)self dismissViewControllerAnimated:0 completion:0];
  }
  [(PUILocationServicesListController *)self stopLocationStatusUpdates];
  [(FindMyLocateSession *)self->_locationSharingSession stopMonitoringPreferenceChangesWithCompletionHandler:&__block_literal_global_264];
  v7.receiver = self;
  v7.super_class = (Class)PUILocationServicesListController;
  [(PUILocationServicesListController *)&v7 dealloc];
}

void __44__PUILocationServicesListController_dealloc__block_invoke()
{
  v0 = _PUILoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E4AD5000, v0, OS_LOG_TYPE_DEFAULT, "findmylocate: stopMonitoringPreferenceChanges completed ", v1, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesListController;
  [(PUILocationServicesListController *)&v4 viewDidAppear:a3];
  [(PUILocationServicesListController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = PUI_BundleForPrivacySettingsFramework();
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  objc_super v7 = (void *)[v5 initWithKey:@"LOCATION_SERVICES" table:@"Location Services" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/LOCATION"];
  [(PUILocationServicesListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.location" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (void)profileNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PUILocationServicesListController_profileNotification___block_invoke;
  v6[3] = &unk_1E6E9CBA0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__PUILocationServicesListController_profileNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F741F8]];

  LODWORD(v2) = [v3 intValue];
  if (v2 != getpid()) {
    [*(id *)(a1 + 40) reloadSpecifiers];
  }
}

- (void)setAuthLevel:(unint64_t)a3 forCell:(id)a4
{
  id v8 = a4;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [v8 location];
    v6 = v5;
    if (v5)
    {
      if ([v5 authLevel] != a3
        || ([v6 authLevelString], id v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
      {
        [v6 setAuthLevel:a3];
        [v8 layoutIfNeeded];
      }
    }
  }
  else
  {
    v6 = 0;
  }
}

- (void)setUsage:(int)a3 forCell:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (([v7 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([v7 isMemberOfClass:objc_opt_class()] & 1) != 0
    || [v7 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [v7 location];
    v6 = v5;
    if (v5 && [v5 usage] != v4)
    {
      [v6 setUsage:v4];
      [v7 setNeedsLayout];
    }
  }
  else
  {
    v6 = 0;
  }
}

- (void)updateLocationUsage
{
  id v3 = _PUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "locationManager:updateLocationUsage", buf, 2u);
  }

  uint64_t v4 = (void *)PSUICLCopyAppsUsingLocation();
  id v5 = [(NSDictionary *)self->_locationEntitiesDetails allKeys];
  v6 = [v4 allKeys];
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count]
    && ([MEMORY[0x1E4F1CAD0] setWithArray:v5],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x1E4F1CAD0] setWithArray:v6],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 isEqualToSet:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    objc_storeStrong((id *)&self->_locationEntitiesDetails, v4);
    locationEntitiesDetails = self->_locationEntitiesDetails;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__PUILocationServicesListController_updateLocationUsage__block_invoke;
    v12[3] = &unk_1E6E9D5E8;
    v12[4] = self;
    [(NSDictionary *)locationEntitiesDetails enumerateKeysAndObjectsUsingBlock:v12];
  }
  else
  {
    [(PUILocationServicesListController *)self reloadSpecifiers];
  }
}

void __56__PUILocationServicesListController_updateLocationUsage__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  id v10 = v8;
  if (([*(id *)(*(void *)(a1 + 32) + 1432) containsObject:v9] & 1) == 0)
  {
    objc_super v11 = [*(id *)(a1 + 32) specifierForID:v9];
    if (v11)
    {
      v12 = *(void **)(a1 + 32);
      uint64_t v13 = [v12 locationUsageForEntity:v9];
      uint64_t v14 = *MEMORY[0x1E4F93220];
      v15 = [v11 propertyForKey:*MEMORY[0x1E4F93220]];
      [v12 setUsage:v13 forCell:v15];

      v16 = *(void **)(a1 + 32);
      id CLLocationManagerClass = getCLLocationManagerClass();
      v18 = *(void **)(*(void *)(a1 + 32) + 1384);
      v19 = [v11 identifier];
      v20 = [v18 objectForKey:v19];
      uint64_t v21 = [CLLocationManagerClass entityAuthorizationForLocationDictionary:v20];
      v22 = [v11 propertyForKey:v14];
      [v16 setAuthLevel:v21 forCell:v22];

      uint64_t v23 = [getCLLocationManagerClass() isEntityAuthorizedForLocationDictionary:v10];
      v24 = [v11 propertyForKey:*MEMORY[0x1E4F930F0]];
      if (v23 != [v24 isOn]) {
        [v24 setOn:v23 animated:1];
      }
    }
    else
    {
      v25 = _PUILoggingFacility();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        __56__PUILocationServicesListController_updateLocationUsage__block_invoke_cold_1();
      }

      [*(id *)(a1 + 32) reloadSpecifiers];
      *a4 = 1;
    }
  }
}

- (void)startLocationStatusUpdates
{
  if (!self->_locationNotificationsEnabled)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getCLAppStatusChangedNotification();
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)entityStateCallback, v4, 0, (CFNotificationSuspensionBehavior)0);

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, self, (CFNotificationCallback)appInstallCallback, @"com.apple.LaunchServices.applicationRegistered", 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)appUninstallCallback, @"com.apple.LaunchServices.applicationUnregistered", 0, (CFNotificationSuspensionBehavior)0);
    self->_locationNotificationsEnabled = 1;
  }
}

- (void)stopLocationStatusUpdates
{
  if (self->_locationNotificationsEnabled)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getCLAppStatusChangedNotification();
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.LaunchServices.applicationRegistered", 0);
    v6 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterRemoveObserver(v6, self, @"com.apple.LaunchServices.applicationUnregistered", 0);
    self->_locationNotificationsEnabled = 0;
  }
}

- (int)locationUsageBasedOnDetails:(id)a3
{
  id v4 = a3;
  char v5 = [getCLLocationManagerClass() activeLocationServiceTypesForLocationDictionary:v4];
  if ((v5 & 2) != 0)
  {
    int v8 = 3;
  }
  else if (v5)
  {
    int v8 = 4;
  }
  else
  {
    v6 = [getCLLocationManagerClass() dateLocationLastUsedForLocationDictionary:v4];
    if (v6)
    {
      id v7 = [(NSDate *)self->_twentyFourHoursAgo laterDate:v6];
      if (v7 == v6) {
        int v8 = 2;
      }
      else {
        int v8 = 1;
      }
    }
    else
    {
      int v8 = 0;
    }
  }
  return v8;
}

- (int)locationUsageForEntity:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 isEqualToString:@"SYSTEM_SERVICES"])
  {
    if ([v4 isEqualToString:@"APP_CLIPS"])
    {
      int v5 = +[PUILocationServicesClipsListController clipsLocationUsage];
      goto LABEL_5;
    }
    if ([v4 isEqualToString:@"LOCATION_BASED_ALERTS"])
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v7 = self->_coalescedLocationBasedAlertsSystemServices;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v56;
        int v6 = -1;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v56 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = [(NSDictionary *)self->_locationEntitiesDetails objectForKey:*(void *)(*((void *)&v55 + 1) + 8 * i)];
            int v13 = [(PUILocationServicesListController *)self locationUsageBasedOnDetails:v12];

            if (v13 > v6) {
              int v6 = v13;
            }
          }
          uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v9);
        goto LABEL_62;
      }
    }
    else if ([v4 isEqualToString:@"HOMEKIT"])
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v7 = self->_coalescedHomeKitSystemServices;
      uint64_t v14 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v51 objects:v62 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v52;
        int v6 = -1;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v52 != v16) {
              objc_enumerationMutation(v7);
            }
            v18 = [(NSDictionary *)self->_locationEntitiesDetails objectForKey:*(void *)(*((void *)&v51 + 1) + 8 * j)];
            int v19 = [(PUILocationServicesListController *)self locationUsageBasedOnDetails:v18];

            if (v19 > v6) {
              int v6 = v19;
            }
          }
          uint64_t v15 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v51 objects:v62 count:16];
        }
        while (v15);
        goto LABEL_62;
      }
    }
    else if ([v4 isEqualToString:@"NETWORKING_WIRELESS"])
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v7 = self->_coalescedWirelessSystemServices;
      uint64_t v20 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v47 objects:v61 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v48;
        int v6 = -1;
        do
        {
          for (uint64_t k = 0; k != v21; ++k)
          {
            if (*(void *)v48 != v22) {
              objc_enumerationMutation(v7);
            }
            v24 = [(NSDictionary *)self->_locationEntitiesDetails objectForKey:*(void *)(*((void *)&v47 + 1) + 8 * k)];
            int v25 = [(PUILocationServicesListController *)self locationUsageBasedOnDetails:v24];

            if (v25 > v6) {
              int v6 = v25;
            }
          }
          uint64_t v21 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v47 objects:v61 count:16];
        }
        while (v21);
        goto LABEL_62;
      }
    }
    else if ([v4 isEqualToString:@"ROUTING_AND_TRAFFIC"])
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v7 = self->_coalescedRoutingAndTrafficSystemServices;
      uint64_t v26 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v43 objects:v60 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v44;
        int v6 = -1;
        do
        {
          for (uint64_t m = 0; m != v27; ++m)
          {
            if (*(void *)v44 != v28) {
              objc_enumerationMutation(v7);
            }
            v30 = [(NSDictionary *)self->_locationEntitiesDetails objectForKey:*(void *)(*((void *)&v43 + 1) + 8 * m)];
            int v31 = [(PUILocationServicesListController *)self locationUsageBasedOnDetails:v30];

            if (v31 > v6) {
              int v6 = v31;
            }
          }
          uint64_t v27 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v43 objects:v60 count:16];
        }
        while (v27);
        goto LABEL_62;
      }
    }
    else
    {
      if (![v4 isEqualToString:@"POLARIS"])
      {
        id v7 = [(NSDictionary *)self->_locationEntitiesDetails objectForKey:v4];
        int v6 = [(PUILocationServicesListController *)self locationUsageBasedOnDetails:v7];
        goto LABEL_62;
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v7 = [(PUILocationServicesListController *)self coalescedImproveMapsServices];
      uint64_t v32 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v59 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v40;
        int v6 = -1;
        do
        {
          for (uint64_t n = 0; n != v33; ++n)
          {
            if (*(void *)v40 != v34) {
              objc_enumerationMutation(v7);
            }
            v36 = [(NSDictionary *)self->_locationEntitiesDetails objectForKey:*(void *)(*((void *)&v39 + 1) + 8 * n)];
            int v37 = [(PUILocationServicesListController *)self locationUsageBasedOnDetails:v36];

            if (v37 > v6) {
              int v6 = v37;
            }
          }
          uint64_t v33 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v59 count:16];
        }
        while (v33);
        goto LABEL_62;
      }
    }
    int v6 = -1;
LABEL_62:

    goto LABEL_63;
  }
  int v5 = +[PUILocationSystemServicesListController systemServicesLocationUsage];
LABEL_5:
  int v6 = v5;
LABEL_63:

  return v6;
}

+ (BOOL)isCoreRoutineAuthorized
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)PSUICLCopyAppsUsingLocation();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = objc_msgSend(v2, "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
        if ([getCLLocationManagerClass() primaryEntityClassForLocationDictionary:v6] == 16)
        {
          LOBYTE(v3) = [getCLLocationManagerClass() isEntityAuthorizedForLocationDictionary:v6];

          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (void)setCoreRoutineAuthorized:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)PSUICLCopyAppsUsingLocation();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        if ([getCLLocationManagerClass() primaryEntityClassForLocationDictionary:v9] == 16)
        {
          [getCLLocationManagerClass() setEntityAuthorized:v3 forLocationDictionary:v9];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)isLocationServicesEnabled:(id)a3
{
  isLocationServicesEnabled = self->_isLocationServicesEnabled;
  if (!isLocationServicesEnabled)
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(getCLLocationManagerClass(), "locationServicesEnabled"));
    uint64_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_isLocationServicesEnabled;
    self->_isLocationServicesEnabled = v5;

    isLocationServicesEnabled = self->_isLocationServicesEnabled;
  }
  return isLocationServicesEnabled;
}

- (void)setLocationServicesEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_isLocationServicesEnabled, a3);
  int v9 = [v7 BOOLValue];
  long long v10 = _PUILoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[PUILocationServicesListController setLocationServicesEnabled:specifier:]";
    __int16 v37 = 1024;
    int v38 = v9;
    _os_log_impl(&dword_1E4AD5000, v10, OS_LOG_TYPE_DEFAULT, "%s - enable: %d", buf, 0x12u);
  }

  if (v9 != [getCLLocationManagerClass() locationServicesEnabled])
  {
    if (v9)
    {
      [(PUILocationServicesListController *)self _setLocationServicesEnabled:1];
      if (isModificationAllowedForID(@"com.apple.findmy"))
      {
LABEL_22:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.Maps.LocationAuthorizationChangedNotification", 0, 0, 1u);
        goto LABEL_23;
      }
      [v8 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
      long long v11 = [v8 propertyForKey:*MEMORY[0x1E4F93220]];
      [v11 setCellEnabled:0];
    }
    else
    {
      if (PSIsInEDUMode()) {
        long long v13 = @"CONFIRM_LOCATION_EDU_TITLE";
      }
      else {
        long long v13 = @"CONFIRM_LOCATION_TITLE";
      }
      long long v11 = PUI_LocalizedStringForLocationServices(v13);
      uint64_t v14 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v15 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v16 = [v15 userInterfaceIdiom];

      unint64_t v17 = v16 & 0xFFFFFFFFFFFFFFFBLL;
      v18 = v11;
      if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v18 = [v8 name];
      }
      int v19 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v20 = [v19 userInterfaceIdiom];

      if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        uint64_t v21 = v11;
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v22 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v23 = [v22 userInterfaceIdiom];

      v24 = [v14 alertControllerWithTitle:v18 message:v21 preferredStyle:(v23 & 0xFFFFFFFFFFFFFFFBLL) == 1];
      if (v17 == 1) {

      }
      int v25 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v26 = PUI_LocalizedStringForLocationServices(@"CANCEL");
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __74__PUILocationServicesListController_setLocationServicesEnabled_specifier___block_invoke;
      v33[3] = &unk_1E6E9CC68;
      v33[4] = self;
      id v34 = v8;
      uint64_t v27 = [v25 actionWithTitle:v26 style:1 handler:v33];
      [v24 addAction:v27];

      uint64_t v28 = (void *)MEMORY[0x1E4FB1410];
      v29 = PUI_LocalizedStringForLocationServices(@"CONFIRM_LOCATION_TURN_OFF");
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __74__PUILocationServicesListController_setLocationServicesEnabled_specifier___block_invoke_2;
      v32[3] = &unk_1E6E9D610;
      v32[4] = self;
      v30 = [v28 actionWithTitle:v29 style:2 handler:v32];
      [v24 addAction:v30];

      [(PUILocationServicesListController *)self presentViewController:v24 animated:1 completion:0];
    }

    goto LABEL_22;
  }
  long long v12 = _PUILoggingFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[PUILocationServicesListController setLocationServicesEnabled:specifier:]";
    _os_log_impl(&dword_1E4AD5000, v12, OS_LOG_TYPE_DEFAULT, "%s - loc services were already enabled.", buf, 0xCu);
  }

LABEL_23:
}

uint64_t __74__PUILocationServicesListController_setLocationServicesEnabled_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelConfirmDisableForSpecifier:*(void *)(a1 + 40)];
}

uint64_t __74__PUILocationServicesListController_setLocationServicesEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLocationServicesEnabled:0];
}

- (void)_cancelConfirmDisableForSpecifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PUILocationServicesListController__cancelConfirmDisableForSpecifier___block_invoke;
  v6[3] = &unk_1E6E9CBA0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71__PUILocationServicesListController__cancelConfirmDisableForSpecifier___block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[1440])
  {
    [v2 reloadSpecifiers];
    *(unsigned char *)(*(void *)(a1 + 32) + 1440) = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) propertyForKey:*MEMORY[0x1E4F930F0]];
    [v3 setOn:1 animated:1];
  }
}

- (void)_setLocationServicesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = _PUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[PUILocationServicesListController _setLocationServicesEnabled:]";
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl(&dword_1E4AD5000, v5, OS_LOG_TYPE_DEFAULT, "%s - enable: %d", (uint8_t *)&v13, 0x12u);
  }

  if (!v3)
  {
    [(PUILocationServicesListController *)self stopLocationStatusUpdates];
    locationEntitiesDetails = self->_locationEntitiesDetails;
    self->_locationEntitiesDetails = 0;
  }
  [getCLLocationManagerClass() setLocationServicesEnabled:v3];
  uint64_t v7 = [(PUILocationServicesListController *)self rangeOfSpecifiersInGroupID:@"LOCATION_SHARING_GROUP"];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(PUILocationServicesListController *)self rangeOfSpecifiersInGroupID:@"LOCATION_SERVICES_MASTER"];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      -[PUILocationServicesListController _setLocationServicesEnabled:]();
    }
  }
  uint64_t v9 = v7;
  uint64_t v10 = v8;
  if (v3)
  {
    long long v11 = [(PUILocationServicesListController *)self locationDetailSpecifiersForAppsAndBundles];
    [(PUILocationServicesListController *)self insertContiguousSpecifiers:v11 atIndex:v9 + v10 animated:1];
  }
  else
  {
    long long v11 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]), "subarrayWithRange:", v7 + v8, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]), "count")- (v7+ v8));
    [(PUILocationServicesListController *)self removeContiguousSpecifiers:v11 animated:1];
  }

  [(PUILocationServicesListController *)self updateLocationSharingSpecifiersWithReload:1];
  [(PUILocationServicesListController *)self updateFindMyFriendsStateBasedOnRestriction];
  long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"com.apple.PrivacySettingsUI.LocationServicesStateChanged" object:0];
}

- (BOOL)_isFindMyDeviceSpecifier:(id)a3
{
  BOOL v3 = [a3 identifier];
  char v4 = [v3 hasSuffix:@"FindMyDevice.framework"];

  return v4;
}

- (id)isEntityAuthorized:(id)a3
{
  char v4 = [a3 identifier];
  id v5 = [(NSDictionary *)self->_locationEntitiesDetails objectForKey:v4];
  uint64_t v6 = [getCLLocationManagerClass() isEntityAuthorizedForLocationDictionary:v5];

  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];

  return v7;
}

- (void)_setEntityAuthorized:(BOOL)a3 specifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a4 identifier];
  uint64_t v7 = [(NSDictionary *)self->_locationEntitiesDetails objectForKey:v6];
  uint64_t v8 = _PUILoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    int v11 = 136446722;
    long long v12 = "-[PUILocationServicesListController _setEntityAuthorized:specifier:]";
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    BOOL v16 = v7;
    _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: authorized: %{public}@ for location dictionary: %{details}@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"com.apple.PrivacySettingsUI.LocationServicesStateChanged" object:0];

  [getCLLocationManagerClass() setEntityAuthorized:v4 forLocationDictionary:v7];
}

- (void)setEntityAuthorized:(id)a3 specifier:(id)a4
{
  id v9 = a4;
  uint64_t v6 = [a3 BOOLValue];
  if ((v6 & 1) == 0
    && [(PUILocationServicesListController *)self _isFindMyDeviceSpecifier:v9]
    && ([getPSGFindMyiPhoneControllerClass() shared],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isFindMyiPhoneEnabled],
        v7,
        v8))
  {
    [(PUILocationServicesListController *)self disableAfterLoginConfirmation:v9];
  }
  else
  {
    [(PUILocationServicesListController *)self _setEntityAuthorized:v6 specifier:v9];
  }
}

- (void)setSOSEntityAuthorized:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 BOOLValue])
  {
    [(PUILocationServicesListController *)self setEntityAuthorized:v6 specifier:v7];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1E4FB1418];
    id v9 = PUI_LocalizedStringForLocationServices(@"SOS_DISABLE_LOCATION_SERVICES_CONFIRMATION_TITLE");
    uint64_t v10 = PUI_LocalizedStringForLocationServices(@"SOS_DISABLE_LOCATION_SERVICES_CONFIRMATION_BODY");
    int v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:0];

    objc_initWeak(&location, self);
    long long v12 = (void *)MEMORY[0x1E4FB1410];
    __int16 v13 = PUI_LocalizedStringForLocationServices(@"SOS_DISABLE_LOCATION_SERVICES_CONFIRMATION_TURN_OFF_BUTTON");
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__PUILocationServicesListController_setSOSEntityAuthorized_specifier___block_invoke;
    v21[3] = &unk_1E6E9D638;
    objc_copyWeak(&v24, &location);
    id v22 = v6;
    id v14 = v7;
    id v23 = v14;
    __int16 v15 = [v12 actionWithTitle:v13 style:0 handler:v21];
    [v11 addAction:v15];

    BOOL v16 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v17 = PUI_LocalizedStringForLocationServices(@"SOS_DISABLE_LOCATION_SERVICES_CONFIRMATION_CANCEL_BUTTON");
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70__PUILocationServicesListController_setSOSEntityAuthorized_specifier___block_invoke_2;
    v19[3] = &unk_1E6E9D610;
    id v20 = v14;
    v18 = [v16 actionWithTitle:v17 style:1 handler:v19];
    [v11 addAction:v18];

    if (PSIsiPad()) {
      [v11 setPreferredStyle:1];
    }
    [(PUILocationServicesListController *)self presentViewController:v11 animated:1 completion:0];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __70__PUILocationServicesListController_setSOSEntityAuthorized_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setEntityAuthorized:*(void *)(a1 + 32) specifier:*(void *)(a1 + 40)];
}

void __70__PUILocationServicesListController_setSOSEntityAuthorized_specifier___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) propertyForKey:*MEMORY[0x1E4F930F0]];
  [v1 setOn:1 animated:1];
}

- (void)disableAfterLoginConfirmation:(id)a3
{
  id v4 = a3;
  id v5 = [getPSGFindMyiPhoneControllerClass() shared];
  id v6 = [v5 preferredFindMyiPhoneAccount];
  id v7 = [v6 username];

  int v8 = PUI_LocalizedStringForLocationServices(@"CONFIRM_FMIP_LOCATION_TITLE");
  id v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v7);
  uint64_t v10 = PUI_LocalizedStringForLocationServices(@"CONFIRM_LOCATION_TURN_OFF");
  int v11 = [getPSGFindMyiPhoneControllerClass() shared];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __67__PUILocationServicesListController_disableAfterLoginConfirmation___block_invoke;
  v13[3] = &unk_1E6E9D660;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v11 disablePhoneLocatorWithMessageString:v9 buttonTitle:v10 presentingViewController:self completion:v13];
}

void __67__PUILocationServicesListController_disableAfterLoginConfirmation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    int v8 = [v5 domain];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    id v9 = (void *)getFindMyiPhoneControllerErrorDomainSymbolLoc_ptr;
    uint64_t v19 = getFindMyiPhoneControllerErrorDomainSymbolLoc_ptr;
    if (!getFindMyiPhoneControllerErrorDomainSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v21 = __getFindMyiPhoneControllerErrorDomainSymbolLoc_block_invoke;
      id v22 = &unk_1E6E9C7F8;
      id v23 = &v16;
      uint64_t v10 = (void *)GeneralSettingsUILibrary();
      int v11 = dlsym(v10, "FindMyiPhoneControllerErrorDomain");
      *(void *)(v23[1] + 24) = v11;
      getFindMyiPhoneControllerErrorDomainSymbolLoc_ptr = *(void *)(v23[1] + 24);
      id v9 = (void *)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v9)
    {
      -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
      __break(1u);
    }
    int v12 = objc_msgSend(v8, "isEqualToString:", *v9, v16);

    if (v12)
    {
      switch([v5 code])
      {
        case 0:
          __int16 v13 = _PUILoggingFacility();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1E4AD5000, v13, OS_LOG_TYPE_DEFAULT, "########## User canceled out of disabling FMiP location service", (uint8_t *)&buf, 2u);
          }
          goto LABEL_16;
        case 1:
          __int16 v15 = _PUILoggingFacility();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1E4AD5000, v15, OS_LOG_TYPE_DEFAULT, "########## no account - disable FMiP location service", (uint8_t *)&buf, 2u);
          }
          goto LABEL_20;
        case 2:
          __int16 v15 = _PUILoggingFacility();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1E4AD5000, v15, OS_LOG_TYPE_DEFAULT, "########## already disabled - disable FMiP location service", (uint8_t *)&buf, 2u);
          }
LABEL_20:

          [*(id *)(a1 + 32) _setEntityAuthorized:0 specifier:*(void *)(a1 + 40)];
          break;
        case 3:
          __int16 v13 = _PUILoggingFacility();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1E4AD5000, v13, OS_LOG_TYPE_DEFAULT, "########## FMiP state in flux - canceling out of disabling FMiP location service", (uint8_t *)&buf, 2u);
          }
          goto LABEL_16;
        default:
          break;
      }
    }
    else
    {
      __int16 v13 = _PUILoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1E4AD5000, v13, OS_LOG_TYPE_DEFAULT, "*** Unknown error: %@. Cancelling out of disabling FMiP location service", (uint8_t *)&buf, 0xCu);
      }
LABEL_16:

      [*(id *)(a1 + 32) _cancelConfirmDisableForSpecifier:*(void *)(a1 + 40)];
    }
  }
  else if ([v6 length])
  {
    id v14 = _PUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "########## authenticated - disable FMiP location service", (uint8_t *)&buf, 2u);
    }

    [*(id *)(a1 + 32) _setEntityAuthorized:0 specifier:*(void *)(a1 + 40)];
  }
}

+ (BOOL)isLocationRestricted
{
  return MEMORY[0x1F4145E88](a1, a2);
}

- (void)updateMutableStateBasedOnRestriction
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithBool:", +[PUILocationServicesListController isLocationRestricted](PUILocationServicesListController, "isLocationRestricted") ^ 1);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    uint64_t v7 = *MEMORY[0x1E4F93130];
    uint64_t v22 = *MEMORY[0x1E4F93220];
    int v8 = (int *)MEMORY[0x1E4F92F28];
    uint64_t v21 = *MEMORY[0x1E4F93130];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(char **)(*((void *)&v24 + 1) + 8 * v9);
        if (*(void *)&v10[*v8] == 6
          || (uint64_t v11 = [*(id *)(*((void *)&v24 + 1) + 8 * v9) detailControllerClass],
              v11 == objc_opt_class()))
        {
          uint64_t v12 = [v10 propertyForKey:v7];
          if (!v12) {
            goto LABEL_10;
          }
          __int16 v13 = (void *)v12;
          [v10 propertyForKey:v7];
          uint64_t v14 = v5;
          uint64_t v15 = v6;
          v17 = uint64_t v16 = v8;
          int v18 = [v17 BOOLValue];
          int v19 = [v3 BOOLValue];

          int v8 = v16;
          uint64_t v6 = v15;
          uint64_t v5 = v14;
          uint64_t v7 = v21;

          if (v18 != v19)
          {
LABEL_10:
            [v10 setProperty:v3 forKey:v7];
            id v20 = [v10 propertyForKey:v22];
            objc_msgSend(v20, "setCellEnabled:", objc_msgSend(v3, "BOOLValue"));
          }
        }
        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
}

- (void)updateFindMyFriendsStateBasedOnRestriction
{
  if ((isModificationAllowedForID(@"com.apple.findmy") & 1) == 0)
  {
    id v5 = [(PUILocationServicesListController *)self specifierForID:@"com.apple.findmy"];
    BOOL v3 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
    [v5 setProperty:v3 forKey:*MEMORY[0x1E4F93130]];

    uint64_t v4 = [v5 propertyForKey:*MEMORY[0x1E4F93220]];
    [v4 setCellEnabled:0];
  }
}

- (void)updateSpecifiersForImposedSettings
{
}

- (void)updateSpecifiersForImposedSettingsWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUILocationServicesListController *)self updateMutableStateBasedOnRestriction];
  [(PUILocationServicesListController *)self updateLocationSharingSpecifiersWithReload:v3];
  [(PUILocationServicesListController *)self updateMutableStateForLocationSharing];
  [(PUILocationServicesListController *)self updateFindMyFriendsStateBasedOnRestriction];
}

- (void)updateMutableStateForLocationSharing
{
  if ((isModificationAllowedForID(@"com.apple.findmy") & 1) == 0)
  {
    BOOL v3 = [(PUILocationServicesListController *)self isLocationServicesEnabled:0];
    int v4 = [v3 BOOLValue];

    if (v4)
    {
      id v6 = [(PUILocationServicesListController *)self specifierForID:@"LOCATION_SERVICES_MASTER"];
      [v6 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
      id v5 = [v6 propertyForKey:*MEMORY[0x1E4F93220]];
      [v5 setCellEnabled:0];
    }
  }
}

- (void)updateRecentlyUsedDate
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v8 = (id)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setHour:-24];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v8 dateByAddingComponents:v4 toDate:v5 options:0];
  twentyFourHoursAgo = self->_twentyFourHoursAgo;
  self->_twentyFourHoursAgo = v6;
}

- (void)updateForApplicationDidBecomeActive:(id)a3
{
  [(PUILocationServicesListController *)self updateRecentlyUsedDate];
  id v4 = [(PUILocationServicesListController *)self table];
  [v4 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesListController;
  [(PUILocationServicesListController *)&v4 viewWillAppear:a3];
  [(PUILocationServicesListController *)self updateSpecifiersForImposedSettings];
}

- (void)willBecomeActive
{
  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesListController;
  [(PUILocationServicesListController *)&v4 willBecomeActive];
  id v3 = [(PUILocationServicesListController *)self presentedViewController];

  if (v3) {
    [(PUILocationServicesListController *)self reloadSpecifiers];
  }
  else {
    self->_deferredRefreshDueToConfiruint64_t m = 1;
  }
}

- (void)showLocationPrivacyPage
{
  id v3 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.locationservices"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (id)hiddenBundleIdentifiers
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.siri", @"/System/Library/LocationBundles/ClipServicesLocation.bundle", 0);
  if (PSIsInEDUMode())
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"/System/Library/PrivateFrameworks/FMF.framework", 0);
    id v4 = [v2 setByAddingObjectsFromSet:v3];
  }
  else
  {
    id v4 = v2;
  }

  return v4;
}

- (id)localizedDisplayNameForBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.mobilesafari"])
  {
    id v4 = PUI_LocalizedStringForLocationServices(@"SAFARI_WEBSITES");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v3];
    id v4 = [v5 localizedName];
  }
  return v4;
}

- (BOOL)_isBundleBlacklisted:(id)a3
{
  id v3 = a3;
  if (_isBundleBlacklisted__onceToken != -1) {
    dispatch_once(&_isBundleBlacklisted__onceToken, &__block_literal_global_370);
  }
  id v4 = [MEMORY[0x1E4F74230] sharedConnection];
  id v5 = [v4 effectiveBlacklistedAppBundleIDs];

  id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  uint64_t v7 = [v6 lastPathComponent];

  id v8 = [(id)_isBundleBlacklisted__appForBundle objectForKeyedSubscript:v7];
  if ([v8 length]) {
    char v9 = [v5 containsObject:v8];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

void __58__PUILocationServicesListController__isBundleBlacklisted___block_invoke()
{
  v0 = (void *)_isBundleBlacklisted__appForBundle;
  _isBundleBlacklisted__appForBundle = (uint64_t)&unk_1F40807A0;
}

- (id)locationDetailSpecifiersForAppsAndBundles
{
  id v3 = objc_opt_new();
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __78__PUILocationServicesListController_locationDetailSpecifiersForAppsAndBundles__block_invoke;
  v25[3] = &unk_1E6E9D688;
  v25[4] = &v26;
  id v4 = [(PUILocationServicesListController *)self locationDetailSpecifiersWithDetailsMatching:v25];
  [v3 addObjectsFromArray:v4];

  int v5 = _os_feature_enabled_impl();
  id v6 = (void *)MEMORY[0x1E4F930A8];
  uint64_t v7 = (void *)MEMORY[0x1E4F931D0];
  id v8 = (void *)MEMORY[0x1E4F931A0];
  if (v5)
  {
    char v9 = [MEMORY[0x1E4F74230] sharedConnection];
    int v10 = [v9 isAppClipsAllowed];

    if (v10)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", *((unsigned int *)v27 + 6));
      uint64_t v12 = PUI_LocalizedStringForPrivacy(v11);
      [(PUILocationServicesListController *)self setAppClipsCount:v12];

      __int16 v13 = (void *)MEMORY[0x1E4F92E70];
      uint64_t v14 = PUI_LocalizedStringForDimSum(@"APP_CLIPS");
      uint64_t v15 = [v13 preferenceSpecifierNamed:v14 target:self set:0 get:sel_getAppClipsCount_ detail:objc_opt_class() cell:2 edit:0];

      [v15 setIdentifier:@"APP_CLIPS"];
      [v15 setProperty:objc_opt_class() forKey:*v6];
      [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v7];
      [v15 setObject:@"com.apple.graphic-icon.app-clips" forKeyedSubscript:*v8];
      [v3 insertObject:v15 atIndex:1];
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F92E70];
  uint64_t v17 = PUI_LocalizedStringForLocationServices(@"SYSTEM_SERVICES");
  int v18 = [v16 preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v18 setIdentifier:@"SYSTEM_SERVICES"];
  [v18 setProperty:objc_opt_class() forKey:*v6];
  [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v7];
  [v18 setObject:@"com.apple.graphic-icon.gear" forKeyedSubscript:*v8];
  [v3 addObject:v18];
  int v19 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v20 = objc_msgSend(v19, "sf_isiPhone");

  if (v20)
  {
    uint64_t v21 = [(PUILocationServicesListController *)self loadSensorKitSpecifiersProvider];
    sensorKitSpecifiersProvider = self->_sensorKitSpecifiersProvider;
    self->_sensorKitSpecifiersProvider = v21;

    id v23 = [(SRRelatedSettingsProvider *)self->_sensorKitSpecifiersProvider specifiersForRelatedSettings:@"Location"];
    if (v23) {
      [v3 addObjectsFromArray:v23];
    }
  }
  _Block_object_dispose(&v26, 8);
  return v3;
}

BOOL __78__PUILocationServicesListController_locationDetailSpecifiersForAppsAndBundles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"BundleId"];
  BOOL v5 = PUIIsAppClip(v4);

  if (v5 && [getCLLocationManagerClass() isEntityAuthorizedForLocationDictionary:v3]) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }

  return !v5;
}

- (id)locationDetailSpecifiersWithDetailsMatching:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v3 = (uint64_t (**)(id, void *))a3;
  obuint64_t j = (id)PSUICLCopyAppsUsingLocation();
  id v4 = _PUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v83 = obj;
    _os_log_impl(&dword_1E4AD5000, v4, OS_LOG_TYPE_DEFAULT, "specifiers -- CLCopyAppsUsingLocation:\n%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_locationEntitiesDetails, obj);
  long long v48 = PUIGetActivePairedDevice();
  long long v56 = [MEMORY[0x1E4F79F08] sharedInstance];
  ScreenScale();
  if ((int)v5 == 2) {
    int v6 = 47;
  }
  else {
    int v6 = 48;
  }
  unsigned int v55 = v6;
  v73 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([obj count])
  {
    uint64_t v7 = [MEMORY[0x1E4F74230] sharedConnection];
    v72 = [v7 effectiveBlacklistedAppBundleIDs];

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    char v9 = [(PUILocationServicesListController *)self hiddenBundleIdentifiers];
    v69 = [v8 setWithSet:v9];

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v10 = obj;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v78 objects:v86 count:16];
    if (!v11) {
      goto LABEL_66;
    }
    uint64_t v74 = *(void *)v79;
    uint64_t v51 = *MEMORY[0x1E4F1CC48];
    uint64_t v52 = *MEMORY[0x1E4F931D0];
    uint64_t v49 = *MEMORY[0x1E4F931C0];
    uint64_t v54 = *MEMORY[0x1E4F93190];
    uint64_t v58 = *MEMORY[0x1E4F93188];
    uint64_t v57 = *MEMORY[0x1E4F930A8];
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v79 != v74) {
          objc_enumerationMutation(v10);
        }
        __int16 v13 = *(void **)(*((void *)&v78 + 1) + 8 * v12);
        uint64_t v14 = [v10 objectForKey:v13];
        if (v3 && (v3[2](v3, v14) & 1) == 0) {
          goto LABEL_20;
        }
        uint64_t v15 = [v14 objectForKeyedSubscript:@"BundleId"];
        if ([v72 containsObject:v15])
        {
LABEL_15:

LABEL_20:
          [(NSArray *)v73 addObject:v13];
          goto LABEL_60;
        }
        uint64_t v16 = [v14 objectForKeyedSubscript:@"BundlePath"];
        BOOL v17 = [(PUILocationServicesListController *)self _isBundleBlacklisted:v16];

        if (v17 || [v69 containsObject:v13]) {
          goto LABEL_20;
        }
        uint64_t v18 = [getCLLocationManagerClass() primaryEntityClassForLocationDictionary:v14];
        uint64_t v19 = v18;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        int v23 = 0;
        long long v24 = 0;
        long long v25 = 0;
        v70 = 0;
        switch(v18)
        {
          case 0:
            uint64_t v15 = _PUILoggingFacility();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412546;
              id v83 = v13;
              __int16 v84 = 2112;
              v85 = v14;
              _os_log_impl(&dword_1E4AD5000, v15, OS_LOG_TYPE_DEFAULT, "EntityClassUnknown:\n%@\n%@", buf, 0x16u);
            }
            goto LABEL_15;
          case 1:
            v70 = [v14 objectForKey:@"BundleId"];
            unsigned int v65 = [MEMORY[0x1E4FB1F10] bundleIdentifierContainsWebClipIdentifier:v70];
            if (v65)
            {
              uint64_t v21 = [(PUILocationServicesListController *)self localizedDisplayNameForBundleID:v70];
              if (![v21 length]) {
                goto LABEL_30;
              }
              goto LABEL_35;
            }
            uint64_t v28 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v70];
            int v29 = [v28 appState];
            int v30 = [v29 isInstalled];

            if (v30)
            {
              uint64_t v21 = [(PUILocationServicesListController *)self localizedDisplayNameForBundleID:v70];
LABEL_35:
              int v59 = 0;
              id v67 = 0;
              goto LABEL_36;
            }
            if (!v48)
            {
              [(NSArray *)v73 addObject:v13];

              break;
            }
            uint64_t v21 = PUIDisplayNameForWatchApp(v70);
            if (v21)
            {
              id v33 = v70;
              if (!v33) {
                goto LABEL_30;
              }
            }
            else
            {
              long long v40 = PUIWatchBundleIDForBundleID(v70);
              uint64_t v21 = PUIDisplayNameForWatchApp(v40);
              id v33 = v40;
              if (!v40)
              {
LABEL_30:
                [(NSArray *)v73 addObject:v13];

                break;
              }
            }
            id v67 = v33;
            int v59 = 1;
LABEL_36:
            if ([v21 length])
            {
              uint64_t v22 = 0;
              long long v25 = 0;
              unsigned int v20 = v65;
            }
            else
            {
              id v34 = v70;
              if (v67) {
                id v34 = v67;
              }
              id v27 = v34;

              uint64_t v26 = _PUILoggingFacility();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                id v83 = v27;
                _os_log_impl(&dword_1E4AD5000, v26, OS_LOG_TYPE_DEFAULT, "No display name found for application: %@", buf, 0xCu);
              }
              uint64_t v61 = 0;
              v63 = 0;
LABEL_50:

              uint64_t v21 = v27;
              unsigned int v20 = v65;
              uint64_t v22 = (void *)v61;
              long long v25 = v63;
            }
            long long v24 = v67;
            int v23 = v59;
LABEL_52:
            v62 = v22;
            uint64_t v64 = v25;
            v68 = v24;
            unsigned int v66 = v20;
            v35 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
            if (v23)
            {
              v36 = PSBlankIconImage();
              [v35 setProperty:v36 forKey:v54];

              objc_initWeak((id *)buf, self);
              v75[0] = MEMORY[0x1E4F143A8];
              v75[1] = 3221225472;
              v75[2] = __81__PUILocationServicesListController_locationDetailSpecifiersWithDetailsMatching___block_invoke;
              v75[3] = &unk_1E6E9D3E0;
              id v76 = v35;
              objc_copyWeak(&v77, (id *)buf);
              [v56 getIconForBundleID:v68 iconVariant:v55 block:v75 timeout:-1.0];
              objc_destroyWeak(&v77);

              objc_destroyWeak((id *)buf);
            }
            else if (v19 == 1)
            {
              __int16 v37 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
              [v35 setProperty:v37 forKey:v52];

              [v35 setProperty:v70 forKey:v49];
            }
            else if (v19 == 2 && v62)
            {
              int v38 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
              [v35 setProperty:v38 forKey:v52];

              [v35 setProperty:v62 forKey:@"_BundleUrl_"];
            }
            [v35 setProperty:v13 forKey:v58];
            uint64_t v39 = [MEMORY[0x1E4F28ED0] numberWithBool:v66];
            [v35 setProperty:v39 forKey:@"WebApp"];

            [v35 setProperty:objc_opt_class() forKey:v57];
            [v60 addObject:v35];

            break;
          case 2:
            v63 = [v14 objectForKey:@"BundlePath"];
            uint64_t v26 = [objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:v63];
            id v27 = [v26 objectForInfoDictionaryKey:v51];
            if ([v27 length])
            {
              uint64_t v61 = [v26 bundleURL];
              unsigned int v65 = 0;
              int v59 = 0;
              id v67 = 0;
              v70 = 0;
            }
            else
            {
              uint64_t v31 = [v63 lastPathComponent];

              uint64_t v32 = _PUILoggingFacility();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                id v83 = v63;
                _os_log_impl(&dword_1E4AD5000, v32, OS_LOG_TYPE_DEFAULT, "No display name found for bundle: %@", buf, 0xCu);
              }

              uint64_t v61 = 0;
              unsigned int v65 = 0;
              int v59 = 0;
              id v67 = 0;
              v70 = 0;
              id v27 = (id)v31;
            }
            goto LABEL_50;
          case 3:
            goto LABEL_52;
          case 4:
            goto LABEL_20;
          default:
            if (v18 == 16) {
              goto LABEL_20;
            }
            uint64_t v22 = 0;
            int v23 = 0;
            long long v24 = 0;
            long long v25 = 0;
            v70 = 0;
            if (v18 == 32) {
              goto LABEL_20;
            }
            goto LABEL_52;
        }
LABEL_60:

        ++v12;
      }
      while (v11 != v12);
      uint64_t v41 = [v10 countByEnumeratingWithState:&v78 objects:v86 count:16];
      uint64_t v11 = v41;
      if (!v41)
      {
LABEL_66:

        [v60 sortUsingFunction:PUICompareSpecifiersByName context:0];
        break;
      }
    }
  }
  long long v42 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  long long v43 = [(PUILocationServicesListController *)self specifier];
  long long v44 = [v43 identifier];
  if ([v44 isEqualToString:@"APP_CLIPS"]) {
    long long v45 = @"PUIClipLocationIndicatorExplanationView";
  }
  else {
    long long v45 = @"PUILocationIndicatorExplanationView";
  }
  [v42 setProperty:v45 forKey:*MEMORY[0x1E4F93140]];

  [v42 setProperty:@"APP" forKey:@"_ExplanationIdSuffix_"];
  [v50 addObject:v42];
  [v50 addObjectsFromArray:v60];
  ignoredLocationEntities = self->_ignoredLocationEntities;
  self->_ignoredLocationEntities = v73;

  [(PUILocationServicesListController *)self startLocationStatusUpdates];
  return v50;
}

void __81__PUILocationServicesListController_locationDetailSpecifiersWithDetailsMatching___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PUILocationServicesListController_locationDetailSpecifiersWithDetailsMatching___block_invoke_2;
  block[3] = &unk_1E6E9D3B8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __81__PUILocationServicesListController_locationDetailSpecifiersWithDetailsMatching___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F93190]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

- (id)loadSensorKitSpecifiersProvider
{
  id v2 = PSBundlePathForPreferenceBundle();
  id v3 = [MEMORY[0x1E4F28B50] bundleWithPath:v2];
  id v4 = v3;
  if (v3 && (double v5 = (objc_class *)[v3 classNamed:@"SRRelatedSpecifiers"]) != 0)
  {
    id v6 = objc_alloc_init(v5);
    if (objc_opt_respondsToSelector()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x1E4F93250]];
}

- (void)_locationSharingSpecifierWasTapped:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F61610];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  [v7 setSpecifier:v5];

  [v7 setParentController:self];
  id v6 = [(PUILocationServicesListController *)self rootController];
  [v7 setRootController:v6];

  [(PUILocationServicesListController *)self showController:v7 animate:1];
}

- (id)accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    id v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (id)primaryAccount
{
  primaryAccount = self->_primaryAccount;
  if (!primaryAccount)
  {
    id v4 = [(PUILocationServicesListController *)self accountStore];
    objc_msgSend(v4, "aa_primaryAppleAccount");
    id v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_primaryAccount;
    self->_primaryAccount = v5;

    primaryAccount = self->_primaryAccount;
  }
  return primaryAccount;
}

- (BOOL)_shouldEnableLocationSharingSpecifier
{
  if ([(id)objc_opt_class() isLocationRestricted])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(PUILocationServicesListController *)self primaryAccount];
    if (objc_msgSend(v4, "aa_isPrimaryEmailVerified"))
    {
      id v5 = [(PUILocationServicesListController *)self primaryAccount];
      int v3 = objc_msgSend(v5, "aa_needsToVerifyTerms") ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isLocationSharingModificationAllowed
{
  return isModificationAllowedForID(@"com.apple.findmy");
}

- (id)locationSharingSpecifiers
{
  if (!PSIsInEDUMode())
  {
    BOOL v5 = [(PUILocationServicesListController *)self _shouldEnableLocationSharingSpecifier];
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    [v6 setProperty:@"LOCATION_SHARING_GROUP" forKey:*MEMORY[0x1E4F93188]];
    [v4 addObject:v6];
    id v7 = (void *)MEMORY[0x1E4F92E70];
    id v8 = PUI_LocalizedStringForLocationServices(@"LOCATION_SHARING");
    char v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:2 edit:0];

    [v9 setControllerLoadAction:sel__locationSharingSpecifierWasTapped_];
    id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
    [v9 setProperty:v10 forKey:*MEMORY[0x1E4F93130]];

    [v9 setIdentifier:@"LOCATION_SHARING"];
    [v4 addObject:v9];
    if (!v5 || ![(PUILocationServicesListController *)self isLocationSharingEnabled]) {
      goto LABEL_16;
    }
    uint64_t v11 = [(PUILocationServicesListController *)self locationSharingDevice];
    if ([v11 isThisDevice])
    {
      if ([getCLLocationManagerClass() locationServicesEnabled]) {
        uint64_t v12 = @"LOCATION_SHARING_FOOTER";
      }
      else {
        uint64_t v12 = @"LOCATION_SHARING_DISABLED_FOOTER";
      }
      __int16 v13 = PUI_LocalizedStringForLocationServices(v12);
    }
    else
    {
      uint64_t v14 = [v11 deviceName];

      if (!v14)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      uint64_t v15 = NSString;
      uint64_t v16 = PUI_LocalizedStringForLocationServices(@"LOCATION_SHARING_FOOTER_OTHER_DEVICE");
      BOOL v17 = [v11 deviceName];
      __int16 v13 = objc_msgSend(v15, "stringWithFormat:", v16, v17);
    }
    [v6 setProperty:v13 forKey:*MEMORY[0x1E4F93170]];

    goto LABEL_15;
  }
  int v3 = _PUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "Configuration does not want location sharing specifiers.", buf, 2u);
  }

  id v4 = 0;
LABEL_17:
  return v4;
}

- (void)updateLocationSharingSpecifiersWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  self->receivedAppListFromCoreLocatiouint64_t n = 0;
  locationSharingAppList = self->locationSharingAppList;
  self->locationSharingAppList = 0;

  if (v3)
  {
    uint64_t v6 = [(PUILocationServicesListController *)self indexOfSpecifierID:@"LOCATION_SHARING_GROUP"];
    id v7 = [(PUILocationServicesListController *)self locationSharingSpecifiers];
    id v8 = v7;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7)
    {
      uint64_t v9 = [v7 count];
      if (v9 >= 1)
      {
        uint64_t v10 = 0;
        uint64_t v11 = *MEMORY[0x1E4F93188];
        do
        {
          uint64_t v12 = [(PUILocationServicesListController *)self specifierAtIndex:v6 + v10];
          __int16 v13 = [v12 propertyForKey:v11];

          if (v13)
          {
            uint64_t v14 = [v8 objectAtIndexedSubscript:v10];
            [v14 setProperty:v13 forKey:v11];
          }
          ++v10;
        }
        while (v9 != v10);
      }
      -[PUILocationServicesListController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", v6, v9, v8);
    }
  }
  uint64_t v15 = [(PUILocationServicesListController *)self specifierForID:@"/System/Library/PrivateFrameworks/FMF.framework"];
  if (v15)
  {
    id v18 = v15;
    BOOL v16 = !+[PUILocationServicesListController isLocationRestricted]&& [(PUILocationServicesListController *)self isLocationSharingModificationAllowed];
    BOOL v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v16];
    [v18 setProperty:v17 forKey:*MEMORY[0x1E4F93130]];

    uint64_t v15 = v18;
    if (v3)
    {
      [(PUILocationServicesListController *)self reloadSpecifier:v18 animated:1];
      uint64_t v15 = v18;
    }
  }
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  return 1;
}

- (id)specifiers
{
  BOOL v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  id v4 = *v3;
  if (!*v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    char v7 = MGGetBoolAnswer();
    uint64_t v8 = PUI_LocalizedStringForLocationServices(@"ABOUT_LOCATION_AND_PRIVACY");
    uint64_t v9 = NSString;
    uint64_t v10 = SFLocalizableWAPIStringKeyForKey();
    uint64_t v11 = PUI_LocalizedStringForLocationServices(v10);
    uint64_t v12 = [v9 stringWithFormat:@"%@ %@", v11, v8];

    if ((v7 & 1) == 0 && ([MEMORY[0x1E4F92E98] wifiEnabled] & 1) == 0)
    {
      __int16 v13 = NSString;
      uint64_t v14 = SFLocalizableWAPIStringKeyForKey();
      uint64_t v15 = PUI_LocalizedStringForLocationServices(v14);
      uint64_t v16 = [v13 stringWithFormat:@"%@\n\n%@", v15, v12];

      uint64_t v12 = (void *)v16;
    }
    BOOL v17 = (void *)v8;
    id v18 = [MEMORY[0x1E4F79EF0] sharedInstance];
    int v19 = [v18 isPaired];

    if (v19)
    {
      unsigned int v20 = NSString;
      uint64_t v21 = PUI_LocalizedStringForLocationServices(@"DESCRIPTION_WATCH");
      uint64_t v22 = [v20 stringWithFormat:@"%@\n\n%@", v12, v21];

      uint64_t v12 = (void *)v22;
    }
    int v23 = (objc_class *)objc_opt_class();
    long long v24 = NSStringFromClass(v23);
    [v6 setProperty:v24 forKey:*MEMORY[0x1E4F93140]];

    [v6 setProperty:v12 forKey:*MEMORY[0x1E4F93160]];
    v44.locatiouint64_t n = [v12 rangeOfString:v8];
    long long v25 = NSStringFromRange(v44);
    [v6 setProperty:v25 forKey:*MEMORY[0x1E4F93150]];

    uint64_t v26 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v6 setProperty:v26 forKey:*MEMORY[0x1E4F93158]];

    [v6 setProperty:@"showLocationPrivacyPage" forKey:*MEMORY[0x1E4F93148]];
    [v5 addObject:v6];
    id v27 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v28 = PUI_LocalizedStringForLocationServices(@"LOCATION_SERVICES");
    int v29 = [v27 preferenceSpecifierNamed:v28 target:self set:sel_setLocationServicesEnabled_specifier_ get:sel_isLocationServicesEnabled_ detail:0 cell:6 edit:0];

    [v5 addObject:v29];
    int v30 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v31 = PUI_LocalizedStringForLocationServices(@"PRIVACY_ALERTS");
    uint64_t v32 = [v30 preferenceSpecifierNamed:v31 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v32 setIdentifier:@"LOCATION_ALERTS"];
    [v5 addObject:v32];
    id v33 = [v5 lastObject];
    [v33 setProperty:@"LOCATION_SERVICES_MASTER" forKey:*MEMORY[0x1E4F93188]];
    objc_initWeak(&location, self);
    if (self->receivedAppListFromCoreLocation)
    {
      [v5 addObjectsFromArray:self->locationSharingAppList];
    }
    else
    {
      int v38 = v29;
      id v34 = [MEMORY[0x1E4F1CA48] array];
      locationServicesAccessQueue = self->locationServicesAccessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__PUILocationServicesListController_specifiers__block_invoke;
      block[3] = &unk_1E6E9D3B8;
      void block[4] = self;
      id v40 = v34;
      id v36 = v34;
      objc_copyWeak(&v41, &location);
      dispatch_async(locationServicesAccessQueue, block);
      objc_destroyWeak(&v41);

      int v29 = v38;
      BOOL v17 = (void *)v8;
    }
    objc_storeStrong(v3, v5);
    [(PUILocationServicesListController *)self updateSpecifiersForImposedSettingsWithReload:0];
    [(PUILocationServicesListController *)self updateLocationSharing];
    [(PUILocationServicesListController *)self updateTribecaText];
    objc_destroyWeak(&location);

    id v4 = *v3;
  }
  return v4;
}

void __47__PUILocationServicesListController_specifiers__block_invoke(id *a1)
{
  int v2 = [getCLLocationManagerClass() locationServicesEnabled];
  uint64_t v3 = [a1[4] locationSharingSpecifiers];
  id v4 = (void *)v3;
  if (!v2)
  {
    id v5 = 0;
    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v5 = [a1[4] locationDetailSpecifiersForAppsAndBundles];
  if (v4) {
LABEL_5:
  }
    [a1[5] addObjectsFromArray:v4];
LABEL_6:
  if (v5) {
    [a1[5] addObjectsFromArray:v5];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PUILocationServicesListController_specifiers__block_invoke_2;
  v6[3] = &unk_1E6E9CB50;
  objc_copyWeak(&v8, a1 + 6);
  id v7 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v8);
}

void __47__PUILocationServicesListController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = (void *)WeakRetained[189];
    WeakRetained[189] = v2;

    *((unsigned char *)WeakRetained + 1504) = 1;
  }
  [WeakRetained reloadSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUILocationServicesListController *)self indexForIndexPath:v6];
  uint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]) objectAtIndex:v8];
  v19.receiver = self;
  v19.super_class = (Class)PUILocationServicesListController;
  uint64_t v10 = [(PUILocationServicesListController *)&v19 tableView:v7 cellForRowAtIndexPath:v6];

  uint64_t v11 = [v9 identifier];
  [(PUILocationServicesListController *)self setUsage:[(PUILocationServicesListController *)self locationUsageForEntity:v11] forCell:v10];

  if ([v10 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v12 = [v9 identifier];
    if (([v12 isEqualToString:@"SYSTEM_SERVICES"] & 1) == 0)
    {
      __int16 v13 = [v9 identifier];
      char v14 = [v13 isEqualToString:@"APP_CLIPS"];

      if (v14) {
        goto LABEL_6;
      }
      id CLLocationManagerClass = getCLLocationManagerClass();
      locationEntitiesDetails = self->_locationEntitiesDetails;
      uint64_t v12 = [v9 identifier];
      BOOL v17 = [(NSDictionary *)locationEntitiesDetails objectForKey:v12];
      -[PUILocationServicesListController setAuthLevel:forCell:](self, "setAuthLevel:forCell:", [CLLocationManagerClass entityAuthorizationForLocationDictionary:v17], v10);
    }
  }
LABEL_6:

  return v10;
}

- (void)startUpdatingFindMyPreferences
{
  objc_initWeak(&location, self);
  [(FindMyLocateSession *)self->_locationSharingSession startMonitoringPrefrenceChangesWithCompletionHandler:&__block_literal_global_484];
  locationSharingSessiouint64_t n = self->_locationSharingSession;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PUILocationServicesListController_startUpdatingFindMyPreferences__block_invoke_485;
  v7[3] = &unk_1E6E9D6B0;
  objc_copyWeak(&v8, &location);
  [(FindMyLocateSession *)locationSharingSession setMeDeviceUpdateCallback:v7];
  id v4 = self->_locationSharingSession;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PUILocationServicesListController_startUpdatingFindMyPreferences__block_invoke_487;
  v5[3] = &unk_1E6E9D6D8;
  objc_copyWeak(&v6, &location);
  [(FindMyLocateSession *)v4 setShareMyLocationUpdateCallback:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__PUILocationServicesListController_startUpdatingFindMyPreferences__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _PUILoggingFacility();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__PUILocationServicesListController_startUpdatingFindMyPreferences__block_invoke_cold_1((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E4AD5000, v4, OS_LOG_TYPE_DEFAULT, "findmylocate: startMonitoringPrefrenceChanges completed successfully", v5, 2u);
  }
}

void __67__PUILocationServicesListController_startUpdatingFindMyPreferences__block_invoke_485(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _PUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1E4AD5000, v4, OS_LOG_TYPE_DEFAULT, "findmylocate: didUpdateMeDevice: %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didChangeActiveLocationSharingDevice:v3];
}

void __67__PUILocationServicesListController_startUpdatingFindMyPreferences__block_invoke_487(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _PUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1E4AD5000, v4, OS_LOG_TYPE_DEFAULT, "findmylocate: didUpdaLocationSharingStatus. Sharing?: %d", (uint8_t *)v6, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didUpdateHidingStatus:a2 ^ 1u];
}

- (void)updateLocationSharing
{
  objc_initWeak(&location, self);
  locationSharingSessiouint64_t n = self->_locationSharingSession;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PUILocationServicesListController_updateLocationSharing__block_invoke;
  v7[3] = &unk_1E6E9D700;
  objc_copyWeak(&v8, &location);
  [(FindMyLocateSession *)locationSharingSession isMyLocationEnabledWithCompletionHandler:v7];
  id v4 = self->_locationSharingSession;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PUILocationServicesListController_updateLocationSharing__block_invoke_490;
  v5[3] = &unk_1E6E9D728;
  objc_copyWeak(&v6, &location);
  [(FindMyLocateSession *)v4 getActiveLocationSharingDeviceWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__PUILocationServicesListController_updateLocationSharing__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = _PUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "findmylocate: locationSharingEnabled error %@", (uint8_t *)&v8, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didUpdateHidingStatus:a2 ^ 1u];
}

void __58__PUILocationServicesListController_updateLocationSharing__block_invoke_490(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "findmylocate: locationSharingDevice error %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didChangeActiveLocationSharingDevice:v5];
}

- (BOOL)isLocationSharingEnabled
{
  return [(NSNumber *)self->_locationSharingEnabled BOOLValue];
}

- (void)mainThreadConnectionError:(id)a3
{
  locationSharingSessiouint64_t n = self->_locationSharingSession;
  self->_locationSharingSessiouint64_t n = 0;

  [(PUILocationServicesListController *)self mainThreadDidChangeActiveLocationSharingDevice:0];
}

- (void)mainThreadDidChangeActiveLocationSharingDevice:(id)a3
{
  id v5 = (_TtC17PrivacySettingsUI12PUIFMLDevice *)a3;
  p_locationSharingDevice = &self->_locationSharingDevice;
  if (self->_locationSharingDevice != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_locationSharingDevice, a3);
    p_locationSharingDevice = (_TtC17PrivacySettingsUI12PUIFMLDevice **)[(PUILocationServicesListController *)self updateLocationSharingSpecifiersWithReload:1];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_locationSharingDevice, v5);
}

- (void)mainThreadDidUpdateHidingStatus:(BOOL)a3
{
  BOOL v3 = a3;
  locationSharingEnabled = self->_locationSharingEnabled;
  if (!locationSharingEnabled || [(NSNumber *)locationSharingEnabled BOOLValue] == a3)
  {
    id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:!v3];
    uint64_t v7 = self->_locationSharingEnabled;
    self->_locationSharingEnabled = v6;

    [(PUILocationServicesListController *)self updateLocationSharingSpecifiersWithReload:1];
  }
}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __74__PUILocationServicesListController_didChangeActiveLocationSharingDevice___block_invoke;
  v6[3] = &unk_1E6E9CBA0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __74__PUILocationServicesListController_didChangeActiveLocationSharingDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mainThreadDidChangeActiveLocationSharingDevice:*(void *)(a1 + 40)];
}

- (void)didUpdateHidingStatus:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PUILocationServicesListController_didUpdateHidingStatus___block_invoke;
  v3[3] = &unk_1E6E9D330;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __59__PUILocationServicesListController_didUpdateHidingStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mainThreadDidUpdateHidingStatus:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateTribecaText
{
  BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isInternalInstall");

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F61A48] sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __54__PUILocationServicesListController_updateTribecaText__block_invoke;
    v6[3] = &unk_1E6E9D750;
    void v6[4] = self;
    [v5 fmipStateWithCompletion:v6];
  }
}

void __54__PUILocationServicesListController_updateTribecaText__block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    if (a2 >= 3)
    {
      id v7 = _PUILoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v12 = "-[PUILocationServicesListController updateTribecaText]_block_invoke";
        _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "%s: FMIP state is off or unknown.", buf, 0xCu);
      }

      id v6 = PUITribecaSupportedText();
    }
    else
    {
      id v6 = 0;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PUILocationServicesListController_updateTribecaText__block_invoke_493;
    v9[3] = &unk_1E6E9CBA0;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v6;
    id v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

void __54__PUILocationServicesListController_updateTribecaText__block_invoke_493(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tribecaSpecifier];

  if (v2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    int v4 = [v3 tribecaSpecifier];
    [v3 removeSpecifier:v4 animated:1];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = _PUILoggingFacility();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[PUILocationServicesListController updateTribecaText]_block_invoke";
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "%s: showing tribeca text", (uint8_t *)&v12, 0xCu);
    }

    id v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"TRIBECA_GROUP"];
    [v7 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F93170]];
    [*(id *)(a1 + 32) setTribecaSpecifier:v7];
    id v8 = *(void **)(a1 + 32);
    int v9 = [v8 tribecaSpecifier];
    id v10 = [*(id *)(a1 + 32) specifiers];
    uint64_t v11 = [v10 lastObject];
    [v8 insertSpecifier:v9 afterSpecifier:v11];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __54__PUILocationServicesListController_updateTribecaText__block_invoke_493_cold_1(v7);
  }
}

- (NSMutableArray)coalescedImproveMapsServices
{
  return self->_coalescedImproveMapsServices;
}

- (void)setCoalescedImproveMapsServices:(id)a3
{
}

- (NSOperationQueue)locationSharingOperationQueue
{
  return self->_locationSharingOperationQueue;
}

- (void)setLocationSharingOperationQueue:(id)a3
{
}

- (_TtC17PrivacySettingsUI19FindMyLocateSession)locationSharingSession
{
  return self->_locationSharingSession;
}

- (void)setLocationSharingSession:(id)a3
{
}

- (_TtC17PrivacySettingsUI12PUIFMLDevice)locationSharingDevice
{
  return self->_locationSharingDevice;
}

- (void)setLocationSharingDevice:(id)a3
{
}

- (NSNumber)locationSharingEnabled
{
  return self->_locationSharingEnabled;
}

- (void)setLocationSharingEnabled:(id)a3
{
}

- (PSSpecifier)tribecaSpecifier
{
  return self->_tribecaSpecifier;
}

- (void)setTribecaSpecifier:(id)a3
{
}

- (NSString)appClipsCount
{
  return self->_appClipsCount;
}

- (void)setAppClipsCount:(id)a3
{
  self->_appClipsCount = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tribecaSpecifier, 0);
  objc_storeStrong((id *)&self->_locationSharingEnabled, 0);
  objc_storeStrong((id *)&self->_locationSharingDevice, 0);
  objc_storeStrong((id *)&self->_locationSharingSession, 0);
  objc_storeStrong((id *)&self->_locationSharingOperationQueue, 0);
  objc_storeStrong((id *)&self->_coalescedImproveMapsServices, 0);
  objc_storeStrong((id *)&self->locationSharingAppList, 0);
  objc_storeStrong((id *)&self->locationServicesAccessQueue, 0);
  objc_storeStrong((id *)&self->_sensorKitSpecifiersProvider, 0);
  objc_storeStrong((id *)&self->_isLocationServicesEnabled, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_twentyFourHoursAgo, 0);
  objc_storeStrong((id *)&self->_coalesceAppKeys, 0);
  objc_storeStrong((id *)&self->_ignoredLocationEntities, 0);
  objc_storeStrong((id *)&self->_coalescedSystemCutomizationSystemServices, 0);
  objc_storeStrong((id *)&self->_coalescedWirelessSystemServices, 0);
  objc_storeStrong((id *)&self->_coalescedRoutingAndTrafficSystemServices, 0);
  objc_storeStrong((id *)&self->_coalescedHomeKitSystemServices, 0);
  objc_storeStrong((id *)&self->_coalescedLocationBasedAlertsSystemServices, 0);
  objc_storeStrong((id *)&self->_locationEntitiesDetails, 0);
}

void __56__PUILocationServicesListController_updateLocationUsage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1E4AD5000, v0, v1, "%s: No specifier found for key: %@", v2, v3, v4, v5, 2u);
}

- (void)_setLocationServicesEnabled:.cold.1()
{
  __assert_rtn("-[PUILocationServicesListController _setLocationServicesEnabled:]", "PUILocationServicesListController.m", 1259, "sharingRange.location != NSNotFound");
}

void __67__PUILocationServicesListController_startUpdatingFindMyPreferences__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "findmylocate: startMonitoringPrefrenceChanges error %@", (uint8_t *)&v2, 0xCu);
}

void __54__PUILocationServicesListController_updateTribecaText__block_invoke_493_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[PUILocationServicesListController updateTribecaText]_block_invoke";
  _os_log_error_impl(&dword_1E4AD5000, log, OS_LOG_TYPE_ERROR, "%s: should show tribeca text, but text was nil!", (uint8_t *)&v1, 0xCu);
}

@end