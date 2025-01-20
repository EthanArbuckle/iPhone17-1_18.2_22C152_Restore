@interface PXPhotosGridSettings
+ (PXPhotosGridSettings)sharedInstance;
+ (id)_enableTungstenNewFeaturesAction;
+ (id)_enableTungstenNewFeaturesActionPredicate;
+ (id)settingsControllerModule;
- (BOOL)backdropStyleForPlacesAndImports;
- (BOOL)colorNavbarArea;
- (BOOL)emulatesEmptyLibrary;
- (BOOL)enableAspectFitButton;
- (BOOL)enableAspectFitToggle;
- (BOOL)enableBlurAndScrollSnapInContiguousGrids;
- (BOOL)enableBlurInContiguousCollections;
- (BOOL)enableContentFiltering;
- (BOOL)enableDetailsMenuAction;
- (BOOL)enableFilterDropDownButton;
- (BOOL)enableFilterViewControllerAnchoringToSender;
- (BOOL)enableInCMM;
- (BOOL)enableInvisibleNavBars;
- (BOOL)enableMultiSelectMenu;
- (BOOL)enableNewActionMenu;
- (BOOL)enablePreviewKeyAssetFetching;
- (BOOL)enableScrollSnapInContiguousCollections;
- (BOOL)enableShowMoreButtonsInEditorialLens;
- (BOOL)enableSortAction;
- (BOOL)enableStacksReviewUI;
- (BOOL)enableSuperzoom;
- (BOOL)enableTitleLegibilityDimmingFilter;
- (BOOL)enableZoomInOutButton;
- (BOOL)exposeMoviePresentationAction;
- (BOOL)forceFooterVisible;
- (BOOL)gridBadgesForAllMediaTypes;
- (BOOL)gridBadgesOnlyShowGlyph;
- (BOOL)gridBadgesPortraitEnabled;
- (BOOL)shouldCurateEditorialLens;
- (BOOL)showCollectionKindInPreviewHeaderToggleAction;
- (BOOL)showLivePhotoFilter;
- (BOOL)showPortraitFilter;
- (BOOL)useGradientSectionHeaders;
- (NSString)actionMenuGlyphName;
- (double)behindContentBackgroundGradientAlpha;
- (double)blurFadeDistance;
- (double)defaultAnimationDuration;
- (double)headerGradientAlpha;
- (double)headerGradientHeight;
- (double)headerTitleBottomSpacing;
- (double)headerTitleTopSpacing;
- (double)matchMoveAnimationDuration;
- (double)maximumBlurDimmingFraction;
- (double)maximumBlurRadius;
- (double)maximumCommonFocus;
- (double)scrollSnapMaximumAccelerationFactor;
- (double)scrollSnapMaximumDecelerationFactor;
- (double)sectionHeaderGradientAlpha;
- (double)sectionHeaderGradientOverhang;
- (double)simulatedLoadDelay;
- (id)parentSettings;
- (int64_t)searchActionLocationOnPhone;
- (void)setActionMenuGlyphName:(id)a3;
- (void)setBackdropStyleForPlacesAndImports:(BOOL)a3;
- (void)setBehindContentBackgroundGradientAlpha:(double)a3;
- (void)setBlurFadeDistance:(double)a3;
- (void)setColorNavbarArea:(BOOL)a3;
- (void)setDefaultAnimationDuration:(double)a3;
- (void)setDefaultValues;
- (void)setEmulatesEmptyLibrary:(BOOL)a3;
- (void)setEnableAspectFitButton:(BOOL)a3;
- (void)setEnableAspectFitToggle:(BOOL)a3;
- (void)setEnableBlurAndScrollSnapInContiguousGrids:(BOOL)a3;
- (void)setEnableBlurInContiguousCollections:(BOOL)a3;
- (void)setEnableContentFiltering:(BOOL)a3;
- (void)setEnableDetailsMenuAction:(BOOL)a3;
- (void)setEnableFilterDropDownButton:(BOOL)a3;
- (void)setEnableFilterViewControllerAnchoringToSender:(BOOL)a3;
- (void)setEnableInCMM:(BOOL)a3;
- (void)setEnableInvisibleNavBars:(BOOL)a3;
- (void)setEnableMultiSelectMenu:(BOOL)a3;
- (void)setEnableNewActionMenu:(BOOL)a3;
- (void)setEnablePreviewKeyAssetFetching:(BOOL)a3;
- (void)setEnableScrollSnapInContiguousCollections:(BOOL)a3;
- (void)setEnableShowMoreButtonsInEditorialLens:(BOOL)a3;
- (void)setEnableSortAction:(BOOL)a3;
- (void)setEnableStacksReviewUI:(BOOL)a3;
- (void)setEnableSuperzoom:(BOOL)a3;
- (void)setEnableTitleLegibilityDimmingFilter:(BOOL)a3;
- (void)setEnableZoomInOutButton:(BOOL)a3;
- (void)setExposeMoviePresentationAction:(BOOL)a3;
- (void)setForceFooterVisible:(BOOL)a3;
- (void)setGridBadgesForAllMediaTypes:(BOOL)a3;
- (void)setGridBadgesOnlyShowGlyph:(BOOL)a3;
- (void)setGridBadgesPortraitEnabled:(BOOL)a3;
- (void)setHeaderGradientAlpha:(double)a3;
- (void)setHeaderGradientHeight:(double)a3;
- (void)setHeaderTitleBottomSpacing:(double)a3;
- (void)setHeaderTitleTopSpacing:(double)a3;
- (void)setMatchMoveAnimationDuration:(double)a3;
- (void)setMaximumBlurDimmingFraction:(double)a3;
- (void)setMaximumBlurRadius:(double)a3;
- (void)setMaximumCommonFocus:(double)a3;
- (void)setScrollSnapMaximumAccelerationFactor:(double)a3;
- (void)setScrollSnapMaximumDecelerationFactor:(double)a3;
- (void)setSearchActionLocationOnPhone:(int64_t)a3;
- (void)setSectionHeaderGradientAlpha:(double)a3;
- (void)setSectionHeaderGradientOverhang:(double)a3;
- (void)setShouldCurateEditorialLens:(BOOL)a3;
- (void)setShowCollectionKindInPreviewHeaderToggleAction:(BOOL)a3;
- (void)setShowLivePhotoFilter:(BOOL)a3;
- (void)setShowPortraitFilter:(BOOL)a3;
- (void)setSimulatedLoadDelay:(double)a3;
- (void)setUseGradientSectionHeaders:(BOOL)a3;
@end

