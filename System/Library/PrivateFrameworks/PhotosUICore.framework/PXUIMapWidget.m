@interface PXUIMapWidget
+ (id)sharedSnapshotRequestConcurrentQueue;
- (BOOL)_containsLocationInPasteboard;
- (BOOL)_hasCachedSnapshotImageForKey:(id)a3;
- (BOOL)_hasLocation;
- (BOOL)_requiresDetailedAddressFooterString;
- (BOOL)allowUserInteractionWithSubtitle;
- (BOOL)enableCuratedThumbnails;
- (BOOL)hasContentForCurrentInput;
- (BOOL)hasLoadedContentData;
- (BOOL)infoPanelLayoutEnabled;
- (BOOL)showAddressLink;
- (CGSize)_estimatedMapViewImageSize;
- (NSMutableArray)_nearbyCountCompletionBlocks;
- (NSString)_cachedDisclosureTitle;
- (NSString)_cachedLocalizedTitle;
- (NSString)cachedFooterTitle;
- (NSString)localizedDisclosureTitle;
- (NSString)localizedTitle;
- (NSString)snappableWidgetIdentifier;
- (PXAnonymousView)contentView;
- (PXImageUIView)_imageView;
- (PXPhotosDetailsContext)context;
- (PXPlacesMapFetchResultViewController)_mapViewController;
- (PXPlacesMapThumbnailLocationCurator)thumbnailLocationCurator;
- (PXPlacesSnapshotFactory)_factory;
- (PXUIMapWidget)init;
- (PXUIMapWidget)initWithEnableCuratedThumbnails:(BOOL)a3;
- (PXWidgetDelegate)widgetDelegate;
- (PXWidgetSpec)spec;
- (PXWidgetUnlockDelegate)widgetUnlockDelegate;
- (UIButton)adjustButton;
- (UIButton)footerButton;
- (UIFont)footerFont;
- (UIImageView)chevronImageView;
- (UIView)_containerView;
- (UIView)_contentView;
- (UIView)footerView;
- (double)footerHeight;
- (double)height;
- (double)preferredContentHeightForWidth:(double)a3;
- (id)_contextMenuActions;
- (id)_copyLocationAction;
- (id)_createSnapshotOptions;
- (id)_fetchResultsForSections;
- (id)_firstAsset;
- (id)_localizedGeoDescriptionForAsset:(id)a3;
- (id)_pasteLocationAction;
- (id)_reloadFooterQueue;
- (id)_snapshotOptionsForExtendedTraitCollection:(id)a3 queue:(id)a4 viewSize:(CGSize)a5 snapshotMapType:(unint64_t)a6;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (int64_t)_fetchCountOfAssetsWithLocation;
- (void)_clipboardChanged:(id)a3;
- (void)_copyLocationTapped;
- (void)_didTapAdjustLocation;
- (void)_fetchPlacesSnapshotUsingMapType:(unint64_t)a3 fetchResults:(id)a4 imageSize:(CGSize)a5 shouldFetchNearbyAssetCount:(BOOL)a6;
- (void)_generateSnapshotsForExtendedTraitCollection:(id)a3 placesUtils:(id)a4 queue:(id)a5 size:(CGSize)a6 snapshotMapType:(unint64_t)a7 fetchResults:(id)a8 shouldFetchNearbyAssetCount:(BOOL)a9;
- (void)_handleContentSizeCategoryDidChange:(id)a3;
- (void)_handleReloadFooterTitle;
- (void)_handleSnapshotResponse:(id)a3 viewPort:(id)a4 snapshotMapType:(unint64_t)a5 shouldFetchNearbyAssetCount:(BOOL)a6 fetchedImageKey:(id)a7 error:(id)a8 userInterfaceStyle:(int64_t)a9;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_hasLocationDidChange;
- (void)_layoutSubviews;
- (void)_loadContainerView;
- (void)_openMapsAtCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4;
- (void)_pasteLocationTapped;
- (void)_presentLocationSearchPicker;
- (void)_reloadFooterTitle;
- (void)_setHasLoadedContentData:(BOOL)a3;
- (void)_setImage:(id)a3 animated:(BOOL)a4;
- (void)_showPlaceholder;
- (void)_showPlacesWithContentMode:(unint64_t)a3;
- (void)_updateContentViewFrame;
- (void)_updateFooterButton;
- (void)_updateFooterContextMenu;
- (void)_updateFooterHeight;
- (void)_updateFooterWithTitle:(id)a3;
- (void)_updateHeight;
- (void)controllerTraitCollectionDidChangeFrom:(id)a3 to:(id)a4;
- (void)dealloc;
- (void)loadContentData;
- (void)photosDataSource:(id)a3 didChange:(id)a4;
- (void)setCachedFooterTitle:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContext:(id)a3;
- (void)setFooterHeight:(double)a3;
- (void)setHeight:(double)a3;
- (void)setShowAddressLink:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setThumbnailLocationCurator:(id)a3;
- (void)setWidgetDelegate:(id)a3;
- (void)setWidgetUnlockDelegate:(id)a3;
- (void)set_cachedDisclosureTitle:(id)a3;
- (void)set_cachedLocalizedTitle:(id)a3;
- (void)set_factory:(id)a3;
- (void)set_nearbyCountCompletionBlocks:(id)a3;
- (void)unloadContentData;
- (void)userDidSelectDisclosureControl;
- (void)userDidSelectFooter:(id)a3;
@end

@implementation PXUIMapWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailLocationCurator, 0);
  objc_storeStrong((id *)&self->_cachedFooterTitle, 0);
  objc_storeStrong((id *)&self->__cachedDisclosureTitle, 0);
  objc_storeStrong((id *)&self->__cachedLocalizedTitle, 0);
  objc_storeStrong((id *)&self->__factory, 0);
  objc_storeStrong((id *)&self->__mapViewController, 0);
  objc_storeStrong((id *)&self->__nearbyCountCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_adjustButton, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_widgetUnlockDelegate);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_footerFont, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_fetchedImages, 0);
}

- (void)setThumbnailLocationCurator:(id)a3
{
}

- (BOOL)enableCuratedThumbnails
{
  return self->_enableCuratedThumbnails;
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (double)height
{
  return self->_height;
}

- (void)setCachedFooterTitle:(id)a3
{
}

- (NSString)cachedFooterTitle
{
  return self->_cachedFooterTitle;
}

- (void)set_cachedDisclosureTitle:(id)a3
{
}

- (NSString)_cachedDisclosureTitle
{
  return self->__cachedDisclosureTitle;
}

- (void)set_cachedLocalizedTitle:(id)a3
{
}

- (NSString)_cachedLocalizedTitle
{
  return self->__cachedLocalizedTitle;
}

- (void)set_factory:(id)a3
{
}

- (PXPlacesMapFetchResultViewController)_mapViewController
{
  return self->__mapViewController;
}

- (void)set_nearbyCountCompletionBlocks:(id)a3
{
}

- (NSMutableArray)_nearbyCountCompletionBlocks
{
  return self->__nearbyCountCompletionBlocks;
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (UIButton)adjustButton
{
  return self->_adjustButton;
}

- (UIButton)footerButton
{
  return self->_footerButton;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (PXImageUIView)_imageView
{
  return self->__imageView;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (BOOL)showAddressLink
{
  return self->_showAddressLink;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)setWidgetUnlockDelegate:(id)a3
{
}

- (PXWidgetUnlockDelegate)widgetUnlockDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetUnlockDelegate);
  return (PXWidgetUnlockDelegate *)WeakRetained;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (BOOL)_hasCachedSnapshotImageForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_fetchedImages objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PXUIMapWidget *)self _imageView];
  if (v6)
  {
    v8 = [(PXUIMapWidget *)self spec];
    v9 = [v8 defaultPlacesPlaceholderColor];
  }
  else
  {
    v9 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PXUIMapWidget__setImage_animated___block_invoke;
  aBlock[3] = &unk_1E5DD0F30;
  id v10 = v7;
  id v19 = v10;
  id v11 = v6;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  v13 = (void (**)(void))_Block_copy(aBlock);
  v14 = v13;
  if (v4)
  {
    v15 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __36__PXUIMapWidget__setImage_animated___block_invoke_2;
    v16[3] = &unk_1E5DD3128;
    v17 = v13;
    [v15 transitionWithView:v10 duration:5242880 options:v16 animations:0 completion:0.25];
  }
  else
  {
    v13[2](v13);
  }
}

uint64_t __36__PXUIMapWidget__setImage_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  return [v3 setBackgroundColor:v2];
}

