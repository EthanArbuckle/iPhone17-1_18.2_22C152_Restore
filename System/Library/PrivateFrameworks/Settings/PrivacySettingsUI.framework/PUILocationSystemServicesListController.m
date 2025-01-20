@interface PUILocationSystemServicesListController
+ (id)homeKitBundles;
+ (id)improveMapsBundles;
+ (id)locationBasedAlertBundles;
+ (id)routingAndTrafficBundles;
+ (id)systemCustomizationBundles;
+ (id)wirelessBundles;
+ (int)systemServicesLocationUsage;
- (BOOL)_areCoalescedBundlesAuthorized:(id)a3;
- (BOOL)hasUltraWideBand;
- (NSString)coreRoutineAppKey;
- (NSString)currentCoreRoutineStatus;
- (NSString)specifierIDBeforeCoreRoutine;
- (PSSpecifier)productImprovementGroup;
- (PUILocationSystemServicesListController)init;
- (RTRoutineManager)routineManager;
- (id)_areLocationBasedAlertsAuthorized;
- (id)_homeKitBundles;
- (id)_isHomeKitAuthorized;
- (id)_isRoutingAndTrafficAuthorized;
- (id)_isSystemCustomizationAuthorized;
- (id)_isWirelessAuthorized;
- (id)_locationBasedAlertBundles;
- (id)_productImprovementByBundlePath;
- (id)_readAddressCorrectionAuthorizationStatus:(id)a3;
- (id)_routingAndTrafficBundles;
- (id)coreRoutineEnabledStatus:(id)a3;
- (id)isStatusEnabled:(id)a3;
- (id)specifiers;
- (void)_handleAuthenticationForSpecifier:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_performConsistencyCheckForBundles:(id)a3 name:(id)a4;
- (void)_performConsistencyCheckValue:(id)a3 bundles:(id)a4 name:(id)a5;
- (void)_performHomeKitConsistencyCheck;
- (void)_performLocationBasedAlertsConsistencyCheck;
- (void)_performRoutingAndTrafficConsistencyCheck;
- (void)_performSystemCustomizationConsistencyCheck;
- (void)_performWirelessConsistencyCheck;
- (void)_pushCoreRoutineViewController;
- (void)_setAddressCorrectionAuthorizationStatus:(id)a3 specifier:(id)a4;
- (void)_setCoalescedBundlesAuthorized:(id)a3 bundles:(id)a4;
- (void)_setHomeKitAuthorized:(id)a3;
- (void)_setLocationBasedAlertsAuthorized:(id)a3;
- (void)_setRoutingAndTrafficAuthorized:(id)a3;
- (void)_setSystemCutomizationAuthorized:(id)a3;
- (void)_setWirelessAuthorized:(id)a3;
- (void)_showAddressCorrectionPage;
- (void)coreRoutinePressed:(id)a3;
- (void)dealloc;
- (void)insertCoreRoutineSpecifier;
- (void)setCoreRoutineAppKey:(id)a3;
- (void)setCurrentCoreRoutineStatus:(id)a3;
- (void)setProductImprovementGroup:(id)a3;
- (void)setRoutineManager:(id)a3;
- (void)setSpecifierIDBeforeCoreRoutine:(id)a3;
- (void)setStatusEnabled:(id)a3 specifier:(id)a4;
- (void)updateCoreRoutineEnabledStatusAndInsertSpecifier:(BOOL)a3;
- (void)updateCoreRoutineSigLocationSpecifier;
- (void)updateImproveMapsSpecifierWithCompletion:(id)a3;
@end

@implementation PUILocationSystemServicesListController

- (PUILocationSystemServicesListController)init
{
  v26.receiver = self;
  v26.super_class = (Class)PUILocationSystemServicesListController;
  v2 = [(PUILocationServicesListController *)&v26 init];
  if (v2)
  {
    v3 = (RTRoutineManager *)objc_alloc_init(MEMORY[0x1E4F5CEB8]);
    routineManager = v2->_routineManager;
    v2->_routineManager = v3;

    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v6 = [(PUILocationSystemServicesListController *)v2 _locationBasedAlertBundles];
    uint64_t v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
    coalescedLocationBasedAlertsSystemServices = v2->super._coalescedLocationBasedAlertsSystemServices;
    v2->super._coalescedLocationBasedAlertsSystemServices = (NSMutableArray *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v10 = [(PUILocationSystemServicesListController *)v2 _homeKitBundles];
    uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
    coalescedHomeKitSystemServices = v2->super._coalescedHomeKitSystemServices;
    v2->super._coalescedHomeKitSystemServices = (NSMutableArray *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v14 = [(PUILocationSystemServicesListController *)v2 _routingAndTrafficBundles];
    uint64_t v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));
    coalescedRoutingAndTrafficSystemServices = v2->super._coalescedRoutingAndTrafficSystemServices;
    v2->super._coalescedRoutingAndTrafficSystemServices = (NSMutableArray *)v15;

    id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v18 = [(id)objc_opt_class() wirelessBundles];
    uint64_t v19 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));
    coalescedWirelessSystemServices = v2->super._coalescedWirelessSystemServices;
    v2->super._coalescedWirelessSystemServices = (NSMutableArray *)v19;

    uint64_t v21 = objc_opt_new();
    coalescedSystemCutomizationSystemServices = v2->super._coalescedSystemCutomizationSystemServices;
    v2->super._coalescedSystemCutomizationSystemServices = (NSMutableArray *)v21;

    v23 = objc_opt_new();
    [(PUILocationServicesListController *)v2 setCoalescedImproveMapsServices:v23];

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v2 selector:sel_updateCoreRoutineSigLocationSpecifier name:@"PreferencesRoutineStateChanged" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUILocationSystemServicesListController;
  [(PUILocationServicesListController *)&v4 dealloc];
}