@implementation PXPhotosGridSettings

+ (PXPhotosGridSettings)sharedInstance
{
  if (sharedInstance_onceToken_284664 != -1) {
    dispatch_once(&sharedInstance_onceToken_284664, &__block_literal_global_284665);
  }
  v2 = (void *)sharedInstance_sharedInstance_284666;
  return (PXPhotosGridSettings *)v2;
}

- (BOOL)enableZoomInOutButton
{
  return self->_enableZoomInOutButton;
}

- (BOOL)enableAspectFitButton
{
  return self->_enableAspectFitButton;
}

- (BOOL)enableNewActionMenu
{
  return self->_enableNewActionMenu;
}

- (BOOL)enableContentFiltering
{
  return self->_enableContentFiltering;
}

- (double)headerGradientHeight
{
  return self->_headerGradientHeight;
}

- (double)headerGradientAlpha
{
  return self->_headerGradientAlpha;
}

- (BOOL)enableStacksReviewUI
{
  return self->_enableStacksReviewUI;
}

- (void)setDefaultValues
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosGridSettings;
  [(PTSettings *)&v7 setDefaultValues];
  [(PXPhotosGridSettings *)self setEnableBlurInContiguousCollections:1];
  [(PXPhotosGridSettings *)self setMaximumBlurRadius:12.0];
  [(PXPhotosGridSettings *)self setMaximumBlurDimmingFraction:0.5];
  [(PXPhotosGridSettings *)self setBlurFadeDistance:200.0];
  [(PXPhotosGridSettings *)self setMaximumCommonFocus:1.0];
  [(PXPhotosGridSettings *)self setEnableScrollSnapInContiguousCollections:1];
  [(PXPhotosGridSettings *)self setScrollSnapMaximumDecelerationFactor:10.0];
  [(PXPhotosGridSettings *)self setScrollSnapMaximumAccelerationFactor:1.2];
  [(PXPhotosGridSettings *)self setEnableShowMoreButtonsInEditorialLens:0];
  [(PXPhotosGridSettings *)self setEnableBlurAndScrollSnapInContiguousGrids:0];
  [(PXPhotosGridSettings *)self setEmulatesEmptyLibrary:0];
  [(PXPhotosGridSettings *)self setForceFooterVisible:0];
  [(PXPhotosGridSettings *)self setSimulatedLoadDelay:0.0];
  [(PXPhotosGridSettings *)self setDefaultAnimationDuration:0.4];
  [(PXPhotosGridSettings *)self setMatchMoveAnimationDuration:0.4];
  [(PXPhotosGridSettings *)self setEnableInCMM:0];
  [(PXPhotosGridSettings *)self setEnablePreviewKeyAssetFetching:1];
  [(PXPhotosGridSettings *)self setEnableSuperzoom:1];
  [(PXPhotosGridSettings *)self setEnableInvisibleNavBars:1];
  [(PXPhotosGridSettings *)self setEnableSortAction:1];
  [(PXPhotosGridSettings *)self setEnableAspectFitToggle:1];
  [(PXPhotosGridSettings *)self setEnableAspectFitButton:1];
  [(PXPhotosGridSettings *)self setEnableZoomInOutButton:0];
  [(PXPhotosGridSettings *)self setEnableContentFiltering:1];
  [(PXPhotosGridSettings *)self setEnableMultiSelectMenu:1];
  [(PXPhotosGridSettings *)self setEnableNewActionMenu:1];
  [(PXPhotosGridSettings *)self setEnableFilterDropDownButton:0];
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  -[PXPhotosGridSettings setEnableFilterViewControllerAnchoringToSender:](self, "setEnableFilterViewControllerAnchoringToSender:", [v3 userInterfaceIdiom] == 1);

  [(PXPhotosGridSettings *)self setEnableDetailsMenuAction:0];
  [(PXPhotosGridSettings *)self setExposeMoviePresentationAction:0];
  [(PXPhotosGridSettings *)self setEnableTitleLegibilityDimmingFilter:0];
  [(PXPhotosGridSettings *)self setBackdropStyleForPlacesAndImports:1];
  [(PXPhotosGridSettings *)self setColorNavbarArea:0];
  [(PXPhotosGridSettings *)self setHeaderTitleTopSpacing:2.0];
  [(PXPhotosGridSettings *)self setHeaderTitleBottomSpacing:12.0];
  [(PXPhotosGridSettings *)self setUseGradientSectionHeaders:1];
  [(PXPhotosGridSettings *)self setSectionHeaderGradientOverhang:60.0];
  [(PXPhotosGridSettings *)self setSectionHeaderGradientAlpha:0.45];
  [(PXPhotosGridSettings *)self setShowLivePhotoFilter:0];
  [(PXPhotosGridSettings *)self setShowPortraitFilter:0];
  [(PXPhotosGridSettings *)self setHeaderGradientHeight:150.0];
  [(PXPhotosGridSettings *)self setHeaderGradientAlpha:0.5];
  [(PXPhotosGridSettings *)self setBehindContentBackgroundGradientAlpha:0.25];
  [(PXPhotosGridSettings *)self setSearchActionLocationOnPhone:2];
  [(PXPhotosGridSettings *)self setActionMenuGlyphName:@"ellipsis.circle"];
  [(PXPhotosGridSettings *)self setShowCollectionKindInPreviewHeaderToggleAction:0];
  [(PXPhotosGridSettings *)self setShouldCurateEditorialLens:1];
  [(PXPhotosGridSettings *)self setGridBadgesOnlyShowGlyph:0];
  [(PXPhotosGridSettings *)self setGridBadgesPortraitEnabled:0];
  [(PXPhotosGridSettings *)self setGridBadgesForAllMediaTypes:0];
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 objectForKey:@"PXPhotosGridEnableStacksReviewUI"];

  if (v5) {
    uint64_t v6 = [v5 BOOLValue];
  }
  else {
    uint64_t v6 = 0;
  }
  [(PXPhotosGridSettings *)self setEnableStacksReviewUI:v6];
}