uint64_t __36__PXUIMapWidget__setImage_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleSnapshotResponse:(id)a3 viewPort:(id)a4 snapshotMapType:(unint64_t)a5 shouldFetchNearbyAssetCount:(BOOL)a6 fetchedImageKey:(id)a7 error:(id)a8 userInterfaceStyle:(int64_t)a9
{
  BOOL v11 = a6;
  id v32 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v18 = v17;
  if (self->_isLoaded)
  {
    if (v17)
    {
      if (a5 == 1)
      {
        [(PXUIMapWidget *)self _showPlaceholder];
      }
      else
      {
        id v19 = [(PXUIMapWidget *)self _imageView];
        [v19 frame];
        double v21 = v20;
        double v23 = v22;

        if (v21 == *MEMORY[0x1E4F1DB30] && v23 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
        {
          [(PXUIMapWidget *)self _estimatedMapViewImageSize];
          double v21 = v25;
          double v23 = v26;
        }
        v27 = [(PXUIMapWidget *)self _fetchResultsForSections];
        -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 1, v27, v11, v21, v23);
      }
    }
    else
    {
      if (a5)
      {
        if ([(PXUIMapWidget *)self _hasCachedSnapshotImageForKey:v16]) {
          goto LABEL_18;
        }
      }
      else
      {
        [(NSMutableDictionary *)self->_fetchedImages setObject:v32 forKey:v16];
      }
      v28 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
      uint64_t v29 = [v28 userInterfaceStyle];

      if (v29 == a9)
      {
        [(PXUIMapWidget *)self _setHasLoadedContentData:1];
        [(PXUIMapWidget *)self _setImage:v32 animated:1];
        v30 = [(PXUIMapWidget *)self _contentView];
        v31 = [MEMORY[0x1E4FB1618] clearColor];
        [v30 setBackgroundColor:v31];
      }
    }
  }
LABEL_18:
}

- (id)_createSnapshotOptions
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(PXPlacesSnapshotOptions);
  objc_sync_exit(v2);

  return v3;
}

- (PXPlacesSnapshotFactory)_factory
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->__factory)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    BOOL v4 = [[PXPlacesSnapshotFactory alloc] initWithPhotoLibrary:v3];
    factory = v2->__factory;
    v2->__factory = v4;
  }
  objc_sync_exit(v2);

  id v6 = v2->__factory;
  return v6;
}

- (PXPlacesMapThumbnailLocationCurator)thumbnailLocationCurator
{
  thumbnailLocationCurator = self->_thumbnailLocationCurator;
  if (!thumbnailLocationCurator)
  {
    BOOL v4 = objc_alloc_init(PXPlacesMapThumbnailLocationCurator);
    v5 = self->_thumbnailLocationCurator;
    self->_thumbnailLocationCurator = v4;

    thumbnailLocationCurator = self->_thumbnailLocationCurator;
  }
  return thumbnailLocationCurator;
}

- (id)_snapshotOptionsForExtendedTraitCollection:(id)a3 queue:(id)a4 viewSize:(CGSize)a5 snapshotMapType:(unint64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a4;
  id v12 = a3;
  v13 = [(PXUIMapWidget *)self _createSnapshotOptions];
  [v13 setExtendedTraitCollection:v12];

  v14 = objc_alloc_init(PXPlacesGeotaggableMediaProvider);
  [v13 setGeotaggableInformationDelegate:v14];

  [v13 setQueue:v11];
  objc_msgSend(v13, "setViewSize:", width, height);
  [v13 setSnapshotMapType:a6];
  [v13 setPopoverImageType:5];
  [v13 setShouldRenderThumbnailForNoLocation:1];
  if ([(PXUIMapWidget *)self enableCuratedThumbnails])
  {
    id v15 = [(PXUIMapWidget *)self thumbnailLocationCurator];
    [v13 setMapThumbnailCurationDelegate:v15];
  }
  return v13;
}

- (void)_generateSnapshotsForExtendedTraitCollection:(id)a3 placesUtils:(id)a4 queue:(id)a5 size:(CGSize)a6 snapshotMapType:(unint64_t)a7 fetchResults:(id)a8 shouldFetchNearbyAssetCount:(BOOL)a9
{
  double height = a6.height;
  double width = a6.width;
  v50[2] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v39 = a4;
  id v38 = a5;
  id v37 = a8;
  uint64_t v17 = [v16 traitCollection];
  v36 = (void *)v17;
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4FB1E20];
    v50[0] = v17;
    id v19 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
    v50[1] = v19;
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    v34 = [v18 traitCollectionWithTraitsFromCollections:v20];

    double v21 = (void *)MEMORY[0x1E4FB1E20];
    v49[0] = v36;
    double v22 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
    v49[1] = v22;
    double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    uint64_t v32 = [v21 traitCollectionWithTraitsFromCollections:v23];
  }
  else
  {
    uint64_t v32 = 0;
    v34 = 0;
  }
  v24 = objc_msgSend(v39, "pkExtendedTraitCollectionFromPXExtendedTraitCollection:", v16, v32);
  [v24 setUserInterfaceStyle:1];
  [v24 setTraitCollectionForMapKit:v34];
  double v25 = [v39 pkExtendedTraitCollectionFromPXExtendedTraitCollection:v16];
  [v25 setUserInterfaceStyle:2];
  [v25 setTraitCollectionForMapKit:v33];
  double v26 = -[PXUIMapWidget _snapshotOptionsForExtendedTraitCollection:queue:viewSize:snapshotMapType:](self, "_snapshotOptionsForExtendedTraitCollection:queue:viewSize:snapshotMapType:", v24, v38, a7, width, height);
  v27 = -[PXUIMapWidget _snapshotOptionsForExtendedTraitCollection:queue:viewSize:snapshotMapType:](self, "_snapshotOptionsForExtendedTraitCollection:queue:viewSize:snapshotMapType:", v25, v38, a7, width, height);
  objc_initWeak(&location, self);
  v28 = [(PXUIMapWidget *)self _factory];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke;
  v44[3] = &unk_1E5DC22E0;
  objc_copyWeak(v46, &location);
  v46[1] = *(id *)&width;
  v46[2] = *(id *)&height;
  id v29 = v24;
  id v45 = v29;
  v46[3] = (id)a7;
  BOOL v47 = a9;
  [v28 requestMapSnapshotWithAssets:v37 snapshotOptions:v26 popoverImageOptions:1 completion:v44];

  v30 = [(PXUIMapWidget *)self _factory];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke_3;
  v40[3] = &unk_1E5DC22E0;
  objc_copyWeak(v42, &location);
  v42[1] = *(id *)&width;
  v42[2] = *(id *)&height;
  id v31 = v25;
  id v41 = v31;
  v42[3] = (id)a7;
  BOOL v43 = a9;
  [v30 requestMapSnapshotWithAssets:v37 snapshotOptions:v27 popoverImageOptions:1 completion:v40];

  objc_destroyWeak(v42);
  objc_destroyWeak(v46);
  objc_destroyWeak(&location);
}

