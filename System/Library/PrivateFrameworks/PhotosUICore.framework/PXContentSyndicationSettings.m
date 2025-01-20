@interface PXContentSyndicationSettings
+ (PXContentSyndicationSettings)sharedInstance;
+ (id)_createDataSourceSection;
+ (id)settingsControllerModule;
- (BOOL)alwaysLeadingAlignAttributionViewOnRegularWidthPads;
- (BOOL)contentSyndicationEnabled;
- (BOOL)delayLoadingActualDataSourceUntilAfterLaunch;
- (BOOL)enableFilteringCuratedGridsForContentSyndication;
- (BOOL)enableStackAspectRatio;
- (BOOL)enableStackSmartCrop;
- (BOOL)ignoreSocialLayerEnablement;
- (BOOL)loadVerySmallInitialBatchOfRecentCollections;
- (BOOL)mockNumberOfAssetsSaved;
- (BOOL)preventActualRemoveSuggestionBehavior;
- (BOOL)preventActualSaveToLibraryBehavior;
- (BOOL)shouldHorizontallyCenterAttributionViewInGrid;
- (BOOL)shouldMockChallengeQuestions;
- (BOOL)showContentSyndicationInSystemPhotoLibraryOnly;
- (BOOL)showSidebarItemEvenIfNoSyndicatedContentAvailable;
- (BOOL)showSyndicated1upPillUI;
- (BOOL)showSyndicatedContentInLibrary;
- (BOOL)showSyndicatedContentWidgetForGuestAssets;
- (BOOL)showSyndicatedContentWidgetForSavedAssets;
- (BOOL)treatEveryAssetAsGuest;
- (BOOL)useRandomStatusForReview;
- (BOOL)useSystemLibraryForReview;
- (BOOL)useUserLibraryForSyndicatedAssets;
- (BOOL)waitForAndLogAssetArrivalWhenSaving;
- (NSString)libraryStateBriefDescription;
- (UIImage)libraryStateImage;
- (double)blackOverlayForFirstThumbnail;
- (double)blackOverlayForSecondThumbnail;
- (double)blackOverlayForThirdThumbnail;
- (id)parentSettings;
- (int64_t)dataSourceType;
- (int64_t)footerMockType;
- (int64_t)itemCellBlurStyle;
- (int64_t)reviewScope;
- (int64_t)savedAssetViewVisibility;
- (int64_t)syndicated1upPillAlignment;
- (unint64_t)maxNumberOfAssetsPerBatch;
- (unint64_t)maxNumberOfBatches;
- (unint64_t)numberOfMinutesToShowPillUIAfterSaving;
- (unsigned)reviewProcessingValuesScope;
- (void)setAlwaysLeadingAlignAttributionViewOnRegularWidthPads:(BOOL)a3;
- (void)setBlackOverlayForFirstThumbnail:(double)a3;
- (void)setBlackOverlayForSecondThumbnail:(double)a3;
- (void)setBlackOverlayForThirdThumbnail:(double)a3;
- (void)setContentSyndicationEnabled:(BOOL)a3;
- (void)setDataSourceType:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDelayLoadingActualDataSourceUntilAfterLaunch:(BOOL)a3;
- (void)setEnableFilteringCuratedGridsForContentSyndication:(BOOL)a3;
- (void)setEnableStackAspectRatio:(BOOL)a3;
- (void)setEnableStackSmartCrop:(BOOL)a3;
- (void)setFooterMockType:(int64_t)a3;
- (void)setIgnoreSocialLayerEnablement:(BOOL)a3;
- (void)setItemCellBlurStyle:(int64_t)a3;
- (void)setLibraryStateBriefDescription:(id)a3;
- (void)setLibraryStateImage:(id)a3;
- (void)setLoadVerySmallInitialBatchOfRecentCollections:(BOOL)a3;
- (void)setMaxNumberOfAssetsPerBatch:(unint64_t)a3;
- (void)setMaxNumberOfBatches:(unint64_t)a3;
- (void)setMockNumberOfAssetsSaved:(BOOL)a3;
- (void)setNumberOfMinutesToShowPillUIAfterSaving:(unint64_t)a3;
- (void)setPreventActualRemoveSuggestionBehavior:(BOOL)a3;
- (void)setPreventActualSaveToLibraryBehavior:(BOOL)a3;
- (void)setReviewProcessingValuesScope:(unsigned __int16)a3;
- (void)setReviewScope:(int64_t)a3;
- (void)setSavedAssetViewVisibility:(int64_t)a3;
- (void)setShouldHorizontallyCenterAttributionViewInGrid:(BOOL)a3;
- (void)setShouldMockChallengeQuestions:(BOOL)a3;
- (void)setShowContentSyndicationInSystemPhotoLibraryOnly:(BOOL)a3;
- (void)setShowSidebarItemEvenIfNoSyndicatedContentAvailable:(BOOL)a3;
- (void)setShowSyndicated1upPillUI:(BOOL)a3;
- (void)setShowSyndicatedContentInLibrary:(BOOL)a3;
- (void)setShowSyndicatedContentWidgetForGuestAssets:(BOOL)a3;
- (void)setShowSyndicatedContentWidgetForSavedAssets:(BOOL)a3;
- (void)setSyndicated1upPillAlignment:(int64_t)a3;
- (void)setTreatEveryAssetAsGuest:(BOOL)a3;
- (void)setUseRandomStatusForReview:(BOOL)a3;
- (void)setUseSystemLibraryForReview:(BOOL)a3;
- (void)setUseUserLibraryForSyndicatedAssets:(BOOL)a3;
- (void)setWaitForAndLogAssetArrivalWhenSaving:(BOOL)a3;
@end