- (void)setUseGradientSectionHeaders:(BOOL)a3
{
  self->_useGradientSectionHeaders = a3;
}

- (void)setShowPortraitFilter:(BOOL)a3
{
  self->_showPortraitFilter = a3;
}

- (void)setShowLivePhotoFilter:(BOOL)a3
{
  self->_showLivePhotoFilter = a3;
}

- (void)setShowCollectionKindInPreviewHeaderToggleAction:(BOOL)a3
{
  self->_showCollectionKindInPreviewHeaderToggleAction = a3;
}

- (void)setShouldCurateEditorialLens:(BOOL)a3
{
  self->_shouldCurateEditorialLens = a3;
}

- (void)setSectionHeaderGradientOverhang:(double)a3
{
  self->_sectionHeaderGradientOverhang = a3;
}

- (void)setSectionHeaderGradientAlpha:(double)a3
{
  self->_sectionHeaderGradientAlpha = a3;
}

- (void)setSearchActionLocationOnPhone:(int64_t)a3
{
  self->_searchActionLocationOnPhone = a3;
}

- (void)setScrollSnapMaximumDecelerationFactor:(double)a3
{
  self->_scrollSnapMaximumDecelerationFactor = a3;
}

- (void)setScrollSnapMaximumAccelerationFactor:(double)a3
{
  self->_scrollSnapMaximumAccelerationFactor = a3;
}

- (void)setMaximumCommonFocus:(double)a3
{
  self->_maximumCommonFocus = a3;
}

- (void)setMaximumBlurRadius:(double)a3
{
  self->_maximumBlurRadius = a3;
}

- (void)setMaximumBlurDimmingFraction:(double)a3
{
  self->_maximumBlurDimmingFraction = a3;
}

- (void)setMatchMoveAnimationDuration:(double)a3
{
  self->_matchMoveAnimationDuration = a3;
}

- (void)setHeaderTitleTopSpacing:(double)a3
{
  self->_headerTitleTopSpacing = a3;
}

- (void)setHeaderTitleBottomSpacing:(double)a3
{
  self->_headerTitleBottomSpacing = a3;
}

- (void)setHeaderGradientHeight:(double)a3
{
  self->_headerGradientHeight = a3;
}

- (void)setHeaderGradientAlpha:(double)a3
{
  self->_headerGradientAlpha = a3;
}

- (void)setGridBadgesPortraitEnabled:(BOOL)a3
{
  self->_gridBadgesPortraitEnabled = a3;
}

- (void)setGridBadgesOnlyShowGlyph:(BOOL)a3
{
  self->_gridBadgesOnlyShowGlyph = a3;
}

- (void)setGridBadgesForAllMediaTypes:(BOOL)a3
{
  self->_gridBadgesForAllMediaTypes = a3;
}

- (void)setForceFooterVisible:(BOOL)a3
{
  self->_forceFooterVisible = a3;
}

- (void)setExposeMoviePresentationAction:(BOOL)a3
{
  self->_exposeMoviePresentationAction = a3;
}

- (void)setEnableZoomInOutButton:(BOOL)a3
{
  self->_enableZoomInOutButton = a3;
}

- (void)setEnableTitleLegibilityDimmingFilter:(BOOL)a3
{
  self->_enableTitleLegibilityDimmingFilter = a3;
}

- (void)setEnableSuperzoom:(BOOL)a3
{
  self->_enableSuperzoom = a3;
}

- (void)setEnableStacksReviewUI:(BOOL)a3
{
  self->_enableStacksReviewUI = a3;
}

- (void)setEnableSortAction:(BOOL)a3
{
  self->_enableSortAction = a3;
}

- (void)setEnableShowMoreButtonsInEditorialLens:(BOOL)a3
{
  self->_enableShowMoreButtonsInEditorialLens = a3;
}

- (void)setEnableScrollSnapInContiguousCollections:(BOOL)a3
{
  self->_enableScrollSnapInContiguousCollections = a3;
}

- (void)setEnablePreviewKeyAssetFetching:(BOOL)a3
{
  self->_enablePreviewKeyAssetFetching = a3;
}