void __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    long long v12 = *(_OWORD *)(a1 + 48);
    *(id *)(a1 + 32);
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v7;
    v8;
    uint64_t v13 = *(void *)(a1 + 64);
    char v14 = *(unsigned char *)(a1 + 72);
    v9;
    px_dispatch_on_main_queue();
  }
}

void __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    long long v12 = *(_OWORD *)(a1 + 48);
    *(id *)(a1 + 32);
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v7;
    v8;
    uint64_t v13 = *(void *)(a1 + 64);
    char v14 = *(unsigned char *)(a1 + 72);
    v9;
    px_dispatch_on_main_queue();
  }
}

void __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke_4(uint64_t a1)
{
  v3 = -[_PXPlacesSnapshotKey initWithImageSize:userInterfaceStyle:]([_PXPlacesSnapshotKey alloc], "initWithImageSize:userInterfaceStyle:", [*(id *)(a1 + 32) userInterfaceStyle], *(double *)(a1 + 72), *(double *)(a1 + 80));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleSnapshotResponse:*(void *)(a1 + 40) viewPort:*(void *)(a1 + 48) snapshotMapType:*(void *)(a1 + 88) shouldFetchNearbyAssetCount:*(unsigned __int8 *)(a1 + 96) fetchedImageKey:v3 error:*(void *)(a1 + 56) userInterfaceStyle:2];
}

void __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke_2(uint64_t a1)
{
  v3 = -[_PXPlacesSnapshotKey initWithImageSize:userInterfaceStyle:]([_PXPlacesSnapshotKey alloc], "initWithImageSize:userInterfaceStyle:", [*(id *)(a1 + 32) userInterfaceStyle], *(double *)(a1 + 72), *(double *)(a1 + 80));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleSnapshotResponse:*(void *)(a1 + 40) viewPort:*(void *)(a1 + 48) snapshotMapType:*(void *)(a1 + 88) shouldFetchNearbyAssetCount:*(unsigned __int8 *)(a1 + 96) fetchedImageKey:v3 error:*(void *)(a1 + 56) userInterfaceStyle:1];
}

- (void)_fetchPlacesSnapshotUsingMapType:(unint64_t)a3 fetchResults:(id)a4 imageSize:(CGSize)a5 shouldFetchNearbyAssetCount:(BOOL)a6
{
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(PXUIMapWidget *)self widgetDelegate];
  uint64_t v9 = [v8 widgetExtendedTraitCollection:self];

  [objc_alloc_init(PXPlacesUtils) pkExtendedTraitCollectionFromPXExtendedTraitCollection:v9];
  [(id)objc_claimAutoreleasedReturnValue() displayScale];
  PXSizeRoundToPixel();
}

void __101__PXUIMapWidget__fetchPlacesSnapshotUsingMapType_fetchResults_imageSize_shouldFetchNearbyAssetCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(v2);
    char v6 = [v5 _hasCachedSnapshotImageForKey:*(void *)(a1 + 32)];

    if ((v6 & 1) == 0)
    {
      id v7 = objc_loadWeakRetained(v2);
      objc_msgSend(v7, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 1, *(void *)(a1 + 40), 1, *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
  }
}

void __101__PXUIMapWidget__fetchPlacesSnapshotUsingMapType_fetchResults_imageSize_shouldFetchNearbyAssetCount___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_generateSnapshotsForExtendedTraitCollection:placesUtils:queue:size:snapshotMapType:fetchResults:shouldFetchNearbyAssetCount:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 88), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 96), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v31 = a3;
  id v7 = a4;
  if (self->__contentView)
  {
    id v8 = +[PXPhotosDetailsSettings sharedInstance];
    char v9 = [v8 placesWidgetShowOnlyPlaceholder];

    if ((v9 & 1) == 0)
    {
      if (![v7 hasIncrementalChanges]) {
        goto LABEL_13;
      }
      id v10 = [v7 originatingPhotoLibraryChange];
      id v11 = [(PXUIMapWidget *)self _firstAsset];
      long long v12 = [v10 changeDetailsForObject:v11];

      uint64_t v13 = [v12 objectBeforeChanges];
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          double v23 = [MEMORY[0x1E4F28B00] currentHandler];
          v24 = (objc_class *)objc_opt_class();
          double v25 = NSStringFromClass(v24);
          double v26 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
          [v23 handleFailureInMethod:a2, self, @"PXUIMapWidget.m", 1095, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"assetChangeDetails.objectBeforeChanges", v25, v26 object file lineNumber description];
        }
      }
      char v14 = [v12 objectAfterChanges];
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = [MEMORY[0x1E4F28B00] currentHandler];
          v28 = (objc_class *)objc_opt_class();
          id v29 = NSStringFromClass(v28);
          v30 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
          [v27 handleFailureInMethod:a2, self, @"PXUIMapWidget.m", 1096, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"assetChangeDetails.objectAfterChanges", v29, v30 object file lineNumber description];
        }
      }
      id v15 = [v13 location];
      id v16 = [v14 location];
      [v15 distanceFromLocation:v16];
      double v18 = v17;
      id v19 = [v7 contentChangedIndexPaths];
      uint64_t v20 = [v19 count];

      if ((v15 != 0) != (v16 != 0) || v18 != 0.0 || v20)
      {
LABEL_13:
        [(PXUIMapWidget *)self _hasLocationDidChange];
        double v21 = [(PXUIMapWidget *)self _fetchResultsForSections];
        [(NSMutableDictionary *)self->_fetchedImages removeAllObjects];
        if ([(PXUIMapWidget *)self _hasLocation])
        {
          [(PXUIMapWidget *)self _estimatedMapViewImageSize];
          -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 0, v21, 0);
        }
      }
      double v22 = [(PXUIMapWidget *)self widgetDelegate];
      [v22 widgetPreferredContentHeightForWidthDidChange:self];
    }
  }
}

- (void)_hasLocationDidChange
{
  [(PXUIMapWidget *)self _reloadFooterTitle];
  [(PXUIMapWidget *)self _showPlaceholder];
  [(PXUIMapWidget *)self _updateHeight];
  [(PXUIMapWidget *)self _updateContentViewFrame];
  if ([(PXUIMapWidget *)self infoPanelLayoutEnabled])
  {
    [(PXUIMapWidget *)self _updateFooterContextMenu];
  }
}

- (void)_presentLocationSearchPicker
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXUIMapWidget *)self context];
  BOOL v4 = [v3 assetCollections];
  id v5 = [v4 firstObject];

  if (v5)
  {
    char v6 = [(PXUIMapWidget *)self context];
    id v7 = [v6 assetsByCollection];
    id v8 = [v7 objectForKeyedSubscript:v5];
    char v9 = [v8 firstObject];

    if (v9)
    {
      id v10 = (void *)MEMORY[0x1E4F38EE8];
      v16[0] = v9;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      long long v12 = [v10 transientAssetCollectionWithAssets:v11 title:0];

      uint64_t v13 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v12 options:0];
      char v14 = +[PXPhotosDetailsLocationSearchUIFactory searchViewControllerWithAssets:v13 delegate:self];
      id v15 = [(PXUIMapWidget *)self widgetDelegate];
      [v15 widget:self transitionToViewController:v14 withTransitionType:2];
    }
  }
}

