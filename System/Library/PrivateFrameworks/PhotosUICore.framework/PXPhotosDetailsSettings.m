@interface PXPhotosDetailsSettings
+ (PXPhotosDetailsSettings)sharedInstance;
+ (id)settingsControllerModule;
+ (id)transientProperties;
+ (void)_fillLibraryWithFakeAssets:(id)a3;
- (BOOL)allowEditorialLayoutStressTest;
- (BOOL)allowItemReorderingInCuratedLayout;
- (BOOL)allowMultiColumnLayout;
- (BOOL)allowWidgetsContentLoading;
- (BOOL)allowsTopTrailingSelectCancelButton;
- (BOOL)captionWidgetEnableDirectAttachToMaster;
- (BOOL)captionWidgetEnableFadeInEffect;
- (BOOL)captionWidgetEnableHashtags;
- (BOOL)captionWidgetEnableVScrollingInEdit;
- (BOOL)draggableInfoPanelEnabled;
- (BOOL)editorialLayoutAvoidSmallestTile;
- (BOOL)editorialLayoutEdit;
- (BOOL)enableFetchResultCaching;
- (BOOL)formattedLensStringsEnabled;
- (BOOL)loadAllWidgetsContentAfterDelay;
- (BOOL)loadAllWidgetsContentOnScroll;
- (BOOL)mapWidgetAllowCopyPasteLocation;
- (BOOL)peopleWidgetDisableSocialGroup;
- (BOOL)placesWidgetShowOnlyPlaceholder;
- (BOOL)purgeOnMemoryWarning;
- (BOOL)showActionableLivePhotosBadge;
- (BOOL)showActionsWidget;
- (BOOL)showAlbumAttributionWidget;
- (BOOL)showAppAttributionWidget;
- (BOOL)showAssetDescriptionWidget;
- (BOOL)showAssetRichDescription;
- (BOOL)showAssetsWidget;
- (BOOL)showCaptionHashtagsWidget;
- (BOOL)showDemoDynamicWidget;
- (BOOL)showDemoTilingViewWidget;
- (BOOL)showDemoViewWidget;
- (BOOL)showEXIFWidget;
- (BOOL)showFacesAreaRect;
- (BOOL)showHeaderWidget;
- (BOOL)showLookUpWidgetSearchIcon;
- (BOOL)showPeopleInlineCandidateWidget;
- (BOOL)showPlacesWidget;
- (BOOL)showRelatedPeopleWidget;
- (BOOL)showSharedLibraryWidget;
- (BOOL)showTimeWidget;
- (BOOL)showVisualLookUpWidget;
- (BOOL)useCuratedLibraryLayout;
- (PXAssetBadgeInfo)debugBadgeInfo;
- (double)assetsWidgetPlaceholderAspectRatio;
- (double)captionWidgetFadeInDuration;
- (double)defaultPriorityWidgetsLoadingDelay;
- (id)parentSettings;
- (int64_t)debugBadgeInfoType;
- (int64_t)defaultCurationAlgorithm;
- (int64_t)detailViewsToKeepLoaded;
- (int64_t)detailsViewCurationAlgorithm;
- (int64_t)editorialLayoutActivityFeedItemCountThreshold;
- (int64_t)editorialLayoutColumns;
- (int64_t)editorialLayoutTargetRowsForChunk;
- (int64_t)peopleWidgetMaximumNumberOfPeople;
- (int64_t)version;
- (void)setAllowEditorialLayoutStressTest:(BOOL)a3;
- (void)setAllowItemReorderingInCuratedLayout:(BOOL)a3;
- (void)setAllowMultiColumnLayout:(BOOL)a3;
- (void)setAllowWidgetsContentLoading:(BOOL)a3;
- (void)setAllowsTopTrailingSelectCancelButton:(BOOL)a3;
- (void)setAssetsWidgetPlaceholderAspectRatio:(double)a3;
- (void)setCaptionWidgetEnableDirectAttachToMaster:(BOOL)a3;
- (void)setCaptionWidgetEnableFadeInEffect:(BOOL)a3;
- (void)setCaptionWidgetEnableHashtags:(BOOL)a3;
- (void)setCaptionWidgetEnableVScrollingInEdit:(BOOL)a3;
- (void)setCaptionWidgetFadeInDuration:(double)a3;
- (void)setDebugBadgeInfoType:(int64_t)a3;
- (void)setDefaultCurationAlgorithm:(int64_t)a3;
- (void)setDefaultPriorityWidgetsLoadingDelay:(double)a3;
- (void)setDefaultValues;
- (void)setDetailViewsToKeepLoaded:(int64_t)a3;
- (void)setDetailsViewCurationAlgorithm:(int64_t)a3;
- (void)setDraggableInfoPanelEnabled:(BOOL)a3;
- (void)setEditorialLayoutActivityFeedItemCountThreshold:(int64_t)a3;
- (void)setEditorialLayoutAvoidSmallestTile:(BOOL)a3;
- (void)setEditorialLayoutColumns:(int64_t)a3;
- (void)setEditorialLayoutEdit:(BOOL)a3;
- (void)setEditorialLayoutTargetRowsForChunk:(int64_t)a3;
- (void)setEnableFetchResultCaching:(BOOL)a3;
- (void)setFormattedLensStringsEnabled:(BOOL)a3;
- (void)setLoadAllWidgetsContentAfterDelay:(BOOL)a3;
- (void)setLoadAllWidgetsContentOnScroll:(BOOL)a3;
- (void)setMapWidgetAllowCopyPasteLocation:(BOOL)a3;
- (void)setPeopleWidgetDisableSocialGroup:(BOOL)a3;
- (void)setPeopleWidgetMaximumNumberOfPeople:(int64_t)a3;
- (void)setPlacesWidgetShowOnlyPlaceholder:(BOOL)a3;
- (void)setPurgeOnMemoryWarning:(BOOL)a3;
- (void)setShowActionableLivePhotosBadge:(BOOL)a3;
- (void)setShowActionsWidget:(BOOL)a3;
- (void)setShowAlbumAttributionWidget:(BOOL)a3;
- (void)setShowAppAttributionWidget:(BOOL)a3;
- (void)setShowAssetDescriptionWidget:(BOOL)a3;
- (void)setShowAssetRichDescription:(BOOL)a3;
- (void)setShowAssetsWidget:(BOOL)a3;
- (void)setShowCaptionHashtagsWidget:(BOOL)a3;
- (void)setShowDemoDynamicWidget:(BOOL)a3;
- (void)setShowDemoTilingViewWidget:(BOOL)a3;
- (void)setShowDemoViewWidget:(BOOL)a3;
- (void)setShowEXIFWidget:(BOOL)a3;
- (void)setShowFacesAreaRect:(BOOL)a3;
- (void)setShowHeaderWidget:(BOOL)a3;
- (void)setShowLookUpWidgetSearchIcon:(BOOL)a3;
- (void)setShowPeopleInlineCandidateWidget:(BOOL)a3;
- (void)setShowPlacesWidget:(BOOL)a3;
- (void)setShowRelatedPeopleWidget:(BOOL)a3;
- (void)setShowSharedLibraryWidget:(BOOL)a3;
- (void)setShowTimeWidget:(BOOL)a3;
- (void)setShowVisualLookUpWidget:(BOOL)a3;
- (void)setUseCuratedLibraryLayout:(BOOL)a3;
@end