@implementation PXContentSyndicationSettings

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

+ (PXContentSyndicationSettings)sharedInstance
{
  if (sharedInstance_onceToken_208777 != -1) {
    dispatch_once(&sharedInstance_onceToken_208777, &__block_literal_global_208778);
  }
  v2 = (void *)sharedInstance_sharedInstance_208779;
  return (PXContentSyndicationSettings *)v2;
}

- (BOOL)treatEveryAssetAsGuest
{
  return self->_treatEveryAssetAsGuest;
}

- (BOOL)delayLoadingActualDataSourceUntilAfterLaunch
{
  return self->_delayLoadingActualDataSourceUntilAfterLaunch;
}

- (BOOL)enableFilteringCuratedGridsForContentSyndication
{
  return self->_enableFilteringCuratedGridsForContentSyndication;
}

- (BOOL)ignoreSocialLayerEnablement
{
  return self->_ignoreSocialLayerEnablement;
}

- (BOOL)contentSyndicationEnabled
{
  return self->_contentSyndicationEnabled;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXContentSyndicationSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXContentSyndicationSettings *)self setContentSyndicationEnabled:1];
  [(PXContentSyndicationSettings *)self setIgnoreSocialLayerEnablement:0];
  [(PXContentSyndicationSettings *)self setShowSidebarItemEvenIfNoSyndicatedContentAvailable:0];
  [(PXContentSyndicationSettings *)self setShouldMockChallengeQuestions:0];
  [(PXContentSyndicationSettings *)self setShowSyndicatedContentInLibrary:1];
  [(PXContentSyndicationSettings *)self setEnableFilteringCuratedGridsForContentSyndication:0];
  [(PXContentSyndicationSettings *)self setShowContentSyndicationInSystemPhotoLibraryOnly:1];
  [(PXContentSyndicationSettings *)self setDataSourceType:0];
  [(PXContentSyndicationSettings *)self setUseUserLibraryForSyndicatedAssets:0];
  [(PXContentSyndicationSettings *)self setMaxNumberOfBatches:50];
  [(PXContentSyndicationSettings *)self setMaxNumberOfAssetsPerBatch:50];
  [(PXContentSyndicationSettings *)self setDelayLoadingActualDataSourceUntilAfterLaunch:1];
  [(PXContentSyndicationSettings *)self setLoadVerySmallInitialBatchOfRecentCollections:1];
  [(PXContentSyndicationSettings *)self setBlackOverlayForFirstThumbnail:0.0299999993];
  [(PXContentSyndicationSettings *)self setBlackOverlayForSecondThumbnail:0.119999997];
  [(PXContentSyndicationSettings *)self setBlackOverlayForThirdThumbnail:0.25];
  [(PXContentSyndicationSettings *)self setItemCellBlurStyle:0];
  [(PXContentSyndicationSettings *)self setShouldHorizontallyCenterAttributionViewInGrid:1];
  [(PXContentSyndicationSettings *)self setAlwaysLeadingAlignAttributionViewOnRegularWidthPads:1];
  [(PXContentSyndicationSettings *)self setShowSyndicatedContentWidgetForSavedAssets:1];
  [(PXContentSyndicationSettings *)self setShowSyndicatedContentWidgetForGuestAssets:1];
  [(PXContentSyndicationSettings *)self setShowSyndicated1upPillUI:1];
  [(PXContentSyndicationSettings *)self setSyndicated1upPillAlignment:0];
  [(PXContentSyndicationSettings *)self setSavedAssetViewVisibility:2];
  [(PXContentSyndicationSettings *)self setNumberOfMinutesToShowPillUIAfterSaving:43200];
  [(PXContentSyndicationSettings *)self setPreventActualSaveToLibraryBehavior:0];
  [(PXContentSyndicationSettings *)self setPreventActualRemoveSuggestionBehavior:0];
  [(PXContentSyndicationSettings *)self setTreatEveryAssetAsGuest:0];
  [(PXContentSyndicationSettings *)self setEnableStackAspectRatio:0];
  [(PXContentSyndicationSettings *)self setEnableStackSmartCrop:0];
  [(PXContentSyndicationSettings *)self setUseSystemLibraryForReview:0];
  [(PXContentSyndicationSettings *)self setUseRandomStatusForReview:0];
  [(PXContentSyndicationSettings *)self setReviewScope:1];
  [(PXContentSyndicationSettings *)self setReviewProcessingValuesScope:32496];
  [(PXContentSyndicationSettings *)self setMockNumberOfAssetsSaved:0];
  [(PXContentSyndicationSettings *)self setFooterMockType:1];
  [(PXContentSyndicationSettings *)self setWaitForAndLogAssetArrivalWhenSaving:0];
}

- (void)setWaitForAndLogAssetArrivalWhenSaving:(BOOL)a3
{
  self->_waitForAndLogAssetArrivalWhenSaving = a3;
}

- (void)setUseUserLibraryForSyndicatedAssets:(BOOL)a3
{
  self->_useUserLibraryForSyndicatedAssets = a3;
}

- (void)setUseSystemLibraryForReview:(BOOL)a3
{
  self->_useSystemLibraryForReview = a3;
}

- (void)setUseRandomStatusForReview:(BOOL)a3
{
  self->_useRandomStatusForReview = a3;
}

- (void)setTreatEveryAssetAsGuest:(BOOL)a3
{
  self->_treatEveryAssetAsGuest = a3;
}

