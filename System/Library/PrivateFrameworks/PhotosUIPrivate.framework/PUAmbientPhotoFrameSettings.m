@interface PUAmbientPhotoFrameSettings
+ (PUAmbientPhotoFrameSettings)sharedInstance;
+ (id)_enabledCurationCategoriesPredicate;
+ (id)settingsControllerModule;
- (BOOL)disableLetterAndPillarBoxing;
- (BOOL)disableNUp;
- (BOOL)forceColdStart;
- (BOOL)includeFeaturedPhotosInFeatured;
- (BOOL)includeHighlightAssetsInFeatured;
- (BOOL)includePhotosInRadar;
- (BOOL)showCitiesCuratedAssets;
- (BOOL)showCuratedCategories;
- (BOOL)showFavoriteAlbumAssets;
- (BOOL)showFeaturedCuratedAssets;
- (BOOL)showNatureCuratedAssets;
- (BOOL)showPeopleCuratedAssets;
- (BOOL)showPetsCuratedAssets;
- (BOOL)showTapToRadarButton;
- (NSArray)personLocalIdentifiers;
- (double)fixedAssetDuration;
- (double)kenBurnsPanSpeed;
- (double)kenBurnsScaleSpeed;
- (id)parentSettings;
- (int64_t)watchTimeConfig;
- (int64_t)watchType;
- (void)setDefaultValues;
- (void)setDisableLetterAndPillarBoxing:(BOOL)a3;
- (void)setDisableNUp:(BOOL)a3;
- (void)setFixedAssetDuration:(double)a3;
- (void)setForceColdStart:(BOOL)a3;
- (void)setIncludeFeaturedPhotosInFeatured:(BOOL)a3;
- (void)setIncludeHighlightAssetsInFeatured:(BOOL)a3;
- (void)setIncludePhotosInRadar:(BOOL)a3;
- (void)setKenBurnsPanSpeed:(double)a3;
- (void)setKenBurnsScaleSpeed:(double)a3;
- (void)setPersonLocalIdentifiers:(id)a3;
- (void)setShowCitiesCuratedAssets:(BOOL)a3;
- (void)setShowCuratedCategories:(BOOL)a3;
- (void)setShowFavoriteAlbumAssets:(BOOL)a3;
- (void)setShowFeaturedCuratedAssets:(BOOL)a3;
- (void)setShowNatureCuratedAssets:(BOOL)a3;
- (void)setShowPeopleCuratedAssets:(BOOL)a3;
- (void)setShowPetsCuratedAssets:(BOOL)a3;
- (void)setShowTapToRadarButton:(BOOL)a3;
- (void)setWatchTimeConfig:(int64_t)a3;
- (void)setWatchType:(int64_t)a3;
- (void)wallpaperShuffleConfigurationViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4;
- (void)wallpaperShuffleConfigurationViewControllerDidCancelManuallySelectingPhotos:(id)a3;
- (void)wallpaperShuffleConfigurationViewControllerDidDismiss:(id)a3;
@end

@implementation PUAmbientPhotoFrameSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUAmbientPhotoFrameSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUAmbientPhotoFrameSettings *)self setFixedAssetDuration:40.0];
  [(PUAmbientPhotoFrameSettings *)self setDisableNUp:1];
  [(PUAmbientPhotoFrameSettings *)self setDisableLetterAndPillarBoxing:1];
  [(PUAmbientPhotoFrameSettings *)self setKenBurnsPanSpeed:4.0];
  [(PUAmbientPhotoFrameSettings *)self setKenBurnsScaleSpeed:4.0];
  [(PUAmbientPhotoFrameSettings *)self setShowFavoriteAlbumAssets:1];
  [(PUAmbientPhotoFrameSettings *)self setShowPeopleCuratedAssets:0];
  [(PUAmbientPhotoFrameSettings *)self setShowPetsCuratedAssets:0];
  [(PUAmbientPhotoFrameSettings *)self setShowNatureCuratedAssets:0];
  [(PUAmbientPhotoFrameSettings *)self setShowCitiesCuratedAssets:0];
  [(PUAmbientPhotoFrameSettings *)self setShowFeaturedCuratedAssets:1];
  [(PUAmbientPhotoFrameSettings *)self setIncludeHighlightAssetsInFeatured:1];
  [(PUAmbientPhotoFrameSettings *)self setIncludeFeaturedPhotosInFeatured:1];
  [(PUAmbientPhotoFrameSettings *)self setForceColdStart:0];
  [(PUAmbientPhotoFrameSettings *)self setPersonLocalIdentifiers:0];
  [(PUAmbientPhotoFrameSettings *)self setShowTapToRadarButton:1];
  [(PUAmbientPhotoFrameSettings *)self setIncludePhotosInRadar:0];
  [(PUAmbientPhotoFrameSettings *)self setWatchType:2];
  [(PUAmbientPhotoFrameSettings *)self setWatchTimeConfig:1];
}

