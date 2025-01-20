@interface PUPhotosGridSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)allowDynamicDetailsTitles;
- (BOOL)badgeAllItemsAsFavorites;
- (BOOL)displayAllItemsAsBursts;
- (BOOL)flashDegradedImages;
- (BOOL)forceJPEGThumbnailsInDefaultGrid;
- (BOOL)isSwipeSelectionEnabled;
- (BOOL)shouldExitEditingModeAfterDuplication;
- (BOOL)showTimelineScrubbers;
- (BOOL)simulateGlobalFooterImportantInformationUpdates;
- (BOOL)useFloatingHeaders;
- (double)defaultItemSideSize;
- (double)leftScrubberRate;
- (double)magnifierRevealPreviewScale;
- (double)maximumSpacing;
- (double)minimumDistanceToUnfreeze;
- (double)previewRevealProgressToFreezeMagnifier;
- (double)rightScrubberRate;
- (double)simulatedDetailsAttributesLoadingDelay;
- (id)parentSettings;
- (int64_t)globalFooterVisibility;
- (int64_t)numberColumnsInDefaultGrid;
- (int64_t)numberOfColumnsInWideGrid;
- (void)setAllowDynamicDetailsTitles:(BOOL)a3;
- (void)setBadgeAllItemsAsFavorites:(BOOL)a3;
- (void)setDefaultItemSideSize:(double)a3;
- (void)setDefaultValues;
- (void)setDisplayAllItemsAsBursts:(BOOL)a3;
- (void)setFlashDegradedImages:(BOOL)a3;
- (void)setForceJPEGThumbnailsInDefaultGrid:(BOOL)a3;
- (void)setGlobalFooterVisibility:(int64_t)a3;
- (void)setLeftScrubberRate:(double)a3;
- (void)setMagnifierRevealPreviewScale:(double)a3;
- (void)setMaximumSpacing:(double)a3;
- (void)setMinimumDistanceToUnfreeze:(double)a3;
- (void)setNumberColumnsInDefaultGrid:(int64_t)a3;
- (void)setNumberOfColumnsInWideGrid:(int64_t)a3;
- (void)setPreviewRevealProgressToFreezeMagnifier:(double)a3;
- (void)setRightScrubberRate:(double)a3;
- (void)setShouldExitEditingModeAfterDuplication:(BOOL)a3;
- (void)setShowTimelineScrubbers:(BOOL)a3;
- (void)setSimulateGlobalFooterImportantInformationUpdates:(BOOL)a3;
- (void)setSimulatedDetailsAttributesLoadingDelay:(double)a3;
- (void)setSwipeSelectionEnabled:(BOOL)a3;
- (void)setUseFloatingHeaders:(BOOL)a3;
@end

@implementation PUPhotosGridSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotosGridSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUPhotosGridSettings *)self setDefaultItemSideSize:132.0];
  [(PUPhotosGridSettings *)self setMaximumSpacing:20.0];
  [(PUPhotosGridSettings *)self setBadgeAllItemsAsFavorites:0];
  [(PUPhotosGridSettings *)self setDisplayAllItemsAsBursts:0];
  [(PUPhotosGridSettings *)self setAllowDynamicDetailsTitles:1];
  [(PUPhotosGridSettings *)self setSimulatedDetailsAttributesLoadingDelay:0.0];
  [(PUPhotosGridSettings *)self setForceJPEGThumbnailsInDefaultGrid:1];
  [(PUPhotosGridSettings *)self setNumberColumnsInDefaultGrid:4];
  [(PUPhotosGridSettings *)self setNumberOfColumnsInWideGrid:5];
  [(PUPhotosGridSettings *)self setFlashDegradedImages:0];
  [(PUPhotosGridSettings *)self setUseFloatingHeaders:1];
  [(PUPhotosGridSettings *)self setSwipeSelectionEnabled:1];
  [(PUPhotosGridSettings *)self setPreviewRevealProgressToFreezeMagnifier:0.400000006];
  [(PUPhotosGridSettings *)self setMagnifierRevealPreviewScale:1.75];
  [(PUPhotosGridSettings *)self setMinimumDistanceToUnfreeze:20.0];
  [(PUPhotosGridSettings *)self setShouldExitEditingModeAfterDuplication:1];
  [(PUPhotosGridSettings *)self setShowTimelineScrubbers:0];
  [(PUPhotosGridSettings *)self setLeftScrubberRate:10.0];
  [(PUPhotosGridSettings *)self setRightScrubberRate:5.0];
  [(PUPhotosGridSettings *)self setGlobalFooterVisibility:0];
  [(PUPhotosGridSettings *)self setSimulateGlobalFooterImportantInformationUpdates:0];
}