@implementation PXPhotosDetailsSettings

+ (PXPhotosDetailsSettings)sharedInstance
{
  if (sharedInstance_onceToken_218995 != -1) {
    dispatch_once(&sharedInstance_onceToken_218995, &__block_literal_global_218996);
  }
  v2 = (void *)sharedInstance_sharedInstance_218997;
  return (PXPhotosDetailsSettings *)v2;
}

- (PXAssetBadgeInfo)debugBadgeInfo
{
  long long v3 = *((_OWORD *)off_1E5DAAEC8 + 1);
  *(_OWORD *)&retstr->badges = *(_OWORD *)off_1E5DAAEC8;
  *(_OWORD *)&retstr->count = v3;
  result = [(PXPhotosDetailsSettings *)self debugBadgeInfoType];
  if (result == (PXAssetBadgeInfo *)2) {
    PXAssetBadgeInfoCreateWithBadges();
  }
  if (result == (PXAssetBadgeInfo *)1) {
    PXAssetBadgeInfoCreateWithDuration();
  }
  return result;
}

- (int64_t)debugBadgeInfoType
{
  return self->_debugBadgeInfoType;
}

- (int64_t)detailsViewCurationAlgorithm
{
  return self->_detailsViewCurationAlgorithm;
}

- (int64_t)defaultCurationAlgorithm
{
  return self->_defaultCurationAlgorithm;
}

- (BOOL)enableFetchResultCaching
{
  return self->_enableFetchResultCaching;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXPhotosDetailsSettings *)self setDefaultCurationAlgorithm:0];
  [(PXPhotosDetailsSettings *)self setDetailsViewCurationAlgorithm:1];
  [(PXPhotosDetailsSettings *)self setEnableFetchResultCaching:1];
  [(PXPhotosDetailsSettings *)self setShowHeaderWidget:1];
  [(PXPhotosDetailsSettings *)self setShowAssetsWidget:1];
  [(PXPhotosDetailsSettings *)self setShowCaptionHashtagsWidget:1];
  [(PXPhotosDetailsSettings *)self setMapWidgetAllowCopyPasteLocation:1];
  [(PXPhotosDetailsSettings *)self setShowTimeWidget:1];
  [(PXPhotosDetailsSettings *)self setShowEXIFWidget:1];
  [(PXPhotosDetailsSettings *)self setShowAlbumAttributionWidget:1];
  [(PXPhotosDetailsSettings *)self setShowAssetDescriptionWidget:0];
  [(PXPhotosDetailsSettings *)self setShowAssetRichDescription:0];
  [(PXPhotosDetailsSettings *)self setShowAppAttributionWidget:1];
  [(PXPhotosDetailsSettings *)self setShowVisualLookUpWidget:1];
  [(PXPhotosDetailsSettings *)self setFormattedLensStringsEnabled:1];
  [(PXPhotosDetailsSettings *)self setShowDemoTilingViewWidget:1];
  [(PXPhotosDetailsSettings *)self setShowDemoViewWidget:1];
  [(PXPhotosDetailsSettings *)self setShowDemoDynamicWidget:0];
  [(PXPhotosDetailsSettings *)self setShowActionableLivePhotosBadge:1];
  [(PXPhotosDetailsSettings *)self setShowPlacesWidget:1];
  [(PXPhotosDetailsSettings *)self setShowRelatedPeopleWidget:1];
  [(PXPhotosDetailsSettings *)self setShowSharedLibraryWidget:1];
  [(PXPhotosDetailsSettings *)self setShowActionsWidget:1];
  [(PXPhotosDetailsSettings *)self setShowPeopleInlineCandidateWidget:1];
  [(PXPhotosDetailsSettings *)self setShowFacesAreaRect:0];
  [(PXPhotosDetailsSettings *)self setAllowWidgetsContentLoading:1];
  [(PXPhotosDetailsSettings *)self setLoadAllWidgetsContentAfterDelay:1];
  [(PXPhotosDetailsSettings *)self setLoadAllWidgetsContentOnScroll:1];
  [(PXPhotosDetailsSettings *)self setDefaultPriorityWidgetsLoadingDelay:0.2];
  [(PXPhotosDetailsSettings *)self setAllowMultiColumnLayout:0];
  [(PXPhotosDetailsSettings *)self setAllowsTopTrailingSelectCancelButton:1];
  [(PXPhotosDetailsSettings *)self setPurgeOnMemoryWarning:1];
  [(PXPhotosDetailsSettings *)self setDetailViewsToKeepLoaded:4];
  [(PXPhotosDetailsSettings *)self setUseCuratedLibraryLayout:1];
  [(PXPhotosDetailsSettings *)self setAllowItemReorderingInCuratedLayout:0];
  [(PXPhotosDetailsSettings *)self setEditorialLayoutEdit:0];
  [(PXPhotosDetailsSettings *)self setEditorialLayoutColumns:3];
  [(PXPhotosDetailsSettings *)self setEditorialLayoutAvoidSmallestTile:1];
  [(PXPhotosDetailsSettings *)self setEditorialLayoutTargetRowsForChunk:4];
  [(PXPhotosDetailsSettings *)self setEditorialLayoutActivityFeedItemCountThreshold:6];
  [(PXPhotosDetailsSettings *)self setAssetsWidgetPlaceholderAspectRatio:0.75];
  [(PXPhotosDetailsSettings *)self setAllowEditorialLayoutStressTest:0];
  [(PXPhotosDetailsSettings *)self setDebugBadgeInfoType:0];
  [(PXPhotosDetailsSettings *)self setCaptionWidgetEnableHashtags:0];
  [(PXPhotosDetailsSettings *)self setCaptionWidgetEnableVScrollingInEdit:0];
  [(PXPhotosDetailsSettings *)self setCaptionWidgetEnableFadeInEffect:0];
  [(PXPhotosDetailsSettings *)self setCaptionWidgetFadeInDuration:0.45];
  [(PXPhotosDetailsSettings *)self setCaptionWidgetEnableDirectAttachToMaster:0];
  [(PXPhotosDetailsSettings *)self setPlacesWidgetShowOnlyPlaceholder:0];
  [(PXPhotosDetailsSettings *)self setShowLookUpWidgetSearchIcon:0];
  [(PXPhotosDetailsSettings *)self setPeopleWidgetMaximumNumberOfPeople:0];
  [(PXPhotosDetailsSettings *)self setPeopleWidgetDisableSocialGroup:0];
  [(PXPhotosDetailsSettings *)self setDraggableInfoPanelEnabled:1];
}

