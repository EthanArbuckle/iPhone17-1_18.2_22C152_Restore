@interface PXWallpaperSuggestionView
+ (id)sharedWorkQueue;
+ (void)requestSharedOverlayImageWithCompletionBlock:(id)a3;
- (BOOL)_isPortrait;
- (BOOL)needsRoundedCorner;
- (BOOL)showClockOverlay;
- (CGRect)contentsRect;
- (PXDisplayAsset)asset;
- (PXImageRequester)imageRequester;
- (PXUIMediaProvider)mediaProvider;
- (PXWallpaperSuggestionView)initWithFrame:(CGRect)a3;
- (UIImage)landscapeOverlay;
- (UIImage)portraitOverlay;
- (UIImageView)overlayView;
- (int64_t)currentImageIdentifier;
- (unint64_t)classificationMode;
- (unint64_t)cropMode;
- (void)_resetImageRequester;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAsset:(id)a3;
- (void)setClassificationMode:(unint64_t)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setCropMode:(unint64_t)a3;
- (void)setCurrentImageIdentifier:(int64_t)a3;
- (void)setImageRequester:(id)a3;
- (void)setLandscapeOverlay:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)setNeedsRoundedCorner:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)setPortraitOverlay:(id)a3;
- (void)setShowClockOverlay:(BOOL)a3;
@end

@implementation PXWallpaperSuggestionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitOverlay, 0);
  objc_storeStrong((id *)&self->_landscapeOverlay, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setCurrentImageIdentifier:(int64_t)a3
{
  self->_currentImageIdentifier = a3;
}

- (int64_t)currentImageIdentifier
{
  return self->_currentImageIdentifier;
}

- (void)setPortraitOverlay:(id)a3
{
}

- (UIImage)portraitOverlay
{
  return self->_portraitOverlay;
}

- (void)setLandscapeOverlay:(id)a3
{
}

- (UIImage)landscapeOverlay
{
  return self->_landscapeOverlay;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMediaProvider:(id)a3
{
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (void)setClassificationMode:(unint64_t)a3
{
  self->_classificationMode = a3;
}

- (unint64_t)classificationMode
{
  return self->_classificationMode;
}

- (void)setCropMode:(unint64_t)a3
{
  self->_cropMode = a3;
}

- (unint64_t)cropMode
{
  return self->_cropMode;
}

- (void)setShowClockOverlay:(BOOL)a3
{
  self->_showClockOverladouble y = a3;
}

- (BOOL)showClockOverlay
{
  return self->_showClockOverlay;
}

- (void)setNeedsRoundedCorner:(BOOL)a3
{
  self->_needsRoundedCorner = a3;
}

- (BOOL)needsRoundedCorner
{
  return self->_needsRoundedCorner;
}

- (void)setOverlayView:(id)a3
{
}

- (UIImageView)overlayView
{
  return self->_overlayView;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXImageRequesterObserverContext_132703 == a5)
  {
    if (v6 < 0)
    {
      location[1] = (id)MEMORY[0x1E4F143A8];
      location[2] = (id)3221225472;
      location[3] = __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke;
      location[4] = &unk_1E5DD36F8;
      location[5] = self;
      px_dispatch_on_main_queue();
    }
    if ((v6 & 4) != 0)
    {
      v9 = [(PXWallpaperSuggestionView *)self imageRequester];
      v10 = [v9 image];
      [(PXWallpaperSuggestionView *)self setCurrentImageIdentifier:[(PXWallpaperSuggestionView *)self currentImageIdentifier] + 1];
      v11 = [(PXWallpaperSuggestionView *)self currentImageIdentifier];
      objc_initWeak(location, self);
      v12 = [(id)objc_opt_class() sharedWorkQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke_2;
      block[3] = &unk_1E5DCCBD8;
      v16[1] = v11;
      objc_copyWeak(v16, location);
      id v15 = v10;
      id v13 = v10;
      dispatch_async(v12, block);

      objc_destroyWeak(v16);
      objc_destroyWeak(location);
    }
  }
}

void __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) imageRequester];
  [v2 contentsRect];
  objc_msgSend(*(id *)(a1 + 32), "setContentsRect:");
}

void __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained currentImageIdentifier];

  if (v2 == v5)
  {
    objc_copyWeak(&v6, v3);
    *(id *)(a1 + 32);
    px_dispatch_on_main_queue();
  }
}

void __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setImage:v1];
}

- (void)_resetImageRequester
{
  [(PXWallpaperSuggestionView *)self setImageRequester:0];
  [(PXWallpaperSuggestionView *)self setCurrentImageIdentifier:0];
}

- (void)setImageRequester:(id)a3
{
  uint64_t v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  id v8 = v5;
  if (imageRequester != v5)
  {
    [(PXImageRequester *)imageRequester unregisterChangeObserver:self context:PXImageRequesterObserverContext_132703];
    objc_storeStrong((id *)&self->_imageRequester, a3);
    [(PXImageRequester *)v8 registerChangeObserver:self context:PXImageRequesterObserverContext_132703];
    v7 = [(PXImageRequester *)v8 image];
    [(PXWallpaperSuggestionView *)self setImage:v7];

    [(PXImageRequester *)v8 contentsRect];
    -[PXWallpaperSuggestionView setContentsRect:](self, "setContentsRect:");
  }
}