- (void)setEnableNewActionMenu:(BOOL)a3
{
  self->_enableNewActionMenu = a3;
}

- (void)setEnableMultiSelectMenu:(BOOL)a3
{
  self->_enableMultiSelectMenu = a3;
}

- (void)setEnableInvisibleNavBars:(BOOL)a3
{
  self->_enableInvisibleNavBars = a3;
}

- (void)setEnableInCMM:(BOOL)a3
{
  self->_enableInCMM = a3;
}

- (void)setEnableFilterViewControllerAnchoringToSender:(BOOL)a3
{
  self->_enableFilterViewControllerAnchoringToSender = a3;
}

- (void)setEnableFilterDropDownButton:(BOOL)a3
{
  self->_enableFilterDropDownButton = a3;
}

- (void)setEnableDetailsMenuAction:(BOOL)a3
{
  self->_enableDetailsMenuAction = a3;
}

- (void)setEnableContentFiltering:(BOOL)a3
{
  self->_enableContentFiltering = a3;
}

- (void)setEnableBlurInContiguousCollections:(BOOL)a3
{
  self->_enableBlurInContiguousCollections = a3;
}

- (void)setEnableBlurAndScrollSnapInContiguousGrids:(BOOL)a3
{
  self->_enableBlurAndScrollSnapInContiguousGrids = a3;
}

- (void)setEnableAspectFitToggle:(BOOL)a3
{
  self->_enableAspectFitToggle = a3;
}

- (void)setEnableAspectFitButton:(BOOL)a3
{
  self->_enableAspectFitButton = a3;
}

- (void)setEmulatesEmptyLibrary:(BOOL)a3
{
  self->_emulatesEmptyLibrary = a3;
}

- (void)setDefaultAnimationDuration:(double)a3
{
  self->_defaultAnimationDuration = a3;
}

- (void)setColorNavbarArea:(BOOL)a3
{
  self->_colorNavbarArea = a3;
}

- (void)setBlurFadeDistance:(double)a3
{
  self->_blurFadeDistance = a3;
}

- (void)setBehindContentBackgroundGradientAlpha:(double)a3
{
  self->_behindContentBackgroundGradientAlpha = a3;
}

- (void)setBackdropStyleForPlacesAndImports:(BOOL)a3
{
  self->_backdropStyleForPlacesAndImports = a3;
}

- (void)setActionMenuGlyphName:(id)a3
{
}

void __38__PXPhotosGridSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 photosGridSettings];
  v1 = (void *)sharedInstance_sharedInstance_284666;
  sharedInstance_sharedInstance_284666 = v0;
}

+ (id)_enableTungstenNewFeaturesActionPredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"enableSuperzoom == NO || enableNewActionMenu == NO || enableInvisibleNavBars == NO || enableSortAction == NO || enableContentFiltering == NO || enableAspectFitToggle == NO || enableAspectFitButton == NO || enableZoomInOutButton == YES || enableFilterDropDownButton == YES"];
}

+ (id)_enableTungstenNewFeaturesAction
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PXPhotosGridSettings_UI___enableTungstenNewFeaturesAction__block_invoke;
  v4[3] = &__block_descriptor_48_e33_B24__0_8__PTUIModuleController_16l;
  v4[4] = a2;
  v4[5] = a1;
  id v2 = [MEMORY[0x1E4F94190] actionWithHandler:v4];
  return v2;
}

uint64_t __60__PXPhotosGridSettings_UI___enableTungstenNewFeaturesAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 settings];
  if (!v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v6 handleFailureInMethod:v7, v8, @"PXPhotosGridSettings+UI.m", 130, @"%@ should be an instance inheriting from %@, but it is nil", @"moduleController.settings", v10 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v13);
    v14 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v6 handleFailureInMethod:v11, v12, @"PXPhotosGridSettings+UI.m", 130, @"%@ should be an instance inheriting from %@, but it is %@", @"moduleController.settings", v10, v14 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  [v4 setEnableSuperzoom:1];
  [v4 setEnableNewActionMenu:1];
  [v4 setEnableInvisibleNavBars:1];
  [v4 setEnableSortAction:1];
  [v4 setEnableContentFiltering:1];
  [v4 setEnableAspectFitToggle:1];
  [v4 setEnableAspectFitButton:1];
  [v4 setEnableZoomInOutButton:0];
  [v4 setEnableFilterDropDownButton:0];

  return 1;
}