- (void)setUseCuratedLibraryLayout:(BOOL)a3
{
  self->_useCuratedLibraryLayout = a3;
}

- (void)setShowVisualLookUpWidget:(BOOL)a3
{
  self->_showVisualLookUpWidget = a3;
}

- (void)setShowTimeWidget:(BOOL)a3
{
  self->_showTimeWidget = a3;
}

- (void)setShowSharedLibraryWidget:(BOOL)a3
{
  self->_showSharedLibraryWidget = a3;
}

- (void)setShowRelatedPeopleWidget:(BOOL)a3
{
  self->_showRelatedPeopleWidget = a3;
}

- (void)setShowPlacesWidget:(BOOL)a3
{
  self->_showPlacesWidget = a3;
}

- (void)setShowPeopleInlineCandidateWidget:(BOOL)a3
{
  self->_showPeopleInlineCandidateWidget = a3;
}

- (void)setShowLookUpWidgetSearchIcon:(BOOL)a3
{
  self->_showLookUpWidgetSearchIcon = a3;
}

- (void)setShowHeaderWidget:(BOOL)a3
{
  self->_showHeaderWidget = a3;
}

- (void)setShowFacesAreaRect:(BOOL)a3
{
  self->_showFacesAreaRect = a3;
}

- (void)setShowEXIFWidget:(BOOL)a3
{
  self->_showEXIFWidget = a3;
}

- (void)setShowDemoViewWidget:(BOOL)a3
{
  self->_showDemoViewWidget = a3;
}

- (void)setShowDemoTilingViewWidget:(BOOL)a3
{
  self->_showDemoTilingViewWidget = a3;
}

- (void)setShowDemoDynamicWidget:(BOOL)a3
{
  self->_showDemoDynamicWidget = a3;
}

- (void)setShowCaptionHashtagsWidget:(BOOL)a3
{
  self->_showCaptionHashtagsWidget = a3;
}

- (void)setShowAssetsWidget:(BOOL)a3
{
  self->_showAssetsWidget = a3;
}

- (void)setShowAssetRichDescription:(BOOL)a3
{
  self->_showAssetRichDescription = a3;
}

- (void)setShowAssetDescriptionWidget:(BOOL)a3
{
  self->_showAssetDescriptionWidget = a3;
}

- (void)setShowAppAttributionWidget:(BOOL)a3
{
  self->_showAppAttributionWidget = a3;
}

- (void)setShowAlbumAttributionWidget:(BOOL)a3
{
  self->_showAlbumAttributionWidget = a3;
}

- (void)setShowActionsWidget:(BOOL)a3
{
  self->_showActionsWidget = a3;
}

- (void)setShowActionableLivePhotosBadge:(BOOL)a3
{
  self->_showActionableLivePhotosBadge = a3;
}

- (void)setPurgeOnMemoryWarning:(BOOL)a3
{
  self->_purgeOnMemoryWarning = a3;
}

- (void)setPlacesWidgetShowOnlyPlaceholder:(BOOL)a3
{
  self->_placesWidgetShowOnlyPlaceholder = a3;
}

- (void)setPeopleWidgetMaximumNumberOfPeople:(int64_t)a3
{
  self->_peopleWidgetMaximumNumberOfPeople = a3;
}

- (void)setPeopleWidgetDisableSocialGroup:(BOOL)a3
{
  self->_peopleWidgetDisableSocialGroup = a3;
}

- (void)setMapWidgetAllowCopyPasteLocation:(BOOL)a3
{
  self->_mapWidgetAllowCopyPasteLocation = a3;
}

- (void)setLoadAllWidgetsContentOnScroll:(BOOL)a3
{
  self->_loadAllWidgetsContentOnScroll = a3;
}

- (void)setLoadAllWidgetsContentAfterDelay:(BOOL)a3
{
  self->_loadAllWidgetsContentAfterDelay = a3;
}

- (void)setFormattedLensStringsEnabled:(BOOL)a3
{
  self->_formattedLensStringsEnabled = a3;
}

- (void)setEnableFetchResultCaching:(BOOL)a3
{
  self->_enableFetchResultCaching = a3;
}

- (void)setEditorialLayoutTargetRowsForChunk:(int64_t)a3
{
  self->_editorialLayoutTargetRowsForChunk = a3;
}

- (void)setEditorialLayoutEdit:(BOOL)a3
{
  self->_editorialLayoutEdit = a3;
}

- (void)setEditorialLayoutColumns:(int64_t)a3
{
  self->_editorialLayoutColumns = a3;
}

- (void)setEditorialLayoutAvoidSmallestTile:(BOOL)a3
{
  self->_editorialLayoutAvoidSmallestTile = a3;
}