- (void)setWatchType:(int64_t)a3
{
  self->_watchType = a3;
}

- (void)setWatchTimeConfig:(int64_t)a3
{
  self->_watchTimeConfig = a3;
}

- (void)setShowTapToRadarButton:(BOOL)a3
{
  self->_showTapToRadarButton = a3;
}

- (void)setShowPetsCuratedAssets:(BOOL)a3
{
  self->_showPetsCuratedAssets = a3;
}

- (void)setShowPeopleCuratedAssets:(BOOL)a3
{
  self->_showPeopleCuratedAssets = a3;
}

- (void)setShowNatureCuratedAssets:(BOOL)a3
{
  self->_showNatureCuratedAssets = a3;
}

- (void)setShowFeaturedCuratedAssets:(BOOL)a3
{
  self->_showFeaturedCuratedAssets = a3;
}

- (void)setShowFavoriteAlbumAssets:(BOOL)a3
{
  self->_showFavoriteAlbumAssets = a3;
}

- (void)setShowCitiesCuratedAssets:(BOOL)a3
{
  self->_showCitiesCuratedAssets = a3;
}

- (void)setPersonLocalIdentifiers:(id)a3
{
}

- (void)setKenBurnsScaleSpeed:(double)a3
{
  self->_kenBurnsScaleSpeed = a3;
}

- (void)setKenBurnsPanSpeed:(double)a3
{
  self->_kenBurnsPanSpeed = a3;
}

- (void)setIncludePhotosInRadar:(BOOL)a3
{
  self->_includePhotosInRadar = a3;
}

- (void)setIncludeHighlightAssetsInFeatured:(BOOL)a3
{
  self->_includeHighlightAssetsInFeatured = a3;
}

- (void)setIncludeFeaturedPhotosInFeatured:(BOOL)a3
{
  self->_includeFeaturedPhotosInFeatured = a3;
}

- (void)setForceColdStart:(BOOL)a3
{
  self->_forceColdStart = a3;
}

- (void)setFixedAssetDuration:(double)a3
{
  self->_fixedAssetDuration = a3;
}

- (void)setDisableNUp:(BOOL)a3
{
  self->_disableNUp = a3;
}

- (void)setDisableLetterAndPillarBoxing:(BOOL)a3
{
  self->_disableLetterAndPillarBoxing = a3;
}

- (void)wallpaperShuffleConfigurationViewControllerDidCancelManuallySelectingPhotos:(id)a3
{
}

- (void)wallpaperShuffleConfigurationViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4
{
  id v6 = a3;
  id v10 = [a4 shuffleConfiguration];
  unint64_t v7 = [v10 shuffleSmartAlbums];
  [(PUAmbientPhotoFrameSettings *)self setShowPeopleCuratedAssets:v7 & 1];
  [(PUAmbientPhotoFrameSettings *)self setShowPetsCuratedAssets:(v7 >> 1) & 1];
  [(PUAmbientPhotoFrameSettings *)self setShowCitiesCuratedAssets:(v7 >> 3) & 1];
  [(PUAmbientPhotoFrameSettings *)self setShowNatureCuratedAssets:(v7 >> 2) & 1];
  [(PUAmbientPhotoFrameSettings *)self setShowFeaturedCuratedAssets:(v7 >> 4) & 1];
  v8 = [v10 personLocalIdentifiers];
  v9 = [v8 allObjects];
  [(PUAmbientPhotoFrameSettings *)self setPersonLocalIdentifiers:v9];

  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)wallpaperShuffleConfigurationViewControllerDidDismiss:(id)a3
{
}

+ (id)_enabledCurationCategoriesPredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"showCuratedCategories == YES"];
}