+ (id)settingsControllerModule
{
  v233[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  v3 = (void *)MEMORY[0x1E4F941F0];
  v4 = NSStringFromSelector(sel_shouldCurateEditorialLens);
  v5 = [v3 rowWithTitle:@"Curate Editorial" valueKeyPath:v4];
  v233[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v233 count:1];
  v222 = [v2 sectionWithRows:v6 title:@"View Modes"];

  v220 = (void *)MEMORY[0x1E4F94160];
  uint64_t v7 = (void *)MEMORY[0x1E4F941F0];
  v217 = NSStringFromSelector(sel_enableBlurInContiguousCollections);
  v212 = [v7 rowWithTitle:@"Blur" valueKeyPath:v217];
  v232[0] = v212;
  uint64_t v8 = (void *)MEMORY[0x1E4F941D8];
  v209 = NSStringFromSelector(sel_maximumBlurRadius);
  v206 = [v8 rowWithTitle:@"Blur Radius" valueKeyPath:v209];
  v202 = [v206 minValue:0.0 maxValue:20.0];
  v198 = objc_msgSend(v202, "px_increment:", 1.0);
  v232[1] = v198;
  v9 = (void *)MEMORY[0x1E4F941D8];
  v195 = NSStringFromSelector(sel_maximumBlurDimmingFraction);
  v192 = [v9 rowWithTitle:@"Dimming" valueKeyPath:v195];
  v189 = [v192 minValue:0.0 maxValue:1.0];
  v186 = objc_msgSend(v189, "px_increment:", 0.1);
  v232[2] = v186;
  v10 = (void *)MEMORY[0x1E4F941D8];
  v183 = NSStringFromSelector(sel_blurFadeDistance);
  v180 = [v10 rowWithTitle:@"Fade Distance" valueKeyPath:v183];
  v177 = [v180 minValue:0.0 maxValue:400.0];
  v174 = objc_msgSend(v177, "px_increment:", 10.0);
  v232[3] = v174;
  uint64_t v11 = (void *)MEMORY[0x1E4F941D8];
  v171 = NSStringFromSelector(sel_maximumCommonFocus);
  v168 = [v11 rowWithTitle:@"Fade Overlap" valueKeyPath:v171];
  v165 = [v168 minValue:0.0 maxValue:1.0];
  v162 = objc_msgSend(v165, "px_increment:", 0.01);
  v232[4] = v162;
  uint64_t v12 = (void *)MEMORY[0x1E4F941F0];
  v159 = NSStringFromSelector(sel_enableScrollSnapInContiguousCollections);
  v156 = [v12 rowWithTitle:@"Snap" valueKeyPath:v159];
  v232[5] = v156;
  v13 = (void *)MEMORY[0x1E4F941D8];
  v153 = NSStringFromSelector(sel_scrollSnapMaximumDecelerationFactor);
  v150 = [v13 rowWithTitle:@"Max Deceleration" valueKeyPath:v153];
  v147 = [v150 minValue:1.0 maxValue:10.0];
  v14 = objc_msgSend(v147, "px_increment:", 0.1);
  v232[6] = v14;
  v15 = (void *)MEMORY[0x1E4F941D8];
  v16 = NSStringFromSelector(sel_scrollSnapMaximumAccelerationFactor);
  v17 = [v15 rowWithTitle:@"Max Acceleration" valueKeyPath:v16];
  v18 = [v17 minValue:1.0 maxValue:10.0];
  v19 = objc_msgSend(v18, "px_increment:", 0.1);
  v232[7] = v19;
  v20 = (void *)MEMORY[0x1E4F941F0];
  v21 = NSStringFromSelector(sel_enableShowMoreButtonsInEditorialLens);
  v22 = [v20 rowWithTitle:@"Show More Buttons" valueKeyPath:v21];
  v232[8] = v22;
  v23 = (void *)MEMORY[0x1E4F941F0];
  v24 = NSStringFromSelector(sel_enableBlurAndScrollSnapInContiguousGrids);
  v25 = [v23 rowWithTitle:@"Blur & Snap in Grids" valueKeyPath:v24];
  v232[9] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v232 count:10];
  v221 = [v220 sectionWithRows:v26 title:@"Contiguous Collections"];

  v218 = (void *)MEMORY[0x1E4F94160];
  v27 = (void *)MEMORY[0x1E4F941D8];
  v213 = NSStringFromSelector(sel_headerGradientHeight);
  v210 = [v27 rowWithTitle:@"Header Gradient Height" valueKeyPath:v213];
  v207 = [v210 minValue:0.0 maxValue:350.0];
  v203 = objc_msgSend(v207, "px_increment:", 1.0);
  v231[0] = v203;
  v28 = (void *)MEMORY[0x1E4F941D8];
  v199 = NSStringFromSelector(sel_headerGradientAlpha);
  v196 = [v28 rowWithTitle:@"Header Gradient Alpha" valueKeyPath:v199];
  v193 = [v196 minValue:0.0 maxValue:1.0];
  v190 = objc_msgSend(v193, "px_increment:", 0.0500000007);
  v231[1] = v190;
  v29 = (void *)MEMORY[0x1E4F941D8];
  v187 = NSStringFromSelector(sel_behindContentBackgroundGradientAlpha);
  v184 = [v29 rowWithTitle:@"Behind Content Header Gradient Alpha" valueKeyPath:v187];
  v181 = [v184 minValue:0.0 maxValue:1.0];
  v178 = objc_msgSend(v181, "px_increment:", 0.0500000007);
  v231[2] = v178;
  v30 = (void *)MEMORY[0x1E4F941F0];
  v175 = NSStringFromSelector(sel_enableTitleLegibilityDimmingFilter);
  v172 = [v30 rowWithTitle:@"Title Legibility Dimming Filter" valueKeyPath:v175];
  v231[3] = v172;
  v31 = (void *)MEMORY[0x1E4F941F0];
  v169 = NSStringFromSelector(sel_colorNavbarArea);
  v166 = [v31 rowWithTitle:@"Color NavBar area" valueKeyPath:v169];
  v231[4] = v166;
  v32 = (void *)MEMORY[0x1E4F941F0];
  v163 = NSStringFromSelector(sel_backdropStyleForPlacesAndImports);
  v160 = [v32 rowWithTitle:@"Header backdrop (places/imports)" valueKeyPath:v163];
  v231[5] = v160;
  v33 = (void *)MEMORY[0x1E4F941D8];
  v157 = NSStringFromSelector(sel_headerTitleTopSpacing);
  v154 = [v33 rowWithTitle:@"Header title top spacing" valueKeyPath:v157];
  v151 = [v154 minValue:-20.0 maxValue:20.0];
  v148 = objc_msgSend(v151, "px_increment:", 1.0);
  v231[6] = v148;
  v34 = (void *)MEMORY[0x1E4F941D8];
  v145 = NSStringFromSelector(sel_headerTitleBottomSpacing);
  v143 = [v34 rowWithTitle:@"Header title bottom spacing" valueKeyPath:v145];
  v141 = [v143 minValue:0.0 maxValue:20.0];
  v140 = objc_msgSend(v141, "px_increment:", 1.0);
  v231[7] = v140;
  v35 = (void *)MEMORY[0x1E4F941F0];
  v139 = NSStringFromSelector(sel_useGradientSectionHeaders);
  v138 = [v35 rowWithTitle:@"Gradient section headers" valueKeyPath:v139];
  v231[8] = v138;
  v36 = (void *)MEMORY[0x1E4F941D8];
  v137 = NSStringFromSelector(sel_sectionHeaderGradientOverhang);
  v37 = [v36 rowWithTitle:@"Section header overhang" valueKeyPath:v137];
  v38 = [v37 minValue:0.0 maxValue:150.0];
  v39 = objc_msgSend(v38, "px_increment:", 1.0);
  v40 = [v39 conditionFormat:@"useGradientSectionHeaders != 0"];
  v231[9] = v40;
  v41 = (void *)MEMORY[0x1E4F941D8];
  v42 = NSStringFromSelector(sel_sectionHeaderGradientAlpha);
  v43 = [v41 rowWithTitle:@"Gradient Alpha" valueKeyPath:v42];
  v44 = [v43 minValue:0.0 maxValue:1.0];
  v45 = objc_msgSend(v44, "px_increment:", 0.05);
  v46 = [v45 conditionFormat:@"useGradientSectionHeaders != 0"];
  v231[10] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v231 count:11];
  v219 = [v218 sectionWithRows:v47 title:@"Title Styles"];

  v48 = (void *)MEMORY[0x1E4F94160];
  v49 = (void *)MEMORY[0x1E4F941F0];
  v50 = NSStringFromSelector(sel_enableInCMM);
  v51 = [v49 rowWithTitle:@"CMM" valueKeyPath:v50];
  v230[0] = v51;
  v52 = (void *)MEMORY[0x1E4F941F0];
  v53 = NSStringFromSelector(sel_enablePreviewKeyAssetFetching);
  v54 = [v52 rowWithTitle:@"Preview Key Asset Fetching" valueKeyPath:v53];
  v230[1] = v54;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v230 count:2];
  v214 = [v48 sectionWithRows:v55 title:@"Enablement"];

  v56 = (void *)MEMORY[0x1E4F94160];
  v57 = (void *)MEMORY[0x1E4F941F0];
  v58 = NSStringFromSelector(sel_showLivePhotoFilter);
  v59 = [v57 rowWithTitle:@"Show Live-Photo Filter" valueKeyPath:v58];
  v229[0] = v59;
  v60 = (void *)MEMORY[0x1E4F941F0];
  v61 = NSStringFromSelector(sel_showPortraitFilter);
  v62 = [v60 rowWithTitle:@"Show Portrait Filter" valueKeyPath:v61];
  v229[1] = v62;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v229 count:2];
  v211 = [v56 sectionWithRows:v63 title:@"Filtering"];

  v64 = (void *)MEMORY[0x1E4F94160];
  v65 = (void *)MEMORY[0x1E4F941F0];
  v66 = NSStringFromSelector(sel_emulatesEmptyLibrary);
  v67 = [v65 rowWithTitle:@"Emulates Empty Library" valueKeyPath:v66];
  v228[0] = v67;
  v68 = (void *)MEMORY[0x1E4F941F0];
  v69 = NSStringFromSelector(sel_forceFooterVisible);
  v70 = [v68 rowWithTitle:@"Force Footer Visible" valueKeyPath:v69];
  v228[1] = v70;
  v71 = (void *)MEMORY[0x1E4F941D8];
  v72 = NSStringFromSelector(sel_simulatedLoadDelay);
  v73 = [v71 rowWithTitle:@"Load Delay" valueKeyPath:v72];
  v74 = [v73 minValue:0.0 maxValue:2.0];
  v75 = objc_msgSend(v74, "px_increment:", 0.1);
  v228[2] = v75;
  v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v228 count:3];
  v208 = [v64 sectionWithRows:v76 title:@"Demo"];

  v173 = (void *)MEMORY[0x1E4F94160];
  v77 = (void *)MEMORY[0x1E4F940F8];
  v204 = [a1 _enableTungstenNewFeaturesAction];
  v200 = [v77 rowWithTitle:@"Enable New Features" action:v204];
  v197 = [a1 _enableTungstenNewFeaturesActionPredicate];
  v194 = [v200 condition:v197];
  v227[0] = v194;
  v78 = (void *)MEMORY[0x1E4F941F0];
  v191 = NSStringFromSelector(sel_enableSuperzoom);
  v188 = [v78 rowWithTitle:@"Superzoom" valueKeyPath:v191];
  v227[1] = v188;
  v79 = (void *)MEMORY[0x1E4F941F0];
  v185 = NSStringFromSelector(sel_enableMultiSelectMenu);
  v182 = [v79 rowWithTitle:@"Multi-Select Menu" valueKeyPath:v185];
  v227[2] = v182;
  v80 = (void *)MEMORY[0x1E4F941F0];
  v179 = NSStringFromSelector(sel_enableNewActionMenu);
  v176 = [v80 rowWithTitle:@"Enable New Action Menu" valueKeyPath:v179];
  v227[3] = v176;
  v81 = (void *)MEMORY[0x1E4F941F0];
  v170 = NSStringFromSelector(sel_enableInvisibleNavBars);
  v167 = [v81 rowWithTitle:@"Enable New Transparent Style" valueKeyPath:v170];
  v227[4] = v167;
  v82 = (void *)MEMORY[0x1E4F941F0];
  v164 = NSStringFromSelector(sel_enableSortAction);
  v161 = [v82 rowWithTitle:@"Enable Sort Action" valueKeyPath:v164];
  v227[5] = v161;
  v83 = (void *)MEMORY[0x1E4F941F0];
  v158 = NSStringFromSelector(sel_enableContentFiltering);
  v155 = [v83 rowWithTitle:@"Enable Filter Action" valueKeyPath:v158];
  v227[6] = v155;
  v84 = (void *)MEMORY[0x1E4F941F0];
  v152 = NSStringFromSelector(sel_enableAspectFitToggle);
  v149 = [v84 rowWithTitle:@"Enable Aspect Toggle Action" valueKeyPath:v152];
  v227[7] = v149;
  v85 = (void *)MEMORY[0x1E4F941F0];
  v146 = NSStringFromSelector(sel_enableAspectFitButton);
  v144 = [v85 rowWithTitle:@"Enable Aspect Toggle Button" valueKeyPath:v146];
  v227[8] = v144;
  v86 = (void *)MEMORY[0x1E4F941F0];
  v142 = NSStringFromSelector(sel_enableZoomInOutButton);
  v87 = [v86 rowWithTitle:@"Enable Zoom In/Out Button" valueKeyPath:v142];
  v227[9] = v87;
  v88 = (void *)MEMORY[0x1E4F941F0];
  v89 = NSStringFromSelector(sel_enableDetailsMenuAction);
  v90 = [v88 rowWithTitle:@"Enable \"Play Memory Video\" Action" valueKeyPath:v89];
  v227[10] = v90;
  v91 = (void *)MEMORY[0x1E4F941F0];
  v92 = NSStringFromSelector(sel_exposeMoviePresentationAction);
  v93 = [v91 rowWithTitle:@"Expose Movie Presentation Action" valueKeyPath:v92];
  v227[11] = v93;
  v94 = (void *)MEMORY[0x1E4F941F0];
  v95 = NSStringFromSelector(sel_enableFilterDropDownButton);
  v96 = [v94 rowWithTitle:@"Enable Filter Dropdown Button" valueKeyPath:v95];
  v227[12] = v96;
  v97 = (void *)MEMORY[0x1E4F941F0];
  v98 = NSStringFromSelector(sel_enableFilterViewControllerAnchoringToSender);
  v99 = [v97 rowWithTitle:@"Enable Filter UI Anchor To Button" valueKeyPath:v98];
  v227[13] = v99;
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v227 count:14];
  v216 = [v173 sectionWithRows:v100 title:@"New features"];

  v101 = (void *)MEMORY[0x1E4F94160];
  v102 = (void *)MEMORY[0x1E4F941D8];
  v103 = NSStringFromSelector(sel_defaultAnimationDuration);
  v104 = [v102 rowWithTitle:@"Default Duration" valueKeyPath:v103];
  v105 = [v104 minValue:0.0 maxValue:2.0];
  v106 = objc_msgSend(v105, "px_increment:", 0.05);
  v226[0] = v106;
  v107 = (void *)MEMORY[0x1E4F941D8];
  v108 = NSStringFromSelector(sel_matchMoveAnimationDuration);
  v109 = [v107 rowWithTitle:@"Match Move Duration" valueKeyPath:v108];
  v110 = [v109 minValue:0.0 maxValue:2.0];
  v111 = objc_msgSend(v110, "px_increment:", 0.05);
  v226[1] = v111;
  v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v226 count:2];
  v205 = [v101 sectionWithRows:v112 title:@"Animations"];

  v113 = (void *)MEMORY[0x1E4F94160];
  v114 = (void *)MEMORY[0x1E4F94108];
  v115 = NSStringFromSelector(sel_searchActionLocationOnPhone);
  v116 = [v114 rowWithTitle:@"Search on Phone" valueKeyPath:v115];
  v117 = objc_msgSend(v116, "px_possibleValues:formatter:", &unk_1F02D32B0, &__block_literal_global_296);
  v225[0] = v117;
  v118 = (void *)MEMORY[0x1E4F94108];
  v119 = NSStringFromSelector(sel_actionMenuGlyphName);
  v120 = [v118 rowWithTitle:@"Action Menu" valueKeyPath:v119];
  v121 = [v120 possibleValues:&unk_1F02D3298 titles:&unk_1F02D3298];
  v225[1] = v121;
  v122 = (void *)MEMORY[0x1E4F941F0];
  v123 = NSStringFromSelector(sel_showCollectionKindInPreviewHeaderToggleAction);
  v124 = [v122 rowWithTitle:@"Collection Kind in Preview Header Toggle Action" valueKeyPath:v123];
  v225[2] = v124;
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:v225 count:3];
  v201 = [v113 sectionWithRows:v125 title:@"Actions"];

  v126 = (void *)MEMORY[0x1E4F94160];
  v127 = (void *)MEMORY[0x1E4F941F0];
  v128 = NSStringFromSelector(sel_enableStacksReviewUI);
  v129 = [v127 rowWithTitle:@"Enable" valueKeyPath:v128];
  v224 = v129;
  v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v224 count:1];
  v131 = [v126 sectionWithRows:v130 title:@"Stacks Review UI"];

  v132 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v133 = (void *)MEMORY[0x1E4F94160];
  v223[0] = v222;
  v223[1] = v221;
  v223[2] = v219;
  v223[3] = v214;
  v223[4] = v211;
  v223[5] = v208;
  v223[6] = v216;
  v223[7] = v205;
  v223[8] = v201;
  v223[9] = v131;
  v223[10] = v132;
  v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:v223 count:11];
  v135 = [v133 moduleWithTitle:@"Photos Grids" contents:v134];

  return v135;
}

