@interface PXAssetsSectionLayout
+ (CGSize)estimatedSizeWithReferenceSize:(CGSize)a3 assetCollection:(id)a4 numberOfAssets:(int64_t)a5 isCurated:(BOOL)a6 zoomLevel:(int64_t)a7 spec:(id)a8;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)itemsLayout:(id)a3 cornerRadiusForItem:(int64_t)a4;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)preferredCornerRadius;
- (BOOL)_shouldAnchorOnAssetCollection;
- (BOOL)allowsDanglingUpdatesAssertions;
- (BOOL)allowsPositionDependentHeaderContentOpacity;
- (BOOL)automaticallyUpdatesPadding;
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)canStartSelecting;
- (BOOL)disableConfigurators;
- (BOOL)hasContentForSummary;
- (BOOL)isCurated;
- (BOOL)isFaceModeEnabled;
- (BOOL)isLastSection;
- (BOOL)isSelecting;
- (BOOL)isSkimming;
- (BOOL)itemCaptionsVisible;
- (BOOL)presentedSkimming;
- (BOOL)removesContentLayoutWhenEmpty;
- (BOOL)removesHeaderLayoutWhenEmpty;
- (BOOL)showsSkimmingInteraction;
- (BOOL)showsSkimmingSlideshow;
- (BOOL)wantsAssetIndexBadge;
- (BOOL)wantsDimmedSelectionStyle;
- (BOOL)wantsFileSizeBadge;
- (BOOL)wantsNumberedSelectionStyle;
- (BOOL)wantsShadow;
- (CGRect)generatedLayout:(id)a3 bestCropRectForInputItemAtIndex:(unsigned int)a4 withAspectRatio:(double)a5;
- (CGRect)itemsLayout:(id)a3 bestCropRectForItem:(int64_t)a4 withAspectRatio:(double)a5;
- (CGRect)showAllButtonFrame;
- (CGSize)itemsLayout:(id)a3 insetForItem:(int64_t)a4;
- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSNumber)preferredInitialContentLayoutNumberOfRows;
- (NSSet)draggedAssetReferences;
- (NSString)axLocalizedBaseLabel;
- (NSString)description;
- (NSString)selectAllButtonTitle;
- (NSString)showAllButtonTitle;
- (PXAssetCollectionReference)assetCollectionReference;
- (PXAssetReference)dropTargetAssetReference;
- (PXAssetsDataSource)dataSource;
- (PXAssetsSectionConfigurator)configurator;
- (PXAssetsSectionLayout)init;
- (PXAssetsSectionLayout)initWithSection:(int64_t)a3 dataSource:(id)a4 actionManager:(id)a5 loadingStatusManager:(id)a6 assetImportStatusManager:(id)a7 inlinePlaybackController:(id)a8 zoomLevel:(int64_t)a9 spec:(id)a10;
- (PXAssetsSectionLayout)initWithSection:(int64_t)a3 dataSource:(id)a4 spec:(id)a5;
- (PXAssetsSectionLayoutDelegate)delegate;
- (PXAssetsSectionLayoutSpec)spec;
- (PXCuratedLibraryActionManager)actionManager;
- (PXCuratedLibraryActionPerformer)selectAllActionPerformer;
- (PXCuratedLibraryOverlayButtonConfiguration)selectAllButtonConfiguration;
- (PXCuratedLibraryOverlayButtonConfiguration)showAllButtonConfiguration;
- (PXCuratedLibraryShowAllActionPerformer)showAllActionPerformer;
- (PXDisplayAssetCollection)assetCollection;
- (PXDisplayAssetFetchResult)keyAssetsFetchResult;
- (PXGBurstStackEffect)burstStackEffect;
- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController;
- (PXGItemsGeometry)bodyItemsGeometry;
- (PXGLayout)bodyContainerLayout;
- (PXGLayout)bodyContentLayout;
- (PXGLayout)headerLayout;
- (PXGLayoutGuide)headerLayoutGuide;
- (PXIndexPathSet)skimmingIndexPaths;
- (PXLoadingStatusManager)loadingStatusManager;
- (PXPhotosCustomViewDecorationDataSource)decorationDataSource;
- (PXPhotosGridAssetDecorationSource)assetDecorationSource;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXSimpleIndexPath)_dataSourceIndexPathForObjectReference:(SEL)a3 options:(id)a4 updatedObjectReference:(unint64_t)a5;
- (PXSimpleIndexPath)presentedSectionIndexPath;
- (PXSimpleIndexPath)sectionIndexPath;
- (PXTapbackStatusManager)tapbackStatusManager;
- (double)blurIntensity;
- (double)buildingRowContentHeight;
- (double)buildingRowSpacing;
- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (double)distanceBetweenHeaderTopAndNextBodyTop;
- (double)distanceBetweenTitleTopAndBodyBottom;
- (double)effectiveBlurIntensity;
- (double)intersectionSpacing;
- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4;
- (double)visibleRectOvershootFactor;
- (id)_assetReferenceClosestVisuallyToAssetReference:(id)a3;
- (id)_displayAssetForBodyItem:(int64_t)a3;
- (id)_displayFaceForBodyItem:(int64_t)a3;
- (id)_rowBasedBodyContentLayout;
- (id)addContentActionHandler;
- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3;
- (id)assetsIteratorForContentInRect:(CGRect)a3;
- (id)axLocalizedLabel;
- (id)axSpriteIndexes;
- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)generatedLayout:(id)a3 inputItemAtIndex:(unsigned int)a4;
- (id)generatedLayout:(id)a3 objectReferenceAtIndex:(unsigned int)a4;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4;
- (id)layoutForItemChanges;
- (id)locationNamesFutureForContentInRect:(CGRect)a3;
- (id)objectReferenceForSpriteIndex:(unsigned int)a3;
- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)showAllActionBlock;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)currentSkimmingIndex;
- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5;
- (int64_t)keyItemIndex;
- (int64_t)maxSkimmingIndex;
- (int64_t)numberOfAssets;
- (int64_t)numberOfPrecedingAssets;
- (int64_t)preferredInitialContentLayoutAxis;
- (int64_t)section;
- (int64_t)showAllAffordanceStyle;
- (int64_t)showAllCount;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (int64_t)targetZoomLevel;
- (int64_t)zoomLevel;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3;
- (unsigned)itemsLayout:(id)a3 effectIdForItem:(int64_t)a4;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_callAddContentActionHandler;
- (void)_getCuratedLibraryShowAllButtonFrame:(CGRect *)a3 alpha:(double *)a4;
- (void)_invalidateAssetsWithCoveredBottomTrailingCorner;
- (void)_invalidateConfigurator;
- (void)_invalidateContent;
- (void)_invalidateFooter;
- (void)_invalidateSelectAllButton;
- (void)_invalidateSelectAllButtonPosition;
- (void)_invalidateShowAllButton;
- (void)_invalidateShowAllButtonPosition;
- (void)_invalidateVisibleRectOvershootFactor;
- (void)_updateAssetsWithCoveredBottomTrailingCorner;
- (void)_updateBlurSprite;
- (void)_updateConfigurator;
- (void)_updateContent;
- (void)_updateDecorationSource;
- (void)_updateDistanceProperties;
- (void)_updateEffectiveBlurIntensity;
- (void)_updateFooter;
- (void)_updateLocalSprites;
- (void)_updateSectionHeaderProperties;
- (void)_updateSelectAllButtonPosition;
- (void)_updateShowAllButtonPosition;
- (void)_updateVisibleRectOvershootFactor;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)contentSizeDidChange;
- (void)displayScaleDidChange;
- (void)enumerateRowsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3;
- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3;
- (void)itemsLayout:(id)a3 updateTagsInSpriteInfos:(id *)a4 forItemsInRange:(_NSRange)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)px_modifyAssetsSectionLayoutGeometry:(id)a3;
- (void)setAddContentActionHandler:(id)a3;
- (void)setAllowsPositionDependentHeaderContentOpacity:(BOOL)a3;
- (void)setAutomaticallyUpdatesPadding:(BOOL)a3;
- (void)setAxLocalizedBaseLabel:(id)a3;
- (void)setBlurIntensity:(double)a3;
- (void)setBodyContainerLayout:(id)a3;
- (void)setBodyContentLayout:(id)a3 wantsDecoration:(BOOL)a4;
- (void)setCanStartSelecting:(BOOL)a3;
- (void)setConfigurator:(id)a3;
- (void)setCurrentSkimmingIndex:(int64_t)a3;
- (void)setDataSource:(id)a3 section:(int64_t)a4;
- (void)setDecorationDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableConfigurators:(BOOL)a3;
- (void)setDistanceBetweenHeaderTopAndNextBodyTop:(double)a3;
- (void)setDistanceBetweenTitleTopAndBodyBottom:(double)a3;
- (void)setDraggedAssetReferences:(id)a3;
- (void)setDropTargetAssetReference:(id)a3;
- (void)setEffectiveBlurIntensity:(double)a3;
- (void)setFaceModeEnabled:(BOOL)a3;
- (void)setHeaderLayout:(id)a3;
- (void)setHeaderLayoutGuide:(id)a3;
- (void)setIntersectionSpacing:(double)a3;
- (void)setIsLastSection:(BOOL)a3;
- (void)setIsSelecting:(BOOL)a3;
- (void)setIsSkimming:(BOOL)a3;
- (void)setItemCaptionsVisible:(BOOL)a3;
- (void)setMaxSkimmingIndex:(int64_t)a3;
- (void)setNumberOfPrecedingAssets:(int64_t)a3;
- (void)setPreferredCornerRadius:(id)a3;
- (void)setPreferredInitialContentLayoutAxis:(int64_t)a3;
- (void)setPreferredInitialContentLayoutNumberOfRows:(id)a3;
- (void)setRemovesContentLayoutWhenEmpty:(BOOL)a3;
- (void)setRemovesHeaderLayoutWhenEmpty:(BOOL)a3;
- (void)setSelectAllActionPerformer:(id)a3;
- (void)setSelectAllButtonTitle:(id)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setShowAllActionBlock:(id)a3;
- (void)setShowAllActionPerformer:(id)a3;
- (void)setShowAllAffordanceStyle:(int64_t)a3;
- (void)setShowAllButtonFrame:(CGRect)a3;
- (void)setShowAllButtonTitle:(id)a3;
- (void)setShowsSkimmingInteraction:(BOOL)a3;
- (void)setShowsSkimmingSlideshow:(BOOL)a3;
- (void)setSkimmingIndexPaths:(id)a3;
- (void)setSpec:(id)a3;
- (void)setTapbackStatusManager:(id)a3;
- (void)setTargetZoomLevel:(int64_t)a3;
- (void)setVisibleRectOvershootFactor:(double)a3;
- (void)setWantsAssetIndexBadge:(BOOL)a3;
- (void)setWantsDimmedSelectionStyle:(BOOL)a3;
- (void)setWantsFileSizeBadge:(BOOL)a3;
- (void)setWantsNumberedSelectionStyle:(BOOL)a3;
- (void)setWantsShadow:(BOOL)a3;
- (void)setZoomLevel:(int64_t)a3;
- (void)update;
- (void)viewEnvironmentDidChange;
- (void)visibleRectDidChange;
@end

@implementation PXAssetsSectionLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showAllButtonTitle, 0);
  objc_storeStrong((id *)&self->_bodyContainerLayout, 0);
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_storeStrong((id *)&self->_bodyContentLayout, 0);
  objc_storeStrong((id *)&self->_headerLayout, 0);
  objc_storeStrong((id *)&self->_skimmingIndexPaths, 0);
  objc_storeStrong((id *)&self->_axLocalizedBaseLabel, 0);
  objc_storeStrong((id *)&self->_headerLayoutGuide, 0);
  objc_storeStrong(&self->_addContentActionHandler, 0);
  objc_storeStrong((id *)&self->_selectAllButtonTitle, 0);
  objc_storeStrong((id *)&self->_selectAllActionPerformer, 0);
  objc_storeStrong(&self->_showAllActionBlock, 0);
  objc_storeStrong((id *)&self->_showAllActionPerformer, 0);
  objc_storeStrong((id *)&self->_decorationDataSource, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_assetDecorationSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_preferredInitialContentLayoutNumberOfRows, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackController, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectAllButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_showAllButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_blurViewConfiguration, 0);
  objc_storeStrong((id *)&self->_burstStackEffect, 0);
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_sectionHeaderLayout, 0);
}

- (double)visibleRectOvershootFactor
{
  return self->_visibleRectOvershootFactor;
}

- (double)blurIntensity
{
  return self->_blurIntensity;
}

- (double)intersectionSpacing
{
  return self->_intersectionSpacing;
}

- (BOOL)automaticallyUpdatesPadding
{
  return self->_automaticallyUpdatesPadding;
}

- (BOOL)presentedSkimming
{
  return self->_presentedSkimming;
}

- (PXSimpleIndexPath)presentedSectionIndexPath
{
  long long v3 = *(_OWORD *)&self[50].dataSourceIdentifier;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[49].item;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (double)effectiveBlurIntensity
{
  return self->_effectiveBlurIntensity;
}

- (CGRect)showAllButtonFrame
{
  double x = self->_showAllButtonFrame.origin.x;
  double y = self->_showAllButtonFrame.origin.y;
  double width = self->_showAllButtonFrame.size.width;
  double height = self->_showAllButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)showAllButtonTitle
{
  return self->_showAllButtonTitle;
}

- (double)distanceBetweenHeaderTopAndNextBodyTop
{
  return self->_distanceBetweenHeaderTopAndNextBodyTop;
}

- (double)distanceBetweenTitleTopAndBodyBottom
{
  return self->_distanceBetweenTitleTopAndBodyBottom;
}

- (BOOL)allowsPositionDependentHeaderContentOpacity
{
  return self->_allowsPositionDependentHeaderContentOpacity;
}

- (BOOL)isLastSection
{
  return self->_isLastSection;
}

- (void)setBodyContainerLayout:(id)a3
{
}

- (PXGLayout)bodyContainerLayout
{
  return self->_bodyContainerLayout;
}

- (PXAssetsSectionConfigurator)configurator
{
  return self->_configurator;
}

- (PXGLayout)bodyContentLayout
{
  return self->_bodyContentLayout;
}

- (PXGLayout)headerLayout
{
  return self->_headerLayout;
}

- (int64_t)currentSkimmingIndex
{
  return self->_currentSkimmingIndex;
}

- (int64_t)maxSkimmingIndex
{
  return self->_maxSkimmingIndex;
}

- (PXIndexPathSet)skimmingIndexPaths
{
  return self->_skimmingIndexPaths;
}

- (BOOL)isSkimming
{
  return self->_isSkimming;
}

- (BOOL)showsSkimmingInteraction
{
  return self->_showsSkimmingInteraction;
}

- (BOOL)showsSkimmingSlideshow
{
  return self->_showsSkimmingSlideshow;
}

- (void)setAxLocalizedBaseLabel:(id)a3
{
}

- (NSString)axLocalizedBaseLabel
{
  return self->_axLocalizedBaseLabel;
}

- (BOOL)removesContentLayoutWhenEmpty
{
  return self->_removesContentLayoutWhenEmpty;
}

- (BOOL)removesHeaderLayoutWhenEmpty
{
  return self->_removesHeaderLayoutWhenEmpty;
}

- (PXGLayoutGuide)headerLayoutGuide
{
  return self->_headerLayoutGuide;
}

- (id)addContentActionHandler
{
  return self->_addContentActionHandler;
}

- (NSString)selectAllButtonTitle
{
  return self->_selectAllButtonTitle;
}

- (PXCuratedLibraryActionPerformer)selectAllActionPerformer
{
  return self->_selectAllActionPerformer;
}

- (void)setShowAllActionBlock:(id)a3
{
}

- (id)showAllActionBlock
{
  return self->_showAllActionBlock;
}

- (PXCuratedLibraryShowAllActionPerformer)showAllActionPerformer
{
  return self->_showAllActionPerformer;
}

- (int64_t)showAllAffordanceStyle
{
  return self->_showAllAffordanceStyle;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)preferredCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (BOOL)wantsShadow
{
  return self->_wantsShadow;
}

- (int64_t)numberOfPrecedingAssets
{
  return self->_numberOfPrecedingAssets;
}

- (BOOL)canStartSelecting
{
  return self->_canStartSelecting;
}

- (BOOL)isSelecting
{
  return self->_isSelecting;
}

- (BOOL)disableConfigurators
{
  return self->_disableConfigurators;
}

- (PXPhotosCustomViewDecorationDataSource)decorationDataSource
{
  return self->_decorationDataSource;
}

- (void)setTapbackStatusManager:(id)a3
{
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (PXCuratedLibraryActionManager)actionManager
{
  return self->_actionManager;
}

- (BOOL)itemCaptionsVisible
{
  return self->_itemCaptionsVisible;
}

- (PXPhotosGridAssetDecorationSource)assetDecorationSource
{
  return self->_assetDecorationSource;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setPreferredInitialContentLayoutNumberOfRows:(id)a3
{
}

- (NSNumber)preferredInitialContentLayoutNumberOfRows
{
  return self->_preferredInitialContentLayoutNumberOfRows;
}

- (void)setPreferredInitialContentLayoutAxis:(int64_t)a3
{
  self->_preferredInitialContentLayoutAxis = a3;
}

- (int64_t)preferredInitialContentLayoutAxis
{
  return self->_preferredInitialContentLayoutAxis;
}

- (int64_t)section
{
  return self->_section;
}

- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController
{
  return self->_inlinePlaybackController;
}

- (PXAssetsSectionLayoutSpec)spec
{
  return self->_spec;
}

- (void)setTargetZoomLevel:(int64_t)a3
{
  self->_targetZoomLevel = a3;
}

- (int64_t)targetZoomLevel
{
  return self->_targetZoomLevel;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setDelegate:(id)a3
{
}

- (PXAssetsSectionLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXAssetsSectionLayoutDelegate *)WeakRetained;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(PXAssetsSectionLayout *)self assetCollectionReference];
  if (v10) {
    PXGAXAddAssetCollectionReferenceUserInfo(v9, v10);
  }
  v13.receiver = self;
  v13.super_class = (Class)PXAssetsSectionLayout;
  BOOL v11 = [(PXGLayout *)&v13 axGroup:v8 didRequestToPerformAction:a4 userInfo:v9];

  return v11;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((a4 & 6) != 0)
  {
    memset(v12, 0, sizeof(v12));
    [(PXAssetsSectionLayout *)self sectionIndexPath];
    PXGAXAddSimpleIndexPathGroupChangeUserInfo(v9, v12, (void *)v12 + 1, 0);
    v10 = [(PXAssetsSectionLayout *)self bodyItemsGeometry];
    PXGAXAddItemGeometryGroupChangeUserInfo(v9, v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)PXAssetsSectionLayout;
  [(PXGLayout *)&v11 axGroup:v8 didChange:a4 userInfo:v9];
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (id)axLocalizedLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PXAssetsSectionLayout *)self axLocalizedBaseLabel];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [(PXAssetsSectionLayout *)self assetCollection];
  v6 = [v5 localizedTitle];
  if (v6) {
    [v3 addObject:v6];
  }
  v7 = [v5 localizedSubtitle];
  if (v7) {
    [v3 addObject:v7];
  }
  id v8 = [v3 componentsJoinedByString:@" "];
  id v9 = (void *)[v8 mutableCopy];

  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"", &stru_1F00B0030, 0, 0, objc_msgSend(v9, "length"));
  return v9;
}

