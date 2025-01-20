@interface PUSuggestionsSettings
+ (PUSuggestionsSettings)sharedInstance;
+ (id)_debugRowsForCurrentAsset;
+ (id)settingsControllerModule;
+ (id)sortDescriptorForMode:(int64_t)a3;
- (BOOL)debugBackfillCompositing;
- (BOOL)debugDisableFrameUpdates;
- (BOOL)debugRoundTripLayerStack;
- (BOOL)debugTintLayers;
- (BOOL)disableSegmentation;
- (BOOL)disableSegmentationCache;
- (BOOL)enableCustomStyles;
- (BOOL)enableFRCInAssetDetails;
- (BOOL)enableGreenScreenStyles;
- (BOOL)includeDebugLayers;
- (PUWallpaperShortcutsPlaygroundSettings)shortcutsPlaygroundSettings;
- (double)manualGatingLenience;
- (double)parallaxAmount;
- (id)parentSettings;
- (int64_t)infillMode;
- (int64_t)primarySort;
- (int64_t)secondarySort;
- (int64_t)sourceMode;
- (int64_t)viewMode;
- (unint64_t)livePhotoTabFetchLimit;
- (void)createChildren;
- (void)performPostSaveActions;
- (void)setDebugBackfillCompositing:(BOOL)a3;
- (void)setDebugDisableFrameUpdates:(BOOL)a3;
- (void)setDebugRoundTripLayerStack:(BOOL)a3;
- (void)setDebugTintLayers:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDisableSegmentation:(BOOL)a3;
- (void)setDisableSegmentationCache:(BOOL)a3;
- (void)setEnableCustomStyles:(BOOL)a3;
- (void)setEnableFRCInAssetDetails:(BOOL)a3;
- (void)setEnableGreenScreenStyles:(BOOL)a3;
- (void)setIncludeDebugLayers:(BOOL)a3;
- (void)setInfillMode:(int64_t)a3;
- (void)setLivePhotoTabFetchLimit:(unint64_t)a3;
- (void)setManualGatingLenience:(double)a3;
- (void)setParallaxAmount:(double)a3;
- (void)setPrimarySort:(int64_t)a3;
- (void)setSecondarySort:(int64_t)a3;
- (void)setShortcutsPlaygroundSettings:(id)a3;
- (void)setSourceMode:(int64_t)a3;
- (void)setViewMode:(int64_t)a3;
@end

@implementation PUSuggestionsSettings

- (void)createChildren
{
  v3 = [(PTSettings *)[PUWallpaperShortcutsPlaygroundSettings alloc] initWithDefaultValues];
  shortcutsPlaygroundSettings = self->_shortcutsPlaygroundSettings;
  self->_shortcutsPlaygroundSettings = v3;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUSuggestionsSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUSuggestionsSettings *)self setViewMode:0];
  [(PUSuggestionsSettings *)self setSourceMode:0];
  [(PUSuggestionsSettings *)self setIncludeDebugLayers:MEMORY[0x1B3E7A500]([(PUSuggestionsSettings *)self setParallaxAmount:30.0])];
  [(PUSuggestionsSettings *)self setDebugRoundTripLayerStack:0];
  [(PUSuggestionsSettings *)self setDebugBackfillCompositing:0];
  [(PUSuggestionsSettings *)self setDebugDisableFrameUpdates:0];
  [(PUSuggestionsSettings *)self setEnableFRCInAssetDetails:0];
  [(PUSuggestionsSettings *)self setPrimarySort:4];
  [(PUSuggestionsSettings *)self setSecondarySort:0];
  [(PUSuggestionsSettings *)self setLivePhotoTabFetchLimit:*MEMORY[0x1E4F8EAC0]];
}

- (void)setViewMode:(int64_t)a3
{
  self->_viewMode = a3;
}

- (void)setSourceMode:(int64_t)a3
{
  self->_sourceMode = a3;
}

- (void)setSecondarySort:(int64_t)a3
{
  self->_secondarySort = a3;
}

- (void)setPrimarySort:(int64_t)a3
{
  self->_primarySort = a3;
}

- (void)setParallaxAmount:(double)a3
{
  self->_parallaxAmount = a3;
}

- (void)setLivePhotoTabFetchLimit:(unint64_t)a3
{
  self->_livePhotoTabFetchLimit = a3;
}

- (void)setIncludeDebugLayers:(BOOL)a3
{
  self->_includeDebugLayers = a3;
}

- (void)setEnableFRCInAssetDetails:(BOOL)a3
{
  self->_enableFRCInAssetDetails = a3;
}

- (void)setDebugRoundTripLayerStack:(BOOL)a3
{
  self->_debugRoundTripLayerStack = a3;
}