__CFString *__52__PXPhotosGridSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  v3 = @"None";
  if (v2 == 1) {
    v3 = @"Bar Button";
  }
  if (v2 == 2) {
    return @"Menu Item";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
}

- (BOOL)gridBadgesForAllMediaTypes
{
  return self->_gridBadgesForAllMediaTypes;
}

- (BOOL)gridBadgesPortraitEnabled
{
  return self->_gridBadgesPortraitEnabled;
}

- (BOOL)gridBadgesOnlyShowGlyph
{
  return self->_gridBadgesOnlyShowGlyph;
}

- (BOOL)shouldCurateEditorialLens
{
  return self->_shouldCurateEditorialLens;
}

- (BOOL)showCollectionKindInPreviewHeaderToggleAction
{
  return self->_showCollectionKindInPreviewHeaderToggleAction;
}

- (NSString)actionMenuGlyphName
{
  return self->_actionMenuGlyphName;
}

- (int64_t)searchActionLocationOnPhone
{
  return self->_searchActionLocationOnPhone;
}

- (BOOL)showPortraitFilter
{
  return self->_showPortraitFilter;
}

- (BOOL)showLivePhotoFilter
{
  return self->_showLivePhotoFilter;
}

- (double)behindContentBackgroundGradientAlpha
{
  return self->_behindContentBackgroundGradientAlpha;
}