- (void)setSyndicated1upPillAlignment:(int64_t)a3
{
  self->_syndicated1upPillAlignment = a3;
}

- (void)setShowSyndicatedContentWidgetForSavedAssets:(BOOL)a3
{
  self->_showSyndicatedContentWidgetForSavedAssets = a3;
}

- (void)setShowSyndicatedContentWidgetForGuestAssets:(BOOL)a3
{
  self->_showSyndicatedContentWidgetForGuestAssets = a3;
}

- (void)setShowSyndicatedContentInLibrary:(BOOL)a3
{
  self->_showSyndicatedContentInLibrary = a3;
}

- (void)setShowSyndicated1upPillUI:(BOOL)a3
{
  self->_showSyndicated1upPillUI = a3;
}

- (void)setShowSidebarItemEvenIfNoSyndicatedContentAvailable:(BOOL)a3
{
  self->_showSidebarItemEvenIfNoSyndicatedContentAvailable = a3;
}

- (void)setShowContentSyndicationInSystemPhotoLibraryOnly:(BOOL)a3
{
  self->_showContentSyndicationInSystemPhotoLibraryOnly = a3;
}

- (void)setShouldMockChallengeQuestions:(BOOL)a3
{
  self->_shouldMockChallengeQuestions = a3;
}

- (void)setShouldHorizontallyCenterAttributionViewInGrid:(BOOL)a3
{
  self->_shouldHorizontallyCenterAttributionViewInGrid = a3;
}

- (void)setSavedAssetViewVisibility:(int64_t)a3
{
  self->_savedAssetViewVisibility = a3;
}

- (void)setReviewScope:(int64_t)a3
{
  self->_reviewScope = a3;
}

- (void)setReviewProcessingValuesScope:(unsigned __int16)a3
{
  self->_reviewProcessingValuesScope = a3;
}

- (void)setPreventActualSaveToLibraryBehavior:(BOOL)a3
{
  self->_preventActualSaveToLibraryBehavior = a3;
}

- (void)setPreventActualRemoveSuggestionBehavior:(BOOL)a3
{
  self->_preventActualRemoveSuggestionBehavior = a3;
}

- (void)setNumberOfMinutesToShowPillUIAfterSaving:(unint64_t)a3
{
  self->_numberOfMinutesToShowPillUIAfterSaving = a3;
}

- (void)setMockNumberOfAssetsSaved:(BOOL)a3
{
  self->_mockNumberOfAssetsSaved = a3;
}

- (void)setMaxNumberOfBatches:(unint64_t)a3
{
  self->_maxNumberOfBatches = a3;
}

- (void)setMaxNumberOfAssetsPerBatch:(unint64_t)a3
{
  self->_maxNumberOfAssetsPerBatch = a3;
}

- (void)setLoadVerySmallInitialBatchOfRecentCollections:(BOOL)a3
{
  self->_loadVerySmallInitialBatchOfRecentCollections = a3;
}

- (void)setItemCellBlurStyle:(int64_t)a3
{
  self->_itemCellBlurStyle = a3;
}

- (void)setIgnoreSocialLayerEnablement:(BOOL)a3
{
  self->_ignoreSocialLayerEnablement = a3;
}

- (void)setFooterMockType:(int64_t)a3
{
  self->_footerMockType = a3;
}

- (void)setEnableStackSmartCrop:(BOOL)a3
{
  self->_enableStackSmartCrop = a3;
}

- (void)setEnableStackAspectRatio:(BOOL)a3
{
  self->_enableStackAspectRatio = a3;
}

- (void)setEnableFilteringCuratedGridsForContentSyndication:(BOOL)a3
{
  self->_enableFilteringCuratedGridsForContentSyndication = a3;
}

- (void)setDelayLoadingActualDataSourceUntilAfterLaunch:(BOOL)a3
{
  self->_delayLoadingActualDataSourceUntilAfterLaunch = a3;
}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (void)setContentSyndicationEnabled:(BOOL)a3
{
  self->_contentSyndicationEnabled = a3;
}

- (void)setBlackOverlayForThirdThumbnail:(double)a3
{
  self->_blackOverlayForThirdThumbnail = a3;
}

- (void)setBlackOverlayForSecondThumbnail:(double)a3
{
  self->_blackOverlayForSecondThumbnail = a3;
}

- (void)setBlackOverlayForFirstThumbnail:(double)a3
{
  self->_blackOverlayForFirstThumbnail = a3;
}

- (void)setAlwaysLeadingAlignAttributionViewOnRegularWidthPads:(BOOL)a3
{
  self->_alwaysLeadingAlignAttributionViewOnRegularWidthPads = a3;
}

void __46__PXContentSyndicationSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 contentSyndicationSettings];
  v1 = (void *)sharedInstance_sharedInstance_208779;
  sharedInstance_sharedInstance_208779 = v0;
}