- (void)setEditorialLayoutActivityFeedItemCountThreshold:(int64_t)a3
{
  self->_editorialLayoutActivityFeedItemCountThreshold = a3;
}

- (void)setDraggableInfoPanelEnabled:(BOOL)a3
{
  self->_draggableInfoPanelEnabled = a3;
}

- (void)setDetailsViewCurationAlgorithm:(int64_t)a3
{
  self->_detailsViewCurationAlgorithm = a3;
}

- (void)setDetailViewsToKeepLoaded:(int64_t)a3
{
  self->_detailViewsToKeepLoaded = a3;
}

- (void)setDefaultPriorityWidgetsLoadingDelay:(double)a3
{
  self->_defaultPriorityWidgetsLoadingDelay = a3;
}

- (void)setDefaultCurationAlgorithm:(int64_t)a3
{
  self->_defaultCurationAlgorithm = a3;
}

- (void)setDebugBadgeInfoType:(int64_t)a3
{
  self->_debugBadgeInfoType = a3;
}

- (void)setCaptionWidgetFadeInDuration:(double)a3
{
  self->_captionWidgetFadeInDuration = a3;
}

- (void)setCaptionWidgetEnableVScrollingInEdit:(BOOL)a3
{
  self->_captionWidgetEnableVScrollingInEdit = a3;
}

- (void)setCaptionWidgetEnableHashtags:(BOOL)a3
{
  self->_captionWidgetEnableHashtags = a3;
}

- (void)setCaptionWidgetEnableFadeInEffect:(BOOL)a3
{
  self->_captionWidgetEnableFadeInEffect = a3;
}

- (void)setCaptionWidgetEnableDirectAttachToMaster:(BOOL)a3
{
  self->_captionWidgetEnableDirectAttachToMaster = a3;
}

- (void)setAssetsWidgetPlaceholderAspectRatio:(double)a3
{
  self->_assetsWidgetPlaceholderAspectRatio = a3;
}

- (void)setAllowsTopTrailingSelectCancelButton:(BOOL)a3
{
  self->_allowsTopTrailingSelectCancelButton = a3;
}

- (void)setAllowWidgetsContentLoading:(BOOL)a3
{
  self->_allowWidgetsContentLoading = a3;
}

- (void)setAllowMultiColumnLayout:(BOOL)a3
{
  self->_allowMultiColumnLayout = a3;
}

- (void)setAllowItemReorderingInCuratedLayout:(BOOL)a3
{
  self->_allowItemReorderingInCuratedLayout = a3;
}

- (void)setAllowEditorialLayoutStressTest:(BOOL)a3
{
  self->_allowEditorialLayoutStressTest = a3;
}

void __41__PXPhotosDetailsSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 photosDetails];
  v1 = (void *)sharedInstance_sharedInstance_218997;
  sharedInstance_sharedInstance_218997 = v0;
}

+ (void)_fillLibraryWithFakeAssets:(id)a3
{
  id v3 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke;
  v6[3] = &unk_1E5DC7038;
  id v7 = v3;
  id v4 = v3;
  id v5 = +[PXAlert show:v6];
}

void __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTitle:@"Fill Library with Fake Assets?"];
  [v3 setMessage:@"The fake assets will be added at the very beginning of your photo library."];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_2;
  v4[3] = &unk_1E5DD36F8;
  id v5 = *(id *)(a1 + 32);
  [v3 addActionWithTitle:@"Fill" style:0 action:v4];
  [v3 addActionWithTitle:@"Cancel" style:1 action:0];
}

uint64_t __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_2(uint64_t a1)
{
  return +[PXFakePhotoKitAssetsFetcher fillLibraryWithFakeAssets:*(void *)(a1 + 32) completion:&__block_literal_global_604];
}

void __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_4;
  v7[3] = &unk_1E5DBFCD8;
  char v9 = a2;
  id v8 = v4;
  id v5 = v4;
  id v6 = +[PXAlert show:v7];
}

void __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    id v4 = @"Done";
  }
  else {
    id v4 = @"Failed";
  }
  id v5 = v3;
  [v3 setTitle:v4];
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v5, "configureForError:");
  }
}

