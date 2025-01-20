@interface PXPhotosDetailsHeaderTileWidget
+ (BOOL)canShowMovieHeaderForDataSource:(id)a3;
+ (double)preferredHeaderContentHeightForWidth:(double)a3 screen:(id)a4;
- (BOOL)_isBasicContentLoaded;
- (BOOL)_isPointWithinCurrentLayoutBounds:(CGPoint)a3;
- (BOOL)_needsUpdate;
- (BOOL)_showPlaceholder;
- (BOOL)_startMovie;
- (BOOL)canLoadContentData;
- (BOOL)containsPoint:(CGPoint)a3 forCoordinateSpace:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasContentForCurrentInput;
- (BOOL)hasLoadedContentData;
- (BOOL)isUserInteractionEnabled;
- (CGRect)_contentRectInCoordinateSpace:(id)a3 withIdentifier:(PXTileIdentifier *)a4;
- (CGRect)photosDetailsHeaderTileLayout:(id)a3 contentsRectForAspectRatio:(double)a4;
- (CGSize)_contentSize;
- (CGSize)_playButtonSize;
- (NSString)localizedTitle;
- (PHAssetCollection)_assetCollection;
- (PHAssetCollection)_curatedAssetCollection;
- (PHFetchResult)_keyAssetsFetchResult;
- (PXMoviePresenter)moviePresenter;
- (PXPhotosDataSource)_photosDataSource;
- (PXPhotosDetailsContext)context;
- (PXPhotosDetailsHeaderPreviewTile)previewTile;
- (PXPhotosDetailsHeaderSpec)_headerSpec;
- (PXPhotosDetailsHeaderTileWidget)init;
- (PXPhotosDetailsLoadCoordinationToken)_loadCoordinationToken;
- (PXTilingController)contentTilingController;
- (PXTitleSubtitleUILabelTile)_titleTile;
- (PXUIPlayButtonTile)_playButtonTile;
- (PXWidgetDelegate)widgetDelegate;
- (PXWidgetSpec)spec;
- (double)preferredContentHeightForWidth:(double)a3;
- (id)_contentRegionOfInterestForTileWithIdentifier:(PXTileIdentifier *)a3;
- (id)_playButtonLocalizedTitle;
- (id)_scrollViewController;
- (id)_subtitle;
- (id)_title;
- (id)_titleFontName;
- (id)extendedTraitCollection;
- (id)keyAsset;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)regionOfInterestForContext:(id)a3;
- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4;
- (id)viewToBeFocused;
- (int64_t)contentLayoutStyle;
- (void)_filterOutVideosFromAssetCollection:(id)a3 filteredAssetCollection:(id *)a4 assets:(id *)a5;
- (void)_handleTapGesture:(id)a3;
- (void)_headerSpecDidChange;
- (void)_invalidateAssetCollection;
- (void)_invalidateCuratedAssetCollection;
- (void)_invalidateKeyAssets;
- (void)_loadBasicContent;
- (void)_setAssetCollection:(id)a3;
- (void)_setBasicContentLoaded:(BOOL)a3;
- (void)_setContentSize:(CGSize)a3;
- (void)_setCuratedAssetCollection:(id)a3;
- (void)_setHasLoadedContentData:(BOOL)a3;
- (void)_setHeaderSpec:(id)a3;
- (void)_setKeyAssetsFetchResult:(id)a3;
- (void)_setLoadCoordinationToken:(id)a3;
- (void)_setPhotosDataSource:(id)a3;
- (void)_setPlayButtonTile:(id)a3;
- (void)_setTitleTile:(id)a3;
- (void)_tileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)_updateAssetCollectionIfNeeded;
- (void)_updateBasicContent;
- (void)_updateCuratedAssetCollectionIfNeeded;
- (void)_updateKeyAssetCropRect;
- (void)_updateKeyAssetsIfNeeded;
- (void)_updateLayoutStyle;
- (void)_updatePreview;
- (void)_updateTitleTile;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)loadContentData;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosDataSource:(id)a3 didChange:(id)a4;
- (void)playMovieWithCompletionHandler:(id)a3;
- (void)setCanLoadContentData:(BOOL)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContext:(id)a3;
- (void)setMoviePresenter:(id)a3;
- (void)setPreviewTile:(id)a3;
- (void)setSpec:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setWidgetDelegate:(id)a3;
@end

@implementation PXPhotosDetailsHeaderTileWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moviePresenter, 0);
  objc_storeStrong((id *)&self->__curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->__assetCollection, 0);
  objc_storeStrong((id *)&self->__keyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->__loadCoordinationToken, 0);
  objc_storeStrong((id *)&self->__titleTile, 0);
  objc_storeStrong((id *)&self->__playButtonTile, 0);
  objc_storeStrong((id *)&self->_previewTile, 0);
  objc_storeStrong((id *)&self->__headerSpec, 0);
  objc_storeStrong((id *)&self->__photosDataSource, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_primaryAssetImageRequester, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tileAnimator, 0);
  objc_storeStrong((id *)&self->_tilesInUse, 0);
  objc_storeStrong((id *)&self->_tilePool, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
}

- (void)setMoviePresenter:(id)a3
{
}

- (PXMoviePresenter)moviePresenter
{
  return self->_moviePresenter;
}

- (void)_setContentSize:(CGSize)a3
{
  self->__contentSize = a3;
}

- (CGSize)_contentSize
{
  double width = self->__contentSize.width;
  double height = self->__contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (void)_setCuratedAssetCollection:(id)a3
{
}

- (PHAssetCollection)_curatedAssetCollection
{
  return self->__curatedAssetCollection;
}

- (void)_setAssetCollection:(id)a3
{
}

- (PHAssetCollection)_assetCollection
{
  return self->__assetCollection;
}

- (PHFetchResult)_keyAssetsFetchResult
{
  return self->__keyAssetsFetchResult;
}

- (PXPhotosDetailsLoadCoordinationToken)_loadCoordinationToken
{
  return self->__loadCoordinationToken;
}

- (BOOL)canLoadContentData
{
  return self->_canLoadContentData;
}

- (void)_setBasicContentLoaded:(BOOL)a3
{
  self->__basicContentLoaded = a3;
}

- (BOOL)_isBasicContentLoaded
{
  return self->__basicContentLoaded;
}

- (void)_setTitleTile:(id)a3
{
}

- (PXTitleSubtitleUILabelTile)_titleTile
{
  return self->__titleTile;
}

- (void)_setPlayButtonTile:(id)a3
{
}

- (PXUIPlayButtonTile)_playButtonTile
{
  return self->__playButtonTile;
}

- (void)setPreviewTile:(id)a3
{
}

- (PXPhotosDetailsHeaderPreviewTile)previewTile
{
  return self->_previewTile;
}

- (PXPhotosDetailsHeaderSpec)_headerSpec
{
  return self->__headerSpec;
}

- (PXPhotosDataSource)_photosDataSource
{
  return self->__photosDataSource;
}

- (void)setSpec:(id)a3
{
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)playMovieWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  v4[2](v4, [(PXPhotosDetailsHeaderTileWidget *)self _startMovie]);
}