+ (id)_createDataSourceSection
{
  v29[6] = *MEMORY[0x1E4F143B8];
  id v22 = (id)MEMORY[0x1E4F941A8];
  id v2 = (void *)MEMORY[0x1E4F941C0];
  v28 = NSStringFromSelector(sel_useUserLibraryForSyndicatedAssets);
  v27 = [v2 rowWithTitle:@"🔄 User Library For Syndicated Assets" valueKeyPath:v28];
  v29[0] = v27;
  objc_super v3 = (void *)MEMORY[0x1E4F941A0];
  v26 = NSStringFromSelector(sel_dataSourceType);
  v25 = [v3 rowWithTitle:@"Data Source Type" valueKeyPath:v26];
  v24 = [v25 possibleValues:&unk_1F02D3A00 titles:&unk_1F02D3A18];
  v29[1] = v24;
  v4 = (void *)MEMORY[0x1E4F941D8];
  v21 = NSStringFromSelector(sel_maxNumberOfBatches);
  v20 = [v4 rowWithTitle:@"🔄 Max Batches" valueKeyPath:v21];
  v19 = [v20 minValue:1.0 maxValue:50.0];
  v5 = objc_msgSend(v19, "px_increment:", 1.0);
  v29[2] = v5;
  v6 = (void *)MEMORY[0x1E4F941D8];
  v7 = NSStringFromSelector(sel_maxNumberOfAssetsPerBatch);
  v8 = [v6 rowWithTitle:@"🔄 Max Assets Per Batch" valueKeyPath:v7];
  v9 = [v8 minValue:1.0 maxValue:50.0];
  v10 = objc_msgSend(v9, "px_increment:", 1.0);
  v29[3] = v10;
  v11 = (void *)MEMORY[0x1E4F941C0];
  v12 = NSStringFromSelector(sel_delayLoadingActualDataSourceUntilAfterLaunch);
  v13 = [v11 rowWithTitle:@"Perf: Delay data source manager at launch" valueKeyPath:v12];
  v29[4] = v13;
  v14 = (void *)MEMORY[0x1E4F941C0];
  v15 = NSStringFromSelector(sel_loadVerySmallInitialBatchOfRecentCollections);
  v16 = [v14 rowWithTitle:@"Perf: Load initial small batch" valueKeyPath:v15];
  v29[5] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];
  [v22 sectionWithRows:v17 title:@"Shared With You" conditionFormat:@"contentSyndicationEnabled != 0"];
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)settingsControllerModule
{
  v205[5] = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4FA5658] isEnabled];
  v187 = (void *)MEMORY[0x1E4F941A8];
  objc_super v3 = (void *)MEMORY[0x1E4F940F8];
  v4 = NSString;
  v5 = @"NO";
  if (v2) {
    v5 = @"YES";
  }
  v185 = v5;
  v182 = [v4 stringWithFormat:@"Messages->Shared With You on: %@", v185];
  v179 = objc_msgSend(v3, "px_rowWithTitle:action:", v182, &__block_literal_global_52925);
  v205[0] = v179;
  v6 = (void *)MEMORY[0x1E4F941F0];
  v7 = NSStringFromSelector(sel_contentSyndicationEnabled);
  v8 = [v6 rowWithTitle:@"Syndication UI Enabled" valueKeyPath:v7];
  v205[1] = v8;
  v9 = (void *)MEMORY[0x1E4F941F0];
  v10 = NSStringFromSelector(sel_ignoreSocialLayerEnablement);
  v11 = [v9 rowWithTitle:@"Ignore Shared With You enablement" valueKeyPath:v10];
  v205[2] = v11;
  v12 = (void *)MEMORY[0x1E4F941F0];
  v13 = NSStringFromSelector(sel_showSyndicatedContentInLibrary);
  v14 = [v12 rowWithTitle:@"Show Content in Library Tab" valueKeyPath:v13];
  v15 = [v14 conditionFormat:@"contentSyndicationEnabled != 0"];
  v205[3] = v15;
  v16 = (void *)MEMORY[0x1E4F941F0];
  v17 = NSStringFromSelector(sel_enableFilteringCuratedGridsForContentSyndication);
  v18 = [v16 rowWithTitle:@"Filter curated grids, if disabled", v17 valueKeyPath];
  v205[4] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v205 count:5];
  v188 = [v187 sectionWithRows:v19 title:@"General"];

  uint64_t v20 = +[PXContentSyndicationSettings _createDataSourceSection];
  v183 = (void *)MEMORY[0x1E4F941A8];
  v186 = (void *)v20;
  v21 = (void *)MEMORY[0x1E4F941D8];
  v180 = NSStringFromSelector(sel_blackOverlayForFirstThumbnail);
  v176 = [v21 rowWithTitle:@"🔄 Img #1 dark %" valueKeyPath:v180];
  v173 = [v176 minValue:0.0 maxValue:1.0];
  v170 = objc_msgSend(v173, "px_increment:", 0.01);
  v204[0] = v170;
  id v22 = (void *)MEMORY[0x1E4F941D8];
  v166 = NSStringFromSelector(sel_blackOverlayForSecondThumbnail);
  v162 = [v22 rowWithTitle:@"🔄 Img #2 dark %" valueKeyPath:v166];
  id v23 = [v162 minValue:0.0 maxValue:1.0];
  v24 = objc_msgSend(v23, "px_increment:", 0.01);
  v204[1] = v24;
  v25 = (void *)MEMORY[0x1E4F941D8];
  v26 = NSStringFromSelector(sel_blackOverlayForThirdThumbnail);
  v27 = [v25 rowWithTitle:@"🔄 Img #3 dark %" valueKeyPath:v26];
  v28 = [v27 minValue:0.0 maxValue:1.0];
  v29 = objc_msgSend(v28, "px_increment:", 0.01);
  v204[2] = v29;
  v30 = (void *)MEMORY[0x1E4F941A0];
  v31 = NSStringFromSelector(sel_itemCellBlurStyle);
  v32 = [v30 rowWithTitle:@"🔄 Blur Style" valueKeyPath:v31];
  v33 = [v32 possibleValues:&unk_1F02D3910 titles:&unk_1F02D3928];
  v204[3] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v204 count:4];
  v184 = [v183 sectionWithRows:v34 title:@"Syndication Cells" conditionFormat:@"contentSyndicationEnabled != 0"];

  v35 = (void *)MEMORY[0x1E4F941A8];
  v36 = (void *)MEMORY[0x1E4F941F0];
  v37 = NSStringFromSelector(sel_shouldHorizontallyCenterAttributionViewInGrid);
  v38 = [v36 rowWithTitle:@"Center micro-pill horizontally" valueKeyPath:v37];
  v203[0] = v38;
  v39 = (void *)MEMORY[0x1E4F941F0];
  v40 = NSStringFromSelector(sel_alwaysLeadingAlignAttributionViewOnRegularWidthPads);
  v41 = [v39 rowWithTitle:@"iPad: Leading-align pill on regular widths" valueKeyPath:v40];
  v203[1] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v203 count:2];
  v181 = [v35 sectionWithRows:v42 title:@"Syndication Grids" conditionFormat:@"contentSyndicationEnabled != 0"];

  v177 = (void *)MEMORY[0x1E4F941A8];
  v43 = (void *)MEMORY[0x1E4F941C0];
  v174 = NSStringFromSelector(sel_showSyndicatedContentWidgetForSavedAssets);
  v171 = [v43 rowWithTitle:@"Show 1up Widget for saved assets" valueKeyPath:v174];
  v167 = [v171 conditionFormat:@"contentSyndicationEnabled != 0"];
  v202[0] = v167;
  v44 = (void *)MEMORY[0x1E4F941C0];
  v163 = NSStringFromSelector(sel_showSyndicatedContentWidgetForGuestAssets);
  v159 = [v44 rowWithTitle:@"Show 1up Widget for guest assets" valueKeyPath:v163];
  v156 = [v159 conditionFormat:@"contentSyndicationEnabled != 0"];
  v202[1] = v156;
  v45 = (void *)MEMORY[0x1E4F941C0];
  v153 = NSStringFromSelector(sel_showSyndicated1upPillUI);
  v150 = [v45 rowWithTitle:@"Show 1up Pill UI" valueKeyPath:v153];
  v148 = [v150 conditionFormat:@"contentSyndicationEnabled != 0"];
  v202[2] = v148;
  v46 = (void *)MEMORY[0x1E4F941A0];
  v146 = NSStringFromSelector(sel_syndicated1upPillAlignment);
  v144 = [v46 rowWithTitle:@"Pill Alignment" valueKeyPath:v146];
  v143 = [v144 possibleValues:&unk_1F02D3940 titles:&unk_1F02D3958];
  v202[3] = v143;
  v47 = (void *)MEMORY[0x1E4F941A0];
  v142 = NSStringFromSelector(sel_savedAssetViewVisibility);
  v141 = [v47 rowWithTitle:@"Show Pill UI for Saved Assets" valueKeyPath:v142];
  v140 = [v141 possibleValues:&unk_1F02D3970 titles:&unk_1F02D3988];
  v202[4] = v140;
  v48 = (void *)MEMORY[0x1E4F941D8];
  v139 = NSStringFromSelector(sel_numberOfMinutesToShowPillUIAfterSaving);
  v138 = [v48 rowWithTitle:@"# Mins After Save" valueKeyPath:v139];
  v137 = [v138 minValue:0.5 maxValue:30.0];
  v49 = objc_msgSend(v137, "px_increment:", 0.5);
  v50 = [v49 conditionFormat:@"savedAssetViewVisibility = 2"];
  v202[5] = v50;
  v51 = (void *)MEMORY[0x1E4F941C0];
  v52 = NSStringFromSelector(sel_preventActualSaveToLibraryBehavior);
  v53 = [v51 rowWithTitle:@"Prevent Actual Save to Library" valueKeyPath:v52];
  v54 = [v53 conditionFormat:@"contentSyndicationEnabled != 0"];
  v202[6] = v54;
  v55 = (void *)MEMORY[0x1E4F941C0];
  v56 = NSStringFromSelector(sel_preventActualRemoveSuggestionBehavior);
  v57 = [v55 rowWithTitle:@"Prevent Actual Remove Suggestion" valueKeyPath:v56];
  v58 = [v57 conditionFormat:@"contentSyndicationEnabled != 0"];
  v202[7] = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v202 count:8];
  v178 = [v177 sectionWithRows:v59 title:@"1up" conditionFormat:@"contentSyndicationEnabled != 0"];

  v60 = (void *)MEMORY[0x1E4F941A8];
  v61 = (void *)MEMORY[0x1E4F941C0];
  v62 = NSStringFromSelector(sel_treatEveryAssetAsGuest);
  v63 = [v61 rowWithTitle:@"Treat All Assets As Guest" valueKeyPath:v62];
  v201 = v63;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v201 count:1];
  v175 = [v60 sectionWithRows:v64 title:@"Inline Guest Assets" conditionFormat:@"contentSyndicationEnabled != 0"];

  v65 = (void *)MEMORY[0x1E4F941A8];
  v66 = (void *)MEMORY[0x1E4F941F0];
  v67 = NSStringFromSelector(sel_useSystemLibraryForReview);
  v68 = [v66 rowWithTitle:@"Use System Library" valueKeyPath:v67];
  v200[0] = v68;
  v69 = (void *)MEMORY[0x1E4F941F0];
  v70 = NSStringFromSelector(sel_useRandomStatusForReview);
  v71 = [v69 rowWithTitle:@"Use Random Status" valueKeyPath:v70];
  v200[1] = v71;
  v72 = (void *)MEMORY[0x1E4F941A0];
  v73 = NSStringFromSelector(sel_reviewScope);
  v74 = [v72 rowWithTitle:@"Review UI Scope" valueKeyPath:v73];
  v75 = [v74 possibleValues:&unk_1F02D39A0 titles:&unk_1F02D39B8];
  v200[2] = v75;
  v76 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Review All", &__block_literal_global_386);
  v200[3] = v76;
  v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:4];
  v172 = [v65 sectionWithRows:v77 title:@"Review Syndicated Assets"];

  v198[0] = &unk_1F02D6868;
  v198[1] = &unk_1F02D6880;
  v199[0] = @"All Positives";
  v199[1] = @"All Negatives";
  v198[2] = &unk_1F02D6898;
  v168 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[2] = v168;
  v198[3] = &unk_1F02D68B0;
  v164 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[3] = v164;
  v198[4] = &unk_1F02D68C8;
  v160 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[4] = v160;
  v198[5] = &unk_1F02D68E0;
  v157 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[5] = v157;
  v198[6] = &unk_1F02D68F8;
  v154 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[6] = v154;
  v198[7] = &unk_1F02D6910;
  v151 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[7] = v151;
  v198[8] = &unk_1F02D6928;
  v78 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[8] = v78;
  v198[9] = &unk_1F02D6940;
  v79 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[9] = v79;
  v198[10] = &unk_1F02D6958;
  v80 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[10] = v80;
  v198[11] = &unk_1F02D6970;
  v81 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[11] = v81;
  v198[12] = &unk_1F02D6988;
  v82 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[12] = v82;
  v198[13] = &unk_1F02D69A0;
  v83 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[13] = v83;
  v198[14] = &unk_1F02D69B8;
  v84 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[14] = v84;
  v198[15] = &unk_1F02D69D0;
  v85 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[15] = v85;
  v198[16] = &unk_1F02D69E8;
  v86 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v199[16] = v86;
  v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v199 forKeys:v198 count:17];

  v88 = (void *)MEMORY[0x1E4F941A8];
  v89 = (void *)MEMORY[0x1E4F941A0];
  v90 = NSStringFromSelector(sel_reviewProcessingValuesScope);
  v91 = [v89 rowWithTitle:@"Review UI Scope" valueKeyPath:v90];
  v92 = [v87 allKeys];
  v169 = v87;
  v93 = [v87 allValues];
  v94 = [v91 possibleValues:v92 titles:v93];
  v197[0] = v94;
  v95 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Review All", &__block_literal_global_450);
  v197[1] = v95;
  v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v197 count:2];
  v165 = [v88 sectionWithRows:v96 title:@"Review Processing Values"];

  v97 = (void *)MEMORY[0x1E4F941A8];
  v98 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Generate Questions", &__block_literal_global_500);
  v196[0] = v98;
  v99 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Reset All Questions", &__block_literal_global_503);
  v196[1] = v99;
  v100 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Delete All Questions", &__block_literal_global_506);
  v196[2] = v100;
  v101 = (void *)MEMORY[0x1E4F941F0];
  v102 = NSStringFromSelector(sel_shouldMockChallengeQuestions);
  v103 = [v101 rowWithTitle:@"Mock Questions" valueKeyPath:v102];
  v104 = [v103 conditionFormat:@"contentSyndicationEnabled != 0"];
  v196[3] = v104;
  v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:4];
  v161 = [v97 sectionWithRows:v105 title:@"Challenge Questions"];

  id v189 = 0;
  uint64_t v106 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:&v189];
  v155 = (void *)v106;
  id v158 = v189;
  if (v106)
  {
    v107 = [PXPhotoLibraryProcessingProgressRow alloc];
    v108 = NSStringFromSelector(sel_libraryStateBriefDescription);
    v109 = NSStringFromSelector(sel_libraryStateImage);
    v110 = [(PXPhotoLibraryProcessingProgressRow *)v107 initWithPhotoLibrary:v106 titleKeyPath:v108 imageKeyPath:v109];

    v195 = v110;
    v111 = &v195;
  }
  else
  {
    v110 = [MEMORY[0x1E4F940F8] rowWithTitle:@"No Syndication Library Available" action:0];
    v194 = v110;
    v111 = &v194;
  }
  v152 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:1];

  v147 = [MEMORY[0x1E4F94160] sectionWithRows:v152 title:@"Syndication Library Processing"];
  v112 = (void *)MEMORY[0x1E4F94160];
  v113 = (void *)MEMORY[0x1E4F940F8];
  v114 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v115 = [v113 rowWithTitle:@"Restore Defaults" action:v114];
  v193 = v115;
  v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v193 count:1];
  v149 = [v112 sectionWithRows:v116];

  v117 = (void *)MEMORY[0x1E4F941A8];
  v118 = (void *)MEMORY[0x1E4F941F0];
  v119 = NSStringFromSelector(sel_mockNumberOfAssetsSaved);
  v120 = [v118 rowWithTitle:@"Mock Number of Assets Saved" valueKeyPath:v119];
  v192[0] = v120;
  v121 = (void *)MEMORY[0x1E4F941A0];
  v122 = NSStringFromSelector(sel_footerMockType);
  v123 = [v121 rowWithTitle:@"Number of Assets Saved" valueKeyPath:v122];
  v124 = [v123 possibleValues:&unk_1F02D39D0 titles:&unk_1F02D39E8];
  v125 = [v124 conditionFormat:@"mockNumberOfAssetsSaved != 0"];
  v192[1] = v125;
  v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:2];
  v145 = [v117 sectionWithRows:v126 title:@"Footer" conditionFormat:@"contentSyndicationEnabled != 0"];

  v127 = (void *)MEMORY[0x1E4F941A8];
  v128 = (void *)MEMORY[0x1E4F941F0];
  v129 = NSStringFromSelector(sel_waitForAndLogAssetArrivalWhenSaving);
  v130 = [v128 rowWithTitle:@"Wait + Log asset arrival on save" valueKeyPath:v129];
  v191 = v130;
  v131 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v191 count:1];
  v132 = [v127 sectionWithRows:v131 title:@"Debugging" conditionFormat:@"contentSyndicationEnabled != 0"];

  v133 = (void *)MEMORY[0x1E4F94160];
  v190[0] = v188;
  v190[1] = v147;
  v190[2] = v172;
  v190[3] = v165;
  v190[4] = v186;
  v190[5] = v184;
  v190[6] = v181;
  v190[7] = v178;
  v190[8] = v175;
  v190[9] = v161;
  v190[10] = v145;
  v190[11] = v132;
  v190[12] = v149;
  v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:13];
  v135 = [v133 moduleWithTitle:@"Content Syndication" contents:v134];

  return v135;
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_3_504(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!v2)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [NSString stringWithUTF8String:"void _DeleteAllQuestionsAction(UINavigationController *__strong)"];
    [v10 handleFailureInFunction:v11, @"PXContentSyndicationSettings+UI.m", 374, @"Invalid parameter not satisfying: %@", @"navigationController" file lineNumber description];
  }
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = _AllHubbleQuestionsForPhotoLibrary(v3);
  if ([v4 count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___DeleteAllQuestionsAction_block_invoke;
    v13[3] = &unk_1E5DD36F8;
    id v14 = v4;
    id v12 = 0;
    char v5 = [v3 performChangesAndWait:v13 error:&v12];
    id v6 = v12;
    v7 = v6;
    if (v5)
    {
      v8 = @"Questions Deleted Successfully";
      v9 = @"Quit and re-launch Photos to update questions.";
    }
    else
    {
      v9 = [v6 localizedDescription];
      v8 = @"Failed to Delete Questions";
    }
  }
  else
  {
    v8 = @"Failed to Delete Questions";
    v9 = @"No questions available to delete.";
  }
  _PresentAlertForNavigationController(v8, v9, v2);
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_2_501(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!v2)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [NSString stringWithUTF8String:"void _ResetAllQuestionsAction(UINavigationController *__strong)"];
    [v10 handleFailureInFunction:v11, @"PXContentSyndicationSettings+UI.m", 346, @"Invalid parameter not satisfying: %@", @"navigationController" file lineNumber description];
  }
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = _AllHubbleQuestionsForPhotoLibrary(v3);
  if ([v4 count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___ResetAllQuestionsAction_block_invoke;
    v13[3] = &unk_1E5DD36F8;
    id v14 = v4;
    id v12 = 0;
    char v5 = [v3 performChangesAndWait:v13 error:&v12];
    id v6 = v12;
    v7 = v6;
    if (v5)
    {
      v8 = @"Questions Reset Successfully";
      v9 = @"Quit and re-launch Photos to update questions.";
    }
    else
    {
      v9 = [v6 localizedDescription];
      v8 = @"Failed to Reset Questions";
    }
  }
  else
  {
    v8 = @"Failed to Reset Questions";
    v9 = @"No questions available to reset.";
  }
  _PresentAlertForNavigationController(v8, v9, v2);
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_498(uint64_t a1, void *a2)
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F8AFE0];
  v30[0] = *MEMORY[0x1E4F8B018];
  v30[1] = v3;
  v31[0] = &unk_1F02D6A00;
  v31[1] = &unk_1F02D6A18;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__53030;
  v24 = __Block_byref_object_dispose__53031;
  id v25 = 0;
  char v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  id v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v7 = [v6 photoAnalysisClient];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = ___GenerateQuestionsAction_block_invoke;
  v16 = &unk_1E5DB4228;
  v18 = &v26;
  v19 = &v20;
  v8 = v5;
  v17 = v8;
  [v7 requestGenerateQuestionsWithOptions:v4 reply:&v13];

  dispatch_time_t v9 = dispatch_time(0, 300000000000);
  if (dispatch_group_wait(v8, v9))
  {
    v10 = @"Request timed out.";
  }
  else
  {
    if (*((unsigned char *)v27 + 24))
    {
      v10 = 0;
      v11 = @"Questions Generated Successfully";
      goto LABEL_6;
    }
    id v12 = (void *)v21[5];
    if (v12)
    {
      objc_msgSend(v12, "localizedDescription", v13, v14, v15, v16);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = @"All available questions may have already been generated, or your syndication library may not have been processed yet.";
    }
  }
  v11 = @"Failed to Generate Questions";
