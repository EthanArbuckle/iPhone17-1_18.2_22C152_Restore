@interface PXMemoriesFeedSettings
+ (id)_resetRejectedMemories;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)alwaysShowOnboarding;
- (BOOL)disableRoundedOverlays;
- (BOOL)displayContentDuringGraphRebuild;
- (BOOL)forceReloadAfterRefresh;
- (BOOL)rankMemoriesByRelevanceScore;
- (BOOL)useSlowAnimations;
- (double)additionalContentThreshold;
- (double)memoryGroupingInterval;
- (id)parentSettings;
- (int64_t)_defaultDataSourceType;
- (int64_t)dataSourceType;
- (int64_t)favoriteMemoriesSortOrder;
- (int64_t)memoryGroupingMethod;
- (int64_t)sharingBehavior;
- (unint64_t)groupsPerBatch;
- (void)setAdditionalContentThreshold:(double)a3;
- (void)setAlwaysShowOnboarding:(BOOL)a3;
- (void)setDataSourceType:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDisableRoundedOverlays:(BOOL)a3;
- (void)setDisplayContentDuringGraphRebuild:(BOOL)a3;
- (void)setFavoriteMemoriesSortOrder:(int64_t)a3;
- (void)setForceReloadAfterRefresh:(BOOL)a3;
- (void)setGroupsPerBatch:(unint64_t)a3;
- (void)setMemoryGroupingInterval:(double)a3;
- (void)setMemoryGroupingMethod:(int64_t)a3;
- (void)setRankMemoriesByRelevanceScore:(BOOL)a3;
- (void)setSharingBehavior:(int64_t)a3;
- (void)setUseSlowAnimations:(BOOL)a3;
@end

@implementation PXMemoriesFeedSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXMemoriesFeedSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXMemoriesFeedSettings *)self setUseSlowAnimations:0];
  [(PXMemoriesFeedSettings *)self setAlwaysShowOnboarding:0];
  [(PXMemoriesFeedSettings *)self setForceReloadAfterRefresh:0];
  [(PXMemoriesFeedSettings *)self setDisableRoundedOverlays:0];
  [(PXMemoriesFeedSettings *)self setRankMemoriesByRelevanceScore:0];
  [(PXMemoriesFeedSettings *)self setDataSourceType:[(PXMemoriesFeedSettings *)self _defaultDataSourceType]];
  [(PXMemoriesFeedSettings *)self setDisplayContentDuringGraphRebuild:1];
  [(PXMemoriesFeedSettings *)self setGroupsPerBatch:20];
  [(PXMemoriesFeedSettings *)self setAdditionalContentThreshold:512.0];
  [(PXMemoriesFeedSettings *)self setMemoryGroupingMethod:2];
  [(PXMemoriesFeedSettings *)self setMemoryGroupingInterval:0.0];
  [(PXMemoriesFeedSettings *)self setFavoriteMemoriesSortOrder:1];
  [(PXMemoriesFeedSettings *)self setSharingBehavior:0];
}

- (void)setUseSlowAnimations:(BOOL)a3
{
  self->_useSlowAnimations = a3;
}

- (void)setSharingBehavior:(int64_t)a3
{
  self->_sharingBehavior = a3;
}

- (void)setRankMemoriesByRelevanceScore:(BOOL)a3
{
  self->_rankMemoriesByRelevanceScore = a3;
}

- (void)setMemoryGroupingMethod:(int64_t)a3
{
  self->_memoryGroupingMethod = a3;
}

- (void)setMemoryGroupingInterval:(double)a3
{
  self->_memoryGroupingInterval = a3;
}

- (void)setGroupsPerBatch:(unint64_t)a3
{
  self->_groupsPerBatch = a3;
}

- (void)setForceReloadAfterRefresh:(BOOL)a3
{
  self->_forceReloadAfterRefresh = a3;
}

- (void)setFavoriteMemoriesSortOrder:(int64_t)a3
{
  self->_favoriteMemoriesSortOrder = a3;
}

- (void)setDisplayContentDuringGraphRebuild:(BOOL)a3
{
  self->_displayContentDuringGraphRebuild = a3;
}

- (void)setDisableRoundedOverlays:(BOOL)a3
{
  self->_disableRoundedOverlays = a3;
}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (void)setAlwaysShowOnboarding:(BOOL)a3
{
  self->_alwaysShowOnboarding = a3;
}

- (void)setAdditionalContentThreshold:(double)a3
{
  self->_additionalContentThreshold = a3;
}

- (int64_t)_defaultDataSourceType
{
  return 3;
}

- (int64_t)sharingBehavior
{
  return self->_sharingBehavior;
}

- (int64_t)favoriteMemoriesSortOrder
{
  return self->_favoriteMemoriesSortOrder;
}

- (unint64_t)groupsPerBatch
{
  return self->_groupsPerBatch;
}

- (double)additionalContentThreshold
{
  return self->_additionalContentThreshold;
}

- (double)memoryGroupingInterval
{
  return self->_memoryGroupingInterval;
}

- (int64_t)memoryGroupingMethod
{
  return self->_memoryGroupingMethod;
}

- (BOOL)alwaysShowOnboarding
{
  return self->_alwaysShowOnboarding;
}

- (BOOL)displayContentDuringGraphRebuild
{
  return self->_displayContentDuringGraphRebuild;
}

- (BOOL)rankMemoriesByRelevanceScore
{
  return self->_rankMemoriesByRelevanceScore;
}

- (BOOL)disableRoundedOverlays
{
  return self->_disableRoundedOverlays;
}

- (BOOL)forceReloadAfterRefresh
{
  return self->_forceReloadAfterRefresh;
}