- (double)sectionHeaderGradientAlpha
{
  return self->_sectionHeaderGradientAlpha;
}

- (double)sectionHeaderGradientOverhang
{
  return self->_sectionHeaderGradientOverhang;
}

- (BOOL)useGradientSectionHeaders
{
  return self->_useGradientSectionHeaders;
}

- (double)headerTitleBottomSpacing
{
  return self->_headerTitleBottomSpacing;
}

- (double)headerTitleTopSpacing
{
  return self->_headerTitleTopSpacing;
}

- (BOOL)colorNavbarArea
{
  return self->_colorNavbarArea;
}

- (BOOL)backdropStyleForPlacesAndImports
{
  return self->_backdropStyleForPlacesAndImports;
}

- (BOOL)enableTitleLegibilityDimmingFilter
{
  return self->_enableTitleLegibilityDimmingFilter;
}

- (BOOL)enableFilterViewControllerAnchoringToSender
{
  return self->_enableFilterViewControllerAnchoringToSender;
}

- (BOOL)enableFilterDropDownButton
{
  return self->_enableFilterDropDownButton;
}

- (BOOL)exposeMoviePresentationAction
{
  return self->_exposeMoviePresentationAction;
}

- (BOOL)enableDetailsMenuAction
{
  return self->_enableDetailsMenuAction;
}

