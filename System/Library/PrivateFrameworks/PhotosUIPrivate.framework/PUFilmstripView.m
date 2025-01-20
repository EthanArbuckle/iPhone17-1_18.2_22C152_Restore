@interface PUFilmstripView
- (AVAsset)asset;
- (AVVideoComposition)videoComposition;
- (BOOL)_isMediaProviderValid;
- (BOOL)generatesPlaceholderImage;
- (BOOL)preserveThumbnailsDuringReload;
- (BOOL)useContentAspectRatio;
- (CGRect)visibleRect;
- (NSArray)indicatorInfos;
- (PUFilmstripDataSource)_dataSource;
- (PUFilmstripMediaProvider)_mediaProvider;
- (PUFilmstripView)initWithFrame:(CGRect)a3;
- (PUTilingView)_tilingView;
- (UIImage)generatedPlaceholderImage;
- (UIImage)placeholderImage;
- (double)_thumbnailAspectRatio;
- (double)desiredClippingOutset;
- (id)_filmstripLayout;
- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5;
- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6;
- (void)_invalidateDataSource;
- (void)_invalidateGeneratedPlaceholderImage;
- (void)_invalidateLayout;
- (void)_invalidateMediaProvider;
- (void)_invalidateThumbnailAspectRatio;
- (void)_releaseAVObjects;
- (void)_setDataSource:(id)a3;
- (void)_setMediaProvider:(id)a3;
- (void)_setThumbnailAspectRatio:(double)a3;
- (void)_updateDataSourceIfNeeded;
- (void)_updateGeneratedPlaceholderImageIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateLayoutIfNeeded;
- (void)_updateMediaProviderPlaceholderImage;
- (void)_updateThumbnailAspectRatioIfNeeded;
- (void)layoutSubviews;
- (void)reloadThumbnails;
- (void)setAsset:(id)a3;
- (void)setAsset:(id)a3 videoComposition:(id)a4;
- (void)setGeneratedPlaceholderImage:(id)a3;
- (void)setGeneratesPlaceholderImage:(BOOL)a3;
- (void)setIndicatorInfos:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPreserveThumbnailsDuringReload:(BOOL)a3;
- (void)setUseContentAspectRatio:(BOOL)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PUFilmstripView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedPlaceholderImage, 0);
  objc_storeStrong((id *)&self->__dataSource, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__tilingView, 0);
  objc_storeStrong((id *)&self->_indicatorInfos, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_placeholderGenerationQueue, 0);
}

- (UIImage)generatedPlaceholderImage
{
  return self->_generatedPlaceholderImage;
}

- (double)_thumbnailAspectRatio
{
  return self->__thumbnailAspectRatio;
}

- (void)_setDataSource:(id)a3
{
}

- (PUFilmstripDataSource)_dataSource
{
  return self->__dataSource;
}

- (void)_setMediaProvider:(id)a3
{
}

- (PUTilingView)_tilingView
{
  return self->__tilingView;
}

- (void)setPreserveThumbnailsDuringReload:(BOOL)a3
{
  self->_preserveThumbnailsDuringReload = a3;
}

- (BOOL)preserveThumbnailsDuringReload
{
  return self->_preserveThumbnailsDuringReload;
}

- (BOOL)useContentAspectRatio
{
  return self->_useContentAspectRatio;
}