- (void)_clipboardChanged:(id)a3
{
  id v10 = a3;
  BOOL v4 = [v10 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  char v6 = v10;
  if (isKindOfClass)
  {
    id v7 = [v10 object];
    id v8 = [v7 pasteboardTypes];
    if ([v8 containsObject:@"com.apple.photos.pasteboard.location"])
    {
      BOOL v9 = [(PXUIMapWidget *)self infoPanelLayoutEnabled];

      if (v9) {
        [(PXUIMapWidget *)self _updateFooterContextMenu];
      }
    }
    else
    {
    }
    char v6 = v10;
  }
}

- (void)_showPlacesWithContentMode:(unint64_t)a3
{
  BOOL v4 = [(PXUIMapWidget *)self _firstAsset];
  uint64_t v5 = [v4 photoLibrary];

  char v6 = [(PXUIMapWidget *)self context];
  id v7 = [v6 photosDataSource];
  id v8 = [v7 firstAssetCollection];

  BOOL v9 = (void *)v5;
  double v17 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v5];
  id v10 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v17];
  uint64_t v11 = [(PXLibraryFilterState *)v10 viewMode];
  BOOL v12 = PXPhotoKitAssetCollectionSupportsNearbyAssetsAffordance(v8);
  uint64_t v13 = [(PXUIMapWidget *)self _mapViewController];
  char v14 = [v13 mapFetchResultsController];
  id v15 = [v14 mapView];
  [v15 centerCoordinate];
  +[PXLemonadeMapView makeViewWithPhotoLibrary:collection:libraryFilterViewMode:initialCenterCoordinate:wantsNearbyAssetsAffordance:enableGridView:](_TtC12PhotosUICore17PXLemonadeMapView, "makeViewWithPhotoLibrary:collection:libraryFilterViewMode:initialCenterCoordinate:wantsNearbyAssetsAffordance:enableGridView:", v9, v8, v11, v12, 1);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  id v16 = [(PXUIMapWidget *)self widgetDelegate];
  [v16 widget:self transitionToViewController:v18 withTransitionType:2];
}

- (void)controllerTraitCollectionDidChangeFrom:(id)a3 to:(id)a4
{
  a3;
  id v6 = a4;
  id v7 = [(PXUIMapWidget *)self _imageView];
  [v7 frame];

  PXSizeIsEmpty();
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] != 3) {
    goto LABEL_12;
  }
  uint64_t v5 = [(PXUIMapWidget *)self _imageView];
  id v6 = [v5 image];
  if (v6)
  {
    BOOL v7 = [(PXUIMapWidget *)self _hasLocation];

    if (v7)
    {
      if ([(PXUIMapWidget *)self infoPanelLayoutEnabled])
      {
        id v8 = (void *)MEMORY[0x1E4F56658];
        uint64_t v25 = *MEMORY[0x1E4F56560];
        BOOL v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        v26[0] = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
        [v8 sendEvent:@"com.apple.photos.CPAnalytics.infoPanelLocationTapped" withPayload:v11];
      }
      objc_initWeak(&location, self);
      BOOL v12 = [(PXUIMapWidget *)self widgetUnlockDelegate];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __45__PXUIMapWidget__handleTapGestureRecognizer___block_invoke;
      v20[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v21, &location);
      [v12 widget:self performAfterUnlockingDeviceIfNecessary:v20 failurehandler:0];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (![(PXUIMapWidget *)self _hasLocation])
  {
    if ([(PXUIMapWidget *)self infoPanelLayoutEnabled])
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F56658];
      uint64_t v23 = *MEMORY[0x1E4F56560];
      char v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      v24 = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      [v13 sendEvent:@"com.apple.photos.CPAnalytics.infoPanelAddLocationTapped" withPayload:v16];
    }
    objc_initWeak(&location, self);
    double v17 = [(PXUIMapWidget *)self widgetUnlockDelegate];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__PXUIMapWidget__handleTapGestureRecognizer___block_invoke_2;
    v18[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v19, &location);
    [v17 widget:self performAfterUnlockingDeviceIfNecessary:v18 failurehandler:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
LABEL_12:
}

void __45__PXUIMapWidget__handleTapGestureRecognizer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showPlacesWithContentMode:1];
}

void __45__PXUIMapWidget__handleTapGestureRecognizer___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentLocationSearchPicker];
}

- (void)userDidSelectDisclosureControl
{
  objc_initWeak(&location, self);
  v3 = [(PXUIMapWidget *)self widgetUnlockDelegate];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PXUIMapWidget_userDidSelectDisclosureControl__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  [v3 widget:self performAfterUnlockingDeviceIfNecessary:v4 failurehandler:0];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__PXUIMapWidget_userDidSelectDisclosureControl__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showPlacesWithContentMode:0];
}

- (void)_openMapsAtCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  BOOL v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a4;
  BOOL v9 = [v7 now];
  id v10 = +[PXProgressIndicatorAlertController beginShowingModalProgressWithConfiguration:&__block_literal_global_347_178234];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__PXUIMapWidget__openMapsAtCoordinate_title___block_invoke_2;
  v13[3] = &unk_1E5DCE438;
  id v14 = v10;
  id v15 = v9;
  id v16 = self;
  id v11 = v9;
  id v12 = v10;
  +[PXPlacesMapController launchMapsAtCoordinate:withTitle:completionHandler:](PXPlacesMapController, "launchMapsAtCoordinate:withTitle:completionHandler:", v8, v13, latitude, longitude);
}

void __45__PXUIMapWidget__openMapsAtCoordinate_title___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) stopShowing];
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  double v5 = -v4;
  id v6 = *(NSObject **)(*(void *)(a1 + 48) + 48);
  if (v4 >= -3.0)
  {
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v10 = 138543618;
        id v11 = @"YES";
        __int16 v12 = 2048;
        double v13 = v5;
        _os_log_fault_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_FAULT, "PXUIMapWidget: launchMapsAtCoordinate completed with success: %{public}@, and took %f.", (uint8_t *)&v10, 0x16u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543618;
      id v11 = @"NO";
      __int16 v12 = 2048;
      double v13 = v5;
      _os_log_error_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "PXUIMapWidget: launchMapsAtCoordinate completed with success: %{public}@, and took %f.", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    BOOL v7 = @"NO";
    if (a2) {
      BOOL v7 = @"YES";
    }
    id v8 = v7;
    BOOL v9 = v6;
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_fault_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_FAULT, "PXUIMapWidget: launchMapsAtCoordinate completed with success: %{public}@, and took %f.", (uint8_t *)&v10, 0x16u);
  }
}

uint64_t __45__PXUIMapWidget__openMapsAtCoordinate_title___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMinimumDisplayDuration:0.0];
}

- (void)userDidSelectFooter:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if ([(PXUIMapWidget *)self _hasLocation])
  {
    double v4 = (void *)MEMORY[0x1E4F56658];
    uint64_t v18 = *MEMORY[0x1E4F56560];
    double v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v19[0] = v6;
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v4 sendEvent:@"com.apple.photos.CPAnalytics.infoPanelLocationTapped" withPayload:v7];

    id v8 = [(PXUIMapWidget *)self _firstAsset];
    if ([(PXUIMapWidget *)self showAddressLink] && v8)
    {
      [v8 coordinate];
      double latitude = v20.latitude;
      double longitude = v20.longitude;
      if (CLLocationCoordinate2DIsValid(v20))
      {
        id v11 = [(PXUIMapWidget *)self _localizedGeoDescriptionForAsset:v8];
        -[PXUIMapWidget _openMapsAtCoordinate:title:](self, "_openMapsAtCoordinate:title:", v11, latitude, longitude);
      }
    }
  }
  else if ([(PXUIMapWidget *)self infoPanelLayoutEnabled])
  {
    __int16 v12 = (void *)MEMORY[0x1E4F56658];
    uint64_t v16 = *MEMORY[0x1E4F56560];
    double v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    double v17 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v12 sendEvent:@"com.apple.photos.CPAnalytics.infoPanelAddLocationTapped" withPayload:v15];

    [(PXUIMapWidget *)self _presentLocationSearchPicker];
  }
}