+ (id)settingsControllerModule
{
  v237[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v4 = (void *)MEMORY[0x1E4F94160];
  id v5 = (void *)MEMORY[0x1E4F940F8];
  v226[0] = MEMORY[0x1E4F143A8];
  v226[1] = 3221225472;
  v226[2] = __55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke;
  v226[3] = &unk_1E5DBFCB0;
  id v6 = v3;
  id v227 = v6;
  id v7 = objc_msgSend(v5, "px_rowWithTitle:action:", @"Test Photos Details", v226);
  v237[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v237 count:1];
  v222 = [v4 sectionWithRows:v8];

  id v9 = &unk_1F02D4618;
  v220 = (void *)MEMORY[0x1E4F94160];
  v10 = (void *)MEMORY[0x1E4F94108];
  v214 = NSStringFromSelector(sel_defaultCurationAlgorithm);
  v209 = [v10 rowWithTitle:@"Default Curation" valueKeyPath:v214];
  v204 = objc_msgSend(v209, "px_possibleValues:formatter:", &unk_1F02D4618, &__block_literal_global_153684);
  v236[0] = v204;
  v11 = (void *)MEMORY[0x1E4F94108];
  v199 = NSStringFromSelector(sel_detailsViewCurationAlgorithm);
  v194 = [v11 rowWithTitle:@"Details View Curation" valueKeyPath:v199];
  v189 = objc_msgSend(v194, "px_possibleValues:formatter:", &unk_1F02D4618, &__block_literal_global_153684);
  v236[1] = v189;
  v12 = (void *)MEMORY[0x1E4F940F8];
  v13 = (void *)MEMORY[0x1E4F94190];
  v223[0] = MEMORY[0x1E4F143A8];
  v223[1] = 3221225472;
  v223[2] = __55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke_3;
  v223[3] = &unk_1E5DCD7C0;
  id v224 = v6;
  id v225 = a1;
  id v219 = v6;
  v184 = [v13 actionWithHandler:v223];
  v174 = [v12 rowWithTitle:@"Fill Library with Fake Assets" action:v184];
  v14 = (void *)MEMORY[0x1E4F28F60];
  v179 = NSStringFromSelector(sel_detailsViewCurationAlgorithm);
  v169 = objc_msgSend(v14, "predicateWithFormat:", @"%K == %d", v179, 2);
  v164 = [v174 condition:v169];
  v236[2] = v164;
  v15 = (void *)MEMORY[0x1E4F941F0];
  v161 = NSStringFromSelector(sel_enableFetchResultCaching);
  v158 = [v15 rowWithTitle:@"Fetch Result Caching" valueKeyPath:v161];
  v236[3] = v158;
  v16 = (void *)MEMORY[0x1E4F941F0];
  v155 = NSStringFromSelector(sel_showActionsWidget);
  v152 = [v16 rowWithTitle:@"Actions Widget" valueKeyPath:v155];
  v236[4] = v152;
  v17 = (void *)MEMORY[0x1E4F941F0];
  v149 = NSStringFromSelector(sel_allowMultiColumnLayout);
  v18 = [v17 rowWithTitle:@"Multi Column Layout" valueKeyPath:v149];
  v236[5] = v18;
  v19 = (void *)MEMORY[0x1E4F941F0];
  v20 = NSStringFromSelector(sel_allowsTopTrailingSelectCancelButton);
  v21 = [v19 rowWithTitle:@"Top Select/Cancel" valueKeyPath:v20];
  v236[6] = v21;
  v22 = (void *)MEMORY[0x1E4F941F0];
  v23 = NSStringFromSelector(sel_showFacesAreaRect);
  v24 = [v22 rowWithTitle:@"Show Faces Area Rect" valueKeyPath:v23];
  v236[7] = v24;
  v25 = (void *)MEMORY[0x1E4F941F0];
  v26 = NSStringFromSelector(sel_draggableInfoPanelEnabled);
  v27 = [v25 rowWithTitle:@"Draggable Info Panel" valueKeyPath:v26];
  v236[8] = v27;
  v28 = (void *)MEMORY[0x1E4F941F0];
  v29 = NSStringFromSelector(sel_formattedLensStringsEnabled);
  v30 = [v28 rowWithTitle:@"Formatted Lens Strings" valueKeyPath:v29];
  v236[9] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v236 count:10];
  v221 = [v220 sectionWithRows:v31 title:@"Settings"];

  v162 = (void *)MEMORY[0x1E4F94160];
  v32 = (void *)MEMORY[0x1E4F941F0];
  v215 = NSStringFromSelector(sel_showVisualLookUpWidget);
  v210 = [v32 rowWithTitle:@"Visual Lookup Widget" valueKeyPath:v215];
  v235[0] = v210;
  v33 = (void *)MEMORY[0x1E4F941F0];
  v205 = NSStringFromSelector(sel_showAlbumAttributionWidget);
  v200 = [v33 rowWithTitle:@"Album Attribution Widget" valueKeyPath:v205];
  v235[1] = v200;
  v34 = (void *)MEMORY[0x1E4F941F0];
  v195 = NSStringFromSelector(sel_showAppAttributionWidget);
  v190 = [v34 rowWithTitle:@"Saved From Apps Widget" valueKeyPath:v195];
  v235[2] = v190;
  v35 = (void *)MEMORY[0x1E4F941F0];
  v185 = NSStringFromSelector(sel_showTimeWidget);
  v180 = [v35 rowWithTitle:@"Date & Time Widget" valueKeyPath:v185];
  v235[3] = v180;
  v36 = (void *)MEMORY[0x1E4F941F0];
  v175 = NSStringFromSelector(sel_showEXIFWidget);
  v170 = [v36 rowWithTitle:@"EXIF Widget" valueKeyPath:v175];
  v235[4] = v170;
  v37 = (void *)MEMORY[0x1E4F941F0];
  v165 = NSStringFromSelector(sel_showAssetDescriptionWidget);
  v159 = [v37 rowWithTitle:@"Asset Description Widget" valueKeyPath:v165];
  v235[5] = v159;
  v38 = (void *)MEMORY[0x1E4F941F0];
  v156 = NSStringFromSelector(sel_showAssetRichDescription);
  v153 = [v38 rowWithTitle:@"Asset Rich Description" valueKeyPath:v156];
  v235[6] = v153;
  v39 = (void *)MEMORY[0x1E4F941F0];
  v150 = NSStringFromSelector(sel_showHeaderWidget);
  v147 = [v39 rowWithTitle:@"Header Widget" valueKeyPath:v150];
  v235[7] = v147;
  v40 = (void *)MEMORY[0x1E4F941F0];
  v145 = NSStringFromSelector(sel_showAssetsWidget);
  v143 = [v40 rowWithTitle:@"Assets Widget" valueKeyPath:v145];
  v235[8] = v143;
  v41 = (void *)MEMORY[0x1E4F941F0];
  v141 = NSStringFromSelector(sel_showCaptionHashtagsWidget);
  v140 = [v41 rowWithTitle:@"Caption&Hashtags Widget" valueKeyPath:v141];
  v235[9] = v140;
  v42 = (void *)MEMORY[0x1E4F941F0];
  v139 = NSStringFromSelector(sel_showDemoTilingViewWidget);
  v138 = [v42 rowWithTitle:@"Demo Tiling View Widget" valueKeyPath:v139];
  v235[10] = v138;
  v43 = (void *)MEMORY[0x1E4F941F0];
  v137 = NSStringFromSelector(sel_showDemoViewWidget);
  v136 = [v43 rowWithTitle:@"Demo View Widget" valueKeyPath:v137];
  v235[11] = v136;
  v44 = (void *)MEMORY[0x1E4F941F0];
  v135 = NSStringFromSelector(sel_showDemoDynamicWidget);
  v45 = [v44 rowWithTitle:@"Demo Dynamic Widget" valueKeyPath:v135];
  v235[12] = v45;
  v46 = (void *)MEMORY[0x1E4F941F0];
  v47 = NSStringFromSelector(sel_showPlacesWidget);
  v48 = [v46 rowWithTitle:@"Places Widget" valueKeyPath:v47];
  v235[13] = v48;
  v49 = (void *)MEMORY[0x1E4F941F0];
  v50 = NSStringFromSelector(sel_showRelatedPeopleWidget);
  v51 = [v49 rowWithTitle:@"People Widget" valueKeyPath:v50];
  v235[14] = v51;
  v52 = (void *)MEMORY[0x1E4F941F0];
  v53 = NSStringFromSelector(sel_showSharedLibraryWidget);
  v54 = [v52 rowWithTitle:@"Shared Library Widget" valueKeyPath:v53];
  v235[15] = v54;
  v55 = (void *)MEMORY[0x1E4F941F0];
  v56 = NSStringFromSelector(sel_showActionsWidget);
  v57 = [v55 rowWithTitle:@"Actions Widget" valueKeyPath:v56];
  v235[16] = v57;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v235 count:17];
  aSelector = [v162 sectionWithRows:v58 title:@"Info Panel"];

  v216 = (void *)MEMORY[0x1E4F94160];
  v59 = (void *)MEMORY[0x1E4F941F0];
  v211 = NSStringFromSelector(sel_purgeOnMemoryWarning);
  v206 = [v59 rowWithTitle:@"Purge On Memory Warning" valueKeyPath:v211];
  v234[0] = v206;
  v60 = (void *)MEMORY[0x1E4F941D8];
  v201 = NSStringFromSelector(sel_detailViewsToKeepLoaded);
  v196 = [v60 rowWithTitle:@"Detail Views to Keep Loaded" valueKeyPath:v201];
  v191 = [v196 minValue:0.0 maxValue:20.0];
  v186 = objc_msgSend(v191, "px_increment:", 1.0);
  v234[1] = v186;
  v61 = (void *)MEMORY[0x1E4F941F0];
  v181 = NSStringFromSelector(sel_allowWidgetsContentLoading);
  v176 = [v61 rowWithTitle:@"Widgets Content Loading" valueKeyPath:v181];
  v234[2] = v176;
  v62 = (void *)MEMORY[0x1E4F941F0];
  v171 = NSStringFromSelector(sel_loadAllWidgetsContentAfterDelay);
  v166 = [v62 rowWithTitle:@"Load All Widgets after Delay" valueKeyPath:v171];
  v63 = [v166 conditionFormat:@"allowWidgetsContentLoading != 0"];
  v234[3] = v63;
  v64 = (void *)MEMORY[0x1E4F941F0];
  v65 = NSStringFromSelector(sel_loadAllWidgetsContentOnScroll);
  v66 = [v64 rowWithTitle:@"Load All Widgets on Scroll" valueKeyPath:v65];
  v67 = [v66 conditionFormat:@"allowWidgetsContentLoading != 0"];
  v234[4] = v67;
  v68 = (void *)MEMORY[0x1E4F941D8];
  v69 = NSStringFromSelector(sel_defaultPriorityWidgetsLoadingDelay);
  v70 = [v68 rowWithTitle:@"Default Priority Load Delay" valueKeyPath:v69];
  v71 = [v70 minValue:0.0 maxValue:2.0];
  v72 = objc_msgSend(v71, "px_increment:", 0.1);
  v73 = [v72 conditionFormat:@"allowWidgetsContentLoading != 0"];
  v234[5] = v73;
  v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v234 count:6];
  v217 = [v216 sectionWithRows:v74 title:@"Loading"];

  v212 = (void *)MEMORY[0x1E4F94160];
  v75 = (void *)MEMORY[0x1E4F941F0];
  v207 = NSStringFromSelector(sel_useCuratedLibraryLayout);
  v202 = [v75 rowWithTitle:@"Curated Library Layout" valueKeyPath:v207];
  v233[0] = v202;
  v76 = (void *)MEMORY[0x1E4F941F0];
  v197 = NSStringFromSelector(sel_allowItemReorderingInCuratedLayout);
  v192 = [v76 rowWithTitle:@"Allow Curated Items Reordering" valueKeyPath:v197];
  v233[1] = v192;
  v77 = (void *)MEMORY[0x1E4F941F0];
  v187 = NSStringFromSelector(sel_editorialLayoutEdit);
  v182 = [v77 rowWithTitle:@"Editorial Layout Edit" valueKeyPath:v187];
  v233[2] = v182;
  v78 = (void *)MEMORY[0x1E4F941D8];
  v177 = NSStringFromSelector(sel_editorialLayoutColumns);
  v172 = [v78 rowWithTitle:@"Editorial Layout Columns" valueKeyPath:v177];
  v167 = [v172 minValue:3.0 maxValue:8.0];
  v163 = objc_msgSend(v167, "px_increment:", 1.0);
  v233[3] = v163;
  v79 = (void *)MEMORY[0x1E4F94108];
  v160 = NSStringFromSelector(sel_editorialLayoutTargetRowsForChunk);
  v157 = [v79 rowWithTitle:@"Editorial Layout Target Rows For Chunk" valueKeyPath:v160];
  v154 = [v157 possibleValues:&unk_1F02D4918 titles:&unk_1F02D4930];
  v233[4] = v154;
  v80 = (void *)MEMORY[0x1E4F941F0];
  v151 = NSStringFromSelector(sel_editorialLayoutAvoidSmallestTile);
  v148 = [v80 rowWithTitle:@"Editorial Layout Avoid Smallest Tile" valueKeyPath:v151];
  v233[5] = v148;
  v81 = (void *)MEMORY[0x1E4F94108];
  v146 = NSStringFromSelector(sel_editorialLayoutActivityFeedItemCountThreshold);
  v144 = [v81 rowWithTitle:@"Editorial Activity Feed Layout" valueKeyPath:v146];
  v142 = [v144 possibleValues:&unk_1F02D4948 titles:&unk_1F02D4960];
  v233[6] = v142;
  v82 = (void *)MEMORY[0x1E4F941D8];
  v83 = NSStringFromSelector(sel_assetsWidgetPlaceholderAspectRatio);
  v84 = [v82 rowWithTitle:@"Placeholder Aspect Ratio" valueKeyPath:v83];
  v85 = [v84 minValue:0.25 maxValue:4.0];
  v86 = objc_msgSend(v85, "px_increment:", 0.25);
  v233[7] = v86;
  v87 = (void *)MEMORY[0x1E4F941F0];
  v88 = NSStringFromSelector(sel_allowEditorialLayoutStressTest);
  v89 = [v87 rowWithTitle:@"Allow Editorial Layout Stress Test" valueKeyPath:v88];
  v233[8] = v89;
  v90 = (void *)MEMORY[0x1E4F94108];
  v91 = NSStringFromSelector(sel_debugBadgeInfoType);
  v92 = [v90 rowWithTitle:@"Debug Badges" valueKeyPath:v91];
  v93 = [v92 possibleValues:&unk_1F02D4978 titles:&unk_1F02D4990];
  v233[9] = v93;
  v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v233 count:10];
  v213 = [v212 sectionWithRows:v94 title:@"Assets Widget" conditionFormat:@"showAssetsWidget != 0"];

  v95 = (void *)MEMORY[0x1E4F94160];
  v96 = (void *)MEMORY[0x1E4F941F0];
  v97 = NSStringFromSelector(sel_peopleWidgetDisableSocialGroup);
  v98 = [v96 rowWithTitle:@"Disable Social Groups" valueKeyPath:v97];
  v232[0] = v98;
  v99 = (void *)MEMORY[0x1E4F941D8];
  v100 = NSStringFromSelector(sel_peopleWidgetMaximumNumberOfPeople);
  v101 = [v99 rowWithTitle:@"Max Number of People" valueKeyPath:v100];
  v102 = [v101 minValue:0.0 maxValue:20.0];
  v103 = objc_msgSend(v102, "px_increment:", 1.0);
  v232[1] = v103;
  v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v232 count:2];
  v208 = [v95 sectionWithRows:v104 title:@"People Widget" conditionFormat:@"showRelatedPeopleWidget != 0"];

  v105 = (void *)MEMORY[0x1E4F94160];
  v106 = (void *)MEMORY[0x1E4F941F0];
  v107 = NSStringFromSelector(sel_placesWidgetShowOnlyPlaceholder);
  v108 = [v106 rowWithTitle:@"Placeholder Only" valueKeyPath:v107];
  v231 = v108;
  v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v231 count:1];
  v203 = [v105 sectionWithRows:v109 title:@"Places Widget" conditionFormat:@"showPlacesWidget != 0"];

  v110 = (void *)MEMORY[0x1E4F94160];
  v111 = (void *)MEMORY[0x1E4F941F0];
  v112 = NSStringFromSelector(sel_showLookUpWidgetSearchIcon);
  v113 = [v111 rowWithTitle:@"Enable Search Icon" valueKeyPath:v112];
  v230 = v113;
  v114 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v230 count:1];
  v198 = [v110 sectionWithRows:v114 title:@"Visual LookUp Widget" conditionFormat:@"showVisualLookUpWidget != 0"];

  v173 = (void *)MEMORY[0x1E4F94160];
  v115 = (void *)MEMORY[0x1E4F941F0];
  v193 = NSStringFromSelector(sel_captionWidgetEnableHashtags);
  v188 = [v115 rowWithTitle:@"Enable Hashtags" valueKeyPath:v193];
  v229[0] = v188;
  v116 = (void *)MEMORY[0x1E4F941F0];
  v183 = NSStringFromSelector(sel_captionWidgetEnableVScrollingInEdit);
  v178 = [v116 rowWithTitle:@"Enable V-Scrolling in Edit" valueKeyPath:v183];
  v229[1] = v178;
  v117 = (void *)MEMORY[0x1E4F941F0];
  v168 = NSStringFromSelector(sel_captionWidgetEnableFadeInEffect);
  v118 = [v117 rowWithTitle:@"Enable Fade-In effect" valueKeyPath:v168];
  v229[2] = v118;
  v119 = (void *)MEMORY[0x1E4F941D8];
  v120 = NSStringFromSelector(sel_captionWidgetFadeInDuration);
  v121 = [v119 rowWithTitle:@"Fade-In duration" valueKeyPath:v120];
  v122 = [v121 minValue:0.25 maxValue:1.0];
  v123 = objc_msgSend(v122, "px_increment:", 0.05);
  v124 = [v123 conditionFormat:@"captionWidgetEnableFadeInEffect != 0"];
  v229[3] = v124;
  v125 = (void *)MEMORY[0x1E4F941F0];
  v126 = NSStringFromSelector(sel_captionWidgetEnableDirectAttachToMaster);
  v127 = [v125 rowWithTitle:@"Enable Direct Attach to Master Photo" valueKeyPath:v126];
  v229[4] = v127;
  v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:v229 count:5];
  v129 = [v173 sectionWithRows:v128 title:@"Caption Widget" conditionFormat:@"showCaptionHashtagsWidget != 0"];

  v130 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v131 = (void *)MEMORY[0x1E4F94160];
  v228[0] = v222;
  v228[1] = v221;
  v228[2] = aSelector;
  v228[3] = v217;
  v228[4] = v213;
  v228[5] = v129;
  v228[6] = v198;
  v228[7] = v208;
  v228[8] = v203;
  v228[9] = v130;
  v132 = [MEMORY[0x1E4F1C978] arrayWithObjects:v228 count:10];
  v133 = [v131 moduleWithTitle:@"Photos Details" contents:v132];

  return v133;
}

