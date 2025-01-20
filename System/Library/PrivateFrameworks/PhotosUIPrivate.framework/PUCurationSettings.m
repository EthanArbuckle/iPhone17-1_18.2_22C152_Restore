@interface PUCurationSettings
+ (PUCurationSettings)sharedInstance;
+ (id)settingsControllerModule;
- (id)parentSettings;
- (void)setDefaultValues;
@end

@implementation PUCurationSettings

- (void)setDefaultValues
{
  v2.receiver = self;
  v2.super_class = (Class)PUCurationSettings;
  [(PTSettings *)&v2 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v36 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"isUtility Comparison", &__block_literal_global_8075);
  objc_super v2 = (void *)MEMORY[0x1E4F94160];
  v44[0] = v36;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  v4 = [v2 sectionWithRows:v3];

  v35 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Tragic Failures in Highlights", &__block_literal_global_222);
  v5 = (void *)MEMORY[0x1E4F94160];
  v43 = v35;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v33 = [v5 sectionWithRows:v6];

  v7 = (void *)MEMORY[0x1E4F94160];
  v8 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:protoViewControllerFactoryClassName:", @"Asset Score Check", @"PXProtoCurationScoreCheckViewControllerFactory");
  v42 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v32 = [v7 sectionWithRows:v9];

  v34 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Behavioral Curation 🏅 and 💎 assets", &__block_literal_global_237);
  v10 = (void *)MEMORY[0x1E4F94160];
  v41 = v34;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v28 = [v10 sectionWithRows:v11];

  v31 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Action Signals", &__block_literal_global_248);
  v30 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Asset Score Signals", &__block_literal_global_254);
  v29 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Classification Signals", &__block_literal_global_260);
  v27 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Import Source Check", &__block_literal_global_266_8081);
  v12 = (void *)MEMORY[0x1E4F94160];
  v40[0] = v31;
  v40[1] = v30;
  v40[2] = v29;
  v40[3] = v27;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  v14 = [v12 sectionWithRows:v13];

  v26 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Trip Key Asset", &__block_literal_global_275);
  v15 = (void *)MEMORY[0x1E4F94160];
  v39 = v26;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v17 = [v15 sectionWithRows:v16];

  v18 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Collection Relevancy", &__block_literal_global_281);
  v19 = (void *)MEMORY[0x1E4F94160];
  v38 = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v21 = [v19 sectionWithRows:v20];

  v22 = (void *)MEMORY[0x1E4F94160];
  v37[0] = v4;
  v37[1] = v33;
  v37[2] = v32;
  v37[3] = v14;
  v37[4] = v28;
  v37[5] = v17;
  v37[6] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:7];
  v24 = [v22 moduleWithTitle:@"Curation Settings" contents:v23];

  return v24;
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = +[PUCollectionRelevancyDebugViewControllerFactory viewController];
  v3 = [v5 navigationItem];
  [v3 setTitle:@"Collection Relevancy"];

  v4 = [v2 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = objc_alloc_init(PUCurationTripKeyAssetDebugViewController);
  v3 = [(PUCurationTripKeyAssetDebugViewController *)v5 navigationItem];
  [v3 setTitle:@"Trip Key Asset"];

  v4 = [v2 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = [[PUCurationImportSourceBrowserDebugViewController alloc] initWithStyle:0];
  v3 = [(PUCurationImportSourceBrowserDebugViewController *)v5 navigationItem];
  [v3 setTitle:@"Import Source Browser"];

  v4 = [v2 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = [[PUCurationClassificationSignalBrowserDebugViewController alloc] initWithStyle:0];
  v3 = [(PUCurationClassificationSignalBrowserDebugViewController *)v5 navigationItem];
  [v3 setTitle:@"Classification Signals"];

  v4 = [v2 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = [[PUCurationSignalBrowserViewController alloc] initWithStyle:0];
  v3 = [(PUCurationSignalBrowserViewController *)v5 navigationItem];
  [v3 setTitle:@"Asset Score Signals"];

  v4 = [v2 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = [[PUCurationActionSignalBrowserViewController alloc] initWithStyle:0];
  v3 = [(PUCurationActionSignalBrowserViewController *)v5 navigationItem];
  [v3 setTitle:@"Action Signals"];

  v4 = [v2 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(v2, "px_extendedTraitCollection");
  [v3 userInterfaceIdiom];
  objc_opt_class();

  v4 = [PUBehavioralCurationCheckAssetBrowserDebugViewController alloc];
  id v5 = objc_opt_new();
  v10 = [(PUPhotosAlbumViewController *)v4 initWithSpec:v5];

  v6 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)v10 navigationItem];
  [v6 setTitle:@"Behavioral Curation Score Check"];

  v7 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)v10 navigationItem];
  v8 = [v7 searchController];
  [v8 setActive:0];

  v9 = [v2 navigationController];

  [v9 pushViewController:v10 animated:1];
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7 = [[PUCurationTragicFailureInHighlightsDebugViewController alloc] initWithStyle:0];
  v3 = [(PUCurationTragicFailureInHighlightsDebugViewController *)v7 navigationItem];
  [v3 setTitle:@"Tragic Failure in Highlights"];

  v4 = [(PUCurationTragicFailureInHighlightsDebugViewController *)v7 navigationItem];
  id v5 = [v4 searchController];
  [v5 setActive:0];

  v6 = [v2 navigationController];

  [v6 pushViewController:v7 animated:1];
}

void __50__PUCurationSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v7 = [[PUCurationUtilityComparisonBrowserDebugViewController alloc] initWithStyle:0];
  v3 = [(PUCurationUtilityComparisonBrowserDebugViewController *)v7 navigationItem];
  [v3 setTitle:@"isUtility Comparison"];

  v4 = [(PUCurationUtilityComparisonBrowserDebugViewController *)v7 navigationItem];
  id v5 = [v4 searchController];
  [v5 setActive:0];

  v6 = [v2 navigationController];

  [v6 pushViewController:v7 animated:1];
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (PUCurationSettings)sharedInstance
{
  if (sharedInstance_onceToken_90682 != -1) {
    dispatch_once(&sharedInstance_onceToken_90682, &__block_literal_global_90683);
  }
  id v2 = (void *)sharedInstance_sharedInstance_90684;
  return (PUCurationSettings *)v2;
}

void __36__PUCurationSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 curation];
  v1 = (void *)sharedInstance_sharedInstance_90684;
  sharedInstance_sharedInstance_90684 = v0;
}

@end