- (void)setHeight:(double)a3
{
}

- (void)_updateHeight
{
  v3 = [(PXUIMapWidget *)self spec];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 3)
  {
    [(PXUIMapWidget *)self footerHeight];
    double v6 = v5 + 400.0;
  }
  else
  {
    BOOL v7 = [(PXUIMapWidget *)self _hasLocation];
    double v6 = 42.0;
    if (v7) {
      double v6 = 171.0;
    }
  }
  [(PXUIMapWidget *)self setHeight:v6];
}

- (BOOL)_requiresDetailedAddressFooterString
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 countryCode];

  LOBYTE(v2) = [v3 isEqualToString:@"CN"];
  return (char)v2;
}

- (id)_localizedGeoDescriptionForAsset:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    [v4 fetchPropertySetsIfNeeded];
    if ([(PXUIMapWidget *)self _requiresDetailedAddressFooterString])
    {
      double v6 = objc_msgSend(v5, "px_singleLineMailingAddress");
    }
    else
    {
      char v10 = 0;
      BOOL v7 = [v5 photosOneUpProperties];
      double v6 = [v7 localizedGeoDescriptionIsHome:&v10];

      if (v10)
      {
        uint64_t v8 = PXLocalizedStringFromTable(@"PXPlacesWidgetHomeTitle", @"PhotosUICore");

        double v6 = (void *)v8;
      }
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (UIFont)footerFont
{
  footerFont = self->_footerFont;
  if (!footerFont)
  {
    if (![(PXUIMapWidget *)self infoPanelLayoutEnabled]) {
      PXFontWithTextStyleSymbolicTraits();
    }
    MEMORY[0x1AD10AAF0](7, 0x8000, 7);
    id v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_footerFont;
    self->_footerFont = v4;

    footerFont = self->_footerFont;
  }
  return footerFont;
}

- (void)_updateFooterButton
{
  v3 = [(PXUIMapWidget *)self footerButton];
  id v4 = [(PXUIMapWidget *)self adjustButton];
  double v5 = [(PXUIMapWidget *)self chevronImageView];
  double v6 = [v3 titleLabel];
  BOOL v7 = [v6 font];
  uint64_t v8 = [(PXUIMapWidget *)self footerFont];

  BOOL v9 = v7 != v8;
  if (v7 != v8)
  {
    char v10 = [(PXUIMapWidget *)self footerFont];
    id v11 = [v3 titleLabel];
    [v11 setFont:v10];

    __int16 v12 = (void *)MEMORY[0x1E4FB1830];
    double v13 = [(PXUIMapWidget *)self footerFont];
    uint64_t v14 = [v12 configurationWithFont:v13];

    [v5 setPreferredSymbolConfiguration:v14];
  }
  id v15 = [v4 titleLabel];
  uint64_t v16 = [v15 font];
  double v17 = [(PXUIMapWidget *)self footerFont];

  if (v16 != v17)
  {
    uint64_t v18 = [(PXUIMapWidget *)self footerFont];
    id v19 = [v4 titleLabel];
    [v19 setFont:v18];

    BOOL v9 = 1;
  }
  if ([(PXUIMapWidget *)self showAddressLink])
  {
    id v20 = [(PXUIMapWidget *)self cachedFooterTitle];
  }
  else
  {
    id v20 = 0;
  }
  id v21 = [v3 titleForState:0];
  if (v20 == v21)
  {

LABEL_15:
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  double v22 = v21;
  char v23 = [v20 isEqualToString:v21];

  if (v23) {
    goto LABEL_15;
  }
  [v3 setTitle:v20 forState:0];
  [v3 setAccessibilityValue:v20];
  [v3 alpha];
  if (v24 == 0.0 && v20)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__PXUIMapWidget__updateFooterButton__block_invoke;
    aBlock[3] = &unk_1E5DD36F8;
    id v25 = v3;
    id v28 = v25;
    double v26 = (void (**)(void))_Block_copy(aBlock);
    if (objc_msgSend(v25, "px_intersectsWindowBounds")) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v26 animations:0.25];
    }
    else {
      v26[2](v26);
    }
  }
LABEL_19:
  [(PXUIMapWidget *)self _layoutSubviews];
LABEL_20:
}

uint64_t __36__PXUIMapWidget__updateFooterButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (id)_copyLocationAction
{
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)MEMORY[0x1E4FB13F0];
  v3 = PXLocalizedStringFromTable(@"PXPlacesWidgetCopyLocationButtonTitle", @"PhotosUICore");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PXUIMapWidget__copyLocationAction__block_invoke;
  v6[3] = &unk_1E5DD2930;
  objc_copyWeak(&v7, &location);
  id v4 = [v2 actionWithTitle:v3 image:0 identifier:0 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __36__PXUIMapWidget__copyLocationAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v3 _copyLocationTapped];
  }
}

- (id)_pasteLocationAction
{
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PXLocalizedStringFromTable(@"PXPlacesWidgetPasteLocationButtonTitle", @"PhotosUICore");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PXUIMapWidget__pasteLocationAction__block_invoke;
  v6[3] = &unk_1E5DD2930;
  objc_copyWeak(&v7, &location);
  id v4 = [v2 actionWithTitle:v3 image:0 identifier:0 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __37__PXUIMapWidget__pasteLocationAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v3 _pasteLocationTapped];
  }
}

- (id)_contextMenuActions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PXUIMapWidget *)self _containsLocationInPasteboard])
  {
    id v4 = [(PXUIMapWidget *)self _pasteLocationAction];
    [v3 addObject:v4];
  }
  if ([(PXUIMapWidget *)self _hasLocation])
  {
    id v5 = [(PXUIMapWidget *)self _copyLocationAction];
    [v3 addObject:v5];
  }
  return v3;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PXUIMapWidget_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_1E5DC4F70;
  void v6[4] = self;
  id v4 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];
  return v4;
}

id __71__PXUIMapWidget_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1970];
  uint64_t v2 = [*(id *)(a1 + 32) _contextMenuActions];
  id v3 = [v1 menuWithChildren:v2];

  return v3;
}

- (void)_updateFooterContextMenu
{
  BOOL v3 = [(PXUIMapWidget *)self _hasLocation];
  BOOL v4 = [(PXUIMapWidget *)self _containsLocationInPasteboard];
  id v5 = +[PXPhotosDetailsSettings sharedInstance];
  int v6 = [v5 mapWidgetAllowCopyPasteLocation];

  id v7 = [(PXUIMapWidget *)self context];
  uint64_t v8 = [v7 photosDataSource];
  char v9 = [v8 containsMultipleAssets];

  if ((v3 || v4) && v6 && (v9 & 1) == 0)
  {
    id v11 = (id)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
    char v10 = [(PXUIMapWidget *)self _contentView];
    [v10 addInteraction:v11];
  }
}

- (void)_updateFooterWithTitle:(id)a3
{
  [(PXUIMapWidget *)self setCachedFooterTitle:a3];
  [(PXUIMapWidget *)self _updateFooterButton];
  [(PXUIMapWidget *)self _updateFooterHeight];
}