void __55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v9 = [v2 librarySpecificFetchOptions];
  [v9 setFetchLimit:1];
  id v4 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v9];
  id v5 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v4 options:0];
  [(PXPhotosDataSourceConfiguration *)v5 setHideHiddenAssets:1];
  id v6 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v5];
  id v7 = [[PXPhotosDetailsContext alloc] initWithPhotosDataSource:v6 displayTitleInfo:0 parentContext:0 keyAssetsFetchResult:0];
  id v8 = [[PXPhotosDetailsUIViewController alloc] initWithContext:v7 options:3072];
  objc_msgSend(v3, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v8, 1, 1, 0);
}

uint64_t __55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1)
{
  return 1;
}

__CFString *__55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  return PXPhotosCurationAlgorithmDescription(v2);
}

- (BOOL)formattedLensStringsEnabled
{
  return self->_formattedLensStringsEnabled;
}

- (BOOL)showActionableLivePhotosBadge
{
  return self->_showActionableLivePhotosBadge;
}

- (BOOL)mapWidgetAllowCopyPasteLocation
{
  return self->_mapWidgetAllowCopyPasteLocation;
}

- (BOOL)draggableInfoPanelEnabled
{
  return self->_draggableInfoPanelEnabled;
}

- (int64_t)peopleWidgetMaximumNumberOfPeople
{
  return self->_peopleWidgetMaximumNumberOfPeople;
}