+ (int)systemServicesLocationUsage
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PUILocationSystemServicesListController);
  [(PUILocationSystemServicesListController *)v2 specifiers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "identifier", (void)v13);
        int v10 = [(PUILocationServicesListController *)v2 locationUsageForEntity:v9];

        if (v10 == 4)
        {
          int v6 = 4;
        }
        else
        {
          if (v10 == 3)
          {
            int v6 = 3;
            goto LABEL_20;
          }
          if (v6 != 4 && v10 == 2) {
            int v6 = 2;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v6 = 0;
  }
LABEL_20:

  return v6;
}

- (BOOL)hasUltraWideBand
{
  return MGGetBoolAnswer();
}

- (id)isStatusEnabled:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = [getCLLocationManagerClass_0() isStatusBarIconEnabledForLocationEntityClass:4];
  return (id)[v3 numberWithBool:v4];
}

- (void)setStatusEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id CLLocationManagerClass_0 = getCLLocationManagerClass_0();
  uint64_t v6 = [v4 BOOLValue];

  [CLLocationManagerClass_0 setStatusBarIconEnabled:v6 forLocationEntityClass:4];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"com.apple.PrivacySettingsUI.LocationServicesStateChanged" object:0];
}

- (void)updateCoreRoutineSigLocationSpecifier
{
}

- (void)updateCoreRoutineEnabledStatusAndInsertSpecifier:(BOOL)a3
{
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke;
  v6[3] = &unk_1E6E9D330;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [*(id *)(a1 + 32) routineManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke_2;
  v10[3] = &unk_1E6E9D7C0;
  v12 = &v13;
  id v4 = v2;
  uint64_t v11 = v4;
  [v3 fetchRoutineStateWithHandler:v10];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v14 + 24)) {
    uint64_t v5 = @"On";
  }
  else {
    uint64_t v5 = @"Off";
  }
  uint64_t v6 = PUI_LocalizedStringForPrivacy(v5);
  [*(id *)(a1 + 32) setCurrentCoreRoutineStatus:v6];

  BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"com.apple.PrivacySettingsUI.LocationServicesStateChanged" object:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke_3;
  v8[3] = &unk_1E6E9D330;
  char v9 = *(unsigned char *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v8);

  _Block_object_dispose(&v13, 8);
}

intptr_t __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    dispatch_semaphore_t v2 = *(void **)(a1 + 32);
    [v2 insertCoreRoutineSpecifier];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) coreRoutineAppKey];
    id v5 = [v1 specifierForID:v4];

    [*(id *)(a1 + 32) reloadSpecifier:v5];
  }
}

- (void)insertCoreRoutineSpecifier
{
  id v10 = [(PUILocationSystemServicesListController *)self specifiers];
  if ([v10 count])
  {
    id v3 = [(PUILocationSystemServicesListController *)self specifierIDBeforeCoreRoutine];

    if (!v3) {
      return;
    }
    id v4 = (void *)MEMORY[0x1E4F92E70];
    id v5 = PUI_LocalizedStringForLocationServices(@"CORE_ROUTINE");
    id v10 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:sel_coreRoutineEnabledStatus_ detail:0 cell:2 edit:0];

    uint64_t v6 = [(PUILocationSystemServicesListController *)self coreRoutineAppKey];
    [v10 setProperty:v6 forKey:*MEMORY[0x1E4F93188]];

    [v10 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93130]];
    [v10 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
    [v10 setButtonAction:sel_coreRoutinePressed_];
    BOOL v7 = [(PUILocationSystemServicesListController *)self specifierIDBeforeCoreRoutine];
    v8 = [(PUILocationSystemServicesListController *)self view];
    char v9 = [v8 window];
    [(PUILocationSystemServicesListController *)self insertSpecifier:v10 afterSpecifierID:v7 animated:v9 != 0];
  }
}

- (void)coreRoutinePressed:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"FrequentLocationsDisableAuthentication", @"com.apple.routined", &keyExistsAndHasValidFormat);
  uint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  if (objc_msgSend(v6, "sf_isInternalInstall")) {
    BOOL v7 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {

    goto LABEL_8;
  }

  if (!AppBooleanValue)
  {
LABEL_8:
    id v8 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    id v20 = 0;
    char v9 = [v8 canEvaluatePolicy:2 error:&v20];
    id v10 = v20;
    uint64_t v11 = v10;
    if (v9)
    {
      v12 = PUI_LocalizedStringForLocationServices(@"VIEW_CORE_ROUTINE");
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke_55;
      v17[3] = &unk_1E6E9D810;
      v17[4] = self;
      id v18 = v4;
      [v8 evaluatePolicy:2 localizedReason:v12 reply:v17];

LABEL_19:
      goto LABEL_20;
    }
    uint64_t v13 = [v10 domain];
    if ([v13 isEqualToString:*MEMORY[0x1E4F30B38]])
    {
      uint64_t v14 = [v11 code];

      if (v14 == -5)
      {
        uint64_t v15 = _PUILoggingFacility();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4AD5000, v15, OS_LOG_TYPE_DEFAULT, "Cannot evaluate authentication policy for significant locations, no passcode set, allowing access.", buf, 2u);
        }

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke;
        block[3] = &unk_1E6E9C758;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
        goto LABEL_19;
      }
    }
    else
    {
    }
    char v16 = _PUILoggingFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl(&dword_1E4AD5000, v16, OS_LOG_TYPE_DEFAULT, "Cannot evaluate authentication policy for significant locations, error %@, returning.", buf, 0xCu);
    }

    goto LABEL_19;
  }
LABEL_20:
}

uint64_t __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushCoreRoutineViewController];
}

void __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke_55(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke_2;
  v8[3] = &unk_1E6E9D7E8;
  uint64_t v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  char v11 = a2;
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAuthenticationForSpecifier:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)_handleAuthenticationForSpecifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v7 || !a4)
  {
    id v8 = _PUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
      {
        id v9 = [v7 description];
      }
      else
      {
        id v9 = &stru_1F4072988;
      }
      int v10 = 138412290;
      char v11 = v9;
      _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "Autentication policy did not evaluate successfully, returning, %@", (uint8_t *)&v10, 0xCu);
      if (v7) {
    }
      }
  }
  else
  {
    [(PUILocationSystemServicesListController *)self _pushCoreRoutineViewController];
  }
}