- (void)_handleReloadFooterTitle
{
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F56658] startSignpost];
  BOOL v4 = [(PXUIMapWidget *)self _firstAsset];
  [v4 fetchPropertySetsIfNeeded];
  id v5 = [v4 photoLibrary];
  int v6 = [v4 localIdentifier];
  v36[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  id v30 = 0;
  char v8 = [v5 requestAssetRevGeocodingForAssetLocalIdentifiers:v7 withError:&v30];
  id v9 = v30;

  if ((v8 & 1) == 0)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      char v23 = logger;
      double v24 = [v4 uuid];
      id v25 = [v9 localizedDescription];
      *(_DWORD *)id location = 138478083;
      *(void *)&location[4] = v24;
      __int16 v34 = 2114;
      v35 = v25;
      _os_log_error_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "PXUIMapWidget error requesting rev geocoding for assetuuid: %{private}@, error: %{public}@", location, 0x16u);
    }
  }
  id v11 = [(PXUIMapWidget *)self _firstAsset];
  if (v11)
  {
    double v26 = [(PXUIMapWidget *)self _localizedGeoDescriptionForAsset:v11];
    __int16 v12 = (void *)MEMORY[0x1E4F56658];
    double v13 = v4;
    uint64_t v14 = v5;
    id v15 = v9;
    uint64_t v16 = *MEMORY[0x1E4F56440];
    uint64_t v17 = *MEMORY[0x1E4F56558];
    v31[0] = *MEMORY[0x1E4F56580];
    v31[1] = v17;
    v32[0] = @"com.apple.photos.CPAnalytics.infoPanelRevGeoLookupDuration";
    v32[1] = v11;
    v31[2] = *MEMORY[0x1E4F56560];
    uint64_t v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    v32[2] = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
    uint64_t v21 = v16;
    id v9 = v15;
    id v5 = v14;
    BOOL v4 = v13;
    [v12 endSignpost:v3 forEventName:v21 withPayload:v20];

    objc_initWeak((id *)location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PXUIMapWidget__handleReloadFooterTitle__block_invoke;
    block[3] = &unk_1E5DD20C8;
    id v28 = v26;
    id v22 = v26;
    objc_copyWeak(&v29, (id *)location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v29);

    objc_destroyWeak((id *)location);
  }
}

void __41__PXUIMapWidget__handleReloadFooterTitle__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _updateFooterWithTitle:*(void *)(a1 + 32)];
  }
}

- (void)_reloadFooterTitle
{
  if ([(PXUIMapWidget *)self showAddressLink])
  {
    if ([(PXUIMapWidget *)self _hasLocation])
    {
      objc_initWeak(&location, self);
      uint64_t v3 = [(PXUIMapWidget *)self _reloadFooterQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__PXUIMapWidget__reloadFooterTitle__block_invoke;
      block[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v6, &location);
      dispatch_async(v3, block);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      PXLocalizedStringFromTable(@"PXPlacesWidgetAddLocationButtonTitle", @"PhotosUICore");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [(PXUIMapWidget *)self _updateFooterWithTitle:v4];
    }
  }
}

void __35__PXUIMapWidget__reloadFooterTitle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleReloadFooterTitle];
}

- (id)_reloadFooterQueue
{
  if (_reloadFooterQueue_onceToken != -1) {
    dispatch_once(&_reloadFooterQueue_onceToken, &__block_literal_global_309_178273);
  }
  uint64_t v2 = (void *)_reloadFooterQueue_queue;
  return v2;
}

void __35__PXUIMapWidget__reloadFooterQueue__block_invoke()
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.PXUIMapWidget.reloadFooterQueue", v0);
  uint64_t v2 = (void *)_reloadFooterQueue_queue;
  _reloadFooterQueue_queue = (uint64_t)v1;
}

- (void)setFooterHeight:(double)a3
{
}

- (void)_updateFooterHeight
{
  BOOL v3 = [(PXUIMapWidget *)self showAddressLink];
  if ([(PXUIMapWidget *)self infoPanelLayoutEnabled])
  {
    if ([(PXUIMapWidget *)self _hasLocation]) {
      double v4 = 38.0;
    }
    else {
      double v4 = 42.0;
    }
  }
  else
  {
    double v4 = 0.0;
    if (v3)
    {
      id v5 = [(PXUIMapWidget *)self _contentView];
      [v5 frame];
      double v7 = v6;

      char v8 = [(PXUIMapWidget *)self footerButton];
      id v9 = [v8 titleLabel];
      objc_msgSend(v9, "sizeThatFits:", v7, 0.0);
      double v11 = v10;

      __int16 v12 = [(PXUIMapWidget *)self spec];
      [v12 distanceBetweenMapViewAndAddressTop];
      double v4 = v11 + v13;
    }
  }
  [(PXUIMapWidget *)self setFooterHeight:v4];
}

- (id)_firstAsset
{
  uint64_t v2 = [(PXUIMapWidget *)self context];
  BOOL v3 = [v2 firstAsset];

  return v3;
}

- (BOOL)allowUserInteractionWithSubtitle
{
  return 1;
}

- (NSString)localizedDisclosureTitle
{
  BOOL v3 = [(PXUIMapWidget *)self context];
  uint64_t v4 = [v3 viewSourceOrigin];

  BOOL v5 = [(PXFeatureSpec *)self->_spec userInterfaceIdiom] == 3 || v4 == 1;
  if (v5 && [(PXUIMapWidget *)self infoPanelLayoutEnabled])
  {
    double v6 = 0;
  }
  else
  {
    double v6 = PXLocalizedStringFromTable(@"PXPlacesNearbyAssets", @"PhotosUICore");
  }
  return (NSString *)v6;
}

- (NSString)localizedTitle
{
  BOOL v3 = [(PXUIMapWidget *)self _cachedLocalizedTitle];
  uint64_t v4 = [(PXUIMapWidget *)self context];
  if ([v4 viewSourceOrigin] != 1)
  {

    goto LABEL_5;
  }
  BOOL v5 = [(PXUIMapWidget *)self infoPanelLayoutEnabled];

  if (!v5)
  {
LABEL_5:
    if (v3)
    {
      id v7 = v3;
    }
    else
    {
      PXLocalizedStringFromTable(@"PXPlacesWidgetTitle", @"PhotosUICore");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v6 = v7;
    goto LABEL_9;
  }
  double v6 = 0;
LABEL_9:

  return (NSString *)v6;
}

- (PXAnonymousView)contentView
{
  [(PXUIMapWidget *)self _loadContainerView];
  result = [(PXUIMapWidget *)self _containerView];
  self->_didDisplayContentView = 1;
  return result;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  uint64_t v4 = [(PXUIMapWidget *)self spec];
  [v4 contentGuideInsets];
  double v6 = v5;
  double v8 = v7;

  return v8 + v6 + self->_height;
}

- (BOOL)_hasLocation
{
  uint64_t v2 = [(PXUIMapWidget *)self context];
  BOOL v3 = [v2 photosDataSource];
  BOOL HasLocationForDataSource = PXPhotosDetailsContextHasLocationForDataSource(v3);

  return HasLocationForDataSource;
}

- (BOOL)hasContentForCurrentInput
{
  BOOL v3 = [(PXUIMapWidget *)self _firstAsset];
  BOOL v4 = [(PXUIMapWidget *)self infoPanelLayoutEnabled];
  double v5 = [(PXUIMapWidget *)self context];
  uint64_t v6 = [v5 viewSourceOrigin];

  char v7 = [v3 canPerformEditOperation:3];
  double v8 = [(PXUIMapWidget *)self widgetUnlockDelegate];
  int v9 = [v8 widgetDeviceIsUnlocked:self];

  if (v9)
  {
    BOOL v10 = [(PXUIMapWidget *)self _hasLocation];
    if (v6 == 1) {
      BOOL v11 = v7;
    }
    else {
      BOOL v11 = 0;
    }
    if (v10 || !v4) {
      BOOL v12 = v10;
    }
    else {
      BOOL v12 = v11;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)setSpec:(id)a3
{
  double v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXUIMapWidget *)self _updateFooterHeight];
    [(PXUIMapWidget *)self _updateHeight];
    [(PXUIMapWidget *)self _updateContentViewFrame];
    double v5 = v6;
  }
}