- (CGRect)generatedLayout:(id)a3 bestCropRectForInputItemAtIndex:(unsigned int)a4 withAspectRatio:(double)a5
{
  uint64_t v7 = a4;
  id v8 = [(PXAssetsSectionLayout *)self _displayAssetForBodyItem:a4];
  double v9 = *MEMORY[0x1E4F1DB20];
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if ([(PXAssetsSectionLayout *)self isFaceModeEnabled])
  {
    objc_super v13 = [(PXAssetsSectionLayout *)self _displayFaceForBodyItem:v7];
    v14 = v13;
    if (v13)
    {
      [v13 normalizedCropRect];
      double v9 = v15;
      CGFloat v10 = v16;
      CGFloat v11 = v17;
      CGFloat v12 = v18;
    }
  }
  v26.origin.double x = v9;
  v26.origin.double y = v10;
  v26.size.double width = v11;
  v26.size.double height = v12;
  if (CGRectIsEmpty(v26))
  {
    double v9 = PXCuratedLibraryBestCropRectForAssetInZoomLevel(v8, [(PXAssetsSectionLayout *)self zoomLevel], 0, a5);
    CGFloat v10 = v19;
    CGFloat v11 = v20;
    CGFloat v12 = v21;
  }

  double v22 = v9;
  double v23 = v10;
  double v24 = v11;
  double v25 = v12;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)generatedLayout:(id)a3 inputItemAtIndex:(unsigned int)a4
{
  return [(PXAssetsSectionLayout *)self _displayAssetForBodyItem:a4];
}

- (id)generatedLayout:(id)a3 objectReferenceAtIndex:(unsigned int)a4
{
  uint64_t v5 = [(PXGLayout *)self convertSpriteIndex:*(void *)&a4 fromDescendantLayout:a3];
  return [(PXAssetsSectionLayout *)self objectReferenceForSpriteIndex:v5];
}

- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4
{
  v6 = [(PXAssetsSectionLayout *)self dataSource];
  v9[0] = [v6 identifier];
  v9[1] = [(PXAssetsSectionLayout *)self section];
  v9[2] = a4;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = [v6 objectReferenceAtIndexPath:v9];

  return v7;
}

- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_9:
      int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_22;
    }
    id v8 = [v7 keyAssetReference];
  }
  double v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  if ((v5 & 1) == 0)
  {
LABEL_11:
    CGFloat v11 = v9;
    goto LABEL_12;
  }
  CGFloat v10 = [(PXAssetsSectionLayout *)self dataSource];
  CGFloat v11 = objc_msgSend(v10, "objectReferenceNearestToObjectReference:inSection:", v9, -[PXAssetsSectionLayout section](self, "section"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }

  if (!v11) {
    goto LABEL_9;
  }
LABEL_12:
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v13 = [(PXAssetsSectionLayout *)self dataSource];
  v14 = v13;
  if (v13)
  {
    [v13 indexPathForAssetReference:v11];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }

  int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  if ((void)v16 != *(void *)off_1E5DAAED8
    && (void)v17 != 0x7FFFFFFFFFFFFFFFLL
    && *((void *)&v17 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*((void *)&v16 + 1) == [(PXAssetsSectionLayout *)self section]) {
      int64_t v12 = v17;
    }
    else {
      int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

LABEL_22:
  return v12;
}

- (void)itemsLayout:(id)a3 updateTagsInSpriteInfos:(id *)a4 forItemsInRange:(_NSRange)a5
{
}

- (unsigned)itemsLayout:(id)a3 effectIdForItem:(int64_t)a4
{
  if ([(PXAssetsSectionLayout *)self zoomLevel] != 4) {
    return 0;
  }
  v6 = [(PXAssetsSectionLayout *)self _displayAssetForBodyItem:a4];
  int v7 = [v6 representsBurst];

  if (!v7) {
    return 0;
  }
  id v8 = [(PXAssetsSectionLayout *)self burstStackEffect];
  unsigned int v9 = [v8 effectId];

  return v9;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)itemsLayout:(id)a3 cornerRadiusForItem:(int64_t)a4
{
  if ([(PXAssetsSectionLayout *)self zoomLevel] == 3)
  {
    char v5 = +[PXCuratedLibrarySettings sharedInstance];
    [v5 cornerRadiusForDays];
  }
  else
  {
    char v5 = [(PXAssetsSectionLayout *)self spec];
    [v5 itemCornerRadius];
  }

  *(void *)&result.var0.var1[2] = v7;
  *(void *)&result.var0.var0.var0 = v6;
  return result;
}

- (CGSize)itemsLayout:(id)a3 insetForItem:(int64_t)a4
{
  char v5 = [(PXAssetsSectionLayout *)self assetDecorationSource];
  [v5 expectedInsetsForItem:a4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGRect)itemsLayout:(id)a3 bestCropRectForItem:(int64_t)a4 withAspectRatio:(double)a5
{
  double v8 = [(PXAssetsSectionLayout *)self _displayAssetForBodyItem:a4];
  if ([v8 representsBurst])
  {
    double v9 = *(double *)off_1E5DAB010;
    CGFloat v10 = *((double *)off_1E5DAB010 + 1);
    CGFloat v11 = *((double *)off_1E5DAB010 + 2);
    CGFloat v12 = *((double *)off_1E5DAB010 + 3);
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if ([(PXAssetsSectionLayout *)self isFaceModeEnabled])
    {
      objc_super v13 = [(PXAssetsSectionLayout *)self _displayFaceForBodyItem:a4];
      v14 = v13;
      if (v13)
      {
        [v13 normalizedCropRect];
        double v9 = v15;
        CGFloat v10 = v16;
        CGFloat v11 = v17;
        CGFloat v12 = v18;
      }
    }
    v26.origin.double x = v9;
    v26.origin.double y = v10;
    v26.size.double width = v11;
    v26.size.double height = v12;
    if (CGRectIsEmpty(v26))
    {
      double v9 = PXCuratedLibraryBestCropRectForAssetInZoomLevel(v8, [(PXAssetsSectionLayout *)self zoomLevel], 0, a5);
      CGFloat v10 = v19;
      CGFloat v11 = v20;
      CGFloat v12 = v21;
    }
  }

  double v22 = v9;
  double v23 = v10;
  double v24 = v11;
  double v25 = v12;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  v4 = [(PXAssetsSectionLayout *)self _displayAssetForBodyItem:a4];
  [v4 aspectRatio];
  double v6 = v5;

  return v6;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v7 = (PXAssetsSectionLayout *)a4;
  double v8 = v7;
  if (v7 != self)
  {
    objc_initWeak(&location, self);
    double v9 = [PXPhotosGridAddButtonViewUserData alloc];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    double v21 = __63__PXAssetsSectionLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke;
    double v22 = &unk_1E5DD32D0;
    objc_copyWeak(&v23, &location);
    CGFloat v10 = [(PXPhotosGridAddButtonViewUserData *)v9 initWithStyle:1 actionHandler:&v19];
    CGFloat v11 = [(PXAssetsSectionLayout *)self spec];
    -[PXPhotosGridAddButtonViewUserData setPreferredUserInterfaceStyle:](v10, "setPreferredUserInterfaceStyle:", [v11 preferredUserInterfaceStyle]);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    goto LABEL_12;
  }
  if (v7->_showAllButtonSpriteIndex == a3)
  {
    if ([(PXAssetsSectionLayout *)v7 showAllAffordanceStyle] != 1)
    {
      objc_super v13 = [(PXAssetsSectionLayout *)v8 showAllButtonTitle];
      v14 = [(PXAssetsSectionLayout *)v8 spec];
      uint64_t v15 = [v14 numberOfLinesForShowAllButton];
      double v16 = [(PXAssetsSectionLayout *)v8 showAllActionBlock];
      CGFloat v10 = +[PXAssetsSectionButton configurationWithTitle:v13 numberOfLines:v15 action:v16];

      goto LABEL_12;
    }
    CGFloat v12 = [(PXAssetsSectionLayout *)v8 showAllButtonConfiguration];
  }
  else if (v7->_selectAllButtonSpriteIndex == a3)
  {
    CGFloat v12 = [(PXAssetsSectionLayout *)v7 selectAllButtonConfiguration];
  }
  else
  {
    if (v7->_blurSpriteIndex != a3)
    {
      double v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:v8 file:@"PXAssetsSectionLayout.m" lineNumber:2037 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    CGFloat v12 = v7->_blurViewConfiguration;
  }
  CGFloat v10 = (PXPhotosGridAddButtonViewUserData *)v12;
LABEL_12:

  return v10;
}

void __63__PXAssetsSectionLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _callAddContentActionHandler];
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v7 = (PXAssetsSectionLayout *)a4;
  double v8 = v7;
  if (v7 == self)
  {
    if (v7->_showAllButtonSpriteIndex == a3)
    {
      [(PXAssetsSectionLayout *)v7 showAllAffordanceStyle];
    }
    else if (v7->_selectAllButtonSpriteIndex != a3 && v7->_blurSpriteIndex != a3)
    {
      CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:v8 file:@"PXAssetsSectionLayout.m" lineNumber:2013 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  double v9 = objc_opt_class();

  return (Class)v9;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_sectionShadowSpriteIndex != a3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1994 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  double v8 = v7;
  double v9 = [(PXAssetsSectionLayout *)self spec];
  if (!v9)
  {
    objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1991 description:@"A valid spec object should be available to retrieve the shadow corner radius."];
  }
  [v9 shadowCornerRadius];
  double v11 = v10;

  return v11;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_sectionShadowSpriteIndex != a3)
  {
    objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1984 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  double v8 = v7;
  double v9 = [(PXAssetsSectionLayout *)self spec];
  if (!v9)
  {
    CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1981 description:@"A valid spec object should be available to retrieve the shadow."];
  }
  double v10 = [v9 shadow];

  return v10;
}

- (id)_displayFaceForBodyItem:(int64_t)a3
{
  double v5 = [(PXAssetsSectionLayout *)self dataSource];
  v8[0] = [v5 identifier];
  v8[1] = [(PXAssetsSectionLayout *)self section];
  v8[2] = a3;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  double v6 = [v5 primaryFaceForAssetAtItemIndexPath:v8];

  return v6;
}

- (id)_displayAssetForBodyItem:(int64_t)a3
{
  double v5 = [(PXAssetsSectionLayout *)self dataSource];
  v8[0] = [v5 identifier];
  v8[1] = [(PXAssetsSectionLayout *)self section];
  v8[2] = a3;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  double v6 = [v5 assetAtItemIndexPath:v8];

  return v6;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  id v6 = a4;
  id v7 = [(PXAssetsSectionLayout *)self bodyContentLayout];

  if (v7 != v6)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1947 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    double v21 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v21);
    double v22 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v18 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1931, @"%@ should be an instance inheriting from %@, but it is %@", @"layout", v20, v22 object file lineNumber description];
  }
  else
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1931, @"%@ should be an instance inheriting from %@, but it is nil", @"layout", v20 object file lineNumber description];
  }

LABEL_4:
  uint64_t v9 = [v8 itemForSpriteIndex:0];
  uint64_t v10 = [v8 numberOfItems];
  if ([(PXAssetsSectionLayout *)self zoomLevel] == 1)
  {
    double v11 = [(PXAssetsSectionLayout *)self keyAssetsFetchResult];
  }
  else
  {
    uint64_t v12 = v10 - v9;
    BOOL v13 = self->_cachedClampedItemRange.location == v9 && self->_cachedClampedItemRange.length == v12;
    if (!v13 || (cachedClampedFetchResult = self->_cachedClampedFetchResult) == 0)
    {
      double v16 = [(PXAssetsSectionLayout *)self dataSource];
      v24[0] = [v16 identifier];
      v24[1] = [(PXAssetsSectionLayout *)self section];
      int64x2_t v25 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      [v16 assetsInSectionIndexPath:v24];
      objc_claimAutoreleasedReturnValue();
      PXDisplayAssetFetchResultSubfetchResultWithRange();
    }
    double v11 = cachedClampedFetchResult;
  }
  uint64_t v15 = v11;

  return v15;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3 == 2)
  {
    id v7 = +[PXCuratedLibrarySettings sharedInstance];
    char v8 = [v7 forcePlayback];

    if ((v8 & 1) == 0)
    {
      int64_t v9 = [(PXAssetsSectionLayout *)self zoomLevel];
      if (v9 == 3)
      {
        uint64_t v10 = [(PXAssetsSectionLayout *)self bodyContentLayout];
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_6:
          [v10 minPlayableSpriteSize];
          double v3 = v11;
          double v4 = v12;
          goto LABEL_12;
        }
        uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
        double v24 = (objc_class *)objc_opt_class();
        double v22 = NSStringFromClass(v24);
        id v23 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
        [v20 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1902, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.bodyContentLayout", v22, v23 object file lineNumber description];
        goto LABEL_20;
      }
      if ((unint64_t)(v9 - 1) <= 1)
      {
        uint64_t v10 = [(PXAssetsSectionLayout *)self bodyContentLayout];
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int64x2_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
            CGRect v26 = (objc_class *)objc_opt_class();
            v27 = NSStringFromClass(v26);
            v28 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
            [v25 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1907, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.bodyContentLayout", v27, v28 object file lineNumber description];
          }
          BOOL v13 = [v10 contentSource];
          [v13 minSpriteSizeForPresentationStyle:2];
          double v3 = v14;
          double v4 = v15;
        }
        goto LABEL_12;
      }
      if (v9 == 4)
      {
        double v18 = [(PXAssetsSectionLayout *)self bodyContentLayout];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v10 = [(PXAssetsSectionLayout *)self bodyContentLayout];
          if (!v10)
          {
            uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
            v29 = (objc_class *)objc_opt_class();
            double v22 = NSStringFromClass(v29);
            [v20 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1913, @"%@ should be an instance inheriting from %@, but it is nil", @"self.bodyContentLayout", v22 object file lineNumber description];
            goto LABEL_21;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_6;
          }
          uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
          double v21 = (objc_class *)objc_opt_class();
          double v22 = NSStringFromClass(v21);
          id v23 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
          [v20 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1913, @"%@ should be an instance inheriting from %@, but it is %@", @"self.bodyContentLayout", v22, v23 object file lineNumber description];
LABEL_20:

LABEL_21:
          goto LABEL_6;
        }
      }
    }
  }