- (BOOL)useSlowAnimations
{
  return self->_useSlowAnimations;
}

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8963 != -1) {
    dispatch_once(&sharedInstance_onceToken_8963, &__block_literal_global_8964);
  }
  v2 = (void *)sharedInstance_sharedInstance_8965;
  return v2;
}

void __40__PXMemoriesFeedSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 memoryFeed];
  v1 = (void *)sharedInstance_sharedInstance_8965;
  sharedInstance_sharedInstance_8965 = v0;
}

+ (id)_resetRejectedMemories
{
  return (id)[MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_366];
}

uint64_t __52__PXMemoriesFeedSettings_UI___resetRejectedMemories__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v1 = PXMemoriesResetRejected(v0, 1, 0);

  return v1;
}

+ (id)settingsControllerModule
{
  v49[10] = *MEMORY[0x1E4F143B8];
  v40 = (void *)MEMORY[0x1E4F94160];
  v43 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Slow Animations" valueKeyPath:@"useSlowAnimations"];
  v49[0] = v43;
  v42 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Display Content During Graph Rebuild" valueKeyPath:@"displayContentDuringGraphRebuild"];
  v49[1] = v42;
  v39 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Show Onboarding" valueKeyPath:@"alwaysShowOnboarding"];
  v49[2] = v39;
  v38 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Reset Onboarding", &__block_literal_global_266943);
  v49[3] = v38;
  v37 = [MEMORY[0x1E4F94108] rowWithTitle:@"Memory Grouping Method" valueKeyPath:@"memoryGroupingMethod"];
  v36 = [v37 possibleValues:&unk_1F02D5590 titles:&unk_1F02D55A8];
  v49[4] = v36;
  v35 = [MEMORY[0x1E4F94108] rowWithTitle:@"Memory Grouping Interval" valueKeyPath:@"memoryGroupingInterval"];
  v34 = [v35 possibleValues:&unk_1F02D55C0 titles:&unk_1F02D55D8];
  v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"memoryGroupingMethod == %@", &unk_1F02D9E80];
  id v2 = [v34 condition:v33];
  v49[5] = v2;
  objc_super v3 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Groups Per Batch" valueKeyPath:@"groupsPerBatch"];
  v4 = [v3 minValue:0.0 maxValue:1024.0];
  v5 = objc_msgSend(v4, "px_increment:", 1.0);
  v49[6] = v5;
  v6 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Additional Content Threshold" valueKeyPath:@"additionalContentThreshold"];
  v7 = [v6 minValue:0.0 maxValue:1024.0];
  v8 = objc_msgSend(v7, "px_increment:", 1.0);
  v49[7] = v8;
  v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Rounded Overlay View" valueKeyPath:@"disableRoundedOverlays"];
  v49[8] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Rank Memories By Relevance Score" valueKeyPath:@"rankMemoriesByRelevanceScore"];
  v49[9] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:10];
  v41 = [v40 sectionWithRows:v11 title:@"Settings"];

  v12 = (void *)MEMORY[0x1E4F94160];
  v13 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Reload After Refresh" valueKeyPath:@"forceReloadAfterRefresh"];
  v48 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v15 = [v12 sectionWithRows:v14 title:@"Refreshing"];

  v16 = (void *)MEMORY[0x1E4F94160];
  v17 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Delete Memories", &__block_literal_global_324);
  v47[0] = v17;
  v18 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:output:", @"Font Diagnostics", &__block_literal_global_348_266966);
  v47[1] = v18;
  v19 = (void *)MEMORY[0x1E4F940F8];
  v20 = [a1 _resetRejectedMemories];
  v21 = [v19 rowWithTitle:@"Reset Rejected Memories" action:v20];
  v47[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
  v23 = [v16 sectionWithRows:v22];

  v24 = (void *)MEMORY[0x1E4F94160];
  v25 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Show Single Memory View", &__block_literal_global_358);
  v46 = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v27 = [v24 sectionWithRows:v26];

  v28 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v29 = (void *)MEMORY[0x1E4F94160];
  v45[0] = v41;
  v45[1] = v15;
  v45[2] = v23;
  v45[3] = v27;
  v45[4] = v28;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:5];
  v31 = [v29 moduleWithTitle:@"Memories Feed" contents:v30];

  return v31;
}

void __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = objc_alloc_init(_SingleMemoryDebugViewController);
  [v2 pushViewController:v3 animated:1];
}

id __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_4()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v1 = [v0 librarySpecificFetchOptions];

  [v1 setIncludePendingMemories:1];
  [v1 setIncludeRejectedMemories:1];
  id v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v7[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v1 setSortDescriptors:v3];

  v4 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v1];
  v5 = +[PXTitleFontDiagnosticsService diagnosticsDescriptionForAssetCollections:v4];

  return v5;
}

void __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_322(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4FB1418];
  id v3 = a2;
  id v6 = [v2 alertControllerWithTitle:0 message:@"Are you sure? This action cannot be undone." preferredStyle:0];
  v4 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Delete All Memories" style:2 handler:&__block_literal_global_335_266985];
  [v6 addAction:v4];

  v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v6 addAction:v5];

  [v3 presentViewController:v6 animated:1 completion:0];
}

void __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v1 = [v0 librarySpecificFetchOptions];

  [v1 setIncludePendingMemories:1];
  id v2 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v1];
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_3;
  v5[3] = &unk_1E5DD36F8;
  id v6 = v2;
  id v4 = v2;
  [v3 performChangesAndWait:v5 error:0];
}

uint64_t __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x1E4F39170] deleteMemories:*(void *)(a1 + 32)];
}

void __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 removeObjectForKey:@"PXMemoriesHasConfirmedOnboardingDefaultsKey"];

  id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v1 synchronize];
}

@end