- (void)setDebugDisableFrameUpdates:(BOOL)a3
{
  self->_debugDisableFrameUpdates = a3;
}

- (void)setDebugBackfillCompositing:(BOOL)a3
{
  self->_debugBackfillCompositing = a3;
}

+ (id)_debugRowsForCurrentAsset
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v31 = objc_msgSend(MEMORY[0x1E4FB1EC0], "pu_currentViewControllerStack");
  v30 = [v31 firstObject];
  if (v30)
  {
    id v33 = [MEMORY[0x1E4F1CA48] array];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = [v31 reverseObjectEnumerator];
    uint64_t v37 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (!v37) {
      goto LABEL_24;
    }
    uint64_t v36 = *(void *)v58;
    while (1)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v58 != v36) {
          objc_enumerationMutation(obj);
        }
        objc_initWeak(&location, *(id *)(*((void *)&v57 + 1) + 8 * i));
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke;
        aBlock[3] = &unk_1E5F2C298;
        objc_copyWeak(&v55, &location);
        v38 = (void (**)(void))_Block_copy(aBlock);
        v2 = [MEMORY[0x1E4F1CA48] array];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        objc_super v3 = v38[2]();
        uint64_t v4 = [v3 countByEnumeratingWithState:&v50 objects:v62 count:16];
        if (v4)
        {
          uint64_t v5 = *(void *)v51;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(void *)v51 != v5) {
                objc_enumerationMutation(v3);
              }
              id v7 = *(id *)(*((void *)&v50 + 1) + 8 * v6);
              if (v7)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  goto LABEL_14;
                }
                v8 = [MEMORY[0x1E4F28B00] currentHandler];
                v11 = (objc_class *)objc_opt_class();
                v10 = NSStringFromClass(v11);
                v12 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
                [v8 handleFailureInMethod:a2, a1, @"PUSuggestionsSettings+UI.m", 336, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v10, v12 object file lineNumber description];
              }
              else
              {
                v8 = [MEMORY[0x1E4F28B00] currentHandler];
                v9 = (objc_class *)objc_opt_class();
                v10 = NSStringFromClass(v9);
                [v8 handleFailureInMethod:a2, a1, @"PUSuggestionsSettings+UI.m", 336, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v10 object file lineNumber description];
              }

LABEL_14:
              [v2 addObject:v7];

              ++v6;
            }
            while (v4 != v6);
            uint64_t v13 = [v3 countByEnumeratingWithState:&v50 objects:v62 count:16];
            uint64_t v4 = v13;
          }
          while (v13);
        }

        if ([v2 count])
        {
          v14 = (void *)MEMORY[0x1E4F940F8];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_2;
          v48[3] = &unk_1E5F2C248;
          id v15 = v2;
          id v49 = v15;
          v16 = objc_msgSend(v14, "pu_rowWithTitle:action:", @"Show in Parallax Debug Viewer", v48);
          v61[0] = v16;
          v17 = (void *)MEMORY[0x1E4F940F8];
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_3;
          v46[3] = &unk_1E5F2C248;
          id v18 = v15;
          id v47 = v18;
          v19 = objc_msgSend(v17, "pu_rowWithTitle:action:", @"Show in Wallpaper Poster Editor", v46);
          v61[1] = v19;
          v20 = (void *)MEMORY[0x1E4F940F8];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_4;
          v44[3] = &unk_1E5F2C248;
          id v21 = v18;
          id v45 = v21;
          v22 = objc_msgSend(v20, "pu_rowWithTitle:action:", @"Show as Lock Screen Wallpaper", v44);
          v61[2] = v22;
          v23 = (void *)MEMORY[0x1E4F940F8];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_5;
          v42[3] = &unk_1E5F2C248;
          id v24 = v21;
          id v43 = v24;
          v25 = objc_msgSend(v23, "pu_rowWithTitle:action:", @"Test Lock Screen Migration", v42);
          v61[3] = v25;
          v26 = (void *)MEMORY[0x1E4F940F8];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_6;
          v40[3] = &unk_1E5F2C248;
          id v41 = v24;
          v27 = objc_msgSend(v26, "pu_rowWithTitle:action:", @"Test Home Screen Migration", v40);
          v61[4] = v27;
          v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:5];

          [v33 addObjectsFromArray:v28];
        }

        objc_destroyWeak(&v55);
        objc_destroyWeak(&location);
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (!v37)
      {
LABEL_24:

        goto LABEL_26;
      }
    }
  }
  id v33 = (id)MEMORY[0x1E4F1CBF0];
LABEL_26:

  return v33;
}