- (BOOL)containsPoint:(CGPoint)a3 forCoordinateSpace:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = [(PXTilingController *)self->_tilingController currentLayout];
  v9 = v8;
  if (v8)
  {
    [v8 contentTileIdentifier];
  }
  else
  {
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
  }
  [(PXPhotosDetailsHeaderTileWidget *)self _contentRectInCoordinateSpace:v7 withIdentifier:v12];
  v14.CGFloat x = x;
  v14.CGFloat y = y;
  BOOL v10 = CGRectContainsPoint(v15, v14);

  return v10;
}

- (void)_setHasLoadedContentData:(BOOL)a3
{
  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    id v4 = [(PXPhotosDetailsHeaderTileWidget *)self widgetDelegate];
    [v4 widgetHasLoadedContentDataDidChange:self];
  }
}

- (id)regionOfInterestForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDetailsHeaderTileWidget *)self context];

  if (v5 == v4)
  {
    id v7 = [(PXTilingController *)self->_tilingController currentLayout];
    v8 = v7;
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    if (v7 && ([v7 contentTileIdentifier], (void)v12))
    {
      v10[2] = v14;
      v10[3] = v15;
      v10[4] = v16;
      uint64_t v11 = v17;
      v10[0] = v12;
      v10[1] = v13;
      v6 = [(PXPhotosDetailsHeaderTileWidget *)self _contentRegionOfInterestForTileWithIdentifier:v10];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (CGRect)photosDetailsHeaderTileLayout:(id)a3 contentsRectForAspectRatio:(double)a4
{
  double x = self->_keyAssetCropRect.origin.x;
  double y = self->_keyAssetCropRect.origin.y;
  double width = self->_keyAssetCropRect.size.width;
  double height = self->_keyAssetCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v19 = a4;
  id v5 = [v19 sectionedDataSourceChangeDetails];
  v6 = [v5 sectionChanges];
  id v7 = [v6 changedIndexes];
  uint64_t v8 = [v7 count];

  v9 = [v19 sectionsWithKeyAssetChanges];
  int v10 = [v9 containsIndex:0];

  if ((v10 & 1) != 0 || ![v19 hasIncrementalChanges])
  {
    BOOL v12 = 1;
    if (v8) {
      goto LABEL_18;
    }
LABEL_6:
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v11 = [v19 contentChangedIndexPaths];
  if ([v11 count])
  {
    BOOL v12 = 1;
  }
  else
  {
    long long v13 = [v19 insertedIndexPaths];
    if ([v13 count])
    {
      BOOL v12 = 1;
    }
    else
    {
      long long v14 = [v19 deletedIndexPaths];
      BOOL v12 = [v14 count] != 0;
    }
  }

  if (!v8) {
    goto LABEL_6;
  }
LABEL_18:
  long long v15 = [(PXPhotosDetailsHeaderTileWidget *)self _photosDataSource];
  long long v16 = [v15 firstAssetCollection];
  uint64_t v17 = [v16 titleFontName];
  v18 = [(PXPhotosDetailsHeaderTileWidget *)self _titleFontName];
  if (([v17 isEqualToString:v18] & 1) == 0) {
    [(PXPhotosDetailsHeaderTileWidget *)self _invalidateAssetCollection];
  }

  if (v10) {
LABEL_7:
  }
    [(PXPhotosDetailsHeaderTileWidget *)self _invalidateKeyAssets];
LABEL_8:
  if (v12)
  {
    [(PXPhotosDetailsHeaderTileWidget *)self _invalidateAssetCollection];
    [(PXPhotosDetailsHeaderTileWidget *)self _invalidateCuratedAssetCollection];
  }
  [(PXPhotosDetailsHeaderTileWidget *)self _updateBasicContent];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  if ((void *)PXPhotosDetailsHeaderSpecManagerObservationContext == a5)
  {
    if (v6)
    {
      BOOL v12 = [(PXFeatureSpecManager *)self->_specManager spec];
      [(PXPhotosDetailsHeaderTileWidget *)self _setHeaderSpec:v12];
    }
  }
  else
  {
    if ((void *)PXPhotosDetailsContextObservationContext != a5)
    {
      long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsHeaderTileWidget.m" lineNumber:841 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (v6)
    {
      [(PXPhotosDetailsHeaderTileWidget *)self _invalidateKeyAssets];
      [(PXPhotosDetailsHeaderTileWidget *)self _invalidateAssetCollection];
      [(PXPhotosDetailsHeaderTileWidget *)self _invalidateCuratedAssetCollection];
    }
    if ((v6 & 0x70) != 0)
    {
      int v10 = [(PXTilingController *)self->_tilingController targetLayout];
      uint64_t v11 = objc_alloc_init(PXTilingLayoutInvalidationContext);
      if (v10)
      {
        [v10 tileIdentifierForTileKind:2];
      }
      else
      {
        uint64_t v17 = 0;
        memset(v16, 0, sizeof(v16));
      }
      [(PXTilingLayoutInvalidationContext *)v11 invalidateTileWithIdentifier:v16];
      [v10 invalidateLayoutWithContext:v11];
      long long v13 = [(PXPhotosDetailsHeaderTileWidget *)self _titleTile];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __64__PXPhotosDetailsHeaderTileWidget_observable_didChange_context___block_invoke;
      v15[3] = &unk_1E5DD36F8;
      v15[4] = self;
      [v13 performBatchUpdates:v15];

      [(PXPhotosDetailsHeaderTileWidget *)self _invalidateAssetCollection];
    }
    if ((*(void *)&v6 & 0x10000CLL) != 0) {
      [(PXPhotosDetailsHeaderTileWidget *)self _invalidateKeyAssets];
    }
    [(PXPhotosDetailsHeaderTileWidget *)self _updateBasicContent];
  }
}

uint64_t __64__PXPhotosDetailsHeaderTileWidget_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTitleTile];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (PXUITapGestureRecognizer *)a3;
  if ([(PXPhotosDetailsHeaderTileWidget *)self isUserInteractionEnabled]
    && (self->_tapGestureRecognizer == v4 || self->_pressGestureRecognizer == v4))
  {
    int v6 = [(PXPhotosDetailsHeaderTileWidget *)self _scrollViewController];
    id v7 = [v6 contentCoordinateSpace];
    [(UIGestureRecognizer *)v4 px_locationInCoordinateSpace:v7];
    double v9 = v8;
    double v11 = v10;

    BOOL v5 = -[PXPhotosDetailsHeaderTileWidget _isPointWithinCurrentLayoutBounds:](self, "_isPointWithinCurrentLayoutBounds:", v9, v11);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isPointWithinCurrentLayoutBounds:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(PXPhotosDetailsHeaderTileWidget *)self contentTilingController];
  id v7 = [v6 currentLayout];

  if (v7)
  {
    double v8 = +[PXTilingCoordinateSpaceConverter defaultConverter];
    double v9 = [(PXPhotosDetailsHeaderTileWidget *)self contentTilingController];
    objc_msgSend(v8, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v9, "contentCoordinateSpaceIdentifier"), objc_msgSend(v7, "coordinateSpaceIdentifier"), x, y);

    [v7 contentBounds];
    [v7 contentInset];
    PXEdgeInsetsInsetRect();
  }

  return 0;
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v4 = objc_alloc_init(PXPhotosDetailsHeaderTileTransitionAnimationCoordinator);
  return v4;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v4 = objc_alloc_init(PXTileIdentifierIdentityConverter);
  return v4;
}

- (CGSize)_playButtonSize
{
  v3 = [(PXPhotosDetailsHeaderTileWidget *)self extendedTraitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 5)
  {
    BOOL v5 = objc_opt_new();
    [v5 setStyle:5];
    int v6 = [(PXPhotosDetailsHeaderTileWidget *)self _playButtonLocalizedTitle];
    [v5 setLocalizedTitle:v6];

    objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonSizeWithConfiguration:", v5);
  }
  else
  {
    BOOL v5 = [(PXFeatureSpecManager *)self->_specManager spec];
    [v5 playButtonSize];
  }
  double v9 = v7;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (id)_playButtonLocalizedTitle
{
  return PXLocalizedStringFromTable(@"InteractiveMemoryCardActionPlay", @"PhotosUICore");
}

- (id)_titleFontName
{
  v2 = [(PXPhotosDetailsHeaderTileWidget *)self context];
  v3 = [v2 titleFontName];

  return v3;
}

- (id)_subtitle
{
  v2 = [(PXPhotosDetailsHeaderTileWidget *)self context];
  v3 = [v2 localizedSubtitle];

  return v3;
}

- (id)_title
{
  v2 = [(PXPhotosDetailsHeaderTileWidget *)self context];
  v3 = [v2 localizedTitle];

  return v3;
}

- (void)_tileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v6 = a4;
  long long v7 = *(_OWORD *)&a3->index[5];
  long long v30 = *(_OWORD *)&a3->index[3];
  long long v31 = v7;
  long long v32 = *(_OWORD *)&a3->index[7];
  *(void *)&long long v33 = a3->index[9];
  long long v8 = *(_OWORD *)&a3->index[1];
  long long v28 = *(_OWORD *)&a3->length;
  long long v29 = v8;
  uint64_t v9 = [v6 tileKindForTileIdentifier:&v28];
  double v10 = [(PXReusableObjectPool *)self->_tilePool checkOutReusableObjectWithReuseIdentifier:v9];
  [(NSMutableSet *)self->_tilesInUse addObject:v10];
  switch(v9)
  {
    case 3:
      id v13 = v10;
      [(PXPhotosDetailsHeaderTileWidget *)self _playButtonSize];
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v18 = *(_OWORD *)&a3->index[5];
      v26[2] = *(_OWORD *)&a3->index[3];
      v26[3] = v18;
      v26[4] = *(_OWORD *)&a3->index[7];
      unint64_t v27 = a3->index[9];
      long long v19 = *(_OWORD *)&a3->index[1];
      v26[0] = *(_OWORD *)&a3->length;
      v26[1] = v19;
      [v6 getGeometry:&v28 group:0 userData:0 forTileWithIdentifier:v26];
      [v6 previewRect];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __61__PXPhotosDetailsHeaderTileWidget__tileForIdentifier_layout___block_invoke;
      v25[3] = &unk_1E5DB5458;
      v25[4] = self;
      v25[5] = v15;
      v25[6] = v17;
      *(double *)&v25[7] = *(double *)&v30 - v20;
      *(double *)&v25[8] = *((double *)&v30 + 1) - v21;
      [v13 performChanges:v25];
      BOOL v22 = [(PXFeatureSpec *)self->_spec userInterfaceIdiom] == 5;
      v23 = [v13 view];
      [v23 setUserInteractionEnabled:v22];

      [v13 setDelegate:self];
      break;
    case 2:
      [(PXPhotosDetailsHeaderTileWidget *)self _setTitleTile:v10];
      [(PXPhotosDetailsHeaderTileWidget *)self _updateTitleTile];
      break;
    case 1:
      primaryAssetImageRequester = self->_primaryAssetImageRequester;
      id v12 = v10;
      [v12 setImageRequester:primaryAssetImageRequester];
      [(PXPhotosDetailsHeaderTileWidget *)self setPreviewTile:v12];

      break;
  }

  return v10;
}

void __61__PXPhotosDetailsHeaderTileWidget__tileForIdentifier_layout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
  id v5 = a2;
  [v5 setImageRequester:v3];
  objc_msgSend(v5, "setPlayButtonSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  [v5 setPlayButtonStyle:0];
  uint64_t v4 = [*(id *)(a1 + 32) _playButtonLocalizedTitle];
  [v5 setPlayButtonTitle:v4];

  objc_msgSend(v5, "setImageViewportLocation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  [v5 setAllowsBackdropStatisticsSuppression:0];
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  tilePool = self->_tilePool;
  id v6 = a3;
  [(PXReusableObjectPool *)tilePool checkInReusableObject:v6];
  [(NSMutableSet *)self->_tilesInUse removeObject:v6];
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  long long v5 = *(_OWORD *)&a3->index[5];
  v11[2] = *(_OWORD *)&a3->index[3];
  v11[3] = v5;
  v11[4] = *(_OWORD *)&a3->index[7];
  unint64_t v12 = a3->index[9];
  long long v6 = *(_OWORD *)&a3->index[1];
  v11[0] = *(_OWORD *)&a3->length;
  v11[1] = v6;
  long long v7 = [(PXPhotosDetailsHeaderTileWidget *)self _tileForIdentifier:v11 layout:a4];
  long long v8 = [(PXTilingController *)self->_tilingController scrollController];
  uint64_t v9 = [v7 view];
  [v8 addSubview:v9];

  return v7;
}

- (id)_contentRegionOfInterestForTileWithIdentifier:(PXTileIdentifier *)a3
{
  long long v5 = [(PXTilingController *)self->_tilingController currentLayout];
  long long v6 = *((_OWORD *)off_1E5DAB048 + 9);
  long long v64 = *((_OWORD *)off_1E5DAB048 + 8);
  long long v65 = v6;
  long long v7 = *((_OWORD *)off_1E5DAB048 + 11);
  long long v66 = *((_OWORD *)off_1E5DAB048 + 10);
  long long v67 = v7;
  long long v8 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v60 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v61 = v8;
  long long v9 = *((_OWORD *)off_1E5DAB048 + 7);
  long long v62 = *((_OWORD *)off_1E5DAB048 + 6);
  long long v63 = v9;
  long long v10 = *((_OWORD *)off_1E5DAB048 + 1);
  long long v56 = *(_OWORD *)off_1E5DAB048;
  long long v57 = v10;
  long long v11 = *((_OWORD *)off_1E5DAB048 + 3);
  long long v58 = *((_OWORD *)off_1E5DAB048 + 2);
  long long v59 = v11;
  long long v12 = *(_OWORD *)&a3->index[5];
  long long v46 = *(_OWORD *)&a3->index[3];
  long long v47 = v12;
  long long v48 = *(_OWORD *)&a3->index[7];
  *(void *)&long long v49 = a3->index[9];
  long long v13 = *(_OWORD *)&a3->index[1];
  long long v44 = *(_OWORD *)&a3->length;
  long long v45 = v13;
  uint64_t v14 = 0;
  if ([v5 getGeometry:&v56 group:0 userData:0 forTileWithIdentifier:&v44])
  {
    uint64_t v15 = +[PXTilingCoordinateSpaceConverter defaultConverter];
    uint64_t v16 = [(PXTilingController *)self->_tilingController contentCoordinateSpaceIdentifier];
    if (v15)
    {
      v43[8] = v64;
      v43[9] = v65;
      v43[10] = v66;
      v43[11] = v67;
      v43[4] = v60;
      v43[5] = v61;
      v43[6] = v62;
      v43[7] = v63;
      v43[0] = v56;
      v43[1] = v57;
      v43[2] = v58;
      v43[3] = v59;
      [v15 convertTileGeometry:v43 toCoordinateSpaceIdentifier:v16];
    }
    else
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
    }
    long long v64 = v52;
    long long v65 = v53;
    long long v66 = v54;
    long long v67 = v55;
    long long v60 = v48;
    long long v61 = v49;
    long long v62 = v50;
    long long v63 = v51;
    long long v56 = v44;
    long long v57 = v45;
    long long v58 = v46;
    long long v59 = v47;

    id v17 = objc_alloc((Class)off_1E5DA82B8);
    long long v18 = [(PXPhotosDetailsHeaderTileWidget *)self _scrollViewController];
    long long v19 = [v18 contentCoordinateSpace];
    uint64_t v14 = objc_msgSend(v17, "initWithRect:inCoordinateSpace:", v19, v56, v57);

    tilingController = self->_tilingController;
    long long v21 = *(_OWORD *)&a3->index[5];
    long long v46 = *(_OWORD *)&a3->index[3];
    long long v47 = v21;
    long long v48 = *(_OWORD *)&a3->index[7];
    *(void *)&long long v49 = a3->index[9];
    long long v22 = *(_OWORD *)&a3->index[1];
    long long v44 = *(_OWORD *)&a3->length;
    long long v45 = v22;
    v23 = [(PXTilingController *)tilingController imageTileWithIdentifier:&v44];
    v24 = [v23 imageRequester];

    id v42 = 0;
    if (v5)
    {
      [v5 tileIdentifierForTileKind:1];
    }
    else
    {
      uint64_t v41 = 0;
      memset(v40, 0, sizeof(v40));
    }
    [v5 getGeometry:0 group:0 userData:&v42 forTileWithIdentifier:v40];
    id v25 = v42;
    v26 = [v25 viewSpec];
    [v14 setImageRequester:v24];
    objc_msgSend(v14, "setImageContentsRect:", *((double *)&v65 + 1), v66, *(double *)&v67);
    [v14 setImageViewSpec:v26];
    unint64_t v27 = self->_tilingController;
    if (v5)
    {
      [v5 tileIdentifierForTileKind:2];
    }
    else
    {
      uint64_t v39 = 0;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
    }
    long long v28 = [(PXTilingController *)v27 titleSubtitleTileWithIdentifier:&v34];
    long long v29 = v28;
    if (v28)
    {
      long long v30 = [v28 title];
      [v14 setTitle:v30];

      long long v31 = [v29 subtitle];
      [v14 setSubtitle:v31];

      long long v32 = [v29 labelSpec];
      [v14 setTextViewSpec:v32];
    }
    objc_msgSend(v14, "setPlaceholderViewFactory:", &__block_literal_global_250, v34, v35, v36, v37, v38, v39);
  }
  return v14;
}

PXPhotosDetailsHeaderPlaceholderView *__81__PXPhotosDetailsHeaderTileWidget__contentRegionOfInterestForTileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[PXPhotosDetailsHeaderPlaceholderView alloc] initWithRegionOfInterest:v2];

  return v3;
}