- (void)_pushCoreRoutineViewController
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  id v10 = [v3 objectAtIndex:0];

  id v4 = [v10 stringByAppendingPathComponent:@"PreferenceBundles/CoreRoutineSettings.bundle"];
  id v5 = [MEMORY[0x1E4F28B50] bundleWithPath:v4];
  int v6 = [v5 load];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4FB1CB0] storyboardWithName:@"Main" bundle:v5];
    id v9 = [v8 instantiateInitialViewController];
    if (v9) {
      [(PUILocationSystemServicesListController *)self showController:v9 animate:1];
    }
  }
}

- (id)coreRoutineEnabledStatus:(id)a3
{
  if ([(NSString *)self->_currentCoreRoutineStatus length]) {
    currentCoreRoutineStatus = (__CFString *)self->_currentCoreRoutineStatus;
  }
  else {
    currentCoreRoutineStatus = &stru_1F4072988;
  }
  return currentCoreRoutineStatus;
}

+ (id)locationBasedAlertBundles
{
  return &unk_1F40806E0;
}

+ (id)routingAndTrafficBundles
{
  return &unk_1F40806F8;
}

+ (id)homeKitBundles
{
  return &unk_1F4080710;
}

+ (id)wirelessBundles
{
  return &unk_1F4080728;
}

- (id)_locationBasedAlertBundles
{
  dispatch_semaphore_t v2 = objc_opt_class();
  return (id)[v2 locationBasedAlertBundles];
}

- (id)_homeKitBundles
{
  dispatch_semaphore_t v2 = objc_opt_class();
  return (id)[v2 homeKitBundles];
}

- (id)_routingAndTrafficBundles
{
  dispatch_semaphore_t v2 = objc_opt_class();
  return (id)[v2 routingAndTrafficBundles];
}

- (id)_productImprovementByBundlePath
{
  return &unk_1F4080740;
}

+ (id)systemCustomizationBundles
{
  return &unk_1F4080758;
}

+ (id)improveMapsBundles
{
  return &unk_1F4080770;
}

- (id)_readAddressCorrectionAuthorizationStatus:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = GEOGetDefaultInteger();
  id v5 = _PUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = @"NO";
    if (v4 == 2) {
      int v6 = @"YES";
    }
    int v13 = 138412290;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1E4AD5000, v5, OS_LOG_TYPE_DEFAULT, "read GEOAddressCorrectionAuthorizationStatus enabled: %@", (uint8_t *)&v13, 0xCu);
  }

  BOOL v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v8 = objc_msgSend(v7, "sf_isInternalInstall");

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v4 == 2];
    id v10 = [(PUILocationServicesListController *)self coalescedImproveMapsServices];
    [(PUILocationSystemServicesListController *)self _performConsistencyCheckValue:v9 bundles:v10 name:@"Improve Maps"];
  }
  char v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v4 == 2];
  return v11;
}

- (void)_setAddressCorrectionAuthorizationStatus:(id)a3 specifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 BOOLValue]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  BOOL v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];
  GEOSetDefault();

  int v8 = _PUILoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "set GEOAddressCorrectionAuthorizationStatus: %ld", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(PUILocationServicesListController *)self coalescedImproveMapsServices];
  [(PUILocationSystemServicesListController *)self _setCoalescedBundlesAuthorized:v5 bundles:v9];
}

- (void)_showAddressCorrectionPage
{
  id v3 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improvemaps"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)_setCoalescedBundlesAuthorized:(id)a3 bundles:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    uint64_t v11 = *MEMORY[0x1E4F93188];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
        [v14 setProperty:v13 forKey:v11];
        [(PUILocationServicesListController *)self setEntityAuthorized:v6 specifier:v14];

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_setLocationBasedAlertsAuthorized:(id)a3
{
  [(PUILocationSystemServicesListController *)self _setCoalescedBundlesAuthorized:a3 bundles:self->super._coalescedLocationBasedAlertsSystemServices];
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
  {
    [(PUILocationSystemServicesListController *)self _performLocationBasedAlertsConsistencyCheck];
  }
}

- (void)_setHomeKitAuthorized:(id)a3
{
  [(PUILocationSystemServicesListController *)self _setCoalescedBundlesAuthorized:a3 bundles:self->super._coalescedHomeKitSystemServices];
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
  {
    [(PUILocationSystemServicesListController *)self _performHomeKitConsistencyCheck];
  }
}

- (void)_setRoutingAndTrafficAuthorized:(id)a3
{
  [(PUILocationSystemServicesListController *)self _setCoalescedBundlesAuthorized:a3 bundles:self->super._coalescedRoutingAndTrafficSystemServices];
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
  {
    [(PUILocationSystemServicesListController *)self _performRoutingAndTrafficConsistencyCheck];
  }
}

- (void)_setSystemCutomizationAuthorized:(id)a3
{
  [(PUILocationSystemServicesListController *)self _setCoalescedBundlesAuthorized:a3 bundles:self->super._coalescedSystemCutomizationSystemServices];
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
  {
    [(PUILocationSystemServicesListController *)self _performSystemCustomizationConsistencyCheck];
  }
}

- (void)_setWirelessAuthorized:(id)a3
{
  id v4 = a3;
  int v5 = self->super._coalescedWirelessSystemServices;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke;
  aBlock[3] = &unk_1E6E9D838;
  aBlock[4] = self;
  id v6 = (void (**)(void *, id, NSMutableArray *))_Block_copy(aBlock);
  if ([v4 BOOLValue])
  {
    v6[2](v6, v4, v5);
  }
  else
  {
    id v7 = PUI_LocalizedStringForLocationServicesPrivacy(@"WIRELESS_DISABLE_TITLE");
    [(PUILocationSystemServicesListController *)self hasUltraWideBand];
    uint64_t v8 = SFLocalizableWAPIStringKeyForKey();
    uint64_t v9 = PUI_LocalizedStringForLocationServicesPrivacy(v8);

    uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    unsigned int v11 = objc_msgSend(v10, "sf_isiPad");

    uint64_t v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v9 preferredStyle:v11];
    uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v14 = PUI_LocalizedStringForLocationServicesPrivacy(@"WIRELESS_DISABLE_CONFIRM");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke_2;
    v22[3] = &unk_1E6E9D860;
    v25 = v6;
    id v23 = v4;
    uint64_t v24 = v5;
    long long v15 = [v13 actionWithTitle:v14 style:0 handler:v22];
    [v12 addAction:v15];

    objc_initWeak(&location, self);
    long long v16 = (void *)MEMORY[0x1E4FB1410];
    long long v17 = PUI_LocalizedStringForLocationServicesPrivacy(@"WIRELESS_DISABLE_CANCEL");
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke_3;
    v19[3] = &unk_1E6E9D888;
    objc_copyWeak(&v20, &location);
    long long v18 = [v16 actionWithTitle:v17 style:1 handler:v19];
    [v12 addAction:v18];

    [(PUILocationSystemServicesListController *)self presentViewController:v12 animated:1 completion:0];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _setCoalescedBundlesAuthorized:a2 bundles:a3];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    [v6 _performWirelessConsistencyCheck];
  }
}