- (BOOL)enableAspectFitToggle
{
  return self->_enableAspectFitToggle;
}

- (BOOL)enableMultiSelectMenu
{
  return self->_enableMultiSelectMenu;
}

- (BOOL)enableSortAction
{
  return self->_enableSortAction;
}

- (BOOL)enableInvisibleNavBars
{
  return self->_enableInvisibleNavBars;
}

- (BOOL)enablePreviewKeyAssetFetching
{
  return self->_enablePreviewKeyAssetFetching;
}

- (BOOL)enableSuperzoom
{
  return self->_enableSuperzoom;
}

- (BOOL)enableInCMM
{
  return self->_enableInCMM;
}

- (double)matchMoveAnimationDuration
{
  return self->_matchMoveAnimationDuration;
}

- (double)defaultAnimationDuration
{
  return self->_defaultAnimationDuration;
}

- (void)setSimulatedLoadDelay:(double)a3
{
  self->_simulatedLoadDelay = a3;
}

- (double)simulatedLoadDelay
{
  return self->_simulatedLoadDelay;
}

- (BOOL)forceFooterVisible
{
  return self->_forceFooterVisible;
}

- (BOOL)emulatesEmptyLibrary
{
  return self->_emulatesEmptyLibrary;
}

- (BOOL)enableBlurAndScrollSnapInContiguousGrids
{
  return self->_enableBlurAndScrollSnapInContiguousGrids;
}

- (BOOL)enableShowMoreButtonsInEditorialLens
{
  return self->_enableShowMoreButtonsInEditorialLens;
}

- (double)scrollSnapMaximumAccelerationFactor
{
  return self->_scrollSnapMaximumAccelerationFactor;
}

- (double)scrollSnapMaximumDecelerationFactor
{
  return self->_scrollSnapMaximumDecelerationFactor;
}

- (BOOL)enableScrollSnapInContiguousCollections
{
  return self->_enableScrollSnapInContiguousCollections;
}

- (double)maximumCommonFocus
{
  return self->_maximumCommonFocus;
}

- (double)blurFadeDistance
{
  return self->_blurFadeDistance;
}

- (double)maximumBlurDimmingFraction
{
  return self->_maximumBlurDimmingFraction;
}

- (double)maximumBlurRadius
{
  return self->_maximumBlurRadius;
}

- (BOOL)enableBlurInContiguousCollections
{
  return self->_enableBlurInContiguousCollections;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

@end