- (void)setUseFloatingHeaders:(BOOL)a3
{
  self->_useFloatingHeaders = a3;
}

- (void)setSwipeSelectionEnabled:(BOOL)a3
{
  self->_swipeSelectionEnabled = a3;
}

- (void)setSimulatedDetailsAttributesLoadingDelay:(double)a3
{
  self->_simulatedDetailsAttributesLoadingDelay = a3;
}

- (void)setSimulateGlobalFooterImportantInformationUpdates:(BOOL)a3
{
  self->_simulateGlobalFooterImportantInformationUpdates = a3;
}

- (void)setShowTimelineScrubbers:(BOOL)a3
{
  self->_showTimelineScrubbers = a3;
}

- (void)setShouldExitEditingModeAfterDuplication:(BOOL)a3
{
  self->_shouldExitEditingModeAfterDuplication = a3;
}

- (void)setRightScrubberRate:(double)a3
{
  self->_rightScrubberRate = a3;
}

- (void)setPreviewRevealProgressToFreezeMagnifier:(double)a3
{
  self->_previewRevealProgressToFreezeMagnifier = a3;
}

- (void)setNumberOfColumnsInWideGrid:(int64_t)a3
{
  self->_numberOfColumnsInWideGrid = a3;
}

- (void)setNumberColumnsInDefaultGrid:(int64_t)a3
{
  self->_numberColumnsInDefaultGrid = a3;
}

- (void)setMinimumDistanceToUnfreeze:(double)a3
{
  self->_minimumDistanceToUnfreeze = a3;
}

- (void)setMaximumSpacing:(double)a3
{
  self->_maximumSpacing = a3;
}

- (void)setMagnifierRevealPreviewScale:(double)a3
{
  self->_magnifierRevealPreviewScale = a3;
}

- (void)setLeftScrubberRate:(double)a3
{
  self->_leftScrubberRate = a3;
}

- (void)setGlobalFooterVisibility:(int64_t)a3
{
  self->_globalFooterVisibility = a3;
}

- (void)setForceJPEGThumbnailsInDefaultGrid:(BOOL)a3
{
  self->_forceJPEGThumbnailsInDefaultGrid = a3;
}

- (void)setFlashDegradedImages:(BOOL)a3
{
  self->_flashDegradedImages = a3;
}

- (void)setDisplayAllItemsAsBursts:(BOOL)a3
{
  self->_displayAllItemsAsBursts = a3;
}

- (void)setDefaultItemSideSize:(double)a3
{
  self->_defaultItemSideSize = a3;
}

- (void)setBadgeAllItemsAsFavorites:(BOOL)a3
{
  self->_badgeAllItemsAsFavorites = a3;
}

- (void)setAllowDynamicDetailsTitles:(BOOL)a3
{
  self->_allowDynamicDetailsTitles = a3;
}

- (BOOL)simulateGlobalFooterImportantInformationUpdates
{
  return self->_simulateGlobalFooterImportantInformationUpdates;
}

- (int64_t)globalFooterVisibility
{
  return self->_globalFooterVisibility;
}

- (double)rightScrubberRate
{
  return self->_rightScrubberRate;
}

- (double)leftScrubberRate
{
  return self->_leftScrubberRate;
}

- (BOOL)showTimelineScrubbers
{
  return self->_showTimelineScrubbers;
}

- (BOOL)shouldExitEditingModeAfterDuplication
{
  return self->_shouldExitEditingModeAfterDuplication;
}

- (double)minimumDistanceToUnfreeze
{
  return self->_minimumDistanceToUnfreeze;
}

- (double)previewRevealProgressToFreezeMagnifier
{
  return self->_previewRevealProgressToFreezeMagnifier;
}

- (double)magnifierRevealPreviewScale
{
  return self->_magnifierRevealPreviewScale;
}