- (void)setAsset:(id)a3
{
  uint64_t v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    [(PXWallpaperSuggestionView *)self _resetImageRequester];
    uint64_t v5 = v6;
    if (v6)
    {
      [(PXWallpaperSuggestionView *)self setNeedsLayout];
      uint64_t v5 = v6;
    }
  }
}

- (BOOL)_isPortrait
{
  uint64_t v2 = [(PXWallpaperSuggestionView *)self window];
  v3 = [v2 windowScene];
  uint64_t v4 = [v3 interfaceOrientation];

  return (unint64_t)(v4 - 1) < 2;
}

- (void)layoutSubviews
{
  [(PXWallpaperSuggestionView *)self bounds];
  double v4 = v3;
  uint64_t v5 = [(PXWallpaperSuggestionView *)self traitCollection];
  [v5 displayScale];
  if (v6 == 0.0)
  {
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
  }
  uint64_t v8 = [(PXWallpaperSuggestionView *)self asset];
  if (v8)
  {
    v9 = [(PXWallpaperSuggestionView *)self imageRequester];

    if (!v9)
    {
      v10 = [PXImageRequester alloc];
      v11 = [(PXWallpaperSuggestionView *)self mediaProvider];
      v12 = [(PXImageRequester *)v10 initWithMediaProvider:v11 asset:v8];

      [(PXWallpaperSuggestionView *)self setImageRequester:v12];
    }
    [(PXWallpaperSuggestionView *)self imageRequester];
    [(id)objc_claimAutoreleasedReturnValue() contentSize];
    PXSizeApproximatelyEqualToSize();
  }
  [(PXWallpaperSuggestionView *)self _resetImageRequester];
  if ([(PXWallpaperSuggestionView *)self needsRoundedCorner])
  {
    id v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v14 = [v13 traitCollection];
    [v14 displayCornerRadius];
    double v16 = v15;
    [v13 bounds];
    double v18 = v16 * (v4 / v17);

    double v19 = 4.0;
    if (v18 >= 4.0) {
      double v19 = v18;
    }
    [(PXWallpaperSuggestionView *)self _setContinuousCornerRadius:v19];
  }
  [(UIImageView *)self->_overlayView setHidden:!self->_showClockOverlay];
  [(PXWallpaperSuggestionView *)self bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [(PXWallpaperSuggestionView *)self overlayView];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  if ([(PXWallpaperSuggestionView *)self _isPortrait]) {
    [(PXWallpaperSuggestionView *)self portraitOverlay];
  }
  else {
  v29 = [(PXWallpaperSuggestionView *)self landscapeOverlay];
  }
  v30 = [(PXWallpaperSuggestionView *)self overlayView];
  [v30 setImage:v29];
}

void __43__PXWallpaperSuggestionView_layoutSubviews__block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setDesiredContentsRect:", a1[6], a1[7], a1[8], a1[9]);
  objc_msgSend(v5, "setCropRect:", a1[6], a1[7], a1[8], a1[9]);
  objc_msgSend(v5, "setViewportSize:", a1[10], a1[11]);
  [v5 setScale:a1[12]];
}

- (PXWallpaperSuggestionView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)PXWallpaperSuggestionView;
  double v3 = -[PXWallpaperSuggestionView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [(PXWallpaperSuggestionView *)v3 setBackgroundColor:v4];

    [(PXWallpaperSuggestionView *)v3 setContentMode:2];
    [(PXWallpaperSuggestionView *)v3 setAccessibilityIgnoresInvertColors:1];
    id v5 = [(PXWallpaperSuggestionView *)v3 layer];
    [v5 setMasksToBounds:1];

    v3->_needsRoundedCorner = 1;
    v3->_showClockOverladouble y = 1;
    double v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    uint64_t v7 = +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:v6];
    mediaProvider = v3->_mediaProvider;
    v3->_mediaProvider = (PXUIMediaProvider *)v7;

    v3->_classificationMode = 0;
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    overlayView = v3->_overlayView;
    v3->_overlayView = (UIImageView *)v9;

    [(UIImageView *)v3->_overlayView setContentMode:2];
    uint64_t v11 = *MEMORY[0x1E4F3A340];
    v12 = [(UIImageView *)v3->_overlayView layer];
    [v12 setMinificationFilter:v11];

    objc_initWeak(&location, v3);
    id v13 = objc_opt_class();
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    double v17 = __43__PXWallpaperSuggestionView_initWithFrame___block_invoke;
    double v18 = &unk_1E5DBD8B0;
    objc_copyWeak(&v19, &location);
    [v13 requestSharedOverlayImageWithCompletionBlock:&v15];
    -[PXWallpaperSuggestionView addSubview:](v3, "addSubview:", v3->_overlayView, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__PXWallpaperSuggestionView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v5;
  v6;
  px_dispatch_on_main_queue();
}