uint64_t __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"NETWORKING_WIRELESS"];
}

- (BOOL)_areCoalescedBundlesAuthorized:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = *MEMORY[0x1E4F93188];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v11 = objc_msgSend(MEMORY[0x1E4F92E70], "emptyGroupSpecifier", (void)v16);
        [v11 setProperty:v10 forKey:v8];
        uint64_t v12 = [(PUILocationServicesListController *)self isEntityAuthorized:v11];
        char v13 = [v12 BOOLValue];

        if (v13)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (id)_areLocationBasedAlertsAuthorized
{
  BOOL v3 = [(PUILocationSystemServicesListController *)self _areCoalescedBundlesAuthorized:self->super._coalescedLocationBasedAlertsSystemServices];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5) {
    [(PUILocationSystemServicesListController *)self _performLocationBasedAlertsConsistencyCheck];
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v6 numberWithBool:v3];
}

- (id)_isWirelessAuthorized
{
  BOOL v3 = [(PUILocationSystemServicesListController *)self _areCoalescedBundlesAuthorized:self->super._coalescedWirelessSystemServices];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5) {
    [(PUILocationSystemServicesListController *)self _performWirelessConsistencyCheck];
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v6 numberWithBool:v3];
}

- (id)_isHomeKitAuthorized
{
  BOOL v3 = [(PUILocationSystemServicesListController *)self _areCoalescedBundlesAuthorized:self->super._coalescedHomeKitSystemServices];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5) {
    [(PUILocationSystemServicesListController *)self _performHomeKitConsistencyCheck];
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v6 numberWithBool:v3];
}

- (id)_isRoutingAndTrafficAuthorized
{
  BOOL v3 = [(PUILocationSystemServicesListController *)self _areCoalescedBundlesAuthorized:self->super._coalescedRoutingAndTrafficSystemServices];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5) {
    [(PUILocationSystemServicesListController *)self _performRoutingAndTrafficConsistencyCheck];
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v6 numberWithBool:v3];
}

- (id)_isSystemCustomizationAuthorized
{
  BOOL v3 = [(PUILocationSystemServicesListController *)self _areCoalescedBundlesAuthorized:self->super._coalescedSystemCutomizationSystemServices];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5) {
    [(PUILocationSystemServicesListController *)self _performSystemCustomizationConsistencyCheck];
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v6 numberWithBool:v3];
}

- (void)_performConsistencyCheckValue:(id)a3 bundles:(id)a4 name:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v8;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v28 = v9;
    v29 = v7;
    uint64_t v12 = 0;
    int v13 = 0;
    int v14 = 0;
    uint64_t v15 = *(void *)v33;
    uint64_t v16 = *MEMORY[0x1E4F93188];
    do
    {
      uint64_t v17 = 0;
      long long v18 = v12;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * v17);
        id v20 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
        [v20 setProperty:v19 forKey:v16];
        uint64_t v12 = [(PUILocationServicesListController *)self isEntityAuthorized:v20];

        int v21 = [v12 BOOLValue];
        v13 |= v21;
        v14 |= v21 ^ 1;

        ++v17;
        long long v18 = v12;
      }
      while (v11 != v17);
      uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v11);
    id v9 = v28;
    id v7 = v29;
    if ((v13 & v14 & 1) != 0
      || v29 && v12 && (int v27 = [v29 BOOLValue], v27 != objc_msgSend(v12, "BOOLValue")))
    {
      v22 = _PUILoggingFacility();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138544131;
        id v37 = v28;
        __int16 v38 = 2113;
        id v39 = obj;
        __int16 v40 = 2113;
        v41 = v12;
        __int16 v42 = 2113;
        v43 = v29;
        _os_log_fault_impl(&dword_1E4AD5000, v22, OS_LOG_TYPE_FAULT, "Muxed '%{public}@' values were not consistent. Please file a radar with a sysdiagnose to \"Settings - Privacy | iOS\". bundles: %{private}@, authorized: %{private}@, value: %{private}@", buf, 0x2Au);
      }

      id v23 = [NSString stringWithFormat:@"Inconsistent Values For '%@'", v28];
      uint64_t v24 = [NSString stringWithFormat:@"The muxed values for '%@' were inconsistent. Please file a radar with a sysdiagnose to \"Settings - Privacy | iOS\".", v28];
      v25 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v23 message:v24 preferredStyle:1];
      objc_super v26 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
      [v25 addAction:v26];

      [(PUILocationSystemServicesListController *)self presentViewController:v25 animated:1 completion:0];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
}