id __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  v2 = objc_msgSend(v1, "pu_debugCurrentlySelectedAssets");

  if (!v2)
  {
    id v3 = objc_loadWeakRetained(&to);
    uint64_t v4 = objc_msgSend(v3, "pu_debugCurrentAsset");

    if (v4)
    {
      v7[0] = v4;
      v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
    else
    {
      v2 = 0;
    }
  }
  objc_destroyWeak(&to);
  return v2;
}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = objc_alloc_init(PUParallaxLayerStackDebugViewController);
  uint64_t v4 = [*(id *)(a1 + 32) firstObject];
  [(PUParallaxLayerStackDebugViewController *)v6 loadPHAsset:v4];

  uint64_t v5 = [v3 navigationController];

  [v5 pushViewController:v6 animated:1];
}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [PUWallpaperPosterEditDebugViewController alloc];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 firstObject];
  id v7 = [v6 photoLibrary];
  v8 = [(PUWallpaperPosterEditDebugViewController *)v4 initWithAssets:v5 posterType:1 photoLibrary:v7];

  [(PUWallpaperPosterEditDebugViewController *)v8 setModalPresentationStyle:5];
  [v3 presentViewController:v8 animated:1 completion:0];
}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[PUWallpaperPlaygroundViewController alloc] initWithAssets:*(void *)(a1 + 32)];
  [(PUWallpaperPlaygroundViewController *)v4 presentPlaygroundWithPresentingViewController:v3];
}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [PUWallpaperPosterEditDebugViewController alloc];
  uint64_t v5 = [*(id *)(a1 + 32) firstObject];
  uint64_t v6 = [v5 photoLibrary];
  id v7 = [(PUWallpaperPosterEditDebugViewController *)v4 initWithMigratorOfLegacyConfigurationType:1 photoLibrary:v6];

  [(PUWallpaperPosterEditDebugViewController *)v7 setModalPresentationStyle:5];
  [v3 presentViewController:v7 animated:1 completion:0];
}

void __54__PUSuggestionsSettings_UI___debugRowsForCurrentAsset__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [PUWallpaperPosterEditDebugViewController alloc];
  uint64_t v5 = [*(id *)(a1 + 32) firstObject];
  uint64_t v6 = [v5 photoLibrary];
  id v7 = [(PUWallpaperPosterEditDebugViewController *)v4 initWithMigratorOfLegacyConfigurationType:2 photoLibrary:v6];

  [(PUWallpaperPosterEditDebugViewController *)v7 setModalPresentationStyle:5];
  [v3 presentViewController:v7 animated:1 completion:0];
}