void __43__PXWallpaperSuggestionView_initWithFrame___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPortraitOverlay:v2];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = objc_loadWeakRetained(v3);
  [v6 setLandscapeOverlay:v5];

  id v7 = objc_loadWeakRetained(v3);
  [v7 setNeedsLayout];
}

+ (void)requestSharedOverlayImageWithCompletionBlock:(id)a3
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

void __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke(uint64_t a1)
{
  if (requestSharedOverlayImageWithCompletionBlock__isLoadingStarted)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    if (v2)
    {
      if (requestSharedOverlayImageWithCompletionBlock__isLoadingFinished == 1)
      {
        id v3 = (void (*)(void))v2[2];
        v3();
      }
      else
      {
        objc_super v21 = (void *)requestSharedOverlayImageWithCompletionBlock__completionBlocks;
        id v23 = (id)[v2 copy];
        double v22 = _Block_copy(v23);
        [v21 addObject:v22];
      }
    }
  }
  else
  {
    requestSharedOverlayImageWithCompletionBlock__isLoadingStarted = 1;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = (void *)requestSharedOverlayImageWithCompletionBlock__completionBlocks;
    requestSharedOverlayImageWithCompletionBlock__completionBlocks = (uint64_t)v4;

    id v6 = *(void **)(a1 + 32);
    if (v6)
    {
      id v7 = (void *)requestSharedOverlayImageWithCompletionBlock__completionBlocks;
      uint64_t v8 = (void *)[v6 copy];
      uint64_t v9 = _Block_copy(v8);
      [v7 addObject:v9];
    }
    v10 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    BOOL v11 = [v10 userInterfaceIdiom] == 1;

    v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 bounds];
    uint64_t v14 = v13;
    uint64_t v16 = v15;

    double v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    uint64_t v19 = v18;

    double v20 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke_2;
    block[3] = &__block_descriptor_57_e5_v8__0l;
    void block[4] = v14;
    block[5] = v16;
    BOOL v25 = v11;
    block[6] = v19;
    dispatch_async(v20, block);
  }
}

void __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = *(double *)(a1 + 32);
  double v1 = *(double *)(a1 + 40);
  if (v1 >= v2) {
    double v3 = *(double *)(a1 + 32);
  }
  else {
    double v3 = *(double *)(a1 + 40);
  }
  if (v1 < v2) {
    double v1 = *(double *)(a1 + 32);
  }
  double v4 = 2.0;
  if (!*(unsigned char *)(a1 + 56)) {
    double v4 = 1.5;
  }
  double v5 = *(double *)(a1 + 48);
  double v6 = round(v5 * (v3 / v4)) / v5;
  double v7 = round(v5 * (v1 / v4)) / v5;
  uint64_t v8 = (void *)MEMORY[0x1AD10CB00]();
  uint64_t v9 = SOFT_LINKED_SBSUIWallpaperGetOverlay(14523, v6);
  v10 = (void *)requestSharedOverlayImageWithCompletionBlock__portraitOverlay;
  requestSharedOverlayImageWithCompletionBlock__portraitOverladouble y = v9;

  uint64_t v11 = SOFT_LINKED_SBSUIWallpaperGetOverlay(14651, v7);
  v12 = (void *)requestSharedOverlayImageWithCompletionBlock__landscapeOverlay;
  requestSharedOverlayImageWithCompletionBlock__landscapeOverladouble y = v11;

  if (!requestSharedOverlayImageWithCompletionBlock__portraitOverlay)
  {
    uint64_t v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134217984;
      double v16 = v6;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "SB SPI returns nil portrait overlay image (requested width: %.3f)", (uint8_t *)&v15, 0xCu);
    }
  }
  if (!requestSharedOverlayImageWithCompletionBlock__landscapeOverlay)
  {
    uint64_t v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134217984;
      double v16 = v7;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "SB SPI returns nil landscape overlay image (requested width: %.3f)", (uint8_t *)&v15, 0xCu);
    }
  }
  px_dispatch_on_main_queue();
}

void __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke_233()
{
  requestSharedOverlayImageWithCompletionBlock__isLoadingFinished = 1;
  [(id)requestSharedOverlayImageWithCompletionBlock__completionBlocks enumerateObjectsUsingBlock:&__block_literal_global_239_132731];
  v0 = (void *)requestSharedOverlayImageWithCompletionBlock__completionBlocks;
  requestSharedOverlayImageWithCompletionBlock__completionBlocks = 0;
}

uint64_t __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke_2_236(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, requestSharedOverlayImageWithCompletionBlock__portraitOverlay, requestSharedOverlayImageWithCompletionBlock__landscapeOverlay);
}

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken_132744 != -1) {
    dispatch_once(&sharedWorkQueue_onceToken_132744, &__block_literal_global_132745);
  }
  double v2 = (void *)sharedWorkQueue_sharedWorkQueue_132746;
  return v2;
}

void __44__PXWallpaperSuggestionView_sharedWorkQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.wallpaperPreview", attr);
  double v2 = (void *)sharedWorkQueue_sharedWorkQueue_132746;
  sharedWorkQueue_sharedWorkQueue_132746 = (uint64_t)v1;
}

@end