- (BOOL)peopleWidgetDisableSocialGroup
{
  return self->_peopleWidgetDisableSocialGroup;
}

- (BOOL)captionWidgetEnableDirectAttachToMaster
{
  return self->_captionWidgetEnableDirectAttachToMaster;
}

- (double)captionWidgetFadeInDuration
{
  return self->_captionWidgetFadeInDuration;
}

- (BOOL)captionWidgetEnableFadeInEffect
{
  return self->_captionWidgetEnableFadeInEffect;
}

- (BOOL)captionWidgetEnableVScrollingInEdit
{
  return self->_captionWidgetEnableVScrollingInEdit;
}

- (BOOL)captionWidgetEnableHashtags
{
  return self->_captionWidgetEnableHashtags;
}

- (BOOL)showLookUpWidgetSearchIcon
{
  return self->_showLookUpWidgetSearchIcon;
}

- (BOOL)placesWidgetShowOnlyPlaceholder
{
  return self->_placesWidgetShowOnlyPlaceholder;
}

- (BOOL)allowEditorialLayoutStressTest
{
  return self->_allowEditorialLayoutStressTest;
}

- (double)assetsWidgetPlaceholderAspectRatio
{
  return self->_assetsWidgetPlaceholderAspectRatio;
}

- (int64_t)editorialLayoutActivityFeedItemCountThreshold
{
  return self->_editorialLayoutActivityFeedItemCountThreshold;
}