LABEL_6:
  _PresentAlertForNavigationController(v11, v10, v2);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_448(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v7 = 0;
  uint64_t v3 = PXContentSyndicationProcessingValuesReviewViewController((uint64_t)&v7);
  id v4 = v7;
  char v5 = v4;
  if (v3)
  {
    [v2 pushViewController:v3 animated:1];
  }
  else
  {
    id v6 = [v4 localizedDescription];
    _PresentAlertForNavigationController(v6, 0, v2);
  }
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_384(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v7 = 0;
  uint64_t v3 = PXContentSyndicationReviewViewController((uint64_t)&v7);
  id v4 = v7;
  char v5 = v4;
  if (v3)
  {
    [v2 pushViewController:v3 animated:1];
  }
  else
  {
    id v6 = [v4 localizedDescription];
    _PresentAlertForNavigationController(v6, 0, v2);
  }
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Enable Shared With You" message:@"Navigate to:\n\nSettings\n-> Messages\n-> Shared With You\n-> Photos\n-> ON" preferredStyle:1];
  id v4 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v3 addAction:v4];

  char v5 = (void *)MEMORY[0x1E4FB1410];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_2;
  v8[3] = &unk_1E5DD0030;
  id v9 = v2;
  id v6 = v2;
  id v7 = [v5 actionWithTitle:@"Settings" style:0 handler:v8];
  [v3 addAction:v7];

  [v6 presentViewController:v3 animated:0 completion:0];
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_3;
  v1[3] = &unk_1E5DD3158;
  id v2 = *(id *)(a1 + 32);
  +[PXSystemNavigation navigateToDestination:1 completion:v1];
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    id v5 = [a3 localizedDescription];
    _PresentAlertForNavigationController(@"Failed to Open Settings", v5, *(void **)(a1 + 32));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryStateImage, 0);
  objc_storeStrong((id *)&self->_libraryStateBriefDescription, 0);
}