- (void)_performConsistencyCheckForBundles:(id)a3 name:(id)a4
{
}

- (void)_performLocationBasedAlertsConsistencyCheck
{
}

- (void)_performHomeKitConsistencyCheck
{
}

- (void)_performRoutingAndTrafficConsistencyCheck
{
}

- (void)_performWirelessConsistencyCheck
{
}

- (void)_performSystemCustomizationConsistencyCheck
{
}

- (id)specifiers
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (v3) {
    goto LABEL_94;
  }
  uint64_t v90 = (int)*MEMORY[0x1E4F92F08];
  v108 = self;
  id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v92 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  v91 = [(PUILocationSystemServicesListController *)v108 productImprovementGroup];
  uint64_t v113 = 0;
  v114 = &v113;
  uint64_t v115 = 0x2020000000;
  id v4 = (uint64_t (*)(void))getCLCopyAppsUsingLocationSymbolLoc_ptr_1;
  v116 = getCLCopyAppsUsingLocationSymbolLoc_ptr_1;
  if (!getCLCopyAppsUsingLocationSymbolLoc_ptr_1)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCLCopyAppsUsingLocationSymbolLoc_block_invoke_1;
    v119 = &unk_1E6E9C7F8;
    v120 = &v113;
    int v5 = (void *)CoreLocationLibrary_0();
    uint64_t v6 = dlsym(v5, "CLCopyAppsUsingLocation");
    *(void *)(v120[1] + 24) = v6;
    getCLCopyAppsUsingLocationSymbolLoc_ptr_1 = *(_UNKNOWN **)(v120[1] + 24);
    id v4 = (uint64_t (*)(void))v114[3];
  }
  _Block_object_dispose(&v113, 8);
  if (!v4)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    __break(1u);
  }
  id obj = (id)v4();
  id v7 = _PUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = obj;
    _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "specifiers -- CLCopyAppsUsingLocation:\n%@", buf, 0xCu);
  }

  objc_storeStrong((id *)&v108->super._locationEntitiesDetails, obj);
  v105 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v102 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v103 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(PUILocationSystemServicesListController *)v108 setCoreRoutineAppKey:0];
  [(PUILocationSystemServicesListController *)v108 setSpecifierIDBeforeCoreRoutine:0];
  if (![obj count])
  {
    uint64_t v46 = *MEMORY[0x1E4F930A8];
    goto LABEL_84;
  }
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [(PUILocationServicesListController *)v108 hiddenBundleIdentifiers];
  v107 = [v8 setWithSet:v9];

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v10 = obj;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v109 objects:v117 count:16];
  if (!v11)
  {
    char v93 = 0;
    char v96 = 0;
    char v101 = 0;
    uint64_t v104 = 0;
    goto LABEL_70;
  }
  char v93 = 0;
  char v96 = 0;
  char v101 = 0;
  uint64_t v104 = 0;
  uint64_t v106 = *(void *)v110;
  uint64_t v97 = *MEMORY[0x1E4F1CC48];
  uint64_t v99 = *MEMORY[0x1E4F93110];
  uint64_t v100 = *MEMORY[0x1E4F93188];
  uint64_t v98 = *MEMORY[0x1E4F930A8];
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v110 != v106) {
        objc_enumerationMutation(v10);
      }
      uint64_t v13 = *(void *)(*((void *)&v109 + 1) + 8 * v12);
      int v14 = [v10 objectForKey:v13];
      if ([v107 containsObject:v13])
      {
        [(NSArray *)v105 addObject:v13];
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        goto LABEL_65;
      }
      uint64_t v16 = [v14 objectForKey:@"BundlePath"];
      if (v16)
      {
        uint64_t v17 = [(PUILocationSystemServicesListController *)v108 _locationBasedAlertBundles];
        int v18 = [v17 containsString:v16];

        if (v18)
        {
          [(NSArray *)v105 addObject:v13];
          [(NSMutableArray *)v108->super._coalescedLocationBasedAlertsSystemServices addObject:v13];
          uint64_t v15 = 0;
          BYTE4(v104) = 1;
          goto LABEL_65;
        }
        uint64_t v19 = [(PUILocationSystemServicesListController *)v108 _homeKitBundles];
        int v20 = [v19 containsString:v16];

        if (v20)
        {
          [(NSArray *)v105 addObject:v13];
          [(NSMutableArray *)v108->super._coalescedHomeKitSystemServices addObject:v13];
          uint64_t v15 = 0;
          LOBYTE(v104) = 1;
          goto LABEL_65;
        }
        int v21 = [(PUILocationSystemServicesListController *)v108 _routingAndTrafficBundles];
        int v22 = [v21 containsString:v16];

        if (v22)
        {
          [(NSArray *)v105 addObject:v13];
          [(NSMutableArray *)v108->super._coalescedRoutingAndTrafficSystemServices addObject:v13];
          uint64_t v15 = 0;
          char v101 = 1;
          goto LABEL_65;
        }
        id v23 = [(id)objc_opt_class() wirelessBundles];
        int v24 = [v23 containsString:v16];

        if (v24)
        {
          [(NSArray *)v105 addObject:v13];
          [(NSMutableArray *)v108->super._coalescedWirelessSystemServices addObject:v13];
          uint64_t v15 = 0;
          char v96 = 1;
          goto LABEL_65;
        }
        v25 = [(id)objc_opt_class() systemCustomizationBundles];
        int v26 = [v25 containsString:v16];

        if (v26)
        {
          [(NSArray *)v105 addObject:v13];
          [(NSMutableArray *)v108->super._coalescedSystemCutomizationSystemServices addObject:v13];
          uint64_t v15 = 0;
          char v93 = 1;
          goto LABEL_65;
        }
        int v27 = [(id)objc_opt_class() improveMapsBundles];
        int v28 = [v27 containsString:v16];

        if (v28)
        {
          [(NSArray *)v105 addObject:v13];
          v29 = [(PUILocationServicesListController *)v108 coalescedImproveMapsServices];
          [v29 addObject:v13];

          goto LABEL_43;
        }
      }
      uint64_t v30 = [getCLLocationManagerClass_0() primaryEntityClassForLocationDictionary:v14];
      uint64_t v31 = v30;
      uint64_t v15 = 0;
      if (v30 <= 3)
      {
        if ((unint64_t)(v30 - 1) < 2) {
          goto LABEL_42;
        }
        if (!v30)
        {
          long long v32 = _PUILoggingFacility();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v13;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v14;
            _os_log_impl(&dword_1E4AD5000, v32, OS_LOG_TYPE_DEFAULT, "EntityClassUnknown:\n%@\n%@", buf, 0x16u);
          }

LABEL_42:
          [(NSArray *)v105 addObject:v13];
LABEL_43:
          uint64_t v15 = 0;
          goto LABEL_65;
        }
        goto LABEL_45;
      }
      if (v30 == 32) {
        goto LABEL_42;
      }
      if (v30 == 16)
      {
        [(PUILocationSystemServicesListController *)v108 setCoreRoutineAppKey:v13];
        uint64_t v15 = 0;
LABEL_45:
        long long v33 = v16;
        goto LABEL_46;
      }
      if (v30 != 4) {
        goto LABEL_45;
      }
      long long v33 = [v14 objectForKey:@"BundlePath"];

      long long v34 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:v33];
      uint64_t v15 = [v34 objectForInfoDictionaryKey:v97];
      if (![v15 length])
      {
        uint64_t v35 = [v33 lastPathComponent];

        v36 = _PUILoggingFacility();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v33;
          _os_log_impl(&dword_1E4AD5000, v36, OS_LOG_TYPE_DEFAULT, "No display name found for system service: %@", buf, 0xCu);
        }

        uint64_t v15 = (void *)v35;
      }