- (BOOL)isSwipeSelectionEnabled
{
  return self->_swipeSelectionEnabled;
}

- (BOOL)useFloatingHeaders
{
  return self->_useFloatingHeaders;
}

- (BOOL)flashDegradedImages
{
  return self->_flashDegradedImages;
}

- (int64_t)numberOfColumnsInWideGrid
{
  return self->_numberOfColumnsInWideGrid;
}

- (int64_t)numberColumnsInDefaultGrid
{
  return self->_numberColumnsInDefaultGrid;
}

- (BOOL)forceJPEGThumbnailsInDefaultGrid
{
  return self->_forceJPEGThumbnailsInDefaultGrid;
}

- (double)simulatedDetailsAttributesLoadingDelay
{
  return self->_simulatedDetailsAttributesLoadingDelay;
}

- (BOOL)allowDynamicDetailsTitles
{
  return self->_allowDynamicDetailsTitles;
}

- (BOOL)displayAllItemsAsBursts
{
  return self->_displayAllItemsAsBursts;
}

- (BOOL)badgeAllItemsAsFavorites
{
  return self->_badgeAllItemsAsFavorites;
}

- (double)maximumSpacing
{
  return self->_maximumSpacing;
}

- (double)defaultItemSideSize
{
  return self->_defaultItemSideSize;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v89[12] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  v79 = [MEMORY[0x1E4F28F60] predicateWithValue:(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  PLPhysicalScreenScale();
  v77 = (void *)MEMORY[0x1E4F94160];
  double v5 = 1.0 / v4;
  v75 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Swipe Selection" valueKeyPath:@"swipeSelectionEnabled"];
  v89[0] = v75;
  v73 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Fake All Videos" valueKeyPath:@"badgeAllItemsAsFavorites"];
  v89[1] = v73;
  v71 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Fake All Bursts" valueKeyPath:@"displayAllItemsAsBursts"];
  v89[2] = v71;
  v69 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Dynamic Details Titles" valueKeyPath:@"allowDynamicDetailsTitles"];
  v89[3] = v69;
  v67 = [MEMORY[0x1E4F94108] rowWithTitle:@"Fake Title/Subtitle Delay" valueKeyPath:@"simulatedDetailsAttributesLoadingDelay"];
  v65 = objc_msgSend(v67, "pu_possibleValues:", &unk_1F078B348);
  v64 = [v65 conditionFormat:@"allowDynamicDetailsTitles != 0"];
  v89[4] = v64;
  v63 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Flash Degraded Images" valueKeyPath:@"flashDegradedImages"];
  v89[5] = v63;
  v62 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Magnifier Reveal Preview Scale" valueKeyPath:@"magnifierRevealPreviewScale"];
  v61 = [v62 minValue:0.0 maxValue:20.0];
  v60 = objc_msgSend(v61, "pu_increment:", 0.00999999978);
  v89[6] = v60;
  v59 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Freeze Magnifier at Reveal Progress" valueKeyPath:@"previewRevealProgressToFreezeMagnifier"];
  v6 = [v59 minValue:0.0 maxValue:1.0];
  v7 = objc_msgSend(v6, "pu_increment:", 0.00999999978);
  v89[7] = v7;
  v8 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Unfreeze Minimum Distance" valueKeyPath:@"minimumDistanceToUnfreeze"];
  v9 = [v8 minValue:0.0 maxValue:500.0];
  v10 = objc_msgSend(v9, "pu_increment:", 1.0);
  v89[8] = v10;
  v11 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Exit Selection After Duplication" valueKeyPath:@"shouldExitEditingModeAfterDuplication"];
  v89[9] = v11;
  v12 = [MEMORY[0x1E4F94108] rowWithTitle:@"Footer Visibility" valueKeyPath:@"globalFooterVisibility"];
  v13 = [v12 possibleValues:&unk_1F078B360 titles:&unk_1F078B378];
  v89[10] = v13;
  v14 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate Footer Updates" valueKeyPath:@"simulateGlobalFooterImportantInformationUpdates"];
  v89[11] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:12];
  v78 = [v77 sectionWithRows:v15 title:@"Grid Settings"];

  v16 = (void *)MEMORY[0x1E4F94160];
  v17 = [MEMORY[0x1E4F941F0] rowWithTitle:@"JPEG Thumbnails" valueKeyPath:@"forceJPEGThumbnailsInDefaultGrid"];
  v88[0] = v17;
  v18 = [MEMORY[0x1E4F94108] rowWithTitle:@"Columns" valueKeyPath:@"numberColumnsInDefaultGrid"];
  v19 = [v18 possibleValues:&unk_1F078B390 titles:&unk_1F078B3A8];
  v88[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
  v21 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v79];
  v76 = [v16 sectionWithRows:v20 title:@"iPhone Grid" condition:v21];

  v22 = (void *)MEMORY[0x1E4F94160];
  v23 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Default Side Size" valueKeyPath:@"defaultItemSideSize"];
  v24 = [v23 minValue:50.0 maxValue:200.0];
  v25 = objc_msgSend(v24, "pu_increment:", v5);
  v87[0] = v25;
  v26 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Maximum Spacing" valueKeyPath:@"maximumSpacing"];
  v27 = [v26 minValue:0.0 maxValue:100.0];
  v28 = objc_msgSend(v27, "pu_increment:", v5);
  v87[1] = v28;
  v29 = [MEMORY[0x1E4F94108] rowWithTitle:@"Columns at half size" valueKeyPath:@"numberOfColumnsInWideGrid"];
  v30 = [v29 possibleValues:&unk_1F078B3C0 titles:&unk_1F078B3D8];
  v87[2] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
  v74 = [v22 sectionWithRows:v31 title:@"iPad Grid Layout" condition:v79];

  v32 = (void *)MEMORY[0x1E4F94160];
  v33 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show scrubbers" valueKeyPath:@"showTimelineScrubbers"];
  v86[0] = v33;
  v34 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Left scrubber rate" valueKeyPath:@"leftScrubberRate"];
  v35 = [v34 minValue:1.0 maxValue:50.0];
  v86[1] = v35;
  v36 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Right scrubber rate" valueKeyPath:@"rightScrubberRate"];
  v37 = [v36 minValue:1.0 maxValue:50.0];
  v86[2] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];
  v72 = [v32 sectionWithRows:v38 title:@"Timeline scrubbers"];

  v39 = (void *)MEMORY[0x1E4F94160];
  v40 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Floating Headers" valueKeyPath:@"useFloatingHeaders"];
  v85 = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  v70 = [v39 sectionWithRows:v41 title:@"Relaunch Photos After Changing These Settings"];

  v42 = (void *)MEMORY[0x1E4F94160];
  v43 = (void *)MEMORY[0x1E4F940F8];
  v44 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v45 = [v43 rowWithTitle:@"Restore Defaults" action:v44];
  v84 = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
  v68 = [v42 sectionWithRows:v46];

  id v47 = objc_alloc(MEMORY[0x1E4F8ACA0]);
  v48 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  v49 = (void *)[v47 initWithPhotoLibrary:v48];

  v50 = (void *)MEMORY[0x1E4F94160];
  v51 = (void *)MEMORY[0x1E4F940F8];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __48__PUPhotosGridSettings_settingsControllerModule__block_invoke;
  v80[3] = &unk_1E5F2BE60;
  id v81 = v49;
  id v66 = v49;
  v52 = objc_msgSend(v51, "pu_rowWithTitle:output:", @"Localized Warnings", v80);
  v83 = v52;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v54 = [v50 sectionWithRows:v53 title:@"Debug"];

  v55 = (void *)MEMORY[0x1E4F94160];
  v82[0] = v78;
  v82[1] = v76;
  v82[2] = v74;
  v82[3] = v72;
  v82[4] = v70;
  v82[5] = v68;
  v82[6] = v54;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:7];
  v57 = [v55 moduleWithTitle:@"Photos Grid" contents:v56];

  return v57;
}

uint64_t __48__PUPhotosGridSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) allWarningMessageCombinations];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_68009 != -1) {
    dispatch_once(&sharedInstance_onceToken_68009, &__block_literal_global_68010);
  }
  v2 = (void *)sharedInstance_sharedInstance_68011;
  return v2;
}

void __38__PUPhotosGridSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 photosGridSettings];
  v1 = (void *)sharedInstance_sharedInstance_68011;
  sharedInstance_sharedInstance_68011 = v0;
}

@end