- (NSArray)indicatorInfos
{
  return self->_indicatorInfos;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)generatesPlaceholderImage
{
  return self->_generatesPlaceholderImage;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5
{
  v6 = off_1E5F1EC30;
  if (![(PUFilmstripView *)self _isMediaProviderValid]
    && ![(PUFilmstripView *)self preserveThumbnailsDuringReload])
  {
    v6 = off_1E5F1F1F8;
  }
  id v7 = objc_alloc_init(*v6);
  return v7;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6
{
  return 0;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6
{
  v6 = objc_alloc_init(PUFilmstripTileTransitionCoordinator);
  return v6;
}

- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 isEqualToString:@"PUTileKindItemContent"])
  {
    v13 = [(PUFilmstripView *)self _dataSource];
    v14 = [v13 assetAtIndexPath:v11];

    v15 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUFilmstripImageTileViewReuseIdentifier"];
    [v15 setAnimatesImageTransitions:1];
    v16 = [(PUFilmstripView *)self _mediaProvider];
    [v15 setMediaProvider:v16];

    [v15 setAsset:v14];
    goto LABEL_5;
  }
  if ([v12 isEqualToString:@"PUTileKindItemContentFilmStripIndicator"])
  {
    v15 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUTileKindItemContentFilmStripIndicator"];
    v17 = [v15 view];
    v18 = [v17 layer];
    id v19 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.200000003];
    objc_msgSend(v18, "setBorderColor:", objc_msgSend(v19, "CGColor"));

    v14 = [v15 view];
    v20 = [v14 layer];
    [v20 setBorderWidth:1.0];

LABEL_5:
    if (v15) {
      goto LABEL_7;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PUFilmstripView.m", 479, @"Invalid parameter not satisfying: %@", @"tileController != nil" object file lineNumber description];

  v15 = 0;
LABEL_7:

  return v15;
}

- (id)_filmstripLayout
{
  v2 = [(PUFilmstripView *)self _tilingView];
  v3 = [v2 layout];

  return v3;
}

- (void)_updateGeneratedPlaceholderImageIfNeeded
{
  if (self->_needsUpdateGeneratedPlaceholder)
  {
    v3 = +[PUPhotoEditProtoSettings sharedInstance];
    char v4 = [v3 disableVideoFilmstrip];

    if ((v4 & 1) == 0)
    {
      self->_needsUpdateGeneratedPlaceholder = 0;
      if ([(PUFilmstripView *)self generatesPlaceholderImage])
      {
        v5 = [(PUFilmstripView *)self asset];

        if (v5)
        {
          if (!self->_placeholderGenerationQueue)
          {
            v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
            id v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PUFilmstripView.placeholderGeneration", v6);
            placeholderGenerationQueue = self->_placeholderGenerationQueue;
            self->_placeholderGenerationQueue = v7;
          }
          objc_initWeak(&location, self);
          v9 = [(PUFilmstripView *)self asset];
          id v10 = [(PUFilmstripView *)self videoComposition];
          [(PUFilmstripView *)self _thumbnailAspectRatio];
          [(PUFilmstripView *)self bounds];
          PFSizeWithAspectRatioFittingSize();
          id v11 = self->_placeholderGenerationQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __59__PUFilmstripView__updateGeneratedPlaceholderImageIfNeeded__block_invoke;
          block[3] = &unk_1E5F25620;
          id v17 = v9;
          id v18 = v10;
          v20[1] = v12;
          v20[2] = v13;
          id v14 = v10;
          id v15 = v9;
          objc_copyWeak(v20, &location);
          id v19 = self;
          dispatch_async(v11, block);
          objc_destroyWeak(v20);

          objc_destroyWeak(&location);
        }
      }
      else
      {
        [(PUFilmstripView *)self setGeneratedPlaceholderImage:0];
      }
    }
  }
}

void __59__PUFilmstripView__updateGeneratedPlaceholderImageIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:*(void *)(a1 + 32)];
  [v2 setVideoComposition:*(void *)(a1 + 40)];
  objc_msgSend(v2, "setMaximumSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  [v2 setAppliesPreferredTrackTransform:1];
  v3 = [v2 customVideoCompositor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [v2 customVideoCompositor];
    [v5 setLabel:@"PUFilmstripView-updateGeneratedPlaceholderImageIfNeeded"];
  }
  id v16 = 0;
  *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
  *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v6 = (CGImage *)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v2 atTime:buf actualTime:0 error:&v16];
  id v7 = v16;
  if (v6)
  {
    v8 = [MEMORY[0x1E4FB1818] imageWithCGImage:v6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PUFilmstripView__updateGeneratedPlaceholderImageIfNeeded__block_invoke_2;
    block[3] = &unk_1E5F2E4E8;
    objc_copyWeak(&v15, (id *)(a1 + 56));
    v9 = v8;
    id v14 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
    CGImageRelease(v6);

    objc_destroyWeak(&v15);
  }
  else
  {
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "%@ unable to generate placeholder image\n\tAsset: %@\n\tVideo Composition: %@\n\tError: %@", buf, 0x2Au);
    }
  }
}

void __59__PUFilmstripView__updateGeneratedPlaceholderImageIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setGeneratedPlaceholderImage:v1];
}

- (void)_invalidateGeneratedPlaceholderImage
{
  self->_needsUpdateGeneratedPlaceholder = 1;
  [(PUFilmstripView *)self _setNeedsUpdate];
}

- (void)_updateMediaProviderPlaceholderImage
{
  v3 = [(PUFilmstripView *)self generatedPlaceholderImage];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PUFilmstripView *)self placeholderImage];
  }
  id v6 = v5;

  [(PUFilmstripMediaProvider *)self->__mediaProvider setPlaceholderImage:v6];
}

