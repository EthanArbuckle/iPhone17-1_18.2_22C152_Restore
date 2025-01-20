@interface PXContextualMemoriesSettingsController
+ (id)sharedController;
- (BOOL)isRequestingUpdates;
- (NSMutableArray)completionHandlers;
- (NSMutableArray)registrationIdentifiers;
- (PXContextualMemoriesSettings)settings;
- (PXContextualMemoriesSettingsController)init;
- (void)registerForLocationPrefetchingWithIdentifier:(id)a3;
- (void)requestUpdatedContextualMemoriesSettingsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setCompletionHandlers:(id)a3;
- (void)setRegistrationIdentifiers:(id)a3;
- (void)setRequestingUpdates:(BOOL)a3;
- (void)unregisterForLocationPrefetchingWithIdentifier:(id)a3;
@end

@implementation PXContextualMemoriesSettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationIdentifiers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)setRegistrationIdentifiers:(id)a3
{
}

- (NSMutableArray)registrationIdentifiers
{
  return self->_registrationIdentifiers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setRequestingUpdates:(BOOL)a3
{
  self->_requestingUpdates = a3;
}

- (BOOL)isRequestingUpdates
{
  return self->_requestingUpdates;
}

- (PXContextualMemoriesSettings)settings
{
  return self->_settings;
}

- (void)unregisterForLocationPrefetchingWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLMemoriesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[Settings] Unregister for location pre-fetching: \"%@\"", (uint8_t *)&v9, 0xCu);
  }

  v6 = [(PXContextualMemoriesSettingsController *)self registrationIdentifiers];
  [v6 removeObject:v4];
  if (![v6 count])
  {
    v7 = [(PXContextualMemoriesSettingsController *)self settings];
    v8 = [v7 locationSetting];
    [v8 setMonitorsCurrentLocation:0];
  }
}

- (void)registerForLocationPrefetchingWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLMemoriesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[Settings] Register for location pre-fetching: \"%@\"", (uint8_t *)&v9, 0xCu);
  }

  v6 = [(PXContextualMemoriesSettingsController *)self registrationIdentifiers];
  [v6 addObject:v4];
  v7 = [(PXContextualMemoriesSettingsController *)self settings];
  v8 = [v7 locationSetting];
  [v8 setMonitorsCurrentLocation:1];
}

- (void)requestUpdatedContextualMemoriesSettingsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    id v6 = (id)objc_opt_new();
  }
  v8 = [(PXContextualMemoriesSettingsController *)self completionHandlers];
  int v9 = _Block_copy(v7);
  [v8 addObject:v9];

  if (![(PXContextualMemoriesSettingsController *)self isRequestingUpdates])
  {
    [(PXContextualMemoriesSettingsController *)self setRequestingUpdates:1];
    id v10 = [(PXContextualMemoriesSettingsController *)self settings];
    uint64_t v11 = [v10 locationSetting];
    [v6 accuracy];
    double v13 = v12;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke;
    v15[3] = &unk_1E5DCAEC8;
    id v16 = v10;
    id v17 = v6;
    v18 = self;
    id v19 = v8;
    id v14 = v10;
    [v11 requestLocationUpdateWithAccuracy:v15 completionHandler:v13];
  }
}

void __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) peopleSetting];
  v3 = [*(id *)(a1 + 40) peopleProximityDate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5DD0F30;
  id v4 = *(void **)(a1 + 56);
  v5[4] = *(void *)(a1 + 48);
  id v6 = v4;
  id v7 = *(id *)(a1 + 32);
  [v2 requestPeopleNamesUpdateSinceDate:v3 withCompletionHandler:v5];
}

void __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke_2(id *a1)
{
  [a1[4] setRequestingUpdates:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke_3;
  v3[3] = &unk_1E5DBD7A8;
  id v2 = a1[5];
  id v4 = a1[6];
  [v2 enumerateObjectsUsingBlock:v3];
  [a1[5] removeAllObjects];
}

uint64_t __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (PXContextualMemoriesSettingsController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXContextualMemoriesSettingsController;
  id v2 = [(PXContextualMemoriesSettingsController *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(PXContextualMemoriesSettings);
    settings = v2->_settings;
    v2->_settings = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;

    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    registrationIdentifiers = v2->_registrationIdentifiers;
    v2->_registrationIdentifiers = v7;
  }
  return v2;
}

+ (id)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PXContextualMemoriesSettingsController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken_132201 != -1) {
    dispatch_once(&sharedController_onceToken_132201, block);
  }
  id v2 = (void *)sharedController_s_sharedController;
  return v2;
}

void __58__PXContextualMemoriesSettingsController_sharedController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)sharedController_s_sharedController;
  sharedController_s_sharedController = (uint64_t)v1;
}

@end