LABEL_13:
  double v16 = v3;
  double v17 = v4;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  if ((unint64_t)([(PXAssetsSectionLayout *)self zoomLevel] - 3) >= 2) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXHeaderLayoutGuideObservationContext != a5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1871 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXAssetsSectionLayout *)self _invalidateSelectAllButtonPosition];
    id v9 = v11;
  }
}

- (void)viewEnvironmentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXAssetsSectionLayout;
  [(PXGSplitLayout *)&v3 viewEnvironmentDidChange];
  [(PXAssetsSectionLayout *)self _updateEffectiveBlurIntensity];
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXAssetsSectionLayout;
  [(PXGSplitLayout *)&v8 displayScaleDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXAssetsSectionLayout.m", 1855, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)contentSizeDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)PXAssetsSectionLayout;
  [(PXGLayout *)&v5 contentSizeDidChange];
  [(PXAssetsSectionLayout *)self _updateLocalSprites];
  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x800) != 0)
  {
    objc_super v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout contentSizeDidChange]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PXAssetsSectionLayout.m", 1850, @"invalidating %lu after it already has been updated", 2048);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x800uLL;
}

- (id)_rowBasedBodyContentLayout
{
  id v2 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  if ([v2 conformsToProtocol:&unk_1F035CF38]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)enumerateRowsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(PXAssetsSectionLayout *)self _rowBasedBodyContentLayout];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PXAssetsSectionLayout_enumerateRowsWithOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E5DB1F58;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 enumerateRowsWithOptions:a3 usingBlock:v10];
}

uint64_t __61__PXAssetsSectionLayout_enumerateRowsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", *(void *)(a1 + 40));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (double)buildingRowSpacing
{
  id v2 = [(PXAssetsSectionLayout *)self _rowBasedBodyContentLayout];
  id v3 = v2;
  if (v2)
  {
    [v2 buildingRowSpacing];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)buildingRowContentHeight
{
  id v2 = [(PXAssetsSectionLayout *)self _rowBasedBodyContentLayout];
  id v3 = v2;
  if (v2)
  {
    [v2 buildingRowContentHeight];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = [(PXAssetsSectionLayout *)self dataSource];
  if ([(PXAssetsSectionLayout *)self zoomLevel] == 4)
  {
    id v9 = [(PXAssetsSectionLayout *)self bodyContentLayout];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v12 = v11;

        BOOL v13 = objc_msgSend(v12, "assetsIteratorForContentInRect:", x, y, width, height);
      }
      else
      {

        id v14 = v11;
        if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        {
          id v15 = v14;

          -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v15, x, y, width, height);
          uint64_t v16 = objc_msgSend(v15, "itemRangeForSpriteIndexRange:", objc_msgSend(v15, "spriteIndexRangeCoveringRect:"));
          uint64_t v18 = v17;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke;
          aBlock[3] = &unk_1E5DB83A0;
          id v42 = v8;
          uint64_t v43 = v16;
          uint64_t v44 = v18;
          BOOL v13 = _Block_copy(aBlock);
          id v19 = v42;
        }
        else
        {

          id v20 = v14;
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
          {
            id v19 = v20;

            id v21 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v19, x, y, width, height);
            double v34 = v22;
            double v24 = v23;
            double v26 = v25;
            double v28 = v27;
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_3;
            v39[3] = &unk_1E5DB1EE0;
            v29 = v21;
            v40 = v29;
            objc_msgSend(v19, "enumerateItemsInRect:usingBlock:", v39, v34, v24, v26, v28);
            if ([v29 count])
            {
              v35[0] = MEMORY[0x1E4F143A8];
              v35[1] = 3221225472;
              v35[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_4;
              v35[3] = &unk_1E5DB1F30;
              v36 = v8;
              v37 = self;
              v38 = v29;
              BOOL v13 = _Block_copy(v35);

              v30 = v36;
            }
            else
            {
              v30 = PLAppIntentsGetLog();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                v49.origin.double x = x;
                v49.origin.double y = y;
                v49.size.double width = width;
                v49.size.double height = height;
                v31 = NSStringFromRect(v49);
                *(_DWORD *)buf = 138543362;
                uint64_t v46 = (uint64_t)v31;
                _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_ERROR, "No items for the provided rect: %{public}@", buf, 0xCu);
              }
              BOOL v13 = 0;
            }
          }
          else
          {

            v29 = PLAppIntentsGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v46 = objc_opt_class();
              _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_ERROR, "Unknown body layout: %{public}@", buf, 0xCu);
            }
            id v19 = 0;
            BOOL v13 = 0;
          }

          id v15 = 0;
        }

        id v12 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  v32 = _Block_copy(v13);

  return v32;
}

void __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = v5 + *(void *)(a1 + 48) - 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_2;
  v11[3] = &unk_1E5DB8378;
  id v12 = v6;
  id v13 = v3;
  v10[0] = v4;
  v10[1] = 0;
  v10[2] = v5;
  v10[3] = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = v4;
  v9[1] = 0;
  v9[2] = v7;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v8 = v3;
  [v12 enumerateItemIndexPathsStartingAtIndexPath:v10 untilEndIndexPath:v9 usingBlock:v11];
}

uint64_t __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2];
}

void __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [*(id *)(a1 + 40) section];
  id v6 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_5;
  v8[3] = &unk_1E5DB1F08;
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  [v6 enumerateIndexesUsingBlock:v8];
}

void __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = a2;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = [v3 assetAtItemIndexPath:&v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  long long v5 = [v3 assetAtItemIndexPath:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(PXAssetsSectionLayout *)self dataSource];
  if ([(PXAssetsSectionLayout *)self zoomLevel] == 4)
  {
    id v9 = [(PXAssetsSectionLayout *)self bodyContentLayout];
    if (v9)
    {
      id v10 = v9;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v11 = v10;

        uint64_t v12 = objc_msgSend(v11, "assetCollectionsIteratorForContentInRect:", x, y, width, height);
      }
      else
      {

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__PXAssetsSectionLayout_assetCollectionsIteratorForContentInRect___block_invoke;
        aBlock[3] = &unk_1E5DB1EB8;
        id v19 = v8;
        id v20 = self;
        uint64_t v12 = _Block_copy(aBlock);

        id v11 = 0;
      }
    }
    else
    {
      id v10 = 0;
      uint64_t v12 = 0;
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__PXAssetsSectionLayout_assetCollectionsIteratorForContentInRect___block_invoke_2;
    v15[3] = &unk_1E5DB1EB8;
    id v16 = v8;
    uint64_t v17 = self;
    uint64_t v12 = _Block_copy(v15);
    id v10 = v16;
  }

  id v13 = _Block_copy(v12);
  return v13;
}

void __66__PXAssetsSectionLayout_assetCollectionsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v4 = a2;
  uint64_t v5 = [v3 identifier];
  uint64_t v6 = [*(id *)(a1 + 40) section];
  uint64_t v7 = *(void **)(a1 + 32);
  v9[0] = v5;
  v9[1] = v6;
  int64x2_t v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  id v8 = [v7 assetCollectionAtSectionIndexPath:v9];
  v4[2](v4, v8);
}

void __66__PXAssetsSectionLayout_assetCollectionsIteratorForContentInRect___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v4 = a2;
  uint64_t v5 = [v3 identifier];
  uint64_t v6 = [*(id *)(a1 + 40) section];
  uint64_t v7 = *(void **)(a1 + 32);
  v9[0] = v5;
  v9[1] = v6;
  int64x2_t v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  id v8 = [v7 assetCollectionAtSectionIndexPath:v9];
  v4[2](v4, v8);
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(PXAssetsSectionLayout *)self dataSource];
  uint64_t v10 = [(PXAssetsSectionLayout *)self section];
  if (v10 >= [v9 numberOfSections])
  {
    double v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1668, @"Invalid parameter not satisfying: %@", @"section < dataSource.numberOfSections" object file lineNumber description];
  }
  if ([(PXAssetsSectionLayout *)self zoomLevel] != 4)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_4;
    v23[3] = &unk_1E5DB8350;
    id v24 = v9;
    uint64_t v25 = v10;
    id v15 = (void *)[v23 copy];

    goto LABEL_15;
  }
  id v11 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v13 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  id v14 = v13;
  if (isKindOfClass)
  {
    id v15 = objc_msgSend(v13, "locationNamesFutureForContentInRect:", x, y, width, height);
LABEL_14:

    goto LABEL_15;
  }

  if (v14)
  {
    id v16 = [(PXAssetsSectionLayout *)self bodyContentLayout];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v14 = v16;

      if (v14)
      {
        -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v14, x, y, width, height);
        uint64_t v17 = objc_msgSend(v14, "itemRangeForSpriteIndexRange:", objc_msgSend(v14, "spriteIndexRangeCoveringRect:"));
        uint64_t v19 = v18;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke;
        v26[3] = &unk_1E5DB1E90;
        id v27 = v9;
        uint64_t v28 = v17;
        uint64_t v29 = v19;
        id v15 = (void *)[v26 copy];

        goto LABEL_14;
      }
    }
    else
    {

      id v14 = 0;
    }
    id v15 = 0;
    goto LABEL_14;
  }
  id v15 = (void *)[&__block_literal_global_328 copy];
LABEL_15:
  id v20 = _Block_copy(v15);

  return v20;
}

id __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) identifier] == a2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = v5 + *(void *)(a1 + 48) - 1;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _OWORD v12[2] = __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_2;
    v12[3] = &unk_1E5DCA3B8;
    id v13 = v6;
    id v14 = v4;
    v11[0] = a2;
    v11[1] = 0;
    v11[2] = v5;
    v11[3] = 0x7FFFFFFFFFFFFFFFLL;
    v10[0] = a2;
    v10[1] = 0;
    v10[2] = v7;
    v10[3] = 0x7FFFFFFFFFFFFFFFLL;
    id v8 = v4;
    [v13 enumerateItemIndexPathsStartingAtIndexPath:v11 untilEndIndexPath:v10 usingBlock:v12];
    PXArrayFromFrequencySortAndDeduplicationOfNSStringSet();
  }
  return 0;
}

id __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) identifier] == a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v9[0] = v3;
    v9[1] = v5;
    int64x2_t v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    uint64_t v6 = [v4 assetCollectionAtSectionIndexPath:v9];
    uint64_t v7 = [v6 localizedLocationNames];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

uint64_t __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_3()
{
  return 0;
}

void __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  uint64_t v5 = [v3 assetAtItemIndexPath:v8];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 localizedGeoDescription];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = [(PXAssetsSectionLayout *)self dataSource];
  uint64_t v12 = [(PXAssetsSectionLayout *)self section];
  if (v12 >= [v11 numberOfSections])
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1612, @"Invalid parameter not satisfying: %@", @"section < dataSource.numberOfSections" object file lineNumber description];
  }
  if ([(PXAssetsSectionLayout *)self zoomLevel] != 4)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke_3;
    v25[3] = &unk_1E5DB8300;
    id v26 = v11;
    uint64_t v27 = v12;
    uint64_t v17 = (void *)[v25 copy];

    goto LABEL_15;
  }
  id v13 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v15 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  id v16 = v15;
  if (isKindOfClass)
  {
    uint64_t v17 = objc_msgSend(v15, "dateIntervalFutureForContentInRect:type:", a4, x, y, width, height);
LABEL_14:

    goto LABEL_15;
  }

  if (v16)
  {
    uint64_t v18 = [(PXAssetsSectionLayout *)self bodyContentLayout];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v16 = v18;

      if (v16)
      {
        -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v16, x, y, width, height);
        uint64_t v19 = objc_msgSend(v16, "itemRangeForSpriteIndexRange:", objc_msgSend(v16, "spriteIndexRangeCoveringRect:"));
        uint64_t v21 = v20;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke;
        v28[3] = &unk_1E5DB1E48;
        id v29 = v11;
        uint64_t v30 = v19;
        uint64_t v31 = v21;
        uint64_t v32 = v12;
        unint64_t v33 = a4;
        uint64_t v17 = (void *)[v28 copy];

        goto LABEL_14;
      }
    }
    else
    {

      id v16 = 0;
    }
    uint64_t v17 = 0;
    goto LABEL_14;
  }
  uint64_t v17 = (void *)[&__block_literal_global_29101 copy];
LABEL_15:
  double v22 = _Block_copy(v17);

  return v22;
}

id __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) identifier] == a2)
  {
    if (*(void *)(a1 + 40) == 0x7FFFFFFFFFFFFFFFLL
      || !*(void *)(a1 + 48)
      || (uint64_t v3 = [*(id *)(a1 + 32) identifier], v4 = *(void *)(a1 + 40), v4 >= *(void *)(a1 + 48) + v4))
    {
      id v15 = 0;
      id v14 = 0;
      id v13 = 0;
    }
    else
    {
      uint64_t v5 = v3;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)(a1 + 56);
      do
      {
        id v9 = *(void **)(a1 + 32);
        v19[0] = v5;
        v19[1] = v8;
        v19[2] = v4;
        v19[3] = 0x7FFFFFFFFFFFFFFFLL;
        int64x2_t v10 = [v9 assetAtItemIndexPath:v19];
        id v11 = v10;
        if (*(void *)(a1 + 64) == 1) {
          [v10 importDate];
        }
        else {
        uint64_t v12 = [v10 creationDate];
        }
        id v17 = v7;
        id v18 = v6;
        objc_msgSend(MEMORY[0x1E4F1C9C8], "px_unionStartDate:endDate:withDate:", &v18, &v17, v12);
        id v13 = v18;

        id v14 = v17;
        ++v4;
        uint64_t v6 = v13;
        uint64_t v7 = v14;
      }
      while (v4 < *(void *)(a1 + 48) + *(void *)(a1 + 40));
      id v15 = 0;
      if (v13 && v14) {
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v14];
      }
    }
  }
  else
  {
    id v15 = 0;
  }
  return v15;
}

id __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) identifier] == a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    unint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v13[0] = v3;
    v13[1] = v5;
    int64x2_t v14 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    uint64_t v6 = [v4 assetCollectionAtSectionIndexPath:v13];
    uint64_t v7 = [v6 startDate];
    uint64_t v8 = [v6 endDate];
    id v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      id v11 = 0;
    }
    else {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

uint64_t __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke_2()
{
  return 0;
}

- (id)_assetReferenceClosestVisuallyToAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXAssetsSectionLayout *)self dataSource];
  uint64_t v6 = [v5 assetReferenceForAssetReference:v4];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id v8 = (id)v6;
  }
  else {
    id v8 = v4;
  }
  id v9 = [v5 objectReferenceNearestToObjectReference:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
LABEL_6:
    id v11 = v10;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = 0;
    goto LABEL_27;
  }
  int64x2_t v26 = 0u;
  int64x2_t v27 = 0u;
  if (v5)
  {
    [v5 indexPathForAssetCollectionReference:v9];
    int64x2_t v22 = v26;
    int64x2_t v23 = v27;
    [v5 keyAssetIndexPathForSectionIndexPath:&v22];
  }
  else
  {
    int64x2_t v24 = 0uLL;
    int64x2_t v25 = 0uLL;
  }
  id v11 = 0;
  int64x2_t v26 = v24;
  int64x2_t v27 = v25;
  if (v24.i64[0] != *(void *)off_1E5DAAED8
    && v27.i64[0] != 0x7FFFFFFFFFFFFFFFLL
    && v27.i64[1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64x2_t v24 = v26;
    int64x2_t v25 = v27;
    id v10 = [v5 assetReferenceAtItemIndexPath:&v24];
    goto LABEL_6;
  }
LABEL_7:
  if (!v11 || ([v11 isEqual:v7] & 1) != 0) {
    goto LABEL_27;
  }
  int64x2_t v26 = 0u;
  int64x2_t v27 = 0u;
  if (v5)
  {
    [v5 indexPathForAssetReference:v11];
    int64x2_t v24 = 0u;
    int64x2_t v25 = 0u;
    uint64_t v19 = [v5 identifier];
    int64_t v20 = [(PXAssetsSectionLayout *)self section];
    int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    [v5 keyAssetIndexPathForSectionIndexPath:&v19];
    int64x2_t v12 = v24;
    int64x2_t v13 = v25;
    int64x2_t v15 = v26;
    int64x2_t v14 = v27;
  }
  else
  {
    uint64_t v19 = [0 identifier];
    int64_t v20 = [(PXAssetsSectionLayout *)self section];
    int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    int64x2_t v15 = 0uLL;
    int64x2_t v24 = 0u;
    int64x2_t v25 = 0u;
    int64x2_t v14 = 0uLL;
    int64x2_t v12 = 0uLL;
    int64x2_t v13 = 0uLL;
  }
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v15, v12), (int32x4_t)vceqq_s64(v14, v13))), 0xFuLL))) & 1) == 0)goto LABEL_27; {
  uint64_t v16 = v13.i64[0] - 1;
  }
  if (v13.i64[0] >= 1) {
    goto LABEL_25;
  }
  if (v13.i64[0] < [v5 numberOfItemsInSection:v12.i64[1]] - 1)
  {
    uint64_t v16 = v27.i64[0] + 1;
LABEL_25:
    v27.i64[0] = v16;
  }
  int64x2_t v22 = v26;
  int64x2_t v23 = v27;
  uint64_t v17 = objc_msgSend(v5, "assetReferenceAtItemIndexPath:", &v22, v19, v20, *(_OWORD *)&v21);

  id v11 = (void *)v17;