- (void)_updateLayoutIfNeeded
{
  if (self->_needsUpdateLayout)
  {
    self->_needsUpdateLayout = 0;
    v3 = [(PUFilmstripView *)self _filmstripLayout];
    char v4 = [(PUFilmstripView *)self _dataSource];
    id v5 = [(PUTilingLayout *)v3 dataSource];

    uint64_t v6 = [v4 numberOfIndexes];
    id v7 = [(PUTilingLayout *)v3 dataSource];
    uint64_t v8 = [v7 numberOfIndexes];

    if (v4 == v5)
    {
      uint64_t v12 = v3;
    }
    else
    {
      v9 = [PUFilmstripTilingLayout alloc];
      [(PUFilmstripView *)self bounds];
      uint64_t v12 = -[PUFilmstripTilingLayout initWithDataSource:contentSize:](v9, "initWithDataSource:contentSize:", v4, v10, v11);

      v13 = [(PUFilmstripView *)self _tilingView];
      [v13 transitionToLayout:v12];

      id v14 = [(PUFilmstripView *)self _tilingView];
      [v14 layoutIfNeeded];

      if ([(PUFilmstripView *)self preserveThumbnailsDuringReload])
      {
        if (v6 == v8)
        {
          id v15 = [(PUFilmstripView *)self _mediaProvider];
          id v16 = [(PUFilmstripView *)self _tilingView];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __40__PUFilmstripView__updateLayoutIfNeeded__block_invoke;
          v18[3] = &unk_1E5F280F0;
          id v19 = v15;
          id v20 = v4;
          id v17 = v15;
          [v16 enumerateAllTileControllersUsingBlock:v18];
        }
      }
    }
  }
}

void __40__PUFilmstripView__updateLayoutIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v8 presentationLayoutInfo];
    char v4 = [v3 indexPath];

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v8;
    [v6 setMediaProvider:v5];
    id v7 = [*(id *)(a1 + 40) assetAtIndexPath:v4];
    [v6 setAsset:v7];
  }
}

- (void)_updateDataSourceIfNeeded
{
  if (self->_needsUpdateDataSource)
  {
    self->_needsUpdateDataSource = 0;
    [(PUFilmstripView *)self _thumbnailAspectRatio];
    double v4 = v3;
    [(PUFilmstripView *)self bounds];
    if (v6 <= 0.0) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = vcvtpd_s64_f64(v5 / (v4 * v6));
    }
    id v8 = [PUFilmstripDataSource alloc];
    v9 = [(PUFilmstripView *)self asset];
    double v10 = [(PUFilmstripView *)self indicatorInfos];
    double v11 = [(PUFilmstripDataSource *)v8 initWithAsset:v9 numberOfIndexes:v7 indicatorInfos:v10];

    [(PUFilmstripView *)self _setDataSource:v11];
  }
}

- (void)_updateIfNeeded
{
  [(PUFilmstripView *)self _updateThumbnailAspectRatioIfNeeded];
  [(PUFilmstripView *)self _updateGeneratedPlaceholderImageIfNeeded];
  [(PUFilmstripView *)self _updateDataSourceIfNeeded];
  [(PUFilmstripView *)self _updateLayoutIfNeeded];
}

- (void)_invalidateLayout
{
  self->_needsUpdateLayout = 1;
  [(PUFilmstripView *)self _setNeedsUpdate];
}

- (void)_invalidateDataSource
{
  self->_needsUpdateDataSource = 1;
  [(PUFilmstripView *)self _invalidateLayout];
  [(PUFilmstripView *)self _setNeedsUpdate];
}

- (BOOL)_isMediaProviderValid
{
  return self->__mediaProvider != 0;
}

- (void)_invalidateMediaProvider
{
  [(PUFilmstripView *)self _setMediaProvider:0];
  [(PUFilmstripView *)self _setNeedsUpdate];
}