- (void)setLibraryStateImage:(id)a3
{
}

- (UIImage)libraryStateImage
{
  return self->_libraryStateImage;
}

- (void)setLibraryStateBriefDescription:(id)a3
{
}

- (NSString)libraryStateBriefDescription
{
  return self->_libraryStateBriefDescription;
}

- (BOOL)waitForAndLogAssetArrivalWhenSaving
{
  return self->_waitForAndLogAssetArrivalWhenSaving;
}

- (int64_t)footerMockType
{
  return self->_footerMockType;
}

- (BOOL)mockNumberOfAssetsSaved
{
  return self->_mockNumberOfAssetsSaved;
}

- (unsigned)reviewProcessingValuesScope
{
  return self->_reviewProcessingValuesScope;
}

- (int64_t)reviewScope
{
  return self->_reviewScope;
}

- (BOOL)useRandomStatusForReview
{
  return self->_useRandomStatusForReview;
}

- (BOOL)useSystemLibraryForReview
{
  return self->_useSystemLibraryForReview;
}

- (BOOL)enableStackSmartCrop
{
  return self->_enableStackSmartCrop;
}

- (BOOL)enableStackAspectRatio
{
  return self->_enableStackAspectRatio;
}

- (BOOL)preventActualRemoveSuggestionBehavior
{
  return self->_preventActualRemoveSuggestionBehavior;
}