- (CGRect)_contentRectInCoordinateSpace:(id)a3 withIdentifier:(PXTileIdentifier *)a4
{
  id v6 = a3;
  long long v7 = *(_OWORD *)&a4->index[5];
  v23[2] = *(_OWORD *)&a4->index[3];
  v23[3] = v7;
  v23[4] = *(_OWORD *)&a4->index[7];
  unint64_t v24 = a4->index[9];
  long long v8 = *(_OWORD *)&a4->index[1];
  v23[0] = *(_OWORD *)&a4->length;
  v23[1] = v8;
  long long v9 = [(PXPhotosDetailsHeaderTileWidget *)self _contentRegionOfInterestForTileWithIdentifier:v23];
  long long v10 = v9;
  if (v9)
  {
    [v9 rectInCoordinateSpace:v6];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB20];
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (BOOL)_startMovie
{
  v23[2] = *MEMORY[0x1E4F143B8];
  [(PXPhotosDetailsHeaderTileWidget *)self loadContentData];
  uint64_t v3 = [(PXPhotosDetailsHeaderTileWidget *)self _photosDataSource];
  uint64_t v4 = [v3 firstAssetCollection];

  if (v4)
  {
    long long v5 = [(PXPhotosDetailsHeaderTileWidget *)self moviePresenter];

    if (!v5)
    {
      id v6 = [(PXPhotosDetailsHeaderTileWidget *)self widgetDelegate];
      long long v7 = [v6 widgetViewControllerHostingWidget:self];

      long long v8 = +[PXMoviePresenter moviePresenterWithPresentingViewController:v7];
      [(PXPhotosDetailsHeaderTileWidget *)self setMoviePresenter:v8];
    }
    long long v9 = [(PXPhotosDetailsHeaderTileWidget *)self context];
    long long v10 = [v9 people];
    double v11 = [v10 fetchedObjects];

    double v12 = [(PXPhotosDetailsHeaderTileWidget *)self moviePresenter];
    double v13 = [(PXPhotosDetailsHeaderTileWidget *)self _keyAssetsFetchResult];
    int v14 = [v12 presentMovieViewControllerForAssetCollection:v4 keyAssetFetchResult:v13 referencePersons:v11 preferredTransitionType:1];

    if (v14)
    {
      double v15 = (void *)MEMORY[0x1E4F56658];
      uint64_t v16 = *MEMORY[0x1E4F56548];
      v23[0] = v4;
      uint64_t v17 = *MEMORY[0x1E4F56560];
      v22[0] = v16;
      v22[1] = v17;
      double v18 = (objc_class *)objc_opt_class();
      double v19 = NSStringFromClass(v18);
      v23[1] = v19;
      double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      [v15 sendEvent:@"com.apple.photos.CPAnalytics.assetCollectionMoviePlayed" withPayload:v20];
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void)_handleTapGesture:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 view];
  id v6 = [(PXTilingController *)self->_tilingController currentLayout];
  long long v7 = v6;
  if (v6)
  {
    [v6 contentTileIdentifier];
  }
  else
  {
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
  }
  [(PXPhotosDetailsHeaderTileWidget *)self _contentRectInCoordinateSpace:v5 withIdentifier:v20];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v4 locationInView:v5];
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v23.origin.double x = v9;
  v23.origin.double y = v11;
  v23.size.double width = v13;
  v23.size.double height = v15;
  v22.double x = v17;
  v22.double y = v19;
  if (CGRectContainsPoint(v23, v22)) {
    [(PXPhotosDetailsHeaderTileWidget *)self _startMovie];
  }
}