- (void)_updateThumbnailAspectRatioIfNeeded
{
  if (self->_needsUpdateThumbnailAspectRatio)
  {
    self->_needsUpdateThumbnailAspectRatio = 0;
    double v3 = +[PUScrubberSettings sharedInstance];
    [v3 filmstripAspectRatio];
    double v5 = v4;

    if ([(PUFilmstripView *)self useContentAspectRatio])
    {
      double v6 = [(PUFilmstripView *)self asset];
      unint64_t v7 = [(PUFilmstripView *)self videoComposition];
      id v8 = v7;
      if (v7)
      {
        [v7 renderSize];
        double v5 = v9 / v10;
      }
      else
      {
        double v11 = [v6 tracks];

        if (v11)
        {
          uint64_t v12 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v6];
          v13 = [v12 firstObject];

          [v13 naturalSize];
          double v15 = v14;
          double v17 = v16;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v24 = 0u;
          if (v13) {
            [v13 preferredTransform];
          }
          v27.size.double width = v17 * 0.0 + 0.0 * v15;
          v27.size.double height = v27.size.width;
          v27.origin.double x = 0.0;
          v27.origin.double y = 0.0;
          CGRect v28 = CGRectStandardize(v27);
          double v5 = v28.size.width / v28.size.height;
        }
        else
        {
          uint64_t v18 = [(PUFilmstripView *)self placeholderImage];

          if (v18)
          {
            id v19 = [(PUFilmstripView *)self placeholderImage];
            [v19 size];
            double v21 = v20;
            double v23 = v22;

            double v5 = v21 / v23;
          }
        }
      }
    }
    -[PUFilmstripView _setThumbnailAspectRatio:](self, "_setThumbnailAspectRatio:", fabs(v5), v24, v25, v26);
  }
}

- (void)_invalidateThumbnailAspectRatio
{
  self->_needsUpdateThumbnailAspectRatio = 1;
  [(PUFilmstripView *)self _setNeedsUpdate];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PUFilmstripView;
  [(PUFilmstripView *)&v4 layoutSubviews];
  [(PUFilmstripView *)self bounds];
  double v3 = [(PUFilmstripView *)self _filmstripLayout];
  [v3 contentSize];

  if ((PUSizeIsEqualToSizeWithTolerance() & 1) == 0)
  {
    self->_needsUpdateDataSource = 1;
    self->_needsUpdateLayout = 1;
  }
  [(PUFilmstripView *)self _updateIfNeeded];
}

- (void)_releaseAVObjects
{
  mediaProvider = self->__mediaProvider;
  self->__mediaProvider = 0;

  asset = self->_asset;
  self->_asset = 0;

  videoComposition = self->_videoComposition;
  self->_videoComposition = 0;
}

- (void)_setThumbnailAspectRatio:(double)a3
{
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
  {
    self->__thumbnailAspectRatio = a3;
    [(PUFilmstripView *)self _invalidateDataSource];
    [(PUFilmstripView *)self _invalidateGeneratedPlaceholderImage];
  }
}

- (PUFilmstripMediaProvider)_mediaProvider
{
  if (!self->__mediaProvider)
  {
    double v3 = +[PUPhotoEditProtoSettings sharedInstance];
    char v4 = [v3 disableVideoFilmstrip];

    if ((v4 & 1) == 0)
    {
      double v5 = [PUFilmstripMediaProvider alloc];
      double v6 = [(PUFilmstripView *)self asset];
      unint64_t v7 = [(PUFilmstripView *)self videoComposition];
      id v8 = [(PUFilmstripMediaProvider *)v5 initWithAVAsset:v6 videoComposition:v7];
      mediaProvider = self->__mediaProvider;
      self->__mediaProvider = v8;

      [(PUFilmstripMediaProvider *)self->__mediaProvider setDeliversImagesInOrder:1];
      [(PUFilmstripView *)self _updateMediaProviderPlaceholderImage];
    }
  }
  double v10 = self->__mediaProvider;
  return v10;
}

- (double)desiredClippingOutset
{
  return 0.0;
}

- (void)setUseContentAspectRatio:(BOOL)a3
{
  if (self->_useContentAspectRatio != a3)
  {
    self->_useContentAspectRatio = a3;
    [(PUFilmstripView *)self _invalidateThumbnailAspectRatio];
  }
}

- (void)setIndicatorInfos:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_indicatorInfos] & 1) == 0)
  {
    char v4 = (NSArray *)[v6 copy];
    indicatorInfos = self->_indicatorInfos;
    self->_indicatorInfos = v4;

    [(PUFilmstripView *)self _invalidateDataSource];
  }
}