LABEL_27:

  return v11;
}

- (PXSimpleIndexPath)_dataSourceIndexPathForObjectReference:(SEL)a3 options:(id)a4 updatedObjectReference:(unint64_t)a5
{
  char v7 = a5;
  id v10 = a4;
  long long v18 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v20 = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v18;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    int64x2_t v12 = [(PXAssetsSectionLayout *)self dataSource];
    int64x2_t v13 = v12;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PXAssetsSectionLayout *)self _assetReferenceClosestVisuallyToAssetReference:v11];
      }
      else {
      uint64_t v14 = [v13 objectReferenceNearestToObjectReference:v11];
      }
    }
    else
    {
      uint64_t v14 = [v12 objectReferenceForObjectReference:v11];
    }
    int64x2_t v15 = (void *)v14;

    if (v13)
    {
      [v13 indexPathForObjectReference:v15];
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
    }
    *(_OWORD *)&retstr->dataSourceIdentifier = v22;
    *(_OWORD *)&retstr->item = v23;
    int64_t section = retstr->section;
    if (section != [(PXAssetsSectionLayout *)self section])
    {
      *(_OWORD *)&retstr->dataSourceIdentifier = v21;
      *(_OWORD *)&retstr->item = v19;
    }
    if (retstr->dataSourceIdentifier != *(void *)off_1E5DAAED8) {
      *a6 = v15;
    }
  }
  return result;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8 = a3;
  id v9 = [(PXAssetsSectionLayout *)self showAllActionPerformer];

  if (v9 == v8)
  {
    showAllButtonSpriteIndedouble x = self->_showAllButtonSpriteIndex;
    int64x2_t v15 = [(PXAssetsSectionLayout *)self showAllActionPerformer];
LABEL_8:
    *a5 = v15;
    goto LABEL_12;
  }
  id v10 = [(PXAssetsSectionLayout *)self selectAllActionPerformer];

  if (v10 == v8)
  {
    showAllButtonSpriteIndedouble x = self->_selectAllButtonSpriteIndex;
    int64x2_t v15 = [(PXAssetsSectionLayout *)self selectAllActionPerformer];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(PXAssetsSectionLayout *)self bodyContainerLayout];
    int64x2_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(PXAssetsSectionLayout *)self bodyContentLayout];
    }
    uint64_t v16 = v13;

    showAllButtonSpriteIndedouble x = -[PXGLayout convertSpriteIndex:fromDescendantLayout:](self, "convertSpriteIndex:fromDescendantLayout:", [v16 spriteIndexForObjectReference:v8 options:a4 updatedObjectReference:a5], v16);
  }
  else
  {
    [(PXAssetsSectionLayout *)self _dataSourceIndexPathForObjectReference:v8 options:a4 updatedObjectReference:a5];
    showAllButtonSpriteIndedouble x = -1;
  }
LABEL_12:

  return showAllButtonSpriteIndex;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  [(PXAssetsSectionLayout *)self _dataSourceIndexPathForObjectReference:a3 options:a4 updatedObjectReference:a5];
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  char v7 = [(PXAssetsSectionLayout *)self bodyContainerLayout];
  if (v7
    || ([(PXAssetsSectionLayout *)self bodyContentLayout],
        (char v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = [(PXGLayout *)self sublayoutDataStore];
    int64_t v6 = [v8 indexOfSublayout:v7];
  }
  return v6;
}

- (BOOL)_shouldAnchorOnAssetCollection
{
  int64_t v4 = [(PXAssetsSectionLayout *)self zoomLevel];
  if ((unint64_t)(v4 - 1) < 2) {
    return 1;
  }
  if ((unint64_t)(v4 - 3) < 2) {
    return (unint64_t)([(PXAssetsSectionLayout *)self targetZoomLevel] - 1) < 2;
  }
  if (!v4)
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1459 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 0;
}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  int64_t v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  if ([(PXAssetsSectionLayout *)self _shouldAnchorOnAssetCollection])
  {
    sectionBoundariesSpriteIndedouble x = self->_sectionBoundariesSpriteIndex;
    if (sectionBoundariesSpriteIndex != -1)
    {
      char v7 = 0;
      v4[2](v4, sectionBoundariesSpriteIndex, 1, &v7);
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXAssetsSectionLayout;
    [(PXGLayout *)&v6 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v4];
  }
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  int64_t v4 = (void (**)(id, PXAssetsSectionLayout *, unsigned char *))a3;
  if ([(PXAssetsSectionLayout *)self _shouldAnchorOnAssetCollection])
  {
    uint64_t v5 = self;
  }
  else
  {
    uint64_t v5 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  }
  objc_super v6 = v5;
  if (v5)
  {
    char v7 = 0;
    v4[2](v4, v5, &v7);
  }
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(PXAssetsSectionLayout *)self headerLayout];
  objc_super v6 = (void *)v5;
  if (self->_showAllButtonSpriteIndex == v3)
  {
    uint64_t v7 = [(PXAssetsSectionLayout *)self showAllActionPerformer];
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_6;
  }
  if (self->_selectAllButtonSpriteIndex == v3)
  {
    uint64_t v7 = [(PXAssetsSectionLayout *)self selectAllButtonConfiguration];
    goto LABEL_5;
  }
  if (v5
    && [(PXGLayout *)self convertSpriteIndex:v3 toDescendantLayout:v5] != -1)
  {
    id v8 = 0;
    goto LABEL_6;
  }
  id v10 = [(PXAssetsSectionLayout *)self dataSource];
  if ((unint64_t)([(PXAssetsSectionLayout *)self zoomLevel] - 3) > 1) {
    goto LABEL_32;
  }
  id v11 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  if (!v11) {
    goto LABEL_31;
  }
  uint64_t v12 = [(PXGLayout *)self convertSpriteIndex:v3 toDescendantLayout:v11];
  if (v12 == -1) {
    goto LABEL_31;
  }
  uint64_t v13 = v12;
  uint64_t v14 = [(PXAssetsSectionLayout *)self configurator];
  if (v14)
  {
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v19 = [v11 objectReferenceForSpriteIndex:v13];
      goto LABEL_29;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v11;
    if ([v15 spriteIndexIsItem:v13])
    {
      uint64_t v13 = [v15 itemForSpriteIndex:v13];
      uint64_t v16 = [v10 identifier];
      int64_t v17 = [(PXAssetsSectionLayout *)self section];
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v16 = *(void *)off_1E5DAB028;
      int64_t v17 = *((void *)off_1E5DAB028 + 1);
      uint64_t v13 = *((void *)off_1E5DAB028 + 2);
      uint64_t v18 = *((void *)off_1E5DAB028 + 3);
    }
  }
  else
  {
    uint64_t v16 = [v10 identifier];
    int64_t v17 = [(PXAssetsSectionLayout *)self section];
    uint64_t v13 = v13;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v16 == *(void *)off_1E5DAAED8 || v13 == 0x7FFFFFFFFFFFFFFFLL || v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_31:

LABEL_32:
    uint64_t v20 = [v10 identifier];
    int64_t v21 = [(PXAssetsSectionLayout *)self section];
    uint64_t v22 = v20;
    int64_t v23 = v21;
    int64x2_t v24 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    id v8 = [v10 objectReferenceAtIndexPath:&v22];
    goto LABEL_33;
  }
  uint64_t v22 = v16;
  int64_t v23 = v17;
  v24.i64[0] = v13;
  v24.i64[1] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v19 = [v10 assetReferenceAtItemIndexPath:&v22];
LABEL_29:
  id v8 = (void *)v19;

  if (!v8) {
    goto LABEL_32;
  }
LABEL_33:

LABEL_6:
  return v8;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_super v6 = [(PXAssetsSectionLayout *)self headerLayout];
  if (!v6
    || (uint64_t v7 = [(PXGLayout *)self convertSpriteIndex:v3 toDescendantLayout:v6],
        v7 == -1))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v6 hitTestResultForSpriteIndex:v7];
  }
  if (self->_showAllButtonSpriteIndex == v3 || self->_selectAllButtonSpriteIndex == v3)
  {
    id v9 = [(PXAssetsSectionLayout *)self assetCollectionReference];
    if (v9)
    {
      if (self->_showAllButtonSpriteIndex == v3) {
        uint64_t v10 = 16;
      }
      else {
        uint64_t v10 = 17;
      }
      id v11 = [(PXGLayout *)self spriteReferenceForSpriteIndex:v3 objectReference:v9];
      uint64_t v12 = [[PXCuratedLibraryHitTestResult alloc] initWithControl:v10 spriteReference:v11 layout:self assetCollectionReference:v9];

      id v8 = v12;
    }
    else
    {
      uint64_t v13 = PLCuratedLibraryGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v32 = v3;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "missing asset collection reference for -hitTestResultForSpriteIndex:%i", buf, 8u);
      }
    }
  }
  if (!v8)
  {
    int64_t v15 = [(PXAssetsSectionLayout *)self zoomLevel];
    int64_t v16 = v15;
    if ((unint64_t)(v15 - 1) >= 2)
    {
      if (v15 == 3)
      {
        int64_t v21 = [(PXAssetsSectionLayout *)self objectReferenceForSpriteIndex:v3];
        uint64_t v22 = [(PXGLayout *)self spriteReferenceForSpriteIndex:v3 objectReference:v21];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v8 = [[PXCuratedLibraryHitTestResult alloc] initWithControl:1 spriteReference:v22 layout:self assetReference:v21];
        }
        else {
          id v8 = 0;
        }
      }
      else if (v15 == 4)
      {
        v30.receiver = self;
        v30.super_class = (Class)PXAssetsSectionLayout;
        id v8 = [(PXGLayout *)&v30 hitTestResultForSpriteIndex:v3];
      }
      else
      {
        id v8 = 0;
      }
      goto LABEL_17;
    }
    int64_t v17 = [(PXAssetsSectionLayout *)self bodyContentLayout];
    if (!v17
      || [(PXGLayout *)self convertSpriteIndex:v3 toDescendantLayout:v17] == -1)
    {
      id v8 = 0;
LABEL_41:

      goto LABEL_17;
    }
    uint64_t v18 = [(PXAssetsSectionLayout *)self objectReferenceForSpriteIndex:v3];
    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_28:
        if (self->_sectionBoundariesSpriteIndex == -1)
        {
          int64x2_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
          [v26 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1329 description:@"missing section boundaries sprite"];
        }
        uint64_t v19 = -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:");
        if (v16 == 1)
        {
          uint64_t v20 = 2;
        }
        else
        {
          if (v16 != 2)
          {
            id v29 = [MEMORY[0x1E4F28B00] currentHandler];
            [v29 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1340 description:@"Code which should be unreachable has been reached"];

            abort();
          }
          uint64_t v20 = 3;
        }
        id v8 = [[PXCuratedLibraryHitTestResult alloc] initWithControl:v20 spriteReference:v19 layout:self assetCollectionReference:v18];

        goto LABEL_41;
      }
      int64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      int64x2_t v27 = (objc_class *)objc_opt_class();
      int64x2_t v25 = NSStringFromClass(v27);
      uint64_t v28 = objc_msgSend(v18, "px_descriptionForAssertionMessage");
      [v23 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1328, @"%@ should be an instance inheriting from %@, but it is %@", @"[self objectReferenceForSpriteIndex:spriteIndex]", v25, v28 object file lineNumber description];
    }
    else
    {
      int64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      int64x2_t v24 = (objc_class *)objc_opt_class();
      int64x2_t v25 = NSStringFromClass(v24);
      [v23 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 1328, @"%@ should be an instance inheriting from %@, but it is nil", @"[self objectReferenceForSpriteIndex:spriteIndex]", v25 object file lineNumber description];
    }

    goto LABEL_28;
  }
LABEL_17:

  return v8;
}

- (PXGItemsGeometry)bodyItemsGeometry
{
  id v2 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 itemsGeometry];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (PXGItemsGeometry *)v3;
}

- (PXGBurstStackEffect)burstStackEffect
{
  burstStackEffect = [(PXGBurstStackEffect *)self->_burstStackEffect entityManager];
  uint64_t v4 = [(PXGLayout *)self entityManager];
  if (burstStackEffect == (void *)v4)
  {
    id v8 = burstStackEffect;
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_super v6 = [(PXGLayout *)self entityManager];

    if (!v6) {
      goto LABEL_6;
    }
    id v7 = objc_alloc((Class)off_1E5DA66D8);
    id v8 = [(PXGLayout *)self entityManager];
    id v9 = (PXGBurstStackEffect *)[v7 initWithEntityManager:v8];
    burstStackEffect = self->_burstStackEffect;
    self->_burstStackEffect = v9;
  }

LABEL_6:
  uint64_t v10 = self->_burstStackEffect;
  return v10;
}

- (PXDisplayAssetFetchResult)keyAssetsFetchResult
{
  uint64_t v3 = [(PXAssetsSectionLayout *)self dataSource];
  uint64_t v4 = [v3 identifier];
  int64_t v5 = [(PXAssetsSectionLayout *)self section];
  uint64_t v10 = v4;
  int64_t v11 = v5;
  int64x2_t v9 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  int64x2_t v12 = v9;
  objc_super v6 = [v3 keyAssetsInSectionIndexPath:&v10];
  if (![v6 count])
  {
    uint64_t v10 = v4;
    int64_t v11 = v5;
    int64x2_t v12 = v9;
    uint64_t v7 = [v3 assetsInSectionIndexPath:&v10];

    objc_super v6 = (void *)v7;
  }

  return (PXDisplayAssetFetchResult *)v6;
}

- (int64_t)keyItemIndex
{
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [(PXAssetsSectionLayout *)self dataSource];
  uint64_t v4 = [(PXAssetsSectionLayout *)self dataSource];
  v6[0] = [v4 identifier];
  v6[1] = [(PXAssetsSectionLayout *)self section];
  int64x2_t v7 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if (v3)
  {
    [v3 keyAssetIndexPathForSectionIndexPath:v6];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }

  if ((void)v8 == *(void *)off_1E5DAAED8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v9;
  }
}

- (BOOL)isCurated
{
  uint64_t v3 = [(PXAssetsSectionLayout *)self dataSource];
  uint64_t v4 = [(PXAssetsSectionLayout *)self assetCollection];
  char v5 = [v3 hasCurationForAssetCollection:v4];

  return v5;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  assetCollectionReference = self->_assetCollectionReference;
  if (!assetCollectionReference) {
    goto LABEL_8;
  }
  [(PXAssetCollectionReference *)assetCollectionReference indexPath];
  [(PXAssetsSectionLayout *)self sectionIndexPath];
  if (v10[8] != v10[4] || v10[9] != v10[5] || v10[10] != v10[6] || v10[11] != v10[7])
  {
    uint64_t v4 = self->_assetCollectionReference;
    self->_assetCollectionReference = 0;
  }
  if (!self->_assetCollectionReference)
  {
LABEL_8:
    if ([(PXAssetsSectionLayout *)self section] != 0x7FFFFFFFFFFFFFFFLL)
    {
      char v5 = [(PXAssetsSectionLayout *)self dataSource];
      [(PXAssetsSectionLayout *)self sectionIndexPath];
      objc_super v6 = [v5 assetCollectionReferenceAtSectionIndexPath:v10];
      int64x2_t v7 = self->_assetCollectionReference;
      self->_assetCollectionReference = v6;
    }
  }
  long long v8 = self->_assetCollectionReference;
  return v8;
}