- (BOOL)editorialLayoutAvoidSmallestTile
{
  return self->_editorialLayoutAvoidSmallestTile;
}

- (int64_t)editorialLayoutTargetRowsForChunk
{
  return self->_editorialLayoutTargetRowsForChunk;
}

- (int64_t)editorialLayoutColumns
{
  return self->_editorialLayoutColumns;
}

- (BOOL)editorialLayoutEdit
{
  return self->_editorialLayoutEdit;
}

- (BOOL)allowItemReorderingInCuratedLayout
{
  return self->_allowItemReorderingInCuratedLayout;
}

- (BOOL)useCuratedLibraryLayout
{
  return self->_useCuratedLibraryLayout;
}

- (int64_t)detailViewsToKeepLoaded
{
  return self->_detailViewsToKeepLoaded;
}

- (BOOL)purgeOnMemoryWarning
{
  return self->_purgeOnMemoryWarning;
}

- (BOOL)allowsTopTrailingSelectCancelButton
{
  return self->_allowsTopTrailingSelectCancelButton;
}

- (BOOL)allowMultiColumnLayout
{
  return self->_allowMultiColumnLayout;
}

- (double)defaultPriorityWidgetsLoadingDelay
{
  return self->_defaultPriorityWidgetsLoadingDelay;
}

- (BOOL)loadAllWidgetsContentOnScroll
{
  return self->_loadAllWidgetsContentOnScroll;
}

- (BOOL)loadAllWidgetsContentAfterDelay
{
  return self->_loadAllWidgetsContentAfterDelay;
}

- (BOOL)allowWidgetsContentLoading
{
  return self->_allowWidgetsContentLoading;
}

- (BOOL)showFacesAreaRect
{
  return self->_showFacesAreaRect;
}

- (BOOL)showPeopleInlineCandidateWidget
{
  return self->_showPeopleInlineCandidateWidget;
}

- (BOOL)showActionsWidget
{
  return self->_showActionsWidget;
}

- (BOOL)showSharedLibraryWidget
{
  return self->_showSharedLibraryWidget;
}

- (BOOL)showRelatedPeopleWidget
{
  return self->_showRelatedPeopleWidget;
}

- (BOOL)showPlacesWidget
{
  return self->_showPlacesWidget;
}

- (BOOL)showDemoDynamicWidget
{
  return self->_showDemoDynamicWidget;
}

- (BOOL)showDemoViewWidget
{
  return self->_showDemoViewWidget;
}

- (BOOL)showDemoTilingViewWidget
{
  return self->_showDemoTilingViewWidget;
}

- (BOOL)showAssetRichDescription
{
  return self->_showAssetRichDescription;
}

- (BOOL)showAssetDescriptionWidget
{
  return self->_showAssetDescriptionWidget;
}

- (BOOL)showEXIFWidget
{
  return self->_showEXIFWidget;
}

- (BOOL)showTimeWidget
{
  return self->_showTimeWidget;
}

- (BOOL)showVisualLookUpWidget
{
  return self->_showVisualLookUpWidget;
}

- (BOOL)showAppAttributionWidget
{
  return self->_showAppAttributionWidget;
}

- (BOOL)showAlbumAttributionWidget
{
  return self->_showAlbumAttributionWidget;
}

- (BOOL)showCaptionHashtagsWidget
{
  return self->_showCaptionHashtagsWidget;
}

- (BOOL)showAssetsWidget
{
  return self->_showAssetsWidget;
}

- (BOOL)showHeaderWidget
{
  return self->_showHeaderWidget;
}

- (int64_t)version
{
  return 2;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)transientProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PXPhotosDetailsSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_218990 != -1) {
    dispatch_once(&transientProperties_onceToken_218990, block);
  }
  unint64_t v2 = (void *)transientProperties_transientProperties_218991;
  return v2;
}

void __46__PXPhotosDetailsSettings_transientProperties__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXPhotosDetailsSettings;
  v1 = objc_msgSendSuper2(&v5, sel_transientProperties);
  unint64_t v2 = NSStringFromSelector(sel_debugBadgeInfo);
  uint64_t v3 = [v1 setByAddingObject:v2];
  id v4 = (void *)transientProperties_transientProperties_218991;
  transientProperties_transientProperties_218991 = v3;
}

@end