- (void)setVisibleRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_visibleRect = &self->_visibleRect;
  if (!CGRectEqualToRect(self->_visibleRect, a3))
  {
    p_visibleRect->origin.CGFloat x = x;
    p_visibleRect->origin.CGFloat y = y;
    p_visibleRect->size.CGFloat width = width;
    p_visibleRect->size.CGFloat height = height;
    [(PUFilmstripView *)self bounds];
    double v13 = PUInsetsOfRectInRect(x, y, width, height, v9, v10, v11, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    id v20 = [(PUFilmstripView *)self _tilingView];
    objc_msgSend(v20, "setLoadingInsets:", v13, v15, v17, v19);
  }
}

- (void)setGeneratedPlaceholderImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_generatedPlaceholderImage != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_generatedPlaceholderImage, a3);
    [(PUFilmstripView *)self _updateMediaProviderPlaceholderImage];
    double v5 = v6;
  }
}

- (void)setGeneratesPlaceholderImage:(BOOL)a3
{
  if (self->_generatesPlaceholderImage != a3)
  {
    self->_generatesPlaceholderImage = a3;
    [(PUFilmstripView *)self _invalidateGeneratedPlaceholderImage];
  }
}

- (void)setPlaceholderImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    [(PUFilmstripView *)self _invalidateThumbnailAspectRatio];
    [(PUFilmstripView *)self _updateMediaProviderPlaceholderImage];
    double v5 = v6;
  }
}

- (void)reloadThumbnails
{
  [(PUFilmstripView *)self _invalidateThumbnailAspectRatio];
  [(PUFilmstripView *)self _invalidateMediaProvider];
  [(PUFilmstripView *)self _invalidateDataSource];
  [(PUFilmstripView *)self _invalidateGeneratedPlaceholderImage];
  [(PUFilmstripView *)self _invalidateLayout];
}

- (void)setAsset:(id)a3 videoComposition:(id)a4
{
  CGFloat v11 = (AVAsset *)a3;
  unint64_t v7 = (AVVideoComposition *)a4;
  asset = self->_asset;
  if (asset != v11 && ![(AVAsset *)asset isEqual:v11]
    || self->_videoComposition != v7 && (-[AVVideoComposition isEqual:](v7, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    objc_storeStrong((id *)&self->_videoComposition, a4);
    CGFloat v9 = +[PUPhotoEditProtoSettings sharedInstance];
    char v10 = [v9 disableVideoFilmstrip];

    if ((v10 & 1) == 0) {
      [(PUFilmstripView *)self reloadThumbnails];
    }
  }
}

- (void)setAsset:(id)a3
{
}

- (PUFilmstripView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PUFilmstripView;
  double v3 = -[PUFilmstripView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    char v4 = objc_alloc_init(PUTileViewAnimator);
    animator = v3->_animator;
    v3->_animator = v4;

    id v6 = +[PUScrubberSettings sharedInstance];
    [v6 filmstripAspectRatio];
    v3->__thumbnailAspectRatio = v7;

    id v8 = [[PUFilmstripDataSource alloc] initWithAsset:0 numberOfIndexes:0 indicatorInfos:0];
    [(PUFilmstripView *)v3 _setDataSource:v8];
    CGFloat v9 = [PUFilmstripTilingLayout alloc];
    char v10 = -[PUFilmstripTilingLayout initWithDataSource:contentSize:](v9, "initWithDataSource:contentSize:", v8, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    CGFloat v11 = [PUTilingView alloc];
    [(PUFilmstripView *)v3 bounds];
    CGFloat v12 = -[PUTilingView initWithFrame:layout:](v11, "initWithFrame:layout:", v10);
    [(PUTilingView *)v12 setShowsHorizontalScrollIndicator:0];
    [(PUTilingView *)v12 setShowsVerticalScrollIndicator:0];
    [(PUTilingView *)v12 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUFilmstripImageTileViewReuseIdentifier"];
    [(PUTilingView *)v12 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUTileKindItemContentFilmStripIndicator"];
    [(PUTilingView *)v12 setTileSource:v3];
    [(PUTilingView *)v12 setTileTransitionDelegate:v3];
    [(PUTilingView *)v12 setDelegate:v3];
    [(PUTilingView *)v12 setTileAnimator:v3->_animator];
    [(PUTilingView *)v12 setClipsToBounds:0];
    [(PUTilingView *)v12 setAutoresizingMask:18];
    tilingView = v3->__tilingView;
    v3->__tilingView = v12;
    double v14 = v12;

    [(PUFilmstripView *)v3 addSubview:v14];
    double v15 = [MEMORY[0x1E4FB1618] systemBackgroundColor];

    [(PUFilmstripView *)v3 setBackgroundColor:v15];
  }
  return v3;
}

@end