- (PXDisplayAssetCollection)assetCollection
{
  if ([(PXAssetsSectionLayout *)self section] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = [(PXAssetsSectionLayout *)self dataSource];
    [(PXAssetsSectionLayout *)self sectionIndexPath];
    uint64_t v3 = [v4 assetCollectionAtSectionIndexPath:&v6];
  }
  return (PXDisplayAssetCollection *)v3;
}

- (int64_t)numberOfAssets
{
  uint64_t v3 = [(PXAssetsSectionLayout *)self dataSource];
  int64_t v4 = objc_msgSend(v3, "numberOfItemsInSection:", -[PXAssetsSectionLayout section](self, "section"));

  return v4;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  id v8 = [(PXAssetsSectionLayout *)self dataSource];
  int64_t v5 = [v8 identifier];
  int64_t v6 = [(PXAssetsSectionLayout *)self section];
  retstr->dataSourceIdentifier = v5;
  retstr->int64_t section = v6;
  *(int64x2_t *)&retstr->item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);

  return result;
}

- (void)setVisibleRectOvershootFactor:(double)a3
{
}

- (void)_updateVisibleRectOvershootFactor
{
  [(PXGLayout *)self visibleRect];
  [(PXGLayout *)self contentSize];
  [(PXGLayout *)self referenceSize];
  PXSizeMax();
}

- (void)_invalidateVisibleRectOvershootFactor
{
  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x10) != 0)
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _invalidateVisibleRectOvershootFactor]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXAssetsSectionLayout.m", 1190, @"invalidating %lu after it already has been updated", 16);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x10uLL;
}

- (void)_updateBlurSprite
{
  if (self->_blurSpriteIndex != -1)
  {
    uint64_t v3 = +[PXPhotosGridSettings sharedInstance];
    [(PXAssetsSectionLayout *)self effectiveBlurIntensity];
    double v5 = v4;
    int64_t v6 = [PXAssetsSectionBlurViewConfiguration alloc];
    [v3 maximumBlurRadius];
    double v8 = v7;
    [v3 maximumBlurDimmingFraction];
    uint64_t v10 = [(PXAssetsSectionBlurViewConfiguration *)v6 initWithIntensity:v5 maximumBlurRadius:v8 maximumDimmingFraction:v9];
    blurViewConfiguration = self->_blurViewConfiguration;
    self->_blurViewConfiguration = v10;

    uint64_t v12 = self->_blurSpriteIndex | 0x100000000;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __42__PXAssetsSectionLayout__updateBlurSprite__block_invoke;
    v13[3] = &__block_descriptor_40_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    *(double *)&v13[4] = v5;
    [(PXGLayout *)self modifySpritesInRange:v12 state:v13];
  }
}

double __42__PXAssetsSectionLayout__updateBlurSprite__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double result = *(double *)(a1 + 32) * 100.0;
  *(_WORD *)(a5 + 32) = (int)result;
  return result;
}

- (void)setEffectiveBlurIntensity:(double)a3
{
  if (self->_effectiveBlurIntensity != a3)
  {
    self->_effectiveBlurIntensitdouble y = a3;
    [(PXAssetsSectionLayout *)self _updateBlurSprite];
  }
}

- (void)_updateEffectiveBlurIntensity
{
  id v3 = [(PXGLayout *)self viewEnvironment];
  if (([v3 isBeingFullPageSnapshotted] & 1) == 0) {
    [(PXAssetsSectionLayout *)self blurIntensity];
  }
  -[PXAssetsSectionLayout setEffectiveBlurIntensity:](self, "setEffectiveBlurIntensity:");
}

- (void)setBlurIntensity:(double)a3
{
  if (self->_blurIntensity != a3)
  {
    self->_blurIntensitdouble y = a3;
    [(PXAssetsSectionLayout *)self _updateEffectiveBlurIntensity];
  }
}

- (void)_updateAssetsWithCoveredBottomTrailingCorner
{
  [(PXAssetsSectionLayout *)self showAllButtonFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int64_t v11 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  v32.origin.double x = v4;
  v32.origin.double y = v6;
  v32.size.double width = v8;
  v32.size.double height = v10;
  if (CGRectIsEmpty(v32) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int64_t v23 = 0;
  }
  else
  {
    objc_msgSend(v11, "convertRect:fromLayout:", self, v4, v6, v8, v10);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    uint64_t v20 = [(PXAssetsSectionLayout *)self spec];
    [v20 padding];
    double v22 = v21;

    v33.origin.double x = v13;
    v33.origin.double y = v15;
    v33.size.double width = v17;
    v33.size.double height = v19;
    CGRect v34 = CGRectInset(v33, v22 * -2.0, v22 * -2.0);
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __69__PXAssetsSectionLayout__updateAssetsWithCoveredBottomTrailingCorner__block_invoke;
    v26[3] = &unk_1E5DB1E20;
    CGRect v27 = v34;
    void v26[4] = &v28;
    objc_msgSend(v11, "enumerateItemsInRect:usingBlock:", v26, v13, v15, v17, v19);
    if (v29[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v23 = 0;
    }
    else
    {
      id v24 = objc_alloc(MEMORY[0x1E4F28D60]);
      int64_t v23 = (void *)[v24 initWithIndex:v29[3]];
    }
    _Block_object_dispose(&v28, 8);
  }
  int64x2_t v25 = [(PXAssetsSectionLayout *)self assetDecorationSource];
  [v25 setItemsWithCoveredBottomTrailingCorner:v23];
}

BOOL __69__PXAssetsSectionLayout__updateAssetsWithCoveredBottomTrailingCorner__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&a4);
  v17.origin.double x = a4;
  v17.origin.double y = a5;
  v17.size.double width = a6;
  v17.size.double height = a7;
  v16.double y = CGRectGetMaxY(v17);
  v16.double x = MaxX;
  BOOL result = CGRectContainsPoint(*(CGRect *)(a1 + 40), v16);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

- (void)_invalidateAssetsWithCoveredBottomTrailingCorner
{
  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x1000) != 0)
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _invalidateAssetsWithCoveredBottomTrailingCorner]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXAssetsSectionLayout.m", 1129, @"invalidating %lu after it already has been updated", 4096);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x1000uLL;
}

- (PXCuratedLibraryOverlayButtonConfiguration)selectAllButtonConfiguration
{
  if (!self->_selectAllButtonConfigurationIsValid)
  {
    double v3 = [(PXAssetsSectionLayout *)self configurator];
    double v4 = [v3 headerSpecForHeaderStyle:2 assetSectionLayout:self];

    if (v4)
    {
      uint64_t v5 = [(PXAssetsSectionLayout *)self selectAllButtonTitle];
      double v6 = (void *)v5;
      double v7 = &stru_1F00B0030;
      if (v5) {
        double v7 = (__CFString *)v5;
      }
      double v8 = v7;

      double v9 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:v8 spec:v4];

      double v10 = [(PXAssetsSectionLayout *)self selectAllActionPerformer];
      [(PXCuratedLibraryOverlayButtonConfiguration *)v9 setActionPerformer:v10];
    }
    else
    {
      double v9 = 0;
    }
    selectAllButtonConfiguration = self->_selectAllButtonConfiguration;
    self->_selectAllButtonConfiguration = v9;

    self->_selectAllButtonConfigurationIsValid = 1;
  }
  double v12 = self->_selectAllButtonConfiguration;
  return v12;
}

- (void)_updateSelectAllButtonPosition
{
  if (self->_selectAllButtonSpriteIndex != -1)
  {
    double v4 = [(PXAssetsSectionLayout *)self headerLayoutGuide];
    [v4 rectInLayout:self];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    [(PXGLayout *)self contentSize];
    double v14 = v13;
    double v16 = v15;
    v19.origin.double x = v6;
    v19.origin.double y = v8;
    v19.size.double width = v10;
    v19.size.double height = v12;
    if (CGRectIsNull(v19))
    {
      CGFloat v6 = *MEMORY[0x1E4F1DAD8];
      CGFloat v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      CGFloat v12 = v16;
      CGFloat v10 = v14;
    }
    unint64_t v17 = [(PXAssetsSectionLayout *)self zoomLevel];
    if (v17 == 3)
    {
      v20.origin.double x = v6;
      v20.origin.double y = v8;
      v20.size.double width = v10;
      v20.size.double height = v12;
      CGRectGetMinX(v20);
    }
    else if (v17 < 3 || v17 == 4)
    {
      double v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:1078 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    PXSizeIsNull();
  }
}

float __55__PXAssetsSectionLayout__updateSelectAllButtonPosition__block_invoke(CGFloat *a1, uint64_t a2, float32x2_t *a3, float *a4)
{
  CGFloat v7 = a1[4];
  CGFloat v8 = a1[5];
  CGFloat v9 = a1[6];
  CGFloat v10 = a1[7];
  v17.origin.double x = v7;
  v17.origin.double y = v8;
  v17.size.double width = v9;
  v17.size.double height = v10;
  CGFloat MidX = CGRectGetMidX(v17);
  v18.origin.double x = v7;
  v18.origin.double y = v8;
  v18.size.double width = v9;
  v18.size.double height = v10;
  CGFloat MidY = CGRectGetMidY(v18);
  v19.origin.double x = v7;
  v19.origin.double y = v8;
  v19.size.double width = v9;
  v19.size.double height = v10;
  CGFloat Width = CGRectGetWidth(v19);
  v20.origin.double x = v7;
  v20.origin.double y = v8;
  v20.size.double width = v9;
  v20.size.double height = v10;
  CGFloat Height = CGRectGetHeight(v20);
  v14.f64[0] = Width;
  v14.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFF0000000000000;
  a3[3] = vcvt_f32_f64(v14);
  float result = a1[8];
  *a4 = result;
  return result;
}

- (void)_invalidateSelectAllButtonPosition
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x2000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x2000) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _invalidateSelectAllButtonPosition]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXAssetsSectionLayout.m", 1056, @"invalidating %lu after it already has been updated", 0x2000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x2000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateSelectAllButton
{
  ++self->_selectAllButtonVersion;
  self->_cachedSelectAllButtonConfigurationSize = *(CGSize *)off_1E5DAB030;
  self->_selectAllButtonConfigurationIsValid = 0;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _invalidateSelectAllButton]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXAssetsSectionLayout.m", 1052, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (PXCuratedLibraryOverlayButtonConfiguration)showAllButtonConfiguration
{
  if (!self->_showAllButtonConfigurationIsValid)
  {
    if ([(PXAssetsSectionLayout *)self zoomLevel] == 3
      && ((uint64_t v3 = [(PXAssetsSectionLayout *)self showAllCount], v3 > 0)
       || (+[PXCuratedLibrarySettings sharedInstance],
           double v4 = objc_claimAutoreleasedReturnValue(),
           int v5 = [v4 forceShowAllButtonsVisible],
           v4,
           v5)))
    {
      CGFloat v6 = PXLocalizedStringFromTable(@"PXLibraryDaysShowAllButtonTitleFormat", @"PhotosUICore");
      CGFloat v7 = PXLocalizedStringWithValidatedFormat(v6, @"%li");

      CGFloat v8 = [(PXAssetsSectionLayout *)self configurator];
      CGFloat v9 = [v8 headerSpecForHeaderStyle:2 assetSectionLayout:self];

      CGFloat v10 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:v7 spec:v9];

      if (v10)
      {
        double v11 = [(PXAssetsSectionLayout *)self showAllActionPerformer];
        [v11 setLayout:self];
        [(PXCuratedLibraryOverlayButtonConfiguration *)v10 setActionPerformer:v11];
      }
    }
    else
    {
      CGFloat v10 = 0;
    }
    showAllButtonConfiguration = self->_showAllButtonConfiguration;
    self->_showAllButtonConfiguration = v10;

    self->_showAllButtonConfigurationIsValid = 1;
  }
  double v13 = self->_showAllButtonConfiguration;
  return v13;
}

- (BOOL)hasContentForSummary
{
  uint64_t v3 = [(PXAssetsSectionLayout *)self dataSource];
  [(PXAssetsSectionLayout *)self sectionIndexPath];
  uint64_t v4 = [v3 numberOfCuratedItemsInSectionIndexPath:&v10];

  int v5 = [(PXAssetsSectionLayout *)self assetCollection];
  uint64_t v6 = [v5 estimatedAssetCount];

  return v6 != 0x7FFFFFFFFFFFFFFFLL && v4 != v6 && v4 > 0;
}

- (int64_t)showAllCount
{
  int64_t v3 = [(PXAssetsSectionLayout *)self numberOfAssets];
  uint64_t v4 = [(PXAssetsSectionLayout *)self assetCollection];
  uint64_t v5 = [v4 estimatedAssetCount];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v5 - v3;
  }
}

- (void)_getCuratedLibraryShowAllButtonFrame:(CGRect *)a3 alpha:(double *)a4
{
  [(PXGLayout *)self contentSize];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v10 = *MEMORY[0x1E4F1DAD8];
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  switch([(PXAssetsSectionLayout *)self zoomLevel])
  {
    case 0:
    case 1:
    case 4:
      CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:966 description:@"Code which should be unreachable has been reached"];

      abort();
    case 2:
      v13.origin.double x = v10;
      v13.origin.double y = v11;
      v13.size.double width = v7;
      v13.size.double height = v9;
      CGRectGetMaxX(v13);
      break;
    default:
      break;
  }
  PXSizeIsNull();
}

- (void)_updateShowAllButtonPosition
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v14 = *MEMORY[0x1E4F1DB20];
  long long v15 = v3;
  if (self->_showAllButtonSpriteIndex != -1)
  {
    *(double *)&uint64_t v13 = 1.0;
    int64_t v5 = [(PXAssetsSectionLayout *)self showAllAffordanceStyle];
    if (v5 == 1)
    {
      [(PXAssetsSectionLayout *)self _getCuratedLibraryShowAllButtonFrame:&v14 alpha:&v13];
      double v6 = *(double *)&v13;
    }
    else
    {
      if (v5 == 2)
      {
        [(PXGLayout *)self contentSize];
        PXRectWithOriginAndSize();
      }
      double v6 = 1.0;
      if (!v5)
      {
        CGFloat v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:a2 object:self file:@"PXAssetsSectionLayout.m" lineNumber:929 description:@"Code which should be unreachable has been reached"];

        abort();
      }
    }
    uint64_t v8 = self->_showAllButtonSpriteIndex | 0x100000000;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __53__PXAssetsSectionLayout__updateShowAllButtonPosition__block_invoke;
    v9[3] = &__block_descriptor_72_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    long long v10 = v14;
    long long v11 = v15;
    double v12 = v6;
    [(PXGLayout *)self modifySpritesInRange:v8 state:v9];
  }
  -[PXAssetsSectionLayout setShowAllButtonFrame:](self, "setShowAllButtonFrame:", v14, v15);
}

float __53__PXAssetsSectionLayout__updateShowAllButtonPosition__block_invoke(CGFloat *a1, uint64_t a2, float32x2_t *a3, float *a4)
{
  CGFloat v7 = a1[4];
  CGFloat v8 = a1[5];
  CGFloat v9 = a1[6];
  CGFloat v10 = a1[7];
  v17.origin.double x = v7;
  v17.origin.double y = v8;
  v17.size.double width = v9;
  v17.size.double height = v10;
  CGFloat MidX = CGRectGetMidX(v17);
  v18.origin.double x = v7;
  v18.origin.double y = v8;
  v18.size.double width = v9;
  v18.size.double height = v10;
  CGFloat MidY = CGRectGetMidY(v18);
  v19.origin.double x = v7;
  v19.origin.double y = v8;
  v19.size.double width = v9;
  v19.size.double height = v10;
  CGFloat Width = CGRectGetWidth(v19);
  v20.origin.double x = v7;
  v20.origin.double y = v8;
  v20.size.double width = v9;
  v20.size.double height = v10;
  CGFloat Height = CGRectGetHeight(v20);
  v14.f64[0] = Width;
  v14.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFF0000000000000;
  a3[3] = vcvt_f32_f64(v14);
  float result = a1[8];
  *a4 = result;
  return result;
}