- (BOOL)preventActualSaveToLibraryBehavior
{
  return self->_preventActualSaveToLibraryBehavior;
}

- (unint64_t)numberOfMinutesToShowPillUIAfterSaving
{
  return self->_numberOfMinutesToShowPillUIAfterSaving;
}

- (int64_t)savedAssetViewVisibility
{
  return self->_savedAssetViewVisibility;
}

- (int64_t)syndicated1upPillAlignment
{
  return self->_syndicated1upPillAlignment;
}

- (BOOL)showSyndicated1upPillUI
{
  return self->_showSyndicated1upPillUI;
}

- (BOOL)showSyndicatedContentWidgetForGuestAssets
{
  return self->_showSyndicatedContentWidgetForGuestAssets;
}

- (BOOL)showSyndicatedContentWidgetForSavedAssets
{
  return self->_showSyndicatedContentWidgetForSavedAssets;
}

- (BOOL)alwaysLeadingAlignAttributionViewOnRegularWidthPads
{
  return self->_alwaysLeadingAlignAttributionViewOnRegularWidthPads;
}

- (BOOL)shouldHorizontallyCenterAttributionViewInGrid
{
  return self->_shouldHorizontallyCenterAttributionViewInGrid;
}

- (int64_t)itemCellBlurStyle
{
  return self->_itemCellBlurStyle;
}

