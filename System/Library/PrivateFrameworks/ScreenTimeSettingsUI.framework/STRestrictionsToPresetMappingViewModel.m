@interface STRestrictionsToPresetMappingViewModel
+ (id)BOOLPresetKeys;
+ (id)presetKeys;
- (STRestrictionsDataSourceProtocol)restrictionsDataSource;
- (STRestrictionsToPresetMappingViewModel)initWithRestrictionsDataSource:(id)a3;
- (id)_presetForValuesByRestriction:(id)a3;
- (id)_restrictionsWithValuesByRestriction:(id)a3 presetKeys:(id)a4;
- (void)loadPresetMatchingCurrentRestrictionsWithCompletionHandler:(id)a3;
- (void)setRestrictionsDataSource:(id)a3;
@end

@implementation STRestrictionsToPresetMappingViewModel

+ (id)presetKeys
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__STRestrictionsToPresetMappingViewModel_presetKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (presetKeys_onceToken != -1) {
    dispatch_once(&presetKeys_onceToken, block);
  }
  v2 = (void *)presetKeys_presetKeys;

  return v2;
}

void __52__STRestrictionsToPresetMappingViewModel_presetKeys__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"system.ratings.ratingTVShows", @"system.ratings.ratingApps", @"system.ratings.ratingMovies", @"STCustomRestrictionConfiguration.STCustomRestrictionWebFilterState", 0);
  v3 = (void *)presetKeys_presetKeys;
  presetKeys_presetKeys = v2;

  v4 = (void *)presetKeys_presetKeys;
  id v7 = [*(id *)(a1 + 32) BOOLPresetKeys];
  uint64_t v5 = [v4 setByAddingObjectsFromSet:v7];
  v6 = (void *)presetKeys_presetKeys;
  presetKeys_presetKeys = v5;
}

+ (id)BOOLPresetKeys
{
  if (BOOLPresetKeys_onceToken != -1) {
    dispatch_once(&BOOLPresetKeys_onceToken, &__block_literal_global_22);
  }
  uint64_t v2 = (void *)BOOLPresetKeys_BOOLPresetKeys;

  return v2;
}

uint64_t __56__STRestrictionsToPresetMappingViewModel_BOOLPresetKeys__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"media.settings.allowBookstoreErotica", @"system.ratings.allowExplicitContent", @"system.music.allowMusicVideos", @"system.music.allowMusicArtistActivity", @"system.siri.allowAssistantUserGeneratedContent", @"system.siri.forceAssistantProfanityFilter", @"application.store.allowAppRemoval", @"STCustomRestrictionConfiguration.STCustomRestrictionImageGeneration", 0);
  uint64_t v1 = BOOLPresetKeys_BOOLPresetKeys;
  BOOLPresetKeys_BOOLPresetKeys = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (STRestrictionsToPresetMappingViewModel)initWithRestrictionsDataSource:(id)a3
{
  v4 = (STRestrictionsDataSourceProtocol *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STRestrictionsToPresetMappingViewModel;
  uint64_t v5 = [(STRestrictionsToPresetMappingViewModel *)&v8 init];
  restrictionsDataSource = v5->_restrictionsDataSource;
  v5->_restrictionsDataSource = v4;

  return v5;
}

- (void)loadPresetMatchingCurrentRestrictionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STRestrictionsToPresetMappingViewModel *)self restrictionsDataSource];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __101__STRestrictionsToPresetMappingViewModel_loadPresetMatchingCurrentRestrictionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_264768440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 loadValuesByRestrictionWithCompletionHandler:v7];
}

void __101__STRestrictionsToPresetMappingViewModel_loadPresetMatchingCurrentRestrictionsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 _presetForValuesByRestriction:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_presetForValuesByRestriction:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(id)objc_opt_class() presetKeys];
    id v6 = [(STRestrictionsToPresetMappingViewModel *)self _restrictionsWithValuesByRestriction:v4 presetKeys:v5];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F3BFD0]) initWithValues:v6];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F3BFD8]) initWithIdentifier:@"com.apple.ScreenTime" configuration:v7];
    id v9 = objc_alloc(MEMORY[0x263F3BFC8]);
    v13[0] = v8;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v11 = (void *)[v9 initWithIdentifier:@"current-preset" minAge:0 maxAge:0 sources:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_restrictionsWithValuesByRestriction:(id)a3 presetKeys:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v13, (void)v16))
        {
          v14 = [v8 objectForKeyedSubscript:v13];
          [v7 setObject:v14 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (STRestrictionsDataSourceProtocol)restrictionsDataSource
{
  return (STRestrictionsDataSourceProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRestrictionsDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end