- (id)_scrollViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  id v4 = [WeakRetained widgetScrollViewControllerHostingWidget:self];

  return v4;
}

- (id)extendedTraitCollection
{
  uint64_t v3 = [(PXPhotosDetailsHeaderTileWidget *)self widgetDelegate];
  id v4 = [v3 widgetViewControllerHostingWidget:self];

  long long v5 = objc_msgSend(v4, "px_extendedTraitCollection");

  return v5;
}

- (NSString)localizedTitle
{
  return 0;
}

- (int64_t)contentLayoutStyle
{
  id v2 = [(PXPhotosDetailsHeaderTileWidget *)self _headerSpec];
  int64_t v3 = [v2 shouldInsetAllPhotoDetailsContent] ^ 1;

  return v3;
}

- (PXTilingController)contentTilingController
{
  [(PXPhotosDetailsHeaderTileWidget *)self _loadBasicContent];
  tilingController = self->_tilingController;
  return tilingController;
}

- (BOOL)hasContentForCurrentInput
{
  id v2 = [(PXPhotosDetailsHeaderTileWidget *)self context];
  int64_t v3 = [v2 photosDataSource];

  if ([v3 containsMultipleAssets])
  {
    char v4 = 1;
  }
  else
  {
    long long v5 = +[PXPhotosDetailsHeaderTileSettings sharedInstance];
    char v4 = [v5 showAlways];
  }
  return v4;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  long long v5 = [(PXPhotosDetailsHeaderTileWidget *)self _scrollViewController];
  id v6 = [v5 scrollView];

  long long v7 = objc_opt_class();
  double v8 = [v6 window];
  CGFloat v9 = [v8 screen];
  [v7 preferredHeaderContentHeightForWidth:v9 screen:a3];

  [(PXPhotosDetailsHeaderTileWidget *)self spec];
  [(id)objc_claimAutoreleasedReturnValue() contentGuideInsets];
  [(PXPhotosDetailsHeaderTileWidget *)self _headerSpec];
  [(id)objc_claimAutoreleasedReturnValue() contentInsetEdges];
  PXEdgeInsetsForEdges();
}