- (void)_invalidateShowAllButtonPosition
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _invalidateShowAllButtonPosition]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXAssetsSectionLayout.m", 919, @"invalidating %lu after it already has been updated", 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 2048;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateShowAllButton
{
  ++self->_showAllButtonVersion;
  self->_cachedShowAllButtonConfigurationSize = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v7 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _invalidateShowAllButton]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXAssetsSectionLayout.m", 914, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_7:
  self->_showAllButtonConfigurationIsValid = 0;
}

- (void)_updateSectionHeaderProperties
{
  long long v3 = self->_sectionHeaderLayout;
  p_super = &v3->super;
  if (!v3) {
    p_super = self->_headerLayout;
  }
  int64_t v5 = p_super;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = __55__PXAssetsSectionLayout__updateSectionHeaderProperties__block_invoke;
  v8[3] = &unk_1E5DD0F30;
  void v8[4] = self;
  CGFloat v9 = v5;
  CGFloat v10 = v3;
  double v6 = v3;
  CGFloat v7 = v5;
  [(PXGLayout *)v7 performChangesWithLocalUpdate:v8];
}

void __55__PXAssetsSectionLayout__updateSectionHeaderProperties__block_invoke(id *a1)
{
  id v3 = +[PXCuratedLibrarySettings sharedInstance];
  if ([a1[4] allowsPositionDependentHeaderContentOpacity])
  {
    [v3 floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom];
    [v3 floatingHeaderFadeOverDistance];
    [a1[4] distanceBetweenTitleTopAndBodyBottom];
    PXClamp();
  }
  [a1[5] setAlpha:1.0];
  [a1[6] setButtonsAlpha:1.0];
  if ([a1[4] mode] == 3)
  {
    id v2 = [a1[4] bodyContentLayout];
    [v2 contentSize];

    [a1[4] visibleRect];
    CGRectGetMinY(v5);
    [a1[4] intersectionSpacing];
    PXClamp();
  }
  [a1[6] setMaxPossibleHeight:1.79769313e308];
}

- (void)_updateDistanceProperties
{
  id v3 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  id v20 = v3;
  if (v3)
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v3 contentSize];
    -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", v20, v4, v5, v6, v7);
    double MaxY = CGRectGetMaxY(v22);
  }
  else
  {
    [(PXGLayout *)self contentSize];
    double MaxY = v9;
  }
  p_sectionHeaderLayout = (id *)&self->_sectionHeaderLayout;
  long long v11 = [(PXGLayout *)self->_sectionHeaderLayout superlayout];

  if (v11 == self)
  {
    [*p_sectionHeaderLayout titleSubtitleFrame];
    -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", *p_sectionHeaderLayout);
    double MinY = CGRectGetMinY(v23);
  }
  else
  {
    double v12 = [(PXGLayout *)self->_headerLayout superlayout];

    double MinY = 0.0;
    if (v12 == self)
    {
      -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", self->_headerLayout, 0.0, 0.0);
      double MinY = v14;
    }
  }
  [(PXAssetsSectionLayout *)self setDistanceBetweenTitleTopAndBodyBottom:MaxY - MinY];
  long long v15 = [*p_sectionHeaderLayout superlayout];

  if (v15 == self
    || (p_sectionHeaderLayout = (id *)&self->_headerLayout,
        [(PXGLayout *)self->_headerLayout superlayout],
        double v16 = (PXAssetsSectionLayout *)objc_claimAutoreleasedReturnValue(),
        v16,
        double v17 = 0.0,
        v16 == self))
  {
    -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", *p_sectionHeaderLayout, 0.0, 0.0);
    double v17 = v18;
  }
  [(PXAssetsSectionLayout *)self intersectionSpacing];
  [(PXAssetsSectionLayout *)self setDistanceBetweenHeaderTopAndNextBodyTop:MaxY + v19 - v17];
}

- (void)_updateLocalSprites
{
  self->_isUpdatingLocalSprites = 1;
  uint64_t v31 = 0;
  CGRect v32 = &v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 0;
  uint64_t v25 = 0;
  int64x2_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__29136;
  id v29 = __Block_byref_object_dispose__29137;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  CGRect v22 = __Block_byref_object_copy__29136;
  CGRect v23 = __Block_byref_object_dispose__29137;
  uint64_t v24 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PXAssetsSectionLayout__updateLocalSprites__block_invoke;
  aBlock[3] = &unk_1E5DB2C40;
  void aBlock[4] = &v31;
  aBlock[5] = &v25;
  aBlock[6] = &v19;
  double v4 = (void (**)(void *, unsigned int *, uint64_t))_Block_copy(aBlock);
  v4[2](v4, &self->_sectionBoundariesSpriteIndex, 1);
  BOOL v5 = [(PXAssetsSectionLayout *)self wantsShadow];
  if (v5)
  {
    id v2 = [(PXAssetsSectionLayout *)self spec];
    uint64_t v6 = [v2 userInterfaceStyleAllowsShadow];
  }
  else
  {
    uint64_t v6 = 0;
  }
  v4[2](v4, &self->_sectionShadowSpriteIndex, v6);
  if (v5) {

  }
  int64_t v7 = [(PXAssetsSectionLayout *)self showAllAffordanceStyle];
  if (v7 == 1)
  {
    double v9 = [(PXAssetsSectionLayout *)self showAllButtonConfiguration];
    if (v9)
    {
      CGFloat v10 = [(PXAssetsSectionLayout *)self showAllActionPerformer];
      BOOL v8 = v10 != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = v7 == 2;
  }
  v4[2](v4, &self->_showAllButtonSpriteIndex, v8);
  long long v11 = [(PXAssetsSectionLayout *)self spec];
  if ([v11 canShowSelectAllButton])
  {
    double v12 = [(PXAssetsSectionLayout *)self selectAllButtonConfiguration];
    if (v12)
    {
      uint64_t v13 = [(PXAssetsSectionLayout *)self selectAllActionPerformer];
      BOOL v14 = v13 != 0;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  v4[2](v4, &self->_selectAllButtonSpriteIndex, v14);
  long long v15 = [(PXAssetsSectionLayout *)self spec];
  v4[2](v4, &self->_blurSpriteIndex, [v15 allowsBlur]);

  if ([(id)v26[5] count] || objc_msgSend((id)v20[5], "count"))
  {
    id v16 = objc_alloc((Class)off_1E5DA5568);
    double v17 = (void *)[v16 initWithIncrementalChangeDetailsRemovedIndexes:v20[5] insertedIndexes:v26[5] movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
    [(PXGLayout *)self applySpriteChangeDetails:v17 countAfterChanges:*((unsigned int *)v32 + 6) initialState:0 modifyState:0];
  }
  [(PXGLayout *)self contentSize];
  PXRectWithOriginAndSize();
}

void *__44__PXAssetsSectionLayout__updateLocalSprites__block_invoke(void *result, unsigned int *a2, int a3)
{
  double v4 = result;
  unsigned int v5 = *a2;
  if (a3)
  {
    *a2 = (*(_DWORD *)(*(void *)(result[4] + 8) + 24))++;
    unsigned int v6 = *a2;
  }
  else
  {
    unsigned int v6 = -1;
    *a2 = -1;
  }
  if (v5 == -1)
  {
    if (v6 == -1) {
      return result;
    }
    int64_t v7 = *(void **)(*(void *)(result[5] + 8) + 40);
    if (!v7)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      uint64_t v12 = *(void *)(v4[5] + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      int64_t v7 = *(void **)(*(void *)(v4[5] + 8) + 40);
      unsigned int v6 = *a2;
    }
  }
  else
  {
    if (v6 != -1) {
      return result;
    }
    int64_t v7 = *(void **)(*(void *)(result[6] + 8) + 40);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      uint64_t v9 = *(void *)(v4[6] + 8);
      CGFloat v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      int64_t v7 = *(void **)(*(void *)(v4[6] + 8) + 40);
    }
    unsigned int v6 = v5;
  }
  return (void *)[v7 addIndex:v6];
}

_DWORD *__44__PXAssetsSectionLayout__updateLocalSprites__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = [*(id *)(a1 + 32) configurator];
  if (v9)
  {
    CGFloat v10 = [*(id *)(a1 + 32) configurator];
    [v10 containerFrameForAssetSectionLayout:*(void *)(a1 + 32)];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
  }
  else
  {
    CGFloat v12 = *(double *)(a1 + 40);
    CGFloat v14 = *(double *)(a1 + 48);
    CGFloat v16 = *(double *)(a1 + 56);
    CGFloat v18 = *(double *)(a1 + 64);
  }

  uint64_t v19 = *(void *)(a1 + 32);
  if (v19)
  {
    [(id)v19 sectionIndexPath];
    uint64_t v19 = *(void *)(a1 + 32);
  }
  uint64_t v20 = *(unsigned int *)(v19 + 1064);
  if (v20 != -1)
  {
    uint64_t v21 = (float32x2_t *)(a3 + 32 * v20);
    v57.origin.double x = v12;
    v57.origin.double y = v14;
    v57.size.double width = v16;
    v57.size.double height = v18;
    CGFloat MidX = CGRectGetMidX(v57);
    v58.origin.double x = v12;
    v58.origin.double y = v14;
    v58.size.double width = v16;
    v58.size.double height = v18;
    CGFloat MidY = CGRectGetMidY(v58);
    v59.origin.double x = v12;
    v59.origin.double y = v14;
    v59.size.double width = v16;
    v59.size.double height = v18;
    CGFloat Width = CGRectGetWidth(v59);
    v60.origin.double x = v12;
    v60.origin.double y = v14;
    v60.size.double width = v16;
    v60.size.double height = v18;
    CGFloat Height = CGRectGetHeight(v60);
    v25.f64[0] = Width;
    v25.f64[1] = Height;
    *(CGFloat *)uint64_t v21 = MidX;
    *(CGFloat *)&v21[1] = MidY;
    v21[2] = (float32x2_t)0x406A400000000000;
    v21[3] = vcvt_f32_f64(v25);
    int64x2_t v26 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 1064));
    long long v27 = *((_OWORD *)off_1E5DAAF90 + 7);
    v26[6] = *((_OWORD *)off_1E5DAAF90 + 6);
    v26[7] = v27;
    long long v28 = *((_OWORD *)off_1E5DAAF90 + 9);
    v26[8] = *((_OWORD *)off_1E5DAAF90 + 8);
    v26[9] = v28;
    long long v29 = *((_OWORD *)off_1E5DAAF90 + 3);
    v26[2] = *((_OWORD *)off_1E5DAAF90 + 2);
    v26[3] = v29;
    long long v30 = *((_OWORD *)off_1E5DAAF90 + 5);
    void v26[4] = *((_OWORD *)off_1E5DAAF90 + 4);
    void v26[5] = v30;
    long long v31 = *((_OWORD *)off_1E5DAAF90 + 1);
    *int64x2_t v26 = *(_OWORD *)off_1E5DAAF90;
    v26[1] = v31;
    *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1064) + 1) = 0;
    uint64_t v19 = *(void *)(a1 + 32);
  }
  uint64_t v32 = *(unsigned int *)(v19 + 1068);
  if (v32 != -1)
  {
    uint64_t v33 = (float32x2_t *)(a3 + 32 * v32);
    uint64_t v34 = a4 + 160 * v32;
    uint64_t v35 = a5 + 40 * v32;
    [(id)v19 spec];
    v36 = [(id)objc_claimAutoreleasedReturnValue() shadow];
    PXGConfigureShadowSprite(v33, v34, v35, v36, *(void **)(a1 + 32), v12, v14, v16, v18);
  }
  if (*(unsigned char *)(v19 + 1056) && (*(unsigned char *)(v19 + 1049) & 8) != 0)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    v55 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _updateLocalSprites]_block_invoke_2"];
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, @"PXAssetsSectionLayout.m", 823, @"invalidating %lu after it already has been updated", 2048);
    goto LABEL_23;
  }
  *(void *)(v19 + 1040) |= 0x800uLL;
  uint64_t v37 = *(void *)(a1 + 32);
  unsigned int v38 = *(_DWORD *)(v37 + 1072);
  if (v38 != -1)
  {
    v39 = (_OWORD *)(a4 + 160 * v38);
    long long v40 = *((_OWORD *)off_1E5DAAF90 + 5);
    void v39[4] = *((_OWORD *)off_1E5DAAF90 + 4);
    v39[5] = v40;
    long long v41 = *((_OWORD *)off_1E5DAAF90 + 3);
    v39[2] = *((_OWORD *)off_1E5DAAF90 + 2);
    v39[3] = v41;
    long long v42 = *((_OWORD *)off_1E5DAAF90 + 9);
    v39[8] = *((_OWORD *)off_1E5DAAF90 + 8);
    v39[9] = v42;
    long long v43 = *((_OWORD *)off_1E5DAAF90 + 7);
    v39[6] = *((_OWORD *)off_1E5DAAF90 + 6);
    v39[7] = v43;
    long long v44 = *((_OWORD *)off_1E5DAAF90 + 1);
    _OWORD *v39 = *(_OWORD *)off_1E5DAAF90;
    v39[1] = v44;
    *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1072)) = 1;
    *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1072) + 1) = 10;
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1072) + 32) = *(_WORD *)(*(void *)(a1 + 32)
                                                                                             + 1076);
    PXGSectionedSpriteTagMake();
  }
  uint64_t v45 = v37 + 1040;
  if (*(unsigned char *)(v45 + 16) && (*(unsigned char *)(v45 + 9) & 0x20) != 0)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    v55 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _updateLocalSprites]_block_invoke_2"];
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, @"PXAssetsSectionLayout.m", 836, @"invalidating %lu after it already has been updated", 0x2000);
LABEL_23:

    abort();
  }
  *(void *)v45 |= 0x2000uLL;
  float result = *(_DWORD **)(a1 + 32);
  unsigned int v47 = result[274];
  if (v47 != -1)
  {
    v48 = (_OWORD *)(a4 + 160 * v47);
    long long v49 = *((_OWORD *)off_1E5DAAF90 + 5);
    v48[4] = *((_OWORD *)off_1E5DAAF90 + 4);
    v48[5] = v49;
    long long v50 = *((_OWORD *)off_1E5DAAF90 + 3);
    v48[2] = *((_OWORD *)off_1E5DAAF90 + 2);
    v48[3] = v50;
    long long v51 = *((_OWORD *)off_1E5DAAF90 + 9);
    v48[8] = *((_OWORD *)off_1E5DAAF90 + 8);
    v48[9] = v51;
    long long v52 = *((_OWORD *)off_1E5DAAF90 + 7);
    v48[6] = *((_OWORD *)off_1E5DAAF90 + 6);
    v48[7] = v52;
    long long v53 = *((_OWORD *)off_1E5DAAF90 + 1);
    _OWORD *v48 = *(_OWORD *)off_1E5DAAF90;
    v48[1] = v53;
    *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1096)) = 1;
    *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1096) + 1) = 10;
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1096) + 32) = *(_WORD *)(*(void *)(a1 + 32)
                                                                                             + 1100);
    PXGSectionedSpriteTagMake();
  }
  if (result[294] != -1)
  {
    [result intersectionSpacing];
    PXEdgeInsetsMake();
  }
  return result;
}

- (void)_updateDecorationSource
{
  id v10 = [(PXAssetsSectionLayout *)self assetDecorationSource];
  id v3 = [(PXAssetsSectionLayout *)self dataSource];
  objc_msgSend(v10, "setWantsSharedLibraryDecorations:", objc_msgSend(v3, "libraryFilter") != 1);

  [v10 setWantsStacksDecorations:0];
  int64_t v4 = [(PXAssetsSectionLayout *)self zoomLevel];
  unsigned int v5 = +[PXPhotosGridSettings sharedInstance];
  int v6 = [v5 enableStacksReviewUI];

  int64_t v7 = +[PXCuratedLibrarySettings sharedInstance];
  unsigned int v8 = [v7 showSaliencyRects];
  if (v4 == 3) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }

  [v10 setEnableDebugDecoration:v6 | v9];
  if (v4 != 4)
  {
    [v10 setForbiddenBadges:0x208000041FLL];
    [v10 setDurationAlwaysHidden:(unint64_t)(v4 - 1) < 2];
  }
}