- (double)blackOverlayForThirdThumbnail
{
  return self->_blackOverlayForThirdThumbnail;
}

- (double)blackOverlayForSecondThumbnail
{
  return self->_blackOverlayForSecondThumbnail;
}

- (double)blackOverlayForFirstThumbnail
{
  return self->_blackOverlayForFirstThumbnail;
}

- (BOOL)loadVerySmallInitialBatchOfRecentCollections
{
  return self->_loadVerySmallInitialBatchOfRecentCollections;
}

- (unint64_t)maxNumberOfAssetsPerBatch
{
  return self->_maxNumberOfAssetsPerBatch;
}

- (unint64_t)maxNumberOfBatches
{
  return self->_maxNumberOfBatches;
}

- (BOOL)useUserLibraryForSyndicatedAssets
{
  return self->_useUserLibraryForSyndicatedAssets;
}

- (BOOL)showContentSyndicationInSystemPhotoLibraryOnly
{
  return self->_showContentSyndicationInSystemPhotoLibraryOnly;
}

- (BOOL)showSyndicatedContentInLibrary
{
  return self->_showSyndicatedContentInLibrary;
}

- (BOOL)shouldMockChallengeQuestions
{
  return self->_shouldMockChallengeQuestions;
}

- (BOOL)showSidebarItemEvenIfNoSyndicatedContentAvailable
{
  return self->_showSidebarItemEvenIfNoSyndicatedContentAvailable;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

@end