- (void)_headerSpecDidChange
{
  id v4 = [(PXPhotosDetailsHeaderTileWidget *)self _headerSpec];
  int64_t v3 = [(PXTilingController *)self->_tilingController targetLayout];
  [v3 setSpec:v4];
}

- (void)_setHeaderSpec:(id)a3
{
  long long v5 = (PXPhotosDetailsHeaderSpec *)a3;
  if (self->__headerSpec != v5)
  {
    long long v7 = v5;
    objc_storeStrong((id *)&self->__headerSpec, a3);
    [(PXPhotosDetailsHeaderTileWidget *)self _headerSpecDidChange];
    id v6 = [(PXPhotosDetailsHeaderTileWidget *)self widgetDelegate];
    [v6 widgetInvalidateContentLayoutStyle:self];

    long long v5 = v7;
  }
}

- (id)viewToBeFocused
{
  id v2 = [(PXPhotosDetailsHeaderTileWidget *)self previewTile];
  int64_t v3 = [v2 view];

  return v3;
}

- (void)_updateTitleTile
{
  int64_t v3 = [(PXPhotosDetailsHeaderTileWidget *)self context];
  int v4 = [v3 shouldShowHeaderTitle];

  if (v4)
  {
    id v7 = [(PXPhotosDetailsHeaderTileWidget *)self _titleTile];
    long long v5 = [(PXPhotosDetailsHeaderTileWidget *)self _title];
    id v6 = [(PXPhotosDetailsHeaderTileWidget *)self _subtitle];
    if (![v5 length])
    {

      long long v5 = v6;
      id v6 = 0;
    }
    [v7 setTitle:v5];
    [v7 setSubtitle:v6];
  }
}

- (void)_updatePreview
{
  if ([(PXPhotosDetailsHeaderTileWidget *)self canLoadContentData])
  {
    primaryAssetImageRequester = self->_primaryAssetImageRequester;
    id v4 = [(PXPhotosDetailsHeaderTileWidget *)self previewTile];
    [v4 setImageRequester:primaryAssetImageRequester];
  }
}