- (void)_updateContent
{
  if ([(PXAssetsSectionLayout *)self numberOfAssets])
  {
    id v3 = [(PXAssetsSectionLayout *)self headerLayout];
    [(PXGSplitLayout *)self setFirstSublayout:v3];
  }
  else
  {
    if ([(PXAssetsSectionLayout *)self removesHeaderLayoutWhenEmpty])
    {
      [(PXGSplitLayout *)self setFirstSublayout:0];
    }
    else
    {
      int64_t v4 = [(PXAssetsSectionLayout *)self headerLayout];
      [(PXGSplitLayout *)self setFirstSublayout:v4];
    }
    if ([(PXAssetsSectionLayout *)self removesContentLayoutWhenEmpty])
    {
      [(PXAssetsSectionLayout *)self setBodyContentLayout:0 wantsDecoration:0];
      goto LABEL_9;
    }
  }
  unsigned int v5 = [(PXAssetsSectionLayout *)self configurator];
  [v5 configureAssetSectionLayout:self];

  int v6 = [(PXAssetsSectionLayout *)self delegate];
  [v6 assetSectionLayoutDidConfigureLayouts:self];

  int64_t v7 = [(PXAssetsSectionLayout *)self dropTargetAssetReference];
  unsigned int v8 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  unsigned int v9 = [v8 layoutForItemChanges];
  [v9 setDropTargetObjectReference:v7];

  [(PXAssetsSectionLayout *)self _updateDecorationSource];
LABEL_9:
  int64_t v10 = [(PXAssetsSectionLayout *)self section];
  id v11 = [(PXAssetsSectionLayout *)self dataSource];
  -[PXAssetsSectionLayout setIsLastSection:](self, "setIsLastSection:", v10 == [v11 numberOfSections] - 1);
}

- (void)_invalidateContent
{
  [(PXGLayout *)self invalidateVersion];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 6;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 6) != 0)
    {
      int v6 = [MEMORY[0x1E4F28B00] currentHandler];
      int64_t v7 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _invalidateContent]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXAssetsSectionLayout.m", 707, @"invalidating %lu after it already has been updated", 6);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 6;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setShowAllButtonTitle:(id)a3
{
  unsigned int v8 = (NSString *)a3;
  int64_t v4 = self->_showAllButtonTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      int v6 = (NSString *)[(NSString *)v8 copy];
      showAllButtonTitle = self->_showAllButtonTitle;
      self->_showAllButtonTitle = v6;

      [(PXAssetsSectionLayout *)self _invalidateShowAllButtonPosition];
    }
  }
}

- (void)_updateFooter
{
  double v3 = *((double *)off_1E5DAAF10 + 2);
  if ([(PXAssetsSectionLayout *)self showAllAffordanceStyle] == 2)
  {
    uint64_t v4 = [(PXAssetsSectionLayout *)self showAllCount];
    if (v4 >= 1)
    {
      uint64_t v5 = v4;
      int v6 = NSString;
      int64_t v7 = PXLocalizedStringFromTable(@"PXAssetsSectionShowAllButtonTitleWith%liMorePhotos", @"PhotosUICore");
      objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
      id v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
      unsigned int v8 = [(PXAssetsSectionLayout *)self spec];
      [v8 showAllButtonHeight];
      double v3 = v3 + v9;

      id v10 = v17;
      goto LABEL_9;
    }
    if ([(PXAssetsSectionLayout *)self hasContentForSummary])
    {
      id v11 = +[PXLemonadeSettings sharedInstance];
      int v12 = [v11 enableDetailsSummaryButton];

      if (v12)
      {
        PXLocalizedStringFromTable(@"PXPhotosGridShowSummaryButtonTitle", @"PhotosUICore");
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
    }
  }
  id v10 = 0;
LABEL_9:
  id v18 = v10;
  -[PXAssetsSectionLayout setShowAllButtonTitle:](self, "setShowAllButtonTitle:");
  if ([(PXAssetsSectionLayout *)self automaticallyUpdatesPadding])
  {
    double v13 = *(double *)off_1E5DAAF10;
    double v14 = *((double *)off_1E5DAAF10 + 1);
    double v15 = *((double *)off_1E5DAAF10 + 3);
    if (![(PXAssetsSectionLayout *)self isLastSection])
    {
      [(PXAssetsSectionLayout *)self intersectionSpacing];
      double v3 = v3 + v16;
    }
    -[PXGSplitLayout setPadding:](self, "setPadding:", v13, v14, v3, v15);
  }
}

- (void)_invalidateFooter
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v6 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _invalidateFooter]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXAssetsSectionLayout.m", 665, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateConfigurator
{
  id v7 = [(PXAssetsSectionLayout *)self spec];
  int64_t v3 = [(PXAssetsSectionLayout *)self zoomLevel];
  if ([(PXAssetsSectionLayout *)self disableConfigurators])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [(PXAssetsSectionLayout *)self assetCollectionReference];
    int v6 = [v5 assetCollection];
    uint64_t v4 = [v7 sectionConfiguratorForAssetCollection:v6 inZoomLevel:v3];
  }
  [(PXAssetsSectionLayout *)self setConfigurator:v4];
  -[PXAssetsSectionLayout setAllowsPositionDependentHeaderContentOpacity:](self, "setAllowsPositionDependentHeaderContentOpacity:", [v7 allowsPositionDependentHeaderContentOpacityInZoomLevel:v3]);
}

- (void)_invalidateConfigurator
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      int v6 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout _invalidateConfigurator]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXAssetsSectionLayout.m", 650, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setRemovesContentLayoutWhenEmpty:(BOOL)a3
{
  if (self->_removesContentLayoutWhenEmpty != a3)
  {
    self->_removesContentLayoutWhenEmptdouble y = a3;
    [(PXAssetsSectionLayout *)self _invalidateContent];
  }
}

- (void)setRemovesHeaderLayoutWhenEmpty:(BOOL)a3
{
  if (self->_removesHeaderLayoutWhenEmpty != a3)
  {
    self->_removesHeaderLayoutWhenEmptdouble y = a3;
    [(PXAssetsSectionLayout *)self _invalidateContent];
  }
}

- (void)setBodyContentLayout:(id)a3 wantsDecoration:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (PXGLayout *)a3;
  p_bodyContentLayout = &self->_bodyContentLayout;
  if (self->_bodyContentLayout != v7)
  {
    double v14 = v7;
    objc_storeStrong((id *)&self->_bodyContentLayout, a3);
    if (v4 && *p_bodyContentLayout)
    {
      double v9 = [[PXGDecoratingLayout alloc] initWithDecoratedLayout:v14];
      id v10 = [(PXAssetsSectionLayout *)self assetDecorationSource];
      [(PXGDecoratingLayout *)v9 setDecorationSource:v10];

      id v11 = [(PXAssetsSectionLayout *)self assetDecorationSource];
      [(PXGDecoratingLayout *)v9 setContentSource:v11];

      int v12 = [(PXAssetsSectionLayout *)self assetDecorationSource];
      [v12 setDecoratedLayout:v14];

      [(PXAssetsSectionLayout *)self setBodyContainerLayout:v9];
      double v13 = [(PXAssetsSectionLayout *)self bodyContainerLayout];
      [(PXGSplitLayout *)self setSecondSublayout:v13];
    }
    else
    {
      [(PXAssetsSectionLayout *)self setBodyContainerLayout:0];
      [(PXGSplitLayout *)self setSecondSublayout:*p_bodyContentLayout];
    }
    [(PXAssetsSectionLayout *)self _invalidateAssetsWithCoveredBottomTrailingCorner];
    id v7 = v14;
  }
}

- (void)setDecorationDataSource:(id)a3
{
  int v6 = (PXPhotosCustomViewDecorationDataSource *)a3;
  if (self->_decorationDataSource != v6)
  {
    objc_storeStrong((id *)&self->_decorationDataSource, a3);
    uint64_t v5 = [(PXAssetsSectionLayout *)self assetDecorationSource];
    [v5 setDecorationDataSource:v6];
  }
}

- (void)setHeaderLayout:(id)a3
{
  int v6 = (PXGLayout *)a3;
  if (self->_headerLayout != v6)
  {
    objc_storeStrong((id *)&self->_headerLayout, a3);
    objc_opt_class();
    uint64_t v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
    objc_storeStrong((id *)&self->_sectionHeaderLayout, v5);
    if ([(PXAssetsSectionLayout *)self numberOfAssets]) {
      [(PXGSplitLayout *)self setFirstSublayout:v6];
    }
  }
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)PXAssetsSectionLayout;
  int64_t v3 = [(PXAssetsSectionLayout *)&v13 description];
  unint64_t v4 = [(PXAssetsSectionLayout *)self zoomLevel];
  if (v4 > 4) {
    uint64_t v5 = @"???";
  }
  else {
    uint64_t v5 = off_1E5DCBFE0[v4];
  }
  int v6 = v5;
  int64_t v7 = [(PXAssetsSectionLayout *)self section];
  unsigned int v8 = [(PXAssetsSectionLayout *)self dataSource];
  uint64_t v9 = [v8 identifier];
  id v10 = [(PXAssetsSectionLayout *)self assetCollection];
  id v11 = objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", @", zoomLevel=%@, section=%lu, dataSourceIdentifier=%li assetCollection={%@}", v6, v7, v9, v10);

  return (NSString *)v11;
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXAssetsSectionLayout;
  [(PXGSplitLayout *)&v3 visibleRectDidChange];
  [(PXAssetsSectionLayout *)self _invalidateShowAllButtonPosition];
  [(PXAssetsSectionLayout *)self _invalidateSelectAllButtonPosition];
  [(PXAssetsSectionLayout *)self _invalidateVisibleRectOvershootFactor];
}

- (id)layoutForItemChanges
{
  id v2 = [(PXAssetsSectionLayout *)self bodyContentLayout];
  objc_super v3 = [v2 layoutForItemChanges];

  return v3;
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      id v17 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
      [v16 handleFailureInFunction:v17, @"PXAssetsSectionLayout.m", 532, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXAssetsSectionLayout *)self _updateConfigurator];
      if (!p_updateFlags->isPerformingUpdate)
      {
        uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v35 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
        [v34 handleFailureInFunction:v35, @"PXAssetsSectionLayout.m", 536, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXAssetsSectionLayout *)self _updateContent];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
      [v18 handleFailureInFunction:v19, @"PXAssetsSectionLayout.m", 539, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXAssetsSectionLayout *)self _updateLocalSprites];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v21 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
      [v20 handleFailureInFunction:v21, @"PXAssetsSectionLayout.m", 542, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXAssetsSectionLayout *)self _updateFooter];
    }
    [(PXAssetsSectionLayout *)self sectionIndexPath];
    long long v8 = v40;
    *(_OWORD *)&self->_presentedSectionIndexPath.dataSourceIdentifier = v39;
    *(_OWORD *)&self->_presentedSectionIndexPath.item = v8;
    BOOL v9 = [(PXAssetsSectionLayout *)self showsSkimmingInteraction]
      || [(PXAssetsSectionLayout *)self showsSkimmingSlideshow];
    self->_presentedSkimming = v9;
    p_updateFlags->isPerformingUpdate = 0;
    if (p_updateFlags->needsUpdate)
    {
      CGRect v22 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v23 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"PXAssetsSectionLayout.m", 547, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v38.receiver = self;
  v38.super_class = (Class)PXAssetsSectionLayout;
  [(PXGSplitLayout *)&v38 update];
  [(PXAssetsSectionLayout *)self _updateDistanceProperties];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t v11 = self->_postUpdateFlags.needsUpdate;
  if (v11)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      float64x2_t v25 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
      [v24 handleFailureInFunction:v25, @"PXAssetsSectionLayout.m", 554, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v11 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v11 & 0x400) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFBFFLL;
      [(PXAssetsSectionLayout *)self _updateSectionHeaderProperties];
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        v36 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v37 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
        [v36 handleFailureInFunction:v37, @"PXAssetsSectionLayout.m", 558, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v12 & 0x800) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFF7FFLL;
      [(PXAssetsSectionLayout *)self _updateShowAllButtonPosition];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      int64x2_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v27 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
      [v26 handleFailureInFunction:v27, @"PXAssetsSectionLayout.m", 561, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v13 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x2000uLL;
    if ((v13 & 0x2000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v13 & 0xFFFFFFFFFFFFDFFFLL;
      [(PXAssetsSectionLayout *)self _updateSelectAllButtonPosition];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v29 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
      [v28 handleFailureInFunction:v29, @"PXAssetsSectionLayout.m", 564, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v14 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000uLL;
    if ((v14 & 0x1000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v14 & 0xFFFFFFFFFFFFEFFFLL;
      [(PXAssetsSectionLayout *)self _updateAssetsWithCoveredBottomTrailingCorner];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v31 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
      [v30 handleFailureInFunction:v31, @"PXAssetsSectionLayout.m", 567, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v15 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x10uLL;
    if ((v15 & 0x10) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v15 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXAssetsSectionLayout *)self _updateVisibleRectOvershootFactor];
      unint64_t v15 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v15)
    {
      uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v33 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout update]"];
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, @"PXAssetsSectionLayout.m", 570, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
}

- (void)setPreferredCornerRadius:(id)a3
{
  if (self->_preferredCornerRadius.var0.var0.topLeft != v3
    || self->_preferredCornerRadius.var0.var0.topRight != v4
    || self->_preferredCornerRadius.var0.var0.bottomLeft != v5
    || self->_preferredCornerRadius.var0.var0.bottomRight != v6)
  {
    self->_preferredCornerRadius.var0.var0.topLeft = v3;
    self->_preferredCornerRadius.var0.var0.topRight = v4;
    self->_preferredCornerRadius.var0.var0.bottomLeft = v5;
    self->_preferredCornerRadius.var0.var0.bottomRight = v6;
    [(PXAssetsSectionLayout *)self _invalidateContent];
  }
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    [(PXAssetsSectionLayout *)self _invalidateContent];
  }
}

- (void)setIsLastSection:(BOOL)a3
{
  if (self->_isLastSection != a3)
  {
    self->_isLastSection = a3;
    [(PXAssetsSectionLayout *)self _invalidateFooter];
  }
}

- (void)setIntersectionSpacing:(double)a3
{
  if (self->_intersectionSpacing == a3) {
    return;
  }
  self->_intersectionSpacing = a3;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (!needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 4;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_6:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v8 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setIntersectionSpacing:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXAssetsSectionLayout.m", 503, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
  }
  p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
LABEL_8:
  [(PXAssetsSectionLayout *)self _invalidateFooter];
}

- (void)setAutomaticallyUpdatesPadding:(BOOL)a3
{
  if (self->_automaticallyUpdatesPadding != a3)
  {
    self->_automaticallyUpdatesPadding = a3;
    [(PXAssetsSectionLayout *)self _invalidateFooter];
  }
}

- (void)setWantsAssetIndexBadge:(BOOL)a3
{
  if (self->_wantsAssetIndexBadge != a3)
  {
    BOOL v3 = a3;
    self->_wantsAssetIndexBadge = a3;
    float v5 = [(PXAssetsSectionLayout *)self assetDecorationSource];
    [v5 setWantsAssetIndexBadge:v3];

    [(PXGLayout *)self invalidateDecoration];
  }
}

- (void)setWantsFileSizeBadge:(BOOL)a3
{
  if (self->_wantsFileSizeBadge != a3)
  {
    BOOL v3 = a3;
    self->_wantsFileSizeBadge = a3;
    float v5 = [(PXAssetsSectionLayout *)self assetDecorationSource];
    [v5 setWantsFileSizeBadge:v3];

    [(PXGLayout *)self invalidateDecoration];
  }
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  if (self->_wantsNumberedSelectionStyle != a3)
  {
    BOOL v3 = a3;
    self->_wantsNumberedSelectionStyle = a3;
    float v5 = [(PXAssetsSectionLayout *)self assetDecorationSource];
    [v5 setWantsNumberedSelectionStyle:v3];

    [(PXGLayout *)self invalidateDecoration];
  }
}

- (void)setWantsDimmedSelectionStyle:(BOOL)a3
{
  if (self->_wantsDimmedSelectionStyle != a3)
  {
    BOOL v3 = a3;
    self->_wantsDimmedSelectionStyle = a3;
    float v5 = [(PXAssetsSectionLayout *)self assetDecorationSource];
    [v5 setWantsDimmedSelectionStyle:v3];

    [(PXGLayout *)self invalidateDecoration];
  }
}

- (void)setItemCaptionsVisible:(BOOL)a3
{
  if (self->_itemCaptionsVisible != a3)
  {
    self->_itemCaptionsVisible = a3;
    [(PXAssetsSectionLayout *)self _invalidateContent];
  }
}

- (void)setAllowsPositionDependentHeaderContentOpacity:(BOOL)a3
{
  if (self->_allowsPositionDependentHeaderContentOpacity != a3)
  {
    self->_allowsPositionDependentHeaderContentOpacitdouble y = a3;
    if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x400) != 0)
    {
      BOOL v3 = [MEMORY[0x1E4F28B00] currentHandler];
      float v4 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setAllowsPositionDependentHeaderContentOpacity:]"];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PXAssetsSectionLayout.m", 443, @"invalidating %lu after it already has been updated", 1024);

      abort();
    }
    self->_postUpdateFlags.needsUpdate |= 0x400uLL;
  }
}