+ (id)settingsControllerModule
{
  v190[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Top People Suggestion Generation", &__block_literal_global_89243);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Wallpaper Nightly Suggestions", &__block_literal_global_259);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Portrait Wallpaper Candidates", &__block_literal_global_268_89246);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Cold Start Photos", &__block_literal_global_275_89248);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Cold Start Photos (Device Owner)", &__block_literal_global_280);
  v9 = (void *)MEMORY[0x1E4F94160];
  v144 = (void *)v5;
  v145 = (void *)v4;
  v190[0] = v4;
  v190[1] = v5;
  v142 = (void *)v7;
  v143 = (void *)v6;
  v190[2] = v6;
  v190[3] = v7;
  v141 = (void *)v8;
  v190[4] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:5];
  v140 = [v9 sectionWithRows:v10 title:@"Wallpaper Generation"];

  v11 = (void *)MEMORY[0x1E4F94160];
  v12 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Wallpaper Category Inspector", &__block_literal_global_290);
  v189[0] = v12;
  uint64_t v13 = (void *)MEMORY[0x1E4F940F8];
  v180[0] = MEMORY[0x1E4F143A8];
  v180[1] = 3221225472;
  v180[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_7;
  v180[3] = &unk_1E5F2C248;
  id v14 = v3;
  id v181 = v14;
  id v15 = objc_msgSend(v13, "pu_rowWithTitle:action:", @"Smart Album People Inspector", v180);
  v189[1] = v15;
  v16 = (void *)MEMORY[0x1E4F940F8];
  v178[0] = MEMORY[0x1E4F143A8];
  v178[1] = 3221225472;
  v178[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_8;
  v178[3] = &unk_1E5F2C248;
  id v17 = v14;
  id v179 = v17;
  id v18 = objc_msgSend(v16, "pu_rowWithTitle:action:", @"Gallery Featured Photo", v178);
  v189[2] = v18;
  v19 = (void *)MEMORY[0x1E4F940F8];
  v176[0] = MEMORY[0x1E4F143A8];
  v176[1] = 3221225472;
  v176[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_9;
  v176[3] = &unk_1E5F2C248;
  id v20 = v17;
  id v177 = v20;
  id v21 = objc_msgSend(v19, "pu_rowWithTitle:action:", @"Gallery Smart Album", v176);
  v189[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:4];
  v139 = [v11 sectionWithRows:v22 title:@"Wallpaper Inspector"];

  v146 = (void *)MEMORY[0x1E4F94160];
  v23 = (void *)MEMORY[0x1E4F940F8];
  v173[0] = MEMORY[0x1E4F143A8];
  v173[1] = 3221225472;
  v173[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_339;
  v173[3] = &unk_1E5F2C270;
  id v153 = v20;
  id v174 = v153;
  id v175 = a1;
  v151 = objc_msgSend(v23, "pu_rowWithTitle:action:", @"Picker Playground", v173);
  v188[0] = v151;
  id v24 = (void *)MEMORY[0x1E4F94108];
  v149 = NSStringFromSelector(sel_primarySort);
  v25 = [v24 rowWithTitle:@"Primary Sort" valueKeyPath:v149];
  v26 = [v25 possibleValues:&unk_1F078B618 titles:&unk_1F078B630];
  v188[1] = v26;
  v27 = (void *)MEMORY[0x1E4F94108];
  v28 = NSStringFromSelector(sel_secondarySort);
  v29 = [v27 rowWithTitle:@"Secondary Sort" valueKeyPath:v28];
  v30 = [v29 possibleValues:&unk_1F078B618 titles:&unk_1F078B630];
  v188[2] = v30;
  v31 = (void *)MEMORY[0x1E4F941D8];
  v32 = NSStringFromSelector(sel_livePhotoTabFetchLimit);
  id v33 = [v31 rowWithTitle:@"Fetch Limit" valueKeyPath:v32];
  v34 = [v33 minValue:50.0 maxValue:200.0];
  v35 = objc_msgSend(v34, "pu_increment:", 1.0);
  v188[3] = v35;
  uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:4];
  v138 = [v146 sectionWithRows:v36 title:@"Picker Live Photo Tab Playground"];

  uint64_t v37 = (void *)MEMORY[0x1E4F94160];
  v38 = (void *)MEMORY[0x1E4F940F8];
  v171[0] = MEMORY[0x1E4F143A8];
  v171[1] = 3221225472;
  v171[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_2_364;
  v171[3] = &unk_1E5F2C248;
  id v39 = v153;
  id v172 = v39;
  v40 = objc_msgSend(v38, "pu_rowWithTitle:action:", @"Combined", v171);
  v187[0] = v40;
  id v41 = (void *)MEMORY[0x1E4F940F8];
  v169[0] = MEMORY[0x1E4F143A8];
  v169[1] = 3221225472;
  v169[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_3_368;
  v169[3] = &unk_1E5F2C248;
  id v42 = v39;
  id v170 = v42;
  id v43 = objc_msgSend(v41, "pu_rowWithTitle:action:", @"Highlight Pass FRC", v169);
  v187[1] = v43;
  v44 = (void *)MEMORY[0x1E4F940F8];
  v167[0] = MEMORY[0x1E4F143A8];
  v167[1] = 3221225472;
  v167[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_4_372;
  v167[3] = &unk_1E5F2C248;
  id v45 = v42;
  id v168 = v45;
  v46 = objc_msgSend(v44, "pu_rowWithTitle:action:", @"Highlight Candidates", v167);
  v187[2] = v46;
  id v47 = (void *)MEMORY[0x1E4F940F8];
  v165[0] = MEMORY[0x1E4F143A8];
  v165[1] = 3221225472;
  v165[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_5_376;
  v165[3] = &unk_1E5F2C248;
  id v48 = v45;
  id v166 = v48;
  id v49 = objc_msgSend(v47, "pu_rowWithTitle:action:", @"Live Photo Suggestions Only", v165);
  v187[3] = v49;
  long long v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:4];
  v154 = [v37 sectionWithRows:v50 title:@"Picker Live Photo Tab Curation"];

  long long v51 = (void *)MEMORY[0x1E4F94160];
  long long v52 = (void *)MEMORY[0x1E4F941F0];
  long long v53 = NSStringFromSelector(sel_enableFRCInAssetDetails);
  v54 = [v52 rowWithTitle:@"Enable FRC in Asset Details" valueKeyPath:v53];
  v186[0] = v54;
  id v55 = (void *)MEMORY[0x1E4F940F8];
  v163[0] = MEMORY[0x1E4F143A8];
  v163[1] = 3221225472;
  v163[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_6_389;
  v163[3] = &unk_1E5F2C248;
  id v56 = v48;
  id v164 = v56;
  long long v57 = objc_msgSend(v55, "pu_rowWithTitle:action:", @"Settling Effect Score", v163);
  v186[1] = v57;
  long long v58 = (void *)MEMORY[0x1E4F940F8];
  v161[0] = MEMORY[0x1E4F143A8];
  v161[1] = 3221225472;
  v161[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_7_393;
  v161[3] = &unk_1E5F2C248;
  id v59 = v56;
  id v162 = v59;
  long long v60 = objc_msgSend(v58, "pu_rowWithTitle:action:", @"Autoplay Suggestion Score", v161);
  v186[2] = v60;
  v61 = (void *)MEMORY[0x1E4F940F8];
  v159[0] = MEMORY[0x1E4F143A8];
  v159[1] = 3221225472;
  v159[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_8_397;
  v159[3] = &unk_1E5F2C248;
  id v62 = v59;
  id v160 = v62;
  v63 = objc_msgSend(v61, "pu_rowWithTitle:action:", @"Settling Effect Suggestions", v159);
  v186[3] = v63;
  uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:4];
  v152 = [v51 sectionWithRows:v64 title:@"Settling Effect"];

  v65 = (void *)MEMORY[0x1E4F94160];
  v66 = (void *)MEMORY[0x1E4F940F8];
  v157[0] = MEMORY[0x1E4F143A8];
  v157[1] = 3221225472;
  v157[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_9_404;
  v157[3] = &unk_1E5F2C248;
  id v67 = v62;
  id v158 = v67;
  v68 = objc_msgSend(v66, "pu_rowWithTitle:action:", @"Me Suggestions", v157);
  v185[0] = v68;
  v69 = (void *)MEMORY[0x1E4F940F8];
  v155[0] = MEMORY[0x1E4F143A8];
  v155[1] = 3221225472;
  v155[2] = __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_10;
  v155[3] = &unk_1E5F2C248;
  id v136 = v67;
  id v156 = v136;
  v70 = objc_msgSend(v69, "pu_rowWithTitle:action:", @"People Suggestions", v155);
  v185[1] = v70;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v185 count:2];
  v150 = [v65 sectionWithRows:v71 title:@"Camera Styleable"];

  v147 = (void *)MEMORY[0x1E4F94160];
  v72 = (void *)MEMORY[0x1E4F94108];
  v135 = NSStringFromSelector(sel_viewMode);
  v134 = [v72 rowWithTitle:@"View Mode" valueKeyPath:v135];
  v133 = [v134 possibleValues:&unk_1F078B648 titles:&unk_1F078B660];
  v184[0] = v133;
  v73 = (void *)MEMORY[0x1E4F94108];
  v132 = NSStringFromSelector(sel_sourceMode);
  v131 = [v73 rowWithTitle:@"Source Mode" valueKeyPath:v132];
  v130 = [v131 possibleValues:&unk_1F078B678 titles:&unk_1F078B690];
  v184[1] = v130;
  v74 = (void *)MEMORY[0x1E4F94108];
  v129 = NSStringFromSelector(sel_infillMode);
  v128 = [v74 rowWithTitle:@"Infill Mode" valueKeyPath:v129];
  v127 = [v128 possibleValues:&unk_1F078B6A8 titles:&unk_1F078B6C0];
  v184[2] = v127;
  v75 = (void *)MEMORY[0x1E4F941F0];
  v126 = NSStringFromSelector(sel_disableSegmentation);
  v125 = [v75 rowWithTitle:@"Disable Segmentation" valueKeyPath:v126];
  v184[3] = v125;
  v76 = (void *)MEMORY[0x1E4F941F0];
  v124 = NSStringFromSelector(sel_disableSegmentationCache);
  v123 = [v76 rowWithTitle:@"Disable Segmentation Cache" valueKeyPath:v124];
  v184[4] = v123;
  v77 = (void *)MEMORY[0x1E4F941D8];
  v122 = NSStringFromSelector(sel_parallaxAmount);
  v121 = [v77 rowWithTitle:@"Parallax Amount" valueKeyPath:v122];
  v120 = [v121 minValue:0.0 maxValue:100.0];
  v184[5] = v120;
  v78 = (void *)MEMORY[0x1E4F941D8];
  v119 = NSStringFromSelector(sel_manualGatingLenience);
  v118 = [v78 rowWithTitle:@"Manual Gating Lenience" valueKeyPath:v119];
  v117 = [v118 minValue:0.0 maxValue:1.0];
  v184[6] = v117;
  v79 = (void *)MEMORY[0x1E4F941F0];
  v116 = NSStringFromSelector(sel_includeDebugLayers);
  v115 = [v79 rowWithTitle:@"Include Debug Layers" valueKeyPath:v116];
  v184[7] = v115;
  v80 = (void *)MEMORY[0x1E4F941F0];
  v114 = NSStringFromSelector(sel_debugRoundTripLayerStack);
  v113 = [v80 rowWithTitle:@"Debug Round Trip Layers" valueKeyPath:v114];
  v184[8] = v113;
  v81 = (void *)MEMORY[0x1E4F941F0];
  v112 = NSStringFromSelector(sel_debugTintLayers);
  v111 = [v81 rowWithTitle:@"Debug Tint Layers" valueKeyPath:v112];
  v184[9] = v111;
  v82 = (void *)MEMORY[0x1E4F941F0];
  v83 = NSStringFromSelector(sel_debugBackfillCompositing);
  v84 = [v82 rowWithTitle:@"Debug Backfill Compositing" valueKeyPath:v83];
  v184[10] = v84;
  v85 = (void *)MEMORY[0x1E4F941F0];
  v86 = NSStringFromSelector(sel_debugDisableFrameUpdates);
  v87 = [v85 rowWithTitle:@"Debug Disable Frame Updates" valueKeyPath:v86];
  v184[11] = v87;
  v88 = (void *)MEMORY[0x1E4F941F0];
  v89 = NSStringFromSelector(sel_enableCustomStyles);
  v90 = [v88 rowWithTitle:@"Enable Custom Styles" valueKeyPath:v89];
  v184[12] = v90;
  v91 = (void *)MEMORY[0x1E4F941F0];
  v92 = NSStringFromSelector(sel_enableGreenScreenStyles);
  v93 = [v91 rowWithTitle:@"Enable Green-Screen Styles" valueKeyPath:v92];
  v184[13] = v93;
  v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:14];
  v148 = [v147 sectionWithRows:v94 title:@"Posters UI"];

  v95 = (void *)MEMORY[0x1E4F94160];
  v96 = (void *)MEMORY[0x1E4F94130];
  v97 = NSStringFromSelector(sel_shortcutsPlaygroundSettings);
  v98 = [v96 rowWithTitle:@"Shortcuts Playground" childSettingsKeyPath:v97];
  v183 = v98;
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v183 count:1];
  v100 = [v95 sectionWithRows:v99 title:@"Shortcuts"];

  v101 = [a1 _debugRowsForCurrentAsset];
  if ([v101 count])
  {
    v102 = [MEMORY[0x1E4F94160] sectionWithRows:v101 title:@"Current Asset or Selection"];
  }
  else
  {
    v102 = 0;
  }
  v103 = (void *)MEMORY[0x1E4F1CA48];
  v182[0] = v140;
  v182[1] = v139;
  v182[2] = v154;
  v182[3] = v138;
  v182[4] = v152;
  v182[5] = v150;
  v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:6];
  v105 = [v103 arrayWithArray:v104];

  if (v148) {
    objc_msgSend(v105, "addObject:");
  }
  if (v102) {
    [v105 addObject:v102];
  }
  [v105 addObject:v100];
  v106 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  [v105 addObject:v106];

  v107 = (void *)MEMORY[0x1E4F94160];
  v108 = (void *)[v105 copy];
  v109 = [v107 moduleWithTitle:@"Suggestions" contents:v108];

  return v109;
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:1];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F908F8]) initWithPhotoLibrary:*(void *)(a1 + 32)];
  uint64_t v5 = [[PUWallpaperSmartAlbumPeopleDebugViewController alloc] initWithSpec:v7 dataSource:v4];
  uint64_t v6 = [v3 navigationController];

  [v6 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F8E858];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v9 = [v2 fetchWallpaperGallerySuggestionsInPhotoLibrary:v3];
  uint64_t v5 = [MEMORY[0x1E4F8E858] wallpaperGalleryFeaturedPhotoSortedSuggestionsFromSuggestions:v9];
  uint64_t v6 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:0];
  uint64_t v7 = [[PUWallpaperGalleryDebugViewController alloc] initWithSpec:v6];
  [(PUWallpaperGalleryDebugViewController *)v7 setSuggestions:v5];
  uint64_t v8 = [v4 navigationController];

  [v8 pushViewController:v7 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_9(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F8E858];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v9 = [v2 fetchWallpaperGallerySuggestionsInPhotoLibrary:v3];
  uint64_t v5 = [MEMORY[0x1E4F8E858] wallpaperGallerySmartAlbumSuggestionsFromSuggestions:v9];
  uint64_t v6 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:0];
  uint64_t v7 = [[PUWallpaperGalleryDebugViewController alloc] initWithSpec:v6];
  [(PUWallpaperGalleryDebugViewController *)v7 setSuggestions:v5];
  uint64_t v8 = [v4 navigationController];

  [v8 pushViewController:v7 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_339(uint64_t a1, void *a2)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[PUSuggestionsSettings sharedInstance];
  uint64_t v5 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
  objc_msgSend(v5, "setFetchLimit:", objc_msgSend(v4, "livePhotoTabFetchLimit"));
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "sortDescriptorForMode:", objc_msgSend(v4, "primarySort"));
  v16[0] = v6;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "sortDescriptorForMode:", objc_msgSend(v4, "secondarySort", v6));
  v16[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v16[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  [v5 setInternalSortDescriptors:v9];

  v10 = [MEMORY[0x1E4F8E858] fetchLivePhotoTabAssetsWithOptions:v5];
  v11 = (void *)MEMORY[0x1E4F38EB8];
  v12 = [v10 fetchedObjectIDs];
  uint64_t v13 = [v11 fetchAssetsWithObjectIDs:v12 options:v5];

  id v14 = [getPUTesterSettlingEffectReviewUtilitiesClass() livePhotoTabPlaygroundViewControllerWithFetchResult:v13];
  id v15 = [v3 navigationController];

  [v15 pushViewController:v14 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_2_364(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterSettlingEffectReviewUtilitiesClass() livePhotoTabReviewViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_3_368(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterSettlingEffectReviewUtilitiesClass() livePhotoTabHighlightSettlingEffectAssetsReviewViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_4_372(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterSettlingEffectReviewUtilitiesClass() livePhotoTabHighlightCandidateAssetsReviewViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_5_376(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterSettlingEffectReviewUtilitiesClass() livePhotoTabSuggestionReviewViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_6_389(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterSettlingEffectReviewUtilitiesClass() settlingEffectScoreReviewViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_7_393(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterSettlingEffectReviewUtilitiesClass() autoplayScoreReviewViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_8_397(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterSettlingEffectReviewUtilitiesClass() settlingEffectSuggestionReviewViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_9_404(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterCurationViewControllerFactoryClass_89387() meCameraStyleableSuggestionsViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterCurationViewControllerFactoryClass_89387() peopleCameraStyleableSuggestionsViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v7 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:0];
  id v3 = [PUPassiveContentSummaryViewController alloc];
  id v4 = +[PUPassiveContentDataSource wallpaperDataSource];
  id v5 = [(PUPassiveContentSummaryViewController *)v3 initWithSpec:v7 dataSource:v4];

  uint64_t v6 = [v2 navigationController];

  [v6 pushViewController:v5 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v7 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:0];
  id v3 = [[PUPortraitWallpaperCandidateDebugViewController alloc] initWithSpec:v7 mode:2];
  id v4 = [(PUPortraitWallpaperCandidateDebugViewController *)v3 navigationItem];
  id v5 = [v4 searchController];
  [v5 setActive:0];

  uint64_t v6 = [v2 navigationController];

  [v6 pushViewController:v3 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v7 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:0];
  id v3 = [[PUPortraitWallpaperCandidateDebugViewController alloc] initWithSpec:v7 mode:1];
  id v4 = [(PUPortraitWallpaperCandidateDebugViewController *)v3 navigationItem];
  id v5 = [v4 searchController];
  [v5 setActive:0];

  uint64_t v6 = [v2 navigationController];

  [v6 pushViewController:v3 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v7 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:0];
  id v3 = [[PUPortraitWallpaperCandidateDebugViewController alloc] initWithSpec:v7 mode:0];
  id v4 = [(PUPortraitWallpaperCandidateDebugViewController *)v3 navigationItem];
  id v5 = [v4 searchController];
  [v5 setActive:0];

  uint64_t v6 = [v2 navigationController];

  [v6 pushViewController:v3 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v7 = objc_alloc_init(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController);
  id v3 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)v7 navigationItem];
  [v3 setTitle:@"Poster Configurations"];

  id v4 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)v7 navigationItem];
  id v5 = [v4 searchController];
  [v5 setActive:0];

  uint64_t v6 = [v2 navigationController];

  [v6 pushViewController:v7 animated:1];
}

void __53__PUSuggestionsSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "px_extendedTraitCollection");
  [v3 userInterfaceIdiom];
  objc_opt_class();

  id v4 = [PUTopPeopleWallpaperSuggestionsDebugViewController alloc];
  id v5 = objc_opt_new();
  v10 = [(PUPhotosAlbumViewController *)v4 initWithSpec:v5];

  uint64_t v6 = [(PUTopPeopleWallpaperSuggestionsDebugViewController *)v10 navigationItem];
  [v6 setTitle:@"Top People Suggestion Generation"];

  uint64_t v7 = [(PUTopPeopleWallpaperSuggestionsDebugViewController *)v10 navigationItem];
  uint64_t v8 = [v7 searchController];
  [v8 setActive:0];

  id v9 = [v2 navigationController];

  [v9 pushViewController:v10 animated:1];
}

- (void).cxx_destruct
{
}

- (void)setShortcutsPlaygroundSettings:(id)a3
{
}

- (PUWallpaperShortcutsPlaygroundSettings)shortcutsPlaygroundSettings
{
  return self->_shortcutsPlaygroundSettings;
}

- (unint64_t)livePhotoTabFetchLimit
{
  return self->_livePhotoTabFetchLimit;
}

- (int64_t)secondarySort
{
  return self->_secondarySort;
}

- (int64_t)primarySort
{
  return self->_primarySort;
}

- (BOOL)enableFRCInAssetDetails
{
  return self->_enableFRCInAssetDetails;
}

- (BOOL)debugDisableFrameUpdates
{
  return self->_debugDisableFrameUpdates;
}

- (BOOL)debugBackfillCompositing
{
  return self->_debugBackfillCompositing;
}

- (BOOL)debugRoundTripLayerStack
{
  return self->_debugRoundTripLayerStack;
}

- (BOOL)includeDebugLayers
{
  return self->_includeDebugLayers;
}

- (double)parallaxAmount
{
  return self->_parallaxAmount;
}

- (int64_t)sourceMode
{
  return self->_sourceMode;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (void)setEnableGreenScreenStyles:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setParallaxStyleEnableGreenScreen:v3];
}

- (BOOL)enableGreenScreenStyles
{
  id v2 = [MEMORY[0x1E4F8A2C0] globalSettings];
  char v3 = [v2 parallaxStyleEnableGreenScreen];

  return v3;
}

- (void)setEnableCustomStyles:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setUseStyleRecipeConfigDirectory:v3];
}

- (BOOL)enableCustomStyles
{
  id v2 = [MEMORY[0x1E4F8A2C0] globalSettings];
  char v3 = [v2 useStyleRecipeConfigDirectory];

  return v3;
}

- (void)setDisableSegmentationCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setSegmentationDisableCaching:v3];
}