- (void)_filterOutVideosFromAssetCollection:(id)a3 filteredAssetCollection:(id *)a4 assets:(id *)a5
{
  id v7 = a3;
  double v8 = [v7 photoLibrary];
  id v13 = [v8 librarySpecificFetchOptions];

  CGFloat v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(kind) = %d", 0);
  [v13 setInternalPredicate:v9];
  double v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v13];

  CGFloat v11 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v10 title:&stru_1F00B0030];
  double v12 = v11;
  if (a4) {
    *a4 = v11;
  }
  if (a5) {
    *a5 = v10;
  }
}

- (id)keyAsset
{
  id v2 = [(PXPhotosDetailsHeaderTileWidget *)self _keyAssetsFetchResult];
  int64_t v3 = [v2 firstObject];

  return v3;
}

- (void)setCanLoadContentData:(BOOL)a3
{
  if (self->_canLoadContentData != a3)
  {
    self->_canLoadContentData = a3;
    [(PXPhotosDetailsHeaderTileWidget *)self _updatePreview];
  }
}

- (void)loadContentData
{
  id v6 = [(PXPhotosDetailsHeaderTileWidget *)self context];
  if ([v6 viewSourceOrigin] != 6
    || ([v6 people],
        int64_t v3 = objc_claimAutoreleasedReturnValue(),
        unint64_t v4 = [v3 count],
        v3,
        v4 >= 2))
  {
    long long v5 = [(PXPhotosDetailsHeaderTileWidget *)self _photosDataSource];
    [v5 startBackgroundFetchIfNeeded];
  }
  [(PXPhotosDetailsHeaderTileWidget *)self setCanLoadContentData:1];
}

- (void)_updateBasicContent
{
  if ([(PXPhotosDetailsHeaderTileWidget *)self _isBasicContentLoaded])
  {
    if ([(PXPhotosDetailsHeaderTileWidget *)self _needsUpdate])
    {
      [(PXPhotosDetailsHeaderTileWidget *)self _updateKeyAssetsIfNeeded];
      [(PXPhotosDetailsHeaderTileWidget *)self _updateAssetCollectionIfNeeded];
      [(PXPhotosDetailsHeaderTileWidget *)self _updateCuratedAssetCollectionIfNeeded];
      if ([(PXPhotosDetailsHeaderTileWidget *)self _needsUpdate])
      {
        id v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsHeaderTileWidget.m" lineNumber:423 description:@"update still needed after update pass"];
      }
    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.keyAssets
      || self->_needsUpdateFlags.assetCollection
      || self->_needsUpdateFlags.curatedAssetCollection;
}

- (BOOL)_showPlaceholder
{
  id v2 = [(PXPhotosDetailsHeaderTileWidget *)self keyAsset];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_updateCuratedAssetCollectionIfNeeded
{
  if (self->_needsUpdateFlags.curatedAssetCollection)
  {
    self->_needsUpdateFlags.curatedAssetCollection = 0;
    id v9 = [(PXPhotosDetailsHeaderTileWidget *)self _photosDataSource];
    if ([v9 numberOfSections] < 1)
    {
      double v8 = v9;
    }
    else
    {
      BOOL v3 = [(PXPhotosDetailsHeaderTileWidget *)self _photosDataSource];
      uint64_t v4 = [v3 curatedAssetsInSection:0];

      if (!v4) {
        return;
      }
      long long v5 = (void *)MEMORY[0x1E4F38EE8];
      id v6 = [(PXPhotosDetailsHeaderTileWidget *)self _title];
      id v7 = [v5 transientAssetCollectionWithAssetFetchResult:v4 title:v6];

      [(PXPhotosDetailsHeaderTileWidget *)self _setCuratedAssetCollection:v7];
      [(PXPhotosDetailsHeaderTileWidget *)self _updatePreview];

      double v8 = (void *)v4;
    }
  }
}

- (void)_invalidateCuratedAssetCollection
{
  self->_needsUpdateFlags.curatedAssetCollection = 1;
}

- (void)_updateAssetCollectionIfNeeded
{
  if (self->_needsUpdateFlags.assetCollection)
  {
    self->_needsUpdateFlags.assetCollection = 0;
    BOOL v3 = [(PXPhotosDetailsHeaderTileWidget *)self _photosDataSource];
    uint64_t v4 = [v3 firstAssetCollection];
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v5 = [v3 uncuratedAssetsInSection:0];
        if ([v5 count])
        {
          id v6 = (void *)MEMORY[0x1E4F38EE8];
          uint64_t v7 = [(PXPhotosDetailsHeaderTileWidget *)self _title];
          double v8 = [(PXPhotosDetailsHeaderTileWidget *)self _subtitle];
          id v9 = [(PXPhotosDetailsHeaderTileWidget *)self _titleFontName];
          uint64_t v10 = [v6 transientAssetCollectionWithAssetFetchResult:v5 title:v7 subtitle:v8 titleFontName:v9];

          uint64_t v4 = (void *)v7;
        }
        else
        {
          uint64_t v10 = 0;
        }

        uint64_t v4 = (void *)v10;
      }
    }
    [(PXPhotosDetailsHeaderTileWidget *)self _setAssetCollection:v4];
    CGFloat v11 = [(PXTilingController *)self->_tilingController currentLayout];
    double v12 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    uint64_t v14 = 0;
    v13[0] = xmmword_1AB2ED380;
    memset(&v13[1], 0, 64);
    [(PXTilingLayoutInvalidationContext *)v12 invalidateTileWithIdentifier:v13];
    [v11 invalidateLayoutWithContext:v12];
  }
}

- (void)_invalidateAssetCollection
{
  self->_needsUpdateFlags.assetCollection = 1;
}

- (void)_updateKeyAssetCropRect
{
  [(PXPhotosDetailsHeaderTileWidget *)self keyAsset];
  if (objc_claimAutoreleasedReturnValue())
  {
    [(PXPhotosDetailsHeaderTileWidget *)self _contentSize];
    PXSizeIsEmpty();
  }
  CGSize v3 = (CGSize)*((_OWORD *)off_1E5DAB010 + 1);
  self->_keyAssetCropRect.origin = *(CGPoint *)off_1E5DAB010;
  self->_keyAssetCropRect.size = v3;
}

- (void)_updateKeyAssetsIfNeeded
{
  if (!self->_needsUpdateFlags.keyAssets) {
    return;
  }
  self->_needsUpdateFlags.keyAssets = 0;
  CGSize v3 = [(PXPhotosDetailsHeaderTileWidget *)self context];
  uint64_t v4 = [v3 keyAssetsFetchResult];

  long long v5 = [(PXPhotosDetailsHeaderTileWidget *)self context];
  int v6 = [v5 shouldUseKeyFace];

  if (v6)
  {
    uint64_t v7 = [(PXPhotosDetailsHeaderTileWidget *)self context];
    uint64_t v8 = [v7 keyFaceAssetFetchResult];
LABEL_4:

    uint64_t v4 = (void *)v8;
    goto LABEL_5;
  }
  if (v4 && [v4 count]) {
    goto LABEL_6;
  }
  uint64_t v7 = [(PXPhotosDetailsHeaderTileWidget *)self _photosDataSource];
  if ([v7 numberOfSections] >= 1)
  {
    id v13 = [v7 keyAssetsInSection:0];

    if ([v13 count])
    {
      uint64_t v4 = v13;
      goto LABEL_5;
    }
    uint64_t v8 = [v7 assetsInSection:0];
    uint64_t v4 = v13;
    goto LABEL_4;
  }
LABEL_5:

LABEL_6:
  [(PXPhotosDetailsHeaderTileWidget *)self _setKeyAssetsFetchResult:v4];
  id v9 = [(PXPhotosDetailsHeaderTileWidget *)self keyAsset];
  if (v9)
  {
    uint64_t v10 = [(PXImageRequester *)self->_primaryAssetImageRequester asset];

    if (v10 != v9)
    {
      primaryAssetImageRequester = self->_primaryAssetImageRequester;
      if (primaryAssetImageRequester)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __59__PXPhotosDetailsHeaderTileWidget__updateKeyAssetsIfNeeded__block_invoke;
        v15[3] = &unk_1E5DB8C18;
        double v16 = v9;
        [(PXImageRequester *)primaryAssetImageRequester performChanges:v15];
        double v12 = v16;
      }
      else
      {
        uint64_t v14 = [[PXImageRequester alloc] initWithMediaProvider:self->_mediaProvider asset:v9];
        double v12 = self->_primaryAssetImageRequester;
        self->_primaryAssetImageRequester = v14;
      }
    }
  }
  [(PXPhotosDetailsHeaderTileWidget *)self _updatePreview];
  [(PXPhotosDetailsHeaderTileWidget *)self _updateLayoutStyle];
}