+ (id)settingsControllerModule
{
  v121[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v4 = (void *)MEMORY[0x1E4F940F8];
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke;
  v110[3] = &unk_1E5F2C248;
  id v5 = v2;
  id v111 = v5;
  id v6 = objc_msgSend(v4, "pu_rowWithTitle:action:", @"Play (Long Press then Lift finger To Dismiss)", v110);
  v121[0] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:1];
  v101 = [v3 sectionWithRows:v7];

  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Ambient Category Inspector", &__block_literal_global_35130);
  v120[0] = v9;
  id v10 = (void *)MEMORY[0x1E4F940F8];
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_3;
  v108[3] = &unk_1E5F2C248;
  id v94 = v5;
  id v109 = v94;
  v11 = objc_msgSend(v10, "pu_rowWithTitle:action:", @"Ambient People Inspector", v108);
  v120[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:2];
  v100 = [v8 sectionWithRows:v12 title:@"Ambient Wallpaper Inspector"];

  v13 = (void *)MEMORY[0x1E4F94160];
  v14 = (void *)MEMORY[0x1E4F941D8];
  v15 = NSStringFromSelector(sel_fixedAssetDuration);
  v16 = [v14 rowWithTitle:@"Fixed Asset Duration" valueKeyPath:v15];
  v17 = [v16 minValue:1.0 maxValue:120.0];
  v119[0] = v17;
  v18 = (void *)MEMORY[0x1E4F941F0];
  v19 = NSStringFromSelector(sel_disableNUp);
  v20 = [v18 rowWithTitle:@"Disable NUp" valueKeyPath:v19];
  v119[1] = v20;
  v21 = (void *)MEMORY[0x1E4F941F0];
  v22 = NSStringFromSelector(sel_disableLetterAndPillarBoxing);
  v23 = [v21 rowWithTitle:@"Disable Letterboxing & Pillarboxing" valueKeyPath:v22];
  v119[2] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:3];
  v99 = [v13 sectionWithRows:v24 title:@"General"];

  v25 = (void *)MEMORY[0x1E4F94160];
  v26 = (void *)MEMORY[0x1E4F941D8];
  v27 = NSStringFromSelector(sel_kenBurnsPanSpeed);
  v28 = [v26 rowWithTitle:@"Pan Speed (points per second)" valueKeyPath:v27];
  v29 = [v28 minValue:0.0 maxValue:200.0];
  v30 = objc_msgSend(v29, "px_increment:", 1.0);
  v118[0] = v30;
  v31 = (void *)MEMORY[0x1E4F941D8];
  v32 = NSStringFromSelector(sel_kenBurnsScaleSpeed);
  v33 = [v31 rowWithTitle:@"Scale Speed (points per second at furthest edge)" valueKeyPath:v32];
  v34 = [v33 minValue:0.0 maxValue:200.0];
  v35 = objc_msgSend(v34, "px_increment:", 1.0);
  v118[1] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
  v98 = [v25 sectionWithRows:v36 title:@"Ken Burns"];

  v37 = (void *)MEMORY[0x1E4F94160];
  v38 = (void *)MEMORY[0x1E4F941F0];
  v39 = NSStringFromSelector(sel_showFavoriteAlbumAssets);
  v40 = [v38 rowWithTitle:@"Favorite Album" valueKeyPath:v39];
  v117[0] = v40;
  v41 = (void *)MEMORY[0x1E4F941F0];
  v42 = NSStringFromSelector(sel_showCuratedCategories);
  v43 = [v41 rowWithTitle:@"Curated Categories" valueKeyPath:v42];
  v117[1] = v43;
  v44 = (void *)MEMORY[0x1E4F940F8];
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_4;
  v106[3] = &unk_1E5F2C248;
  id v45 = v94;
  id v107 = v45;
  v46 = objc_msgSend(v44, "pu_rowWithTitle:action:", @"Configure Curated Categories", v106);
  v47 = [a1 _enabledCurationCategoriesPredicate];
  v48 = [v46 condition:v47];
  v117[2] = v48;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:3];
  v97 = [v37 sectionWithRows:v49 title:@"Asset Sources"];

  v92 = (void *)MEMORY[0x1E4F94160];
  v50 = (void *)MEMORY[0x1E4F941F0];
  v90 = NSStringFromSelector(sel_includeHighlightAssetsInFeatured);
  v51 = [v50 rowWithTitle:@"Highlight Summary Assets" valueKeyPath:v90];
  v116[0] = v51;
  v52 = (void *)MEMORY[0x1E4F941F0];
  v53 = NSStringFromSelector(sel_includeFeaturedPhotosInFeatured);
  v54 = [v52 rowWithTitle:@"Featured Photos" valueKeyPath:v53];
  v116[1] = v54;
  v55 = (void *)MEMORY[0x1E4F941F0];
  v56 = NSStringFromSelector(sel_forceColdStart);
  v57 = [v55 rowWithTitle:@"Force Cold Start" valueKeyPath:v56];
  v116[2] = v57;
  v58 = (void *)MEMORY[0x1E4F940F8];
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_5;
  v104[3] = &unk_1E5F2C248;
  id v59 = v45;
  id v105 = v59;
  v60 = objc_msgSend(v58, "pu_rowWithTitle:action:", @"Highlight Summary Assets", v104);
  v116[3] = v60;
  v61 = (void *)MEMORY[0x1E4F940F8];
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_6;
  v102[3] = &unk_1E5F2C248;
  id v103 = v59;
  id v95 = v59;
  v62 = objc_msgSend(v61, "pu_rowWithTitle:action:", @"Memory Key Assets", v102);
  v116[4] = v62;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:5];
  v93 = [v92 sectionWithRows:v63 title:@"Featured Content"];

  v64 = (void *)MEMORY[0x1E4F94160];
  v65 = (void *)MEMORY[0x1E4F941F0];
  v66 = NSStringFromSelector(sel_showTapToRadarButton);
  v67 = [v65 rowWithTitle:@"Show Tap To Radar" valueKeyPath:v66];
  v115[0] = v67;
  v68 = (void *)MEMORY[0x1E4F941F0];
  v69 = NSStringFromSelector(sel_includePhotosInRadar);
  v70 = [v68 rowWithTitle:@"Include Photos in Radar" valueKeyPath:v69];
  v115[1] = v70;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
  v91 = [v64 sectionWithRows:v71 title:@"Tap To Radar"];

  v72 = (void *)MEMORY[0x1E4F94160];
  v73 = (void *)MEMORY[0x1E4F940F8];
  v74 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v75 = [v73 rowWithTitle:@"Restore Defaults" action:v74];
  v114 = v75;
  v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
  v89 = [v72 sectionWithRows:v76];

  v77 = (void *)MEMORY[0x1E4F94160];
  v78 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Watch Category Inspector", &__block_literal_global_366_35154);
  v113[0] = v78;
  v79 = [MEMORY[0x1E4F94108] rowWithTitle:@"Model" valueKeyPath:@"watchType"];
  v80 = [v79 possibleValues:&unk_1F078ADC0 titles:&unk_1F078ADD8];
  v113[1] = v80;
  v81 = [MEMORY[0x1E4F94108] rowWithTitle:@"Time Position" valueKeyPath:@"watchTimeConfig"];
  v82 = [v81 possibleValues:&unk_1F078ADF0 titles:&unk_1F078AE08];
  v113[2] = v82;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:3];
  v84 = [v77 sectionWithRows:v83 title:@"Watch Face Inspector"];

  v85 = (void *)MEMORY[0x1E4F94160];
  v112[0] = v101;
  v112[1] = v100;
  v112[2] = v97;
  v112[3] = v93;
  v112[4] = v99;
  v112[5] = v98;
  v112[6] = v91;
  v112[7] = v84;
  v112[8] = v89;
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:9];
  v87 = [v85 moduleWithTitle:@"Ambient Photo Frame" contents:v86];

  return v87;
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[PUAmbientPhotoFramePlayergroundViewController alloc] initWithPhotoLibrary:*(void *)(a1 + 32)];
  [(PUAmbientPhotoFramePlayergroundViewController *)v4 setModalPresentationStyle:5];
  [v3 presentViewController:v4 animated:1 completion:0];
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v7 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:1];
  v4 = [[_TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource alloc] initWithPhotoLibrary:*(void *)(a1 + 32)];
  id v5 = [[PUWallpaperSmartAlbumPeopleDebugViewController alloc] initWithSpec:v7 dataSource:v4];
  id v6 = [v3 navigationController];

  [v6 pushViewController:v5 animated:1];
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = +[PUAmbientPhotoFrameSettings sharedInstance];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F8CD38]) initWithShuffleType:0];
  uint64_t v5 = 0;
  if ([v12 showPeopleCuratedAssets])
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    unint64_t v7 = [v12 personLocalIdentifiers];
    v8 = [v6 setWithArray:v7];
    [v4 setPersonLocalIdentifiers:v8];

    uint64_t v5 = 1;
  }
  if ([v12 showCitiesCuratedAssets]) {
    v5 |= 8uLL;
  }
  if ([v12 showNatureCuratedAssets]) {
    v5 |= 4uLL;
  }
  if ([v12 showPetsCuratedAssets]) {
    v5 |= 2uLL;
  }
  if ([v12 showFeaturedCuratedAssets]) {
    uint64_t v9 = v5 | 0x10;
  }
  else {
    uint64_t v9 = v5;
  }
  [v4 setShuffleSmartAlbums:v9];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F8CCF8]) initWithConfigurationType:1];
  [v10 setShuffleConfiguration:v4];
  v11 = [[_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController alloc] initWithPhotoLibrary:*(void *)(a1 + 32) style:1 posterConfiguration:v10 centerMedia:0 contentMode:1];
  [(PUWallpaperShuffleConfigurationViewController *)v11 setModalPresentationStyle:2];
  [(PUWallpaperShuffleConfigurationViewController *)v11 setDelegate:v12];
  [v3 presentViewController:v11 animated:1 completion:0];
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterCurationViewControllerFactoryClass() ambientHighlightAssetReviewViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [getPUTesterCurationViewControllerFactoryClass() ambientMemoryKeyAssetReviewViewControllerWithPhotoLibrary:*(void *)(a1 + 32)];
  v4 = [v3 navigationController];

  [v4 pushViewController:v5 animated:1];
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v7 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:3];
  id v3 = [PUPassiveContentSummaryViewController alloc];
  v4 = +[PUPassiveContentDataSource watchFaceDataSource];
  id v5 = [(PUPassiveContentSummaryViewController *)v3 initWithSpec:v7 dataSource:v4];

  id v6 = [v2 navigationController];

  [v6 pushViewController:v5 animated:1];
}

void __59__PUAmbientPhotoFrameSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v7 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:2];
  id v3 = [PUPassiveContentSummaryViewController alloc];
  v4 = +[PUPassiveContentDataSource ambientDataSource];
  id v5 = [(PUPassiveContentSummaryViewController *)v3 initWithSpec:v7 dataSource:v4];

  id v6 = [v2 navigationController];

  [v6 pushViewController:v5 animated:1];
}

- (void).cxx_destruct
{
}

- (int64_t)watchTimeConfig
{
  return self->_watchTimeConfig;
}

- (int64_t)watchType
{
  return self->_watchType;
}

- (BOOL)includePhotosInRadar
{
  return self->_includePhotosInRadar;
}

- (BOOL)showTapToRadarButton
{
  return self->_showTapToRadarButton;
}

- (NSArray)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (BOOL)forceColdStart
{
  return self->_forceColdStart;
}

- (BOOL)includeFeaturedPhotosInFeatured
{
  return self->_includeFeaturedPhotosInFeatured;
}

- (BOOL)includeHighlightAssetsInFeatured
{
  return self->_includeHighlightAssetsInFeatured;
}

- (BOOL)showFeaturedCuratedAssets
{
  return self->_showFeaturedCuratedAssets;
}

- (BOOL)showCitiesCuratedAssets
{
  return self->_showCitiesCuratedAssets;
}