- (void)_showPlaceholder
{
}

- (void)_layoutSubviews
{
  uint64_t v2 = [(PXUIMapWidget *)self spec];
  [v2 contentGuideInsets];

  PXEdgeInsetsInsetRect();
}

- (void)_updateContentViewFrame
{
  uint64_t v2 = [(PXUIMapWidget *)self spec];
  [v2 contentGuideInsets];

  PXEdgeInsetsInsetRect();
}

- (int64_t)_fetchCountOfAssetsWithLocation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PXUIMapWidget *)self _fetchResultsForSections];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v2);
        }
        double v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * j) locationCoordinate];
              v5 += CLLocationCoordinate2DIsValid(v26);
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v11);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)_fetchResultsForSections
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PXUIMapWidget *)self context];
  int64_t v5 = [v4 photosDataSource];

  if ([v5 numberOfSections] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      char v7 = [v5 assetsInSection:v6];
      [v3 addObject:v7];

      ++v6;
    }
    while ([v5 numberOfSections] > v6);
  }
  double v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v8;
}

- (void)_handleContentSizeCategoryDidChange:(id)a3
{
  footerFont = self->_footerFont;
  self->_footerFont = 0;

  [(PXUIMapWidget *)self _updateFooterHeight];
  [(PXUIMapWidget *)self _updateFooterButton];
}

- (void)_setHasLoadedContentData:(BOOL)a3
{
  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    id v4 = [(PXUIMapWidget *)self widgetDelegate];
    [v4 widgetHasLoadedContentDataDidChange:self];
  }
}

- (void)unloadContentData
{
  self->_isLoaded = 0;
  id v3 = [(PXPhotosDetailsContext *)self->_context photosDataSource];
  [v3 unregisterChangeObserver:self];
}

- (CGSize)_estimatedMapViewImageSize
{
  uint64_t v2 = [(PXUIMapWidget *)self spec];
  [v2 contentGuideInsets];

  PXEdgeInsetsInsetRect();
}

- (void)loadContentData
{
  self->_isLoaded = 1;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleContentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  if ([(PXUIMapWidget *)self _hasLocation])
  {
    [(PXUIMapWidget *)self _estimatedMapViewImageSize];
    double v5 = v4;
    double v7 = v6;
    id v8 = [(PXUIMapWidget *)self _fetchResultsForSections];
    -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 0, v8, 0, v5, v7);
  }
}

- (void)_didTapAdjustLocation
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(PXUIMapWidget *)self infoPanelLayoutEnabled])
  {
    id v3 = (void *)MEMORY[0x1E4F56658];
    uint64_t v9 = *MEMORY[0x1E4F56560];
    double v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    v10[0] = v5;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v3 sendEvent:@"com.apple.photos.CPAnalytics.infoPanelAdjustLocationTapped" withPayload:v6];
  }
  double v7 = [(PXUIMapWidget *)self widgetUnlockDelegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PXUIMapWidget__didTapAdjustLocation__block_invoke;
  v8[3] = &unk_1E5DD36F8;
  v8[4] = self;
  [v7 widget:self performAfterUnlockingDeviceIfNecessary:v8 failurehandler:0];
}

uint64_t __38__PXUIMapWidget__didTapAdjustLocation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentLocationSearchPicker];
}

- (void)_pasteLocationTapped
{
  uint64_t v2 = [(PXUIMapWidget *)self _firstAsset];
  if (v2)
  {
    id v3 = v2;
    PXAssignLocationFromPasteboardToAsset(v2);
    uint64_t v2 = v3;
  }
}