- (BOOL)disableSegmentationCache
{
  id v2 = [MEMORY[0x1E4F8A2C0] globalSettings];
  char v3 = [v2 segmentationDisableCaching];

  return v3;
}

- (void)setManualGatingLenience:(double)a3
{
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setSegmentationManualGatingLenience:a3];
}

- (double)manualGatingLenience
{
  id v2 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v2 segmentationManualGatingLenience];
  double v4 = v3;

  return v4;
}

- (void)setDisableSegmentation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setDisableSegmentation:v3];
}

- (BOOL)disableSegmentation
{
  id v2 = [MEMORY[0x1E4F8A2C0] globalSettings];
  char v3 = [v2 disableSegmentation];

  return v3;
}

- (void)setDebugTintLayers:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setSegmentationDebugTintLayers:v3];
}

- (BOOL)debugTintLayers
{
  id v2 = [MEMORY[0x1E4F8A2C0] globalSettings];
  char v3 = [v2 segmentationDebugTintLayers];

  return v3;
}

- (void)setInfillMode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F8A2C0] globalSettings];
  [v4 setSegmentationInfillAlgorithm:a3];
}

- (int64_t)infillMode
{
  id v2 = [MEMORY[0x1E4F8A2C0] globalSettings];
  int64_t v3 = [v2 segmentationInfillAlgorithm];

  return v3;
}