- (BOOL)showNatureCuratedAssets
{
  return self->_showNatureCuratedAssets;
}

- (BOOL)showPetsCuratedAssets
{
  return self->_showPetsCuratedAssets;
}

- (BOOL)showPeopleCuratedAssets
{
  return self->_showPeopleCuratedAssets;
}

- (void)setShowCuratedCategories:(BOOL)a3
{
  self->_showCuratedCategories = a3;
}

- (BOOL)showCuratedCategories
{
  return self->_showCuratedCategories;
}

- (BOOL)showFavoriteAlbumAssets
{
  return self->_showFavoriteAlbumAssets;
}

- (double)kenBurnsScaleSpeed
{
  return self->_kenBurnsScaleSpeed;
}

- (double)kenBurnsPanSpeed
{
  return self->_kenBurnsPanSpeed;
}

- (BOOL)disableLetterAndPillarBoxing
{
  return self->_disableLetterAndPillarBoxing;
}

- (BOOL)disableNUp
{
  return self->_disableNUp;
}

- (double)fixedAssetDuration
{
  return self->_fixedAssetDuration;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (PUAmbientPhotoFrameSettings)sharedInstance
{
  if (sharedInstance_onceToken_88418 != -1) {
    dispatch_once(&sharedInstance_onceToken_88418, &__block_literal_global_88419);
  }
  id v2 = (void *)sharedInstance_sharedInstance_88420;
  return (PUAmbientPhotoFrameSettings *)v2;
}

void __45__PUAmbientPhotoFrameSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 ambientPhotoFrameSettings];
  v1 = (void *)sharedInstance_sharedInstance_88420;
  sharedInstance_sharedInstance_88420 = v0;
}

@end