LABEL_46:
      if (specifiers_onceToken != -1) {
        dispatch_once(&specifiers_onceToken, &__block_literal_global_11);
      }
      [v33 rangeOfString:@"WifiCalling.bundle" options:1];
      if (!v37) {
        goto LABEL_53;
      }
      if (([getTUCallCapabilitiesClass() isWiFiCallingEnabled] & 1) != 0
        || ([getTUCallCapabilitiesClass() isThumperCallingEnabled] & 1) != 0)
      {
        if (specifiers___hasWAPI)
        {
          uint64_t v38 = PUI_LocalizedStringForLocationServices(@"WLAN_CALLING");

          uint64_t v15 = (void *)v38;
        }
LABEL_53:
        [v33 rangeOfString:@"WirelessDiagnostics.framework"];
        if (v39)
        {
          uint64_t v40 = PUI_LocalizedStringForLocationServices(@"WIRELESS_DIAGNOSTICS");

          uint64_t v15 = (void *)v40;
        }
        if (v31 != 16)
        {
          if ([v33 hasSuffix:@"Emergency SOS.bundle"]) {
            [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v15 target:v108 set:sel_setSOSEntityAuthorized_specifier_ get:sel_isEntityAuthorized_ detail:0 cell:6 edit:0];
          }
          else {
          v41 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v15 target:v108 set:sel_setEntityAuthorized_specifier_ get:sel_isEntityAuthorized_ detail:0 cell:6 edit:0];
          }
          [v41 setProperty:v13 forKey:v100];
          __int16 v42 = [(PUILocationServicesListController *)v108 isEntityAuthorized:v41];
          [v41 setProperty:v42 forKey:v99];

          [v41 setProperty:objc_opt_class() forKey:v98];
          v43 = [(PUILocationSystemServicesListController *)v108 _productImprovementByBundlePath];
          int v44 = [v43 containsString:v33];

          if (v44) {
            uint64_t v45 = v103;
          }
          else {
            uint64_t v45 = v102;
          }
          [v45 addObject:v41];
        }
        goto LABEL_64;
      }
      [(NSArray *)v105 addObject:v13];
LABEL_64:
      uint64_t v16 = v33;
LABEL_65:

      ++v12;
    }
    while (v11 != v12);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v109 objects:v117 count:16];
  }
  while (v11);
LABEL_70:

  if ((v104 & 0x100000000) != 0)
  {
    v49 = (void *)MEMORY[0x1E4F92E70];
    v50 = PUI_LocalizedStringForLocationServicesPrivacy(@"LOCATION_BASED_ALERTS");
    v51 = [v49 preferenceSpecifierNamed:v50 target:v108 set:sel__setLocationBasedAlertsAuthorized_ get:sel__areLocationBasedAlertsAuthorized detail:0 cell:6 edit:0];

    uint64_t v47 = *MEMORY[0x1E4F93188];
    [v51 setProperty:@"LOCATION_BASED_ALERTS" forKey:*MEMORY[0x1E4F93188]];
    v52 = [(PUILocationSystemServicesListController *)v108 _areLocationBasedAlertsAuthorized];
    uint64_t v48 = *MEMORY[0x1E4F93110];
    [v51 setProperty:v52 forKey:*MEMORY[0x1E4F93110]];

    uint64_t v53 = objc_opt_class();
    uint64_t v46 = *MEMORY[0x1E4F930A8];
    [v51 setProperty:v53 forKey:*MEMORY[0x1E4F930A8]];
    [v51 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93068]];
    [v102 addObject:v51];

    if ((v104 & 1) == 0) {
      goto LABEL_74;
    }