- (BOOL)_containsLocationInPasteboard
{
  uint64_t v2 = [(PXUIMapWidget *)self _firstAsset];
  id v3 = (void *)v2;
  if (v2) {
    char v4 = PXCanAssignLocationFromPasteboardToAsset(v2);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_copyLocationTapped
{
  uint64_t v2 = [(PXUIMapWidget *)self _firstAsset];
  if (v2)
  {
    id v3 = v2;
    PXCopyLocationFromAssetToPasteboard(v2);
    uint64_t v2 = v3;
  }
}

- (void)_loadContainerView
{
  if (!self->__containerView)
  {
    double width = self->_contentSize.width;
    double height = self->_contentSize.height;
    double v5 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, width, height);
    contentView = self->__contentView;
    self->__contentView = v5;

    double v7 = [(PXUIMapWidget *)self widgetDelegate];
    id v60 = [v7 widgetExtendedTraitCollection:self];

    [v60 displayScale];
    double v9 = v8;
    uint64_t v10 = objc_alloc_init(PXImageViewSpec);
    uint64_t v11 = [(PXUIMapWidget *)self spec];
    v59 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    -[PXViewSpec setBackgroundColor:](v10, "setBackgroundColor:");
    [(PXViewSpec *)v10 setDisplayScale:v9];
    uint64_t v12 = [v60 userInterfaceIdiom];
    BOOL v13 = [(PXUIMapWidget *)self infoPanelLayoutEnabled];
    [(PXUIMapWidget *)self footerHeight];
    double v15 = height - v14;
    long long v16 = objc_alloc_init(PXImageUIView);
    -[PXImageUIView setFrame:](v16, "setFrame:", 0.0, 0.0, width, v15);
    long long v17 = [v11 defaultPlacesPlaceholderColor];
    [(PXImageUIView *)v16 setBackgroundColor:v17];

    long long v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapGestureRecognizer_];
    [(PXImageUIView *)v16 addGestureRecognizer:v18];

    [(PXImageUIView *)v16 setAutoresizingMask:18];
    [(PXImageUIView *)v16 setUserInteractionEnabled:1];
    [(PXImageUIView *)v16 setContentMode:2];
    [(PXImageUIView *)v16 setSpec:v10];
    [(PXImageUIView *)v16 setFloatingRotationEnabled:0];
    [(PXImageUIView *)v16 setFloatingViewEnabled:v12 == 3];
    if (v12 != 3)
    {
      [(PXImageUIView *)v16 setDrawsFocusRing:1];
      long long v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapGestureRecognizer_];
      [v19 setAllowedPressTypes:&unk_1F02D4C78];
      [(PXImageUIView *)v16 addGestureRecognizer:v19];
    }
    objc_storeStrong((id *)&self->__imageView, v16);
    long long v20 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    [v20 addTarget:self action:sel_userDidSelectFooter_ forControlEvents:64];
    long long v21 = PXLocalizedStringFromTable(@"PXPlacesWidgetFooterAddressButtonTitleAXLabel", @"PhotosUICore");
    [v20 setAccessibilityLabel:v21];

    long long v22 = PXLocalizedStringFromTable(@"PXPlacesWidgetFooterAddressButtonTitleAXHint", @"PhotosUICore");
    [v20 setAccessibilityHint:v22];

    [v20 setAccessibilityIdentifier:@"com.apple.photos.infoPanel.map.footer.address"];
    objc_storeStrong((id *)&self->_footerButton, v20);
    char v23 = [v20 titleLabel];
    [v23 setLineBreakMode:5];
    objc_msgSend(v23, "setNumberOfLines:", -[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"));
    [v23 setTextAlignment:4];
    if (v13)
    {
      [(PXUIMapWidget *)self _updateFooterContextMenu];
      double v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v24 addObserver:self selector:sel__clipboardChanged_ name:*MEMORY[0x1E4FB2E20] object:0];

      v58 = v11;
      uint64_t v25 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
      [(UIView *)v25 setAutoresizingMask:18];
      CLLocationCoordinate2D v26 = [(UIView *)v25 contentView];
      [v26 addSubview:v20];

      v27 = (void *)MEMORY[0x1E4FB1830];
      id v28 = [(PXUIMapWidget *)self footerFont];
      v57 = [v27 configurationWithFont:v28];

      id v29 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
      id v30 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v29];
      id v31 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
      [(UIImageView *)v30 setTintColor:v31];

      [(UIImageView *)v30 setContentMode:4];
      [(UIImageView *)v30 setPreferredSymbolConfiguration:v57];
      uint64_t v32 = [(UIView *)v25 contentView];
      [v32 addSubview:v30];

      chevronImageView = self->_chevronImageView;
      self->_chevronImageView = v30;
      v56 = v30;

      __int16 v34 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      v35 = PXLocalizedStringFromTable(@"PXPlacesWidgetAdjustButtonTitle", @"PhotosUICore");
      [(UIButton *)v34 setTitle:v35 forState:0];

      [(UIButton *)v34 addTarget:self action:sel__didTapAdjustLocation forControlEvents:64];
      v36 = PXLocalizedStringFromTable(@"PXPlacesWidgetAdjustButtonTitleAXHint", @"PhotosUICore");
      [(UIButton *)v34 setAccessibilityHint:v36];

      [(UIButton *)v34 setAccessibilityIdentifier:@"com.apple.photos.infoPanel.map.footer.adjust"];
      id v37 = [(UIView *)v25 contentView];
      [v37 addSubview:v34];

      adjustButton = self->_adjustButton;
      self->_adjustButton = v34;
      id v39 = v34;

      footerView = self->_footerView;
      self->_footerView = v25;
      id v41 = v25;
      uint64_t v11 = v58;
      v42 = v41;

      BOOL v43 = [(UIView *)self->__contentView layer];
      [v43 setCornerRadius:8.0];

      v44 = [(UIView *)self->__contentView layer];
      [v44 setMasksToBounds:1];

      [(UIView *)self->__contentView addSubview:v16];
      [(UIView *)self->__contentView addSubview:v42];
    }
    else
    {
      [(UIView *)self->__contentView addSubview:v16];
      [(UIView *)self->__contentView addSubview:v20];
    }
    [(PXUIMapWidget *)self _reloadFooterTitle];
    [(PXUIMapWidget *)self _updateContentViewFrame];
    id v45 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v46 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v46 bounds];
    BOOL v47 = (UIView *)objc_msgSend(v45, "initWithFrame:");
    containerView = self->__containerView;
    self->__containerView = v47;

    [(UIView *)self->__containerView addSubview:self->__contentView];
    v49 = objc_alloc_init(PXPlacesUtils);
    v50 = [(PXPlacesUtils *)v49 pkExtendedTraitCollectionFromPXExtendedTraitCollection:v60];
    v51 = [_PXPlacesSnapshotKey alloc];
    [(PXUIMapWidget *)self _estimatedMapViewImageSize];
    v54 = -[_PXPlacesSnapshotKey initWithImageSize:userInterfaceStyle:](v51, "initWithImageSize:userInterfaceStyle:", [v50 userInterfaceStyle], v52, v53);
    if ([(PXUIMapWidget *)self _hasCachedSnapshotImageForKey:v54])
    {
      v55 = [(PXUIMapWidget *)self _fetchResultsForSections];
      [(PXUIMapWidget *)self _estimatedMapViewImageSize];
      -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 0, v55, 0);
    }
    else
    {
      [(PXUIMapWidget *)self _showPlaceholder];
    }
  }
}

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)@"PXUIMapWidget";
}

- (BOOL)infoPanelLayoutEnabled
{
  id v3 = [(PXUIMapWidget *)self spec];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = [(PXUIMapWidget *)self context];
  uint64_t v6 = [v5 viewSourceOrigin];

  return v6 == 1 && v4 != 3;
}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    if (self->__contentView)
    {
      [(PXUIMapWidget *)self _updateContentViewFrame];
      if ([(PXUIMapWidget *)self _hasLocation])
      {
        id v9 = [(PXUIMapWidget *)self _fetchResultsForSections];
        uint64_t v5 = [(PXUIMapWidget *)self _hasLocation] ^ 1;
        uint64_t v6 = [(PXUIMapWidget *)self _imageView];
        [v6 frame];
        -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", v5, v9, 0, v7, v8);
      }
    }
  }
}

- (void)setContext:(id)a3
{
  uint64_t v4 = (PXPhotosDetailsContext *)a3;
  uint64_t v5 = [(PXPhotosDetailsContext *)self->_context photosDataSource];
  [v5 unregisterChangeObserver:self];

  id v7 = [(PXPhotosDetailsContext *)v4 photosDataSource];
  [v7 registerChangeObserver:self];
  context = self->_context;
  self->_context = v4;

  if (self->_isLoaded) {
    [(PXUIMapWidget *)self _reloadFooterTitle];
  }
}

- (void)setShowAddressLink:(BOOL)a3
{
  if (self->_showAddressLink != a3)
  {
    self->_showAddressLink = a3;
    if (self->_isLoaded) {
      [(PXUIMapWidget *)self _reloadFooterTitle];
    }
  }
}

- (void)dealloc
{
  [(PXUIMapWidget *)self unloadContentData];
  v3.receiver = self;
  v3.super_class = (Class)PXUIMapWidget;
  [(PXUIMapWidget *)&v3 dealloc];
}

- (PXUIMapWidget)initWithEnableCuratedThumbnails:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PXUIMapWidget;
  uint64_t v4 = [(PXUIMapWidget *)&v15 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_enableCuratedThumbnails = a3;
    v4->_double height = 171.0;
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fetchedImages = v5->_fetchedImages;
    v5->_fetchedImages = v6;

    v5->_lastFetchedBoundingRectAssetCount = -1;
    double v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nearbyCountCompletionBlocks = v5->__nearbyCountCompletionBlocks;
    v5->__nearbyCountCompletionBlocks = v8;

    v5->_contentSize = (CGSize)*MEMORY[0x1E4F1DB30];
    uint64_t v10 = PXLocalizedStringFromTable(@"PXPlacesWidgetTitle", @"PhotosUICore");
    cachedLocalizedTitle = v5->__cachedLocalizedTitle;
    v5->__cachedLocalizedTitle = (NSString *)v10;

    os_log_t v12 = os_log_create("com.apple.photos.infopanel", "InfoPanel");
    logger = v5->_logger;
    v5->_logger = (OS_os_log *)v12;
  }
  return v5;
}

- (PXUIMapWidget)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUIMapWidget.m", 202, @"%s is not available as initializer", "-[PXUIMapWidget init]");

  abort();
}

+ (id)sharedSnapshotRequestConcurrentQueue
{
  if (sharedSnapshotRequestConcurrentQueue_onceToken != -1) {
    dispatch_once(&sharedSnapshotRequestConcurrentQueue_onceToken, &__block_literal_global_178339);
  }
  uint64_t v2 = (void *)sharedSnapshotRequestConcurrentQueue_sharedQueue;
  return v2;
}

void __53__PXUIMapWidget_sharedSnapshotRequestConcurrentQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.mapSnapshotRequestQueue", attr);
  uint64_t v2 = (void *)sharedSnapshotRequestConcurrentQueue_sharedQueue;
  sharedSnapshotRequestConcurrentQueue_sharedQueue = (uint64_t)v1;
}

@end