uint64_t __59__PXPhotosDetailsHeaderTileWidget__updateKeyAssetsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAsset:*(void *)(a1 + 32)];
}

- (void)_invalidateKeyAssets
{
  self->_needsUpdateFlags.keyAssets = 1;
}

- (void)_updateLayoutStyle
{
  id v3 = [(PXTilingController *)self->_tilingController targetLayout];
  objc_msgSend(v3, "setStyle:", -[PXPhotosDetailsHeaderTileWidget _showPlaceholder](self, "_showPlaceholder") ^ 1);
}

- (void)_setLoadCoordinationToken:(id)a3
{
  long long v5 = (PXPhotosDetailsLoadCoordinationToken *)a3;
  loadCoordinationToken = self->__loadCoordinationToken;
  p_loadCoordinationToken = &self->__loadCoordinationToken;
  int v6 = loadCoordinationToken;
  if (loadCoordinationToken != v5)
  {
    id v9 = v5;
    [(PXPhotosDetailsLoadCoordinationToken *)v6 complete];
    objc_storeStrong((id *)p_loadCoordinationToken, a3);
    long long v5 = v9;
  }
}

- (void)_setPhotosDataSource:(id)a3
{
  id v14 = a3;
  char v4 = [(PXPhotosDataSource *)self->__photosDataSource isEqual:v14];
  long long v5 = v14;
  if ((v4 & 1) == 0)
  {
    if (v14)
    {
      uint64_t v6 = [v14 options];
      uint64_t v7 = [(PXPhotosDetailsHeaderTileWidget *)self context];
      int v8 = [v7 shouldUseKeyFace];

      uint64_t v9 = 48;
      if (v8) {
        uint64_t v9 = 16;
      }
      uint64_t v10 = [[PXPhotosDataSource alloc] initWithPhotosDataSource:v14 options:v9 | v6];
    }
    else
    {
      uint64_t v10 = 0;
    }
    [(PXPhotosDataSource *)self->__photosDataSource unregisterChangeObserver:self];
    CGFloat v11 = [(PXPhotosDataSource *)v10 firstAssetCollection];
    if (v11) {
      [(PXPhotosDataSource *)v10 setWantsCuration:1 forAssetCollection:v11];
    }
    photosDataSource = self->__photosDataSource;
    self->__photosDataSource = v10;
    id v13 = v10;

    [(PXPhotosDataSource *)self->__photosDataSource registerChangeObserver:self];
    long long v5 = v14;
  }
}

- (void)_setKeyAssetsFetchResult:(id)a3
{
  long long v5 = (PHFetchResult *)a3;
  if (self->__keyAssetsFetchResult != v5)
  {
    objc_storeStrong((id *)&self->__keyAssetsFetchResult, a3);
    if ([(PHFetchResult *)v5 count])
    {
      [(PXPhotosDetailsHeaderTileWidget *)self _setLoadCoordinationToken:0];
      [(PXPhotosDetailsHeaderTileWidget *)self _setHasLoadedContentData:1];
      [(PXPhotosDetailsHeaderTileWidget *)self _updateKeyAssetCropRect];
    }
  }
}

- (void)setContext:(id)a3
{
  long long v5 = (PXPhotosDetailsContext *)a3;
  context = self->_context;
  uint64_t v10 = v5;
  if (context != v5)
  {
    [(PXPhotosDetailsContext *)context unregisterChangeObserver:self context:PXPhotosDetailsContextObservationContext];
    objc_storeStrong((id *)&self->_context, a3);
    [(PXPhotosDetailsContext *)self->_context registerChangeObserver:self context:PXPhotosDetailsContextObservationContext];
    uint64_t v7 = +[PXPhotosDetailsLoadCoordinator loadCoordinatorForContext:v10];
    int v8 = [v7 tokenForCuratedFetch];

    [(PXPhotosDetailsHeaderTileWidget *)self _setLoadCoordinationToken:v8];
    [(PXPhotosDetailsHeaderTileWidget *)self _invalidateKeyAssets];
    uint64_t v9 = [(PXPhotosDetailsContext *)v10 photosDataSource];
    [(PXPhotosDetailsHeaderTileWidget *)self _setPhotosDataSource:v9];

    [(PXPhotosDetailsHeaderTileWidget *)self _updateBasicContent];
  }
}

- (void)setContentSize:(CGSize)a3
{
  -[PXPhotosDetailsHeaderTileWidget _setContentSize:](self, "_setContentSize:", a3.width, a3.height);
  [(PXPhotosDetailsHeaderTileWidget *)self _updateKeyAssetCropRect];
}