LABEL_76:
    v54 = (void *)MEMORY[0x1E4F92E70];
    v55 = PUI_LocalizedStringForLocationServicesPrivacy(@"HOMEKIT");
    v56 = [v54 preferenceSpecifierNamed:v55 target:v108 set:sel__setHomeKitAuthorized_ get:sel__isHomeKitAuthorized detail:0 cell:6 edit:0];

    [v56 setProperty:@"HOMEKIT" forKey:v47];
    v57 = [(PUILocationSystemServicesListController *)v108 _isHomeKitAuthorized];
    [v56 setProperty:v57 forKey:v48];

    [v56 setProperty:objc_opt_class() forKey:v46];
    [v102 addObject:v56];

    if ((v96 & 1) == 0) {
      goto LABEL_77;
    }
LABEL_79:
    v59 = (void *)MEMORY[0x1E4F92E70];
    v60 = PUI_LocalizedStringForLocationServicesPrivacy(@"NETWORKING_WIRELESS");
    v61 = [v59 preferenceSpecifierNamed:v60 target:v108 set:sel__setWirelessAuthorized_ get:sel__isWirelessAuthorized detail:0 cell:6 edit:0];

    [v61 setProperty:@"NETWORKING_WIRELESS" forKey:v47];
    v62 = [(PUILocationSystemServicesListController *)v108 _isWirelessAuthorized];
    [v61 setProperty:v62 forKey:v48];

    [v61 setProperty:objc_opt_class() forKey:v46];
    [v102 addObject:v61];

    char v58 = v93;
    if ((v101 & 1) == 0) {
      goto LABEL_80;
    }
LABEL_82:
    BOOL v63 = (v58 & 1) == 0;
    v64 = (void *)MEMORY[0x1E4F92E70];
    v65 = PUI_LocalizedStringForLocationServicesPrivacy(@"ROUTING_AND_TRAFFIC");
    v66 = [v64 preferenceSpecifierNamed:v65 target:v108 set:sel__setRoutingAndTrafficAuthorized_ get:sel__isRoutingAndTrafficAuthorized detail:0 cell:6 edit:0];

    [v66 setProperty:@"ROUTING_AND_TRAFFIC" forKey:v47];
    v67 = [(PUILocationSystemServicesListController *)v108 _isRoutingAndTrafficAuthorized];
    [v66 setProperty:v67 forKey:v48];

    [v66 setProperty:objc_opt_class() forKey:v46];
    [v103 addObject:v66];

    if (!v63)
    {
LABEL_83:
      v68 = (void *)MEMORY[0x1E4F92E70];
      v69 = PUI_LocalizedStringForLocationServicesPrivacy(@"SYSTEM_CUSTOMIZATION");
      v70 = [v68 preferenceSpecifierNamed:v69 target:v108 set:sel__setSystemCutomizationAuthorized_ get:sel__isSystemCustomizationAuthorized detail:0 cell:6 edit:0];

      [v70 setProperty:@"SYSTEM_CUSTOMIZATION" forKey:v47];
      v71 = [(PUILocationSystemServicesListController *)v108 _isSystemCustomizationAuthorized];
      [v70 setProperty:v71 forKey:v48];

      [v70 setProperty:objc_opt_class() forKey:v46];
      [v102 addObject:v70];
    }
  }
  else
  {
    uint64_t v46 = *MEMORY[0x1E4F930A8];
    if (v104)
    {
      uint64_t v47 = *MEMORY[0x1E4F93188];
      uint64_t v48 = *MEMORY[0x1E4F93110];
      goto LABEL_76;
    }
LABEL_74:
    if (v96)
    {
      uint64_t v47 = *MEMORY[0x1E4F93188];
      uint64_t v48 = *MEMORY[0x1E4F93110];
      goto LABEL_79;
    }
LABEL_77:
    char v58 = v93;
    if (v101)
    {
      uint64_t v47 = *MEMORY[0x1E4F93188];
      uint64_t v48 = *MEMORY[0x1E4F93110];
      goto LABEL_82;
    }
LABEL_80:
    if (v58)
    {
      uint64_t v47 = *MEMORY[0x1E4F93188];
      uint64_t v48 = *MEMORY[0x1E4F93110];
      goto LABEL_83;
    }
  }
LABEL_84:
  [v102 sortUsingFunction:PUICompareSpecifiersByName context:0];
  [v103 sortUsingFunction:PUICompareSpecifiersByName context:0];
  v72 = (void *)MEMORY[0x1E4F92E70];
  v73 = PUI_LocalizedStringForLocationServices(@"POLARIS_TITLE");
  v74 = [v72 preferenceSpecifierNamed:v73 target:v108 set:sel__setAddressCorrectionAuthorizationStatus_specifier_ get:sel__readAddressCorrectionAuthorizationStatus_ detail:0 cell:6 edit:0];

  [v74 setIdentifier:@"POLARIS"];
  [v74 setObject:objc_opt_class() forKeyedSubscript:v46];
  [v103 addObject:v74];
  v75 = [(PUILocationSystemServicesListController *)v108 coreRoutineAppKey];

  if (v75)
  {
    v76 = [v102 lastObject];
    v77 = [v76 identifier];
    [(PUILocationSystemServicesListController *)v108 setSpecifierIDBeforeCoreRoutine:v77];

    [(PUILocationSystemServicesListController *)v108 updateCoreRoutineEnabledStatusAndInsertSpecifier:1];
  }
  if ([v102 count])
  {
    [v95 addObject:v92];
    [v95 addObjectsFromArray:v102];
  }
  if ([v103 count])
  {
    [v95 addObject:v91];
    [v95 addObjectsFromArray:v103];
  }
  v78 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"INDICATOR_EXPLANATION"];
  v79 = (objc_class *)objc_opt_class();
  v80 = NSStringFromClass(v79);
  [v78 setProperty:v80 forKey:*MEMORY[0x1E4F93140]];

  [v78 setProperty:@"SERVICE" forKey:@"_ExplanationIdSuffix_"];
  [v95 addObject:v78];
  if ([v103 count] || objc_msgSend(v102, "count"))
  {
    v81 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"STATUS_BAR_GROUP"];
    v82 = PUI_LocalizedStringForLocationServices(@"SYSTEM_SERVICES_STATUS_BAR_ICON_EXPLANATION");
    [v81 setProperty:v82 forKey:*MEMORY[0x1E4F93170]];

    [v95 addObject:v81];
    v83 = (void *)MEMORY[0x1E4F92E70];
    v84 = PUI_LocalizedStringForLocationServices(@"STATUS_BAR_ICON");
    v85 = [v83 preferenceSpecifierNamed:v84 target:v108 set:sel_setStatusEnabled_specifier_ get:sel_isStatusEnabled_ detail:0 cell:6 edit:0];
    [v95 addObject:v85];
  }
  ignoredLocationEntities = v108->super._ignoredLocationEntities;
  v108->super._ignoredLocationEntities = v105;
  v87 = v105;

  v88 = *(Class *)((char *)&v108->super.super.super.super.super.super.isa + v90);
  *(Class *)((char *)&v108->super.super.super.super.super.super.isa + v90) = (Class)v95;

  [(PUILocationServicesListController *)v108 updateSpecifiersForImposedSettingsWithReload:0];
  [(PUILocationSystemServicesListController *)v108 updateImproveMapsSpecifierWithCompletion:0];

  BOOL v3 = *(Class *)((char *)&v108->super.super.super.super.super.super.isa + v90);