- (void)setShowAllButtonFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_showAllButtonFrame = &self->_showAllButtonFrame;
  if (!CGRectEqualToRect(a3, self->_showAllButtonFrame))
  {
    p_showAllButtonFrame->origin.CGFloat x = x;
    p_showAllButtonFrame->origin.CGFloat y = y;
    p_showAllButtonFrame->size.CGFloat width = width;
    p_showAllButtonFrame->size.CGFloat height = height;
    [(PXAssetsSectionLayout *)self _invalidateAssetsWithCoveredBottomTrailingCorner];
  }
}

- (void)setDistanceBetweenHeaderTopAndNextBodyTop:(double)a3
{
  if (self->_distanceBetweenHeaderTopAndNextBodyTop != a3)
  {
    self->_distanceBetweenHeaderTopAndNextBodyTop = a3;
    if ([(PXAssetsSectionLayout *)self allowsPositionDependentHeaderContentOpacity])
    {
      if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x400) != 0)
      {
        float v4 = [MEMORY[0x1E4F28B00] currentHandler];
        float v5 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setDistanceBetweenHeaderTopAndNextBodyTop:]"];
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXAssetsSectionLayout.m", 426, @"invalidating %lu after it already has been updated", 1024);

        abort();
      }
      self->_postUpdateFlags.needsUpdate |= 0x400uLL;
    }
  }
}

- (void)setDistanceBetweenTitleTopAndBodyBottom:(double)a3
{
  if (self->_distanceBetweenTitleTopAndBodyBottom != a3)
  {
    self->_distanceBetweenTitleTopAndBodyBottom = a3;
    if ([(PXAssetsSectionLayout *)self allowsPositionDependentHeaderContentOpacity])
    {
      if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x400) != 0)
      {
        float v4 = [MEMORY[0x1E4F28B00] currentHandler];
        float v5 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setDistanceBetweenTitleTopAndBodyBottom:]"];
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXAssetsSectionLayout.m", 415, @"invalidating %lu after it already has been updated", 1024);

        abort();
      }
      self->_postUpdateFlags.needsUpdate |= 0x400uLL;
    }
  }
}

- (void)setHeaderLayoutGuide:(id)a3
{
  float v5 = (PXGLayoutGuide *)a3;
  headerLayoutGuide = self->_headerLayoutGuide;
  if (headerLayoutGuide != v5)
  {
    unint64_t v7 = v5;
    [(PXGLayoutGuide *)headerLayoutGuide unregisterChangeObserver:self context:PXHeaderLayoutGuideObservationContext];
    objc_storeStrong((id *)&self->_headerLayoutGuide, a3);
    [(PXGLayoutGuide *)self->_headerLayoutGuide registerChangeObserver:self context:PXHeaderLayoutGuideObservationContext];
    [(PXAssetsSectionLayout *)self _invalidateSelectAllButtonPosition];
    float v5 = v7;
  }
}

- (void)_callAddContentActionHandler
{
  uint64_t v3 = [(PXAssetsSectionLayout *)self addContentActionHandler];
  float v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, PXAssetsSectionLayout *))(v3 + 16))(v3, self);
  }
  else
  {
    float v5 = PLGridZeroGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float v6 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Missing add content handler for add button press", v6, 2u);
    }
  }
}

- (void)setAddContentActionHandler:(id)a3
{
  if (self->_addContentActionHandler != a3)
  {
    float v4 = (void *)[a3 copy];
    id addContentActionHandler = self->_addContentActionHandler;
    self->_id addContentActionHandler = v4;

    [(PXAssetsSectionLayout *)self _invalidateContent];
  }
}

- (void)setSelectAllButtonTitle:(id)a3
{
  float v5 = (NSString *)a3;
  if (self->_selectAllButtonTitle != v5)
  {
    float v6 = v5;
    objc_storeStrong((id *)&self->_selectAllButtonTitle, a3);
    [(PXAssetsSectionLayout *)self _invalidateSelectAllButton];
    float v5 = v6;
  }
}

- (void)setSelectAllActionPerformer:(id)a3
{
  float v5 = (PXCuratedLibraryActionPerformer *)a3;
  if (self->_selectAllActionPerformer != v5)
  {
    float v6 = v5;
    objc_storeStrong((id *)&self->_selectAllActionPerformer, a3);
    [(PXAssetsSectionLayout *)self _invalidateSelectAllButton];
    float v5 = v6;
  }
}

- (void)setShowAllActionPerformer:(id)a3
{
  float v5 = (PXCuratedLibraryShowAllActionPerformer *)a3;
  if (self->_showAllActionPerformer != v5)
  {
    float v6 = v5;
    objc_storeStrong((id *)&self->_showAllActionPerformer, a3);
    [(PXAssetsSectionLayout *)self _invalidateShowAllButton];
    float v5 = v6;
  }
}

- (void)setShowAllAffordanceStyle:(int64_t)a3
{
  if (self->_showAllAffordanceStyle != a3)
  {
    self->_showAllAffordanceStyle = a3;
    [(PXAssetsSectionLayout *)self _invalidateFooter];
    [(PXAssetsSectionLayout *)self _invalidateShowAllButton];
    [(PXAssetsSectionLayout *)self _invalidateShowAllButtonPosition];
  }
}

- (void)setWantsShadow:(BOOL)a3
{
  if (self->_wantsShadow != a3)
  {
    self->_wantsShadow = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setWantsShadow:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXAssetsSectionLayout.m", 343, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setCurrentSkimmingIndex:(int64_t)a3
{
  if (self->_currentSkimmingIndex != a3)
  {
    self->_currentSkimmingIndeCGFloat x = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setCurrentSkimmingIndex:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXAssetsSectionLayout.m", 335, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setMaxSkimmingIndex:(int64_t)a3
{
  if (self->_maxSkimmingIndex != a3)
  {
    self->_maxSkimmingIndeCGFloat x = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setMaxSkimmingIndex:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXAssetsSectionLayout.m", 326, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setSkimmingIndexPaths:(id)a3
{
  unint64_t v13 = (PXIndexPathSet *)a3;
  float v5 = self->_skimmingIndexPaths;
  if (v5 == v13)
  {

LABEL_10:
    unint64_t v7 = v13;
    goto LABEL_11;
  }
  char v6 = [(PXIndexPathSet *)v13 isEqual:v5];

  unint64_t v7 = v13;
  if (v6) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_skimmingIndexPaths, a3);
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      goto LABEL_10;
    }
LABEL_8:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v12 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setSkimmingIndexPaths:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXAssetsSectionLayout.m", 317, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  unint64_t v7 = v13;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setIsSkimming:(BOOL)a3
{
  if (self->_isSkimming != a3)
  {
    self->_isSkimming = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setIsSkimming:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXAssetsSectionLayout.m", 309, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setCanStartSelecting:(BOOL)a3
{
  if (self->_canStartSelecting != a3)
  {
    self->_canStartSelecting = a3;
    [(PXAssetsSectionLayout *)self _invalidateContent];
  }
}

- (void)setIsSelecting:(BOOL)a3
{
  if (self->_isSelecting != a3)
  {
    self->_isSelecting = a3;
    -[PXPhotosGridAssetDecorationSource setIsInSelectMode:](self->_assetDecorationSource, "setIsInSelectMode:");
    [(PXAssetsSectionLayout *)self _invalidateContent];
    [(PXGLayout *)self invalidateDecoration];
  }
}

- (void)setShowsSkimmingInteraction:(BOOL)a3
{
  if (self->_showsSkimmingInteraction != a3)
  {
    self->_showsSkimmingInteraction = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setShowsSkimmingInteraction:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXAssetsSectionLayout.m", 281, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setShowsSkimmingSlideshow:(BOOL)a3
{
  if (self->_showsSkimmingSlideshow != a3)
  {
    self->_showsSkimmingSlideshow = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXAssetsSectionLayout setShowsSkimmingSlideshow:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXAssetsSectionLayout.m", 272, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setNumberOfPrecedingAssets:(int64_t)a3
{
  if (self->_numberOfPrecedingAssets != a3)
  {
    self->_numberOfPrecedingAssets = a3;
    [(PXAssetsSectionLayout *)self _invalidateContent];
  }
}

- (void)setConfigurator:(id)a3
{
  float v5 = (PXAssetsSectionConfigurator *)a3;
  if (self->_configurator != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_configurator, a3);
    [(PXAssetsSectionLayout *)self _invalidateContent];
    float v5 = v6;
  }
}

- (void)setDisableConfigurators:(BOOL)a3
{
  if (self->_disableConfigurators != a3)
  {
    self->_disableConfigurators = a3;
    [(PXAssetsSectionLayout *)self _invalidateConfigurator];
  }
}

- (void)setSpec:(id)a3
{
  float v5 = (PXAssetsSectionLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXAssetsSectionLayout *)self _invalidateConfigurator];
    [(PXAssetsSectionLayout *)self _invalidateFooter];
    [(PXAssetsSectionLayout *)self _invalidateShowAllButton];
    [(PXAssetsSectionLayout *)self _invalidateShowAllButtonPosition];
    [(PXAssetsSectionLayout *)self _invalidateSelectAllButton];
    float v5 = v6;
  }
}

- (void)setDropTargetAssetReference:(id)a3
{
  long long v8 = (PXAssetReference *)a3;
  float v5 = self->_dropTargetAssetReference;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = v5;
    char v7 = [(PXAssetReference *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
      [(PXAssetsSectionLayout *)self _invalidateContent];
    }
  }
}

- (void)setDraggedAssetReferences:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetsSectionLayout *)self assetDecorationSource];
  [v5 setDraggedAssetReferences:v4];
}

- (NSSet)draggedAssetReferences
{
  id v2 = [(PXAssetsSectionLayout *)self assetDecorationSource];
  uint64_t v3 = [v2 draggedAssetReferences];

  return (NSSet *)v3;
}

- (void)setSelectionSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetsSectionLayout *)self assetDecorationSource];
  [v5 setSelectionSnapshot:v4];

  [(PXAssetsSectionLayout *)self _invalidateContent];
  [(PXGLayout *)self invalidateDecoration];
}

- (PXSelectionSnapshot)selectionSnapshot
{
  id v2 = [(PXAssetsSectionLayout *)self assetDecorationSource];
  uint64_t v3 = [v2 selectionSnapshot];

  return (PXSelectionSnapshot *)v3;
}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  long long v8 = (PXAssetsDataSource *)a3;
  if (self->_section != a4 || self->_dataSource != v8)
  {
    self->_int64_t section = a4;
    unint64_t v12 = v8;
    objc_storeStrong((id *)&self->_dataSource, a3);
    if ([(PXAssetsDataSource *)v12 numberOfSections] <= a4)
    {
      unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PXAssetsSectionLayout.m", 194, @"Invalid parameter not satisfying: %@", @"section < dataSource.numberOfSections" object file lineNumber description];
    }
    self->_cachedClampedItemRange = (_NSRange)xmmword_1AB359BD0;
    cachedClampedFetchResult = self->_cachedClampedFetchResult;
    self->_cachedClampedFetchResult = 0;

    id v10 = [(PXAssetsSectionLayout *)self assetDecorationSource];
    [v10 setDataSource:v12 section:a4];

    [(PXAssetsSectionLayout *)self _invalidateContent];
    [(PXAssetsSectionLayout *)self _invalidateFooter];
    [(PXAssetsSectionLayout *)self _invalidateShowAllButton];
    [(PXAssetsSectionLayout *)self _invalidateSelectAllButton];
    long long v8 = v12;
  }
}

- (void)setZoomLevel:(int64_t)a3
{
  if (self->_zoomLevel != a3)
  {
    self->_zoomLevel = a3;
    [(PXAssetsSectionLayout *)self _invalidateConfigurator];
    [(PXAssetsSectionLayout *)self _invalidateContent];
    [(PXAssetsSectionLayout *)self _invalidateShowAllButton];
    [(PXAssetsSectionLayout *)self _invalidateSelectAllButton];
  }
}

- (PXAssetsSectionLayout)initWithSection:(int64_t)a3 dataSource:(id)a4 spec:(id)a5
{
  return [(PXAssetsSectionLayout *)self initWithSection:a3 dataSource:a4 actionManager:0 loadingStatusManager:0 assetImportStatusManager:0 inlinePlaybackController:0 zoomLevel:4 spec:a5];
}

- (PXAssetsSectionLayout)initWithSection:(int64_t)a3 dataSource:(id)a4 actionManager:(id)a5 loadingStatusManager:(id)a6 assetImportStatusManager:(id)a7 inlinePlaybackController:(id)a8 zoomLevel:(int64_t)a9 spec:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v28 = a8;
  id v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)PXAssetsSectionLayout;
  uint64_t v20 = [(PXGLayout *)&v29 init];
  uint64_t v21 = v20;
  if (v20)
  {
    v20->_sectionBoundariesSpriteIndeCGFloat x = -1;
    v20->_sectionShadowSpriteIndeCGFloat x = -1;
    v20->_showAllButtonSpriteIndeCGFloat x = -1;
    v20->_selectAllButtonSpriteIndeCGFloat x = -1;
    v20->_blurSpriteIndeCGFloat x = -1;
    objc_storeStrong((id *)&v20->_loadingStatusManager, a6);
    CGRect v22 = objc_alloc_init(PXPhotosGridAssetDecorationSource);
    assetDecorationSource = v21->_assetDecorationSource;
    v21->_assetDecorationSource = v22;

    [(PXPhotosGridAssetDecorationSource *)v21->_assetDecorationSource setLoadingStatusManager:v21->_loadingStatusManager];
    [(PXPhotosGridAssetDecorationSource *)v21->_assetDecorationSource setAssetImportStatusManager:v18];
    [(PXAssetsSectionLayout *)v21 setDataSource:v15 section:a3];
    objc_storeStrong((id *)&v21->_actionManager, a5);
    [(PXAssetsSectionLayout *)v21 setZoomLevel:a9];
    [(PXAssetsSectionLayout *)v21 setSpec:v19];
    [(PXGSplitLayout *)v21 setMode:0];
    [(PXGLayout *)v21 setContentSource:v21];
    uint64_t v24 = [(PXGLayout *)v21 axGroup];
    [v24 setAxRole:1];

    objc_storeStrong((id *)&v21->_inlinePlaybackController, a8);
    v21->_cachedShowAllButtonConfigurationSize = *(CGSize *)off_1E5DAB030;
    CGSize v25 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v21->_showAllButtonFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v21->_showAllButtonFrame.size = v25;
    v21->_removesHeaderLayoutWhenEmptCGFloat y = 1;
    v21->_removesContentLayoutWhenEmptCGFloat y = 1;
  }

  return v21;
}

- (PXAssetsSectionLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetsSectionLayout.m", 121, @"%s is not available as initializer", "-[PXAssetsSectionLayout init]");

  abort();
}

+ (CGSize)estimatedSizeWithReferenceSize:(CGSize)a3 assetCollection:(id)a4 numberOfAssets:(int64_t)a5 isCurated:(BOOL)a6 zoomLevel:(int64_t)a7 spec:(id)a8
{
  double width = a3.width;
  if ((unint64_t)(a7 - 3) > 1)
  {
    double v18 = 0.0;
  }
  else
  {
    BOOL v11 = a6;
    double height = a3.height;
    id v14 = a4;
    id v15 = [a8 sectionConfiguratorForAssetCollection:v14 inZoomLevel:a7];
    objc_msgSend(v15, "estimatedSizeOfSectionForAssetCollection:isCurated:numberOfAssets:referenceSize:", v14, v11, a5, width, height);
    double width = v16;
    double v18 = v17;
  }
  double v19 = width;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)px_modifyAssetsSectionLayoutGeometry:(id)a3
{
  char v6 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t v5 = 0;
  v3[0] = 0;
  v3[1] = 0;
  (*((void (**)(id, uint64_t, _OWORD *, void *, char *))a3 + 2))(a3, 0x7FFFFFFFFFFFFFFFLL, v4, v3, &v6);
}

@end