- (void)_loadBasicContent
{
  if (![(PXPhotosDetailsHeaderTileWidget *)self _isBasicContentLoaded])
  {
    [(PXPhotosDetailsHeaderTileWidget *)self _setBasicContentLoaded:1];
    id v25 = [(PXPhotosDetailsHeaderTileWidget *)self extendedTraitCollection];
    id v3 = [(PXFeatureSpecManager *)[PXPhotosDetailsHeaderSpecManager alloc] initWithExtendedTraitCollection:v25];
    specManager = self->_specManager;
    self->_specManager = v3;

    [(PXPhotosDetailsHeaderSpecManager *)self->_specManager registerChangeObserver:self context:PXPhotosDetailsHeaderSpecManagerObservationContext];
    long long v5 = objc_alloc_init(PXPhotoKitUIMediaProvider);
    mediaProvider = self->_mediaProvider;
    self->_mediaProvider = v5;

    uint64_t v7 = [(PXFeatureSpecManager *)self->_specManager spec];
    [(PXPhotosDetailsHeaderTileWidget *)self _setHeaderSpec:v7];

    int v8 = [PXPhotosDetailsHeaderTileLayout alloc];
    uint64_t v9 = [(PXFeatureSpecManager *)self->_specManager spec];
    uint64_t v10 = [(PXPhotosDetailsHeaderTileLayout *)v8 initWithSpec:v9];

    [(PXPhotosDetailsHeaderTileLayout *)v10 setDelegate:self];
    CGFloat v11 = [[PXTilingController alloc] initWithLayout:v10];
    tilingController = self->_tilingController;
    self->_tilingController = v11;

    [(PXTilingController *)self->_tilingController setTileSource:self];
    id v13 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->_tileAnimator;
    self->_tileAnimator = v13;

    [(PXTilingController *)self->_tilingController setTileAnimator:self->_tileAnimator];
    [(PXTilingController *)self->_tilingController setTransitionDelegate:self];
    CGFloat v15 = (PXReusableObjectPool *)objc_alloc_init((Class)off_1E5DA8338);
    tilePool = self->_tilePool;
    self->_tilePool = v15;

    [(PXReusableObjectPool *)self->_tilePool setDelegate:self];
    [(PXReusableObjectPool *)self->_tilePool registerReusableObjectForReuseIdentifier:0 creationHandler:&__block_literal_global_67465];
    [(PXReusableObjectPool *)self->_tilePool registerReusableObjectForReuseIdentifier:1 creationHandler:&__block_literal_global_202_67466];
    [(PXReusableObjectPool *)self->_tilePool registerReusableObjectForReuseIdentifier:2 creationHandler:&__block_literal_global_205];
    [(PXReusableObjectPool *)self->_tilePool registerReusableObjectForReuseIdentifier:3 creationHandler:&__block_literal_global_208];
    CGFloat v17 = [MEMORY[0x1E4F1CA80] set];
    tilesInUse = self->_tilesInUse;
    self->_tilesInUse = v17;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
    double v20 = [WeakRetained widgetViewHostingGestureRecognizers:self];

    uint64_t v21 = [[PXUITapGestureRecognizer alloc] initWithTarget:self action:sel__handleTapGesture_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v21;

    [(PXUITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
    [v20 addGestureRecognizer:self->_tapGestureRecognizer];
    if ([v25 userInterfaceIdiom] == 3)
    {
      [(PXUITapGestureRecognizer *)self->_tapGestureRecognizer setAllowedPressTypes:&unk_1F02D3D00];
    }
    else
    {
      CGRect v23 = [[PXUITapGestureRecognizer alloc] initWithTarget:self action:sel__handleTapGesture_];
      pressGestureRecognizer = self->_pressGestureRecognizer;
      self->_pressGestureRecognizer = v23;

      [(PXUITapGestureRecognizer *)self->_pressGestureRecognizer setAllowedPressTypes:&unk_1F02D3D18];
      [(PXUITapGestureRecognizer *)self->_pressGestureRecognizer setDelegate:self];
      [v20 addGestureRecognizer:self->_pressGestureRecognizer];
    }
    *(_WORD *)&self->_needsUpdateFlags.keyAssets = 257;
    self->_needsUpdateFlags.curatedAssetCollection = 1;
    [(PXPhotosDetailsHeaderTileWidget *)self _updateBasicContent];
  }
}

PXUIPlayButtonTile *__52__PXPhotosDetailsHeaderTileWidget__loadBasicContent__block_invoke_4()
{
  v0 = objc_alloc_init(PXUIPlayButtonTile);
  return v0;
}

PXTitleSubtitleUILabelTile *__52__PXPhotosDetailsHeaderTileWidget__loadBasicContent__block_invoke_3()
{
  v0 = objc_alloc_init(PXTitleSubtitleUILabelTile);
  return v0;
}

PXPhotosDetailsHeaderPreviewTile *__52__PXPhotosDetailsHeaderTileWidget__loadBasicContent__block_invoke_2()
{
  v0 = objc_alloc_init(PXPhotosDetailsHeaderPreviewTile);
  [(PXUIImageTile *)v0 setDrawsFocusRing:1];
  return v0;
}

PXPlaceholderView *__52__PXPhotosDetailsHeaderTileWidget__loadBasicContent__block_invoke()
{
  v0 = [PXPlaceholderView alloc];
  v1 = -[PXPlaceholderView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v1;
}

- (PXPhotosDetailsHeaderTileWidget)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosDetailsHeaderTileWidget;
  id v2 = [(PXPhotosDetailsHeaderTileWidget *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    char v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photosUICore.photosDetailsHeaderTileWidget.internalWork-queue", v4);
    internalWorkQueue = v2->_internalWorkQueue;
    v2->_internalWorkQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (BOOL)canShowMovieHeaderForDataSource:(id)a3
{
  return PXPhotosDetailsContextShouldShowHeaderForDataSource(a3);
}

+ (double)preferredHeaderContentHeightForWidth:(double)a3 screen:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[PXPhotosDetailsHeaderTileSettings sharedInstance];
  [v6 aspectRatio];
  double v8 = v7;
  if (v5)
  {
    [v5 bounds];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 bounds];
    double v10 = v14;
    double v12 = v15;
  }
  if (v10 >= v12) {
    double v10 = v12;
  }
  double v16 = a3 / v8;
  [v6 maximumHeightRelativeToScreenHeight];
  double v18 = v17 * v10;
  [v6 maximumAbsoluteHeight];
  if (v18 < v19) {
    double v19 = v18;
  }
  if (v16 >= v19) {
    double v16 = v19;
  }

  return v16;
}

@end