- (void)performPostSaveActions
{
  v7.receiver = self;
  v7.super_class = (Class)PUSuggestionsSettings;
  [(PXSettings *)&v7 performPostSaveActions];
  int64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = *MEMORY[0x1E4F283E0];
  id v5 = [v3 persistentDomainForName:*MEMORY[0x1E4F283E0]];
  uint64_t v6 = (void *)[v5 mutableCopy];

  if ([(PUSuggestionsSettings *)self enableFRCInAssetDetails]) {
    [v6 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F8EAC8]];
  }
  else {
    [v6 removeObjectForKey:*MEMORY[0x1E4F8EAC8]];
  }
  [v3 setPersistentDomain:v6 forName:v4];
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)sortDescriptorForMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 4)
  {
    objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", off_1E5F2D2E8[a3], 0, v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (PUSuggestionsSettings)sharedInstance
{
  if (sharedInstance_onceToken_95230 != -1) {
    dispatch_once(&sharedInstance_onceToken_95230, &__block_literal_global_95231);
  }
  id v2 = (void *)sharedInstance_sharedInstance_95232;
  return (PUSuggestionsSettings *)v2;
}

void __39__PUSuggestionsSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 suggestions];
  id v1 = (void *)sharedInstance_sharedInstance_95232;
  sharedInstance_sharedInstance_95232 = v0;
}

@end