LABEL_94:
  return v3;
}

uint64_t __53__PUILocationSystemServicesListController_specifiers__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  specifiers___hasWAPI = result;
  return result;
}

- (void)updateImproveMapsSpecifierWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  int v5 = SFIsAppWithBundleIDInstalled();
  uint64_t v6 = _PUILoggingFacility();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[PUILocationSystemServicesListController updateImproveMapsSpecifierWithCompletion:]";
      _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "%s: fetching routine state", buf, 0xCu);
    }

    id v8 = [(PUILocationSystemServicesListController *)self routineManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__PUILocationSystemServicesListController_updateImproveMapsSpecifierWithCompletion___block_invoke;
    v9[3] = &unk_1E6E9D8D8;
    v9[4] = self;
    id v10 = v4;
    [v8 fetchRoutineStateWithHandler:v9];
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[PUILocationSystemServicesListController updateImproveMapsSpecifierWithCompletion:]";
      _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "%s: Maps is not installed", buf, 0xCu);
    }

    [(PUILocationSystemServicesListController *)self _setAddressCorrectionAuthorizationStatus:MEMORY[0x1E4F1CC28] specifier:0];
    if (v4) {
      v4[2](v4);
    }
  }
}

void __84__PUILocationSystemServicesListController_updateImproveMapsSpecifierWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __84__PUILocationSystemServicesListController_updateImproveMapsSpecifierWithCompletion___block_invoke_2;
  v2[3] = &unk_1E6E9D8B0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __84__PUILocationSystemServicesListController_updateImproveMapsSpecifierWithCompletion___block_invoke_2(uint64_t a1)
{
  GEOGetDefaultBOOL();
  dispatch_semaphore_t v2 = [MEMORY[0x1E4F64860] sharedPlatform];
  int v3 = [v2 isInternalInstall];

  if (v3) {
    GEOGetDefaultBOOL();
  }
  [*(id *)(a1 + 32) updateSpecifiersForImposedSettingsWithReload:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (PSSpecifier)productImprovementGroup
{
  productImprovementGroup = self->_productImprovementGroup;
  if (!productImprovementGroup)
  {
    id v4 = (void *)MEMORY[0x1E4F92E70];
    int v5 = PUI_LocalizedStringForLocationServices(@"PRODUCT_IMPROVEMENT");
    uint64_t v6 = [v4 groupSpecifierWithID:@"PRODUCT_IMPROVEMENT" name:v5];
    BOOL v7 = self->_productImprovementGroup;
    self->_productImprovementGroup = v6;

    id v8 = self->_productImprovementGroup;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [(PSSpecifier *)v8 setProperty:v10 forKey:*MEMORY[0x1E4F93140]];

    uint64_t v11 = PUI_LocalizedStringForLocationServices(@"POLARIS_FOOTER");
    uint64_t v12 = PUI_LocalizedStringForLocationServices(@"LEARN_MORE");
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", v11, v12);

    [(PSSpecifier *)self->_productImprovementGroup setProperty:v13 forKey:*MEMORY[0x1E4F93160]];
    int v14 = self->_productImprovementGroup;
    v20.id location = [v13 rangeOfString:v12];
    uint64_t v15 = NSStringFromRange(v20);
    [(PSSpecifier *)v14 setProperty:v15 forKey:*MEMORY[0x1E4F93150]];

    uint64_t v16 = self->_productImprovementGroup;
    uint64_t v17 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [(PSSpecifier *)v16 setProperty:v17 forKey:*MEMORY[0x1E4F93158]];

    [(PSSpecifier *)self->_productImprovementGroup setProperty:@"_showAddressCorrectionPage" forKey:*MEMORY[0x1E4F93148]];
    productImprovementGroup = self->_productImprovementGroup;
  }
  return productImprovementGroup;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (void)setProductImprovementGroup:(id)a3
{
}

- (NSString)currentCoreRoutineStatus
{
  return self->_currentCoreRoutineStatus;
}

- (void)setCurrentCoreRoutineStatus:(id)a3
{
}

- (NSString)coreRoutineAppKey
{
  return self->_coreRoutineAppKey;
}

- (void)setCoreRoutineAppKey:(id)a3
{
}

- (NSString)specifierIDBeforeCoreRoutine
{
  return self->_specifierIDBeforeCoreRoutine;
}

- (void)setSpecifierIDBeforeCoreRoutine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierIDBeforeCoreRoutine, 0);
  objc_storeStrong((id *)&self->_coreRoutineAppKey, 0);
  objc_storeStrong((id *)&self->_currentCoreRoutineStatus, 0);
  objc_storeStrong((id *)&self->_productImprovementGroup, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
}

@end