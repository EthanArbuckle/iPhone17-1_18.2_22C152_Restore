@interface PXDisplayAssetView
+ (CGRect)preferredContentsRectForAsset:(id)a3 targetSize:(CGSize)a4;
+ (NSLocale)currentLocaleForTesting;
+ (id)localizedTitleForAsset:(id)a3;
+ (void)setCurrentLocaleForTesting:(id)a3;
- (BOOL)allowsTextSelection;
- (BOOL)photosAssetDebugOverlayViewHasEffectivePreferredImageDynamicRange:(id)a3;
- (CGRect)imageFrame;
- (CGSize)viewportSize;
- (NSArray)audioIdentifiersToHighlight;
- (NSArray)humanActionIdentifiersToHighlight;
- (NSArray)personLocalIdentifiersToHighlight;
- (NSArray)sceneIdentifiersToHighlight;
- (NSArray)stringsToHighlight;
- (PUPhotosAssetDebugOverlayView)debugOverlayView;
- (PXDisplayAsset)asset;
- (PXDisplayAssetCombinedOverlayView)overlayView;
- (PXDisplayAssetContentView)contentView;
- (PXDisplayAssetView)initWithCoder:(id)a3;
- (PXDisplayAssetView)initWithFrame:(CGRect)a3;
- (PXDisplayAssetView)initWithFrame:(CGRect)a3 options:(unint64_t)a4;
- (PXDisplayAssetViewModel)viewModel;
- (PXUIMediaProvider)mediaProvider;
- (PXUpdater)updater;
- (UIImage)currentImage;
- (int64_t)photosAssetDebugOverlayViewEffectivePreferredImageDynamicRange:(id)a3;
- (int64_t)photosAssetDebugOverlayViewPreferredImageDynamicRange:(id)a3;
- (int64_t)preferredImageDynamicRange;
- (unint64_t)options;
- (void)_addDebugOverlayViewIfNeeded;
- (void)_commonPXDisplayAssetViewInit;
- (void)_invalidateContentView;
- (void)_invalidateContentViewLayout;
- (void)_invalidateContentViewProperties;
- (void)_invalidateDebugOverlayView;
- (void)_invalidateViewModelProperties;
- (void)_setNeedsUpdate;
- (void)_updateContentView;
- (void)_updateContentViewLayout;
- (void)_updateContentViewProperties;
- (void)_updateDebugOverlayView;
- (void)_updateViewModelProperties;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosAssetDebugOverlayView:(id)a3 didRequestPreferredImageDynamicRange:(int64_t)a4;
- (void)setAllowsTextSelection:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setAudioIdentifiersToHighlight:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setContentView:(id)a3;
- (void)setHumanActionIdentifiersToHighlight:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)setPersonLocalIdentifiersToHighlight:(id)a3;
- (void)setPreferredImageDynamicRange:(int64_t)a3;
- (void)setSceneIdentifiersToHighlight:(id)a3;
- (void)setStringsToHighlight:(id)a3;
- (void)setViewportSize:(CGSize)a3;
@end

@implementation PXDisplayAssetView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOverlayView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_audioIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_stringsToHighlight, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PUPhotosAssetDebugOverlayView)debugOverlayView
{
  return self->_debugOverlayView;
}

- (PXDisplayAssetContentView)contentView
{
  return self->_contentView;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXDisplayAssetCombinedOverlayView)overlayView
{
  return self->_overlayView;
}

- (PXDisplayAssetViewModel)viewModel
{
  return self->_viewModel;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)personLocalIdentifiersToHighlight
{
  return self->_personLocalIdentifiersToHighlight;
}

- (NSArray)humanActionIdentifiersToHighlight
{
  return self->_humanActionIdentifiersToHighlight;
}

- (NSArray)audioIdentifiersToHighlight
{
  return self->_audioIdentifiersToHighlight;
}

- (NSArray)sceneIdentifiersToHighlight
{
  return self->_sceneIdentifiersToHighlight;
}

- (NSArray)stringsToHighlight
{
  return self->_stringsToHighlight;
}

- (BOOL)allowsTextSelection
{
  return self->_allowsTextSelection;
}

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (int64_t)photosAssetDebugOverlayViewEffectivePreferredImageDynamicRange:(id)a3
{
  v3 = [(PXDisplayAssetView *)self contentView];
  int64_t v4 = _PUImageDynamicRangeFromPXImageDynamicRange([v3 effectivePreferredImageDynamicRange]);

  return v4;
}

- (BOOL)photosAssetDebugOverlayViewHasEffectivePreferredImageDynamicRange:(id)a3
{
  return 1;
}

- (int64_t)photosAssetDebugOverlayViewPreferredImageDynamicRange:(id)a3
{
  uint64_t v3 = [(PXDisplayAssetView *)self preferredImageDynamicRange];
  return _PUImageDynamicRangeFromPXImageDynamicRange(v3);
}

- (void)photosAssetDebugOverlayView:(id)a3 didRequestPreferredImageDynamicRange:(int64_t)a4
{
  if ((unint64_t)a4 >= 4) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = a4 - 1;
  }
  [(PXDisplayAssetView *)self setPreferredImageDynamicRange:v4];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)ViewModelObservationContext_286970 != a5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXDisplayAssetView.m" lineNumber:424 description:@"Code which should be unreachable has been reached"];

    abort();
  }
}

- (void)_updateDebugOverlayView
{
}

- (void)_invalidateDebugOverlayView
{
  id v2 = [(PXDisplayAssetView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDebugOverlayView];
}

- (void)_updateContentViewLayout
{
  [(PXDisplayAssetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(PXDisplayAssetView *)self contentMode];
  if (v11 == 1)
  {
    v12 = [(PXDisplayAssetView *)self asset];
    [v12 pixelWidth];
    [v12 pixelHeight];
    PXSizeGetAspectRatioWithDefault();
  }
  uint64_t v13 = v11;
  id v14 = [(PXDisplayAssetView *)self contentView];
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);
  [v14 setContentMode:v13];
}

- (void)_invalidateContentViewLayout
{
  id v2 = [(PXDisplayAssetView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateContentViewLayout];
}

- (void)_updateContentViewProperties
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = [(PXDisplayAssetView *)self contentView];
  double v4 = [(PXDisplayAssetView *)self viewModel];
  double v5 = [(PXDisplayAssetView *)self mediaProvider];
  if (!v5) {
    PXAssertGetLog();
  }
  [v3 setMediaProvider:v5];
  [v3 setAnimatedContentEnabled:1];
  [v3 setViewModel:v4];
  objc_msgSend(v3, "setPreferredImageDynamicRange:", -[PXDisplayAssetView preferredImageDynamicRange](self, "preferredImageDynamicRange"));
}

- (void)_invalidateContentViewProperties
{
  id v2 = [(PXDisplayAssetView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateContentViewProperties];
}

- (void)_updateContentView
{
  [(PXDisplayAssetView *)self setContentView:0];
  double v3 = [(PXDisplayAssetView *)self asset];
  if (v3)
  {
    id v6 = v3;
    if ([(PXDisplayAssetView *)self options]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [v6 playbackStyle];
    }
    double v5 = +[PXDisplayAssetContentView checkOutViewForAsset:v6 withPlaybackStyle:v4];
    [v5 setCanDisplayLoadingIndicator:0];
    [(PXDisplayAssetView *)self setContentView:v5];

    double v3 = v6;
  }
}

- (void)_invalidateContentView
{
  id v2 = [(PXDisplayAssetView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateContentView];
}

- (void)_updateViewModelProperties
{
  double v3 = [(PXDisplayAssetView *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PXDisplayAssetView__updateViewModelProperties__block_invoke;
  v4[3] = &unk_1E5DD0EA0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __48__PXDisplayAssetView__updateViewModelProperties__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 asset];
  [v4 setAsset:v5];

  objc_msgSend(v4, "setContentMode:", objc_msgSend(*(id *)(a1 + 32), "contentMode"));
  objc_msgSend(v4, "setAllowsTextSelection:", objc_msgSend(*(id *)(a1 + 32), "allowsTextSelection"));
  id v6 = [*(id *)(a1 + 32) stringsToHighlight];
  [v4 setStringsToHighlight:v6];

  double v7 = [*(id *)(a1 + 32) sceneIdentifiersToHighlight];
  [v4 setSceneIdentifiersToHighlight:v7];

  double v8 = [*(id *)(a1 + 32) audioIdentifiersToHighlight];
  [v4 setAudioIdentifiersToHighlight:v8];

  double v9 = [*(id *)(a1 + 32) humanActionIdentifiersToHighlight];
  [v4 setHumanActionIdentifiersToHighlight:v9];

  id v10 = [*(id *)(a1 + 32) personLocalIdentifiersToHighlight];
  [v4 setPersonLocalIdentifiersToHighlight:v10];
}

- (void)_invalidateViewModelProperties
{
  id v2 = [(PXDisplayAssetView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewModelProperties];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingLayout) {
    [(PXDisplayAssetView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  if (self->_isPerformingLayout)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXDisplayAssetView.m", 309, @"Invalid parameter not satisfying: %@", @"!_isPerformingLayout" object file lineNumber description];
  }
  self->_isPerformingLayout = 1;
  [(PXDisplayAssetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PXDisplayAssetView setViewportSize:](self, "setViewportSize:", v7, v9);
  uint64_t v11 = [(PXDisplayAssetView *)self overlayView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(PXDisplayAssetView *)self updater];
  [v12 updateIfNeeded];

  self->_isPerformingLayout = 0;
  [(PXDisplayAssetView *)self bounds];
  debugOverlayView = self->_debugOverlayView;
  -[PUPhotosAssetDebugOverlayView setFrame:](debugOverlayView, "setFrame:");
}

- (void)setViewportSize:(CGSize)a3
{
  if (a3.width != self->_viewportSize.width || a3.height != self->_viewportSize.height)
  {
    self->_viewportSize = a3;
    [(PXDisplayAssetView *)self _invalidateContentViewLayout];
  }
}

- (void)setContentView:(id)a3
{
  double v5 = (PXDisplayAssetContentView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    double v10 = v5;
    if (contentView)
    {
      +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:");
      [(PXDisplayAssetContentView *)*p_contentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    [(PXDisplayAssetContentView *)*p_contentView setDelegate:self];
    if (*p_contentView)
    {
      double v8 = [(PXDisplayAssetView *)self overlayView];
      double v9 = *p_contentView;
      if (v8) {
        [(PXDisplayAssetView *)self insertSubview:v9 belowSubview:v8];
      }
      else {
        [(PXDisplayAssetView *)self addSubview:v9];
      }
    }
    [(PXDisplayAssetView *)self _invalidateContentViewProperties];
    [(PXDisplayAssetView *)self _invalidateContentViewLayout];
    double v5 = v10;
  }
}

- (CGRect)imageFrame
{
  id v2 = [(PXDisplayAssetView *)self contentView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIImage)currentImage
{
  id v2 = [(PXDisplayAssetView *)self contentView];
  double v3 = [v2 currentImage];

  return (UIImage *)v3;
}

- (void)setPersonLocalIdentifiersToHighlight:(id)a3
{
  double v8 = (NSArray *)a3;
  double v4 = self->_personLocalIdentifiersToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSArray *)[(NSArray *)v8 copy];
      personLocalIdentifiersToHighlight = self->_personLocalIdentifiersToHighlight;
      self->_personLocalIdentifiersToHighlight = v6;

      [(PXDisplayAssetView *)self _invalidateViewModelProperties];
    }
  }
}

- (void)setHumanActionIdentifiersToHighlight:(id)a3
{
  double v8 = (NSArray *)a3;
  double v4 = self->_humanActionIdentifiersToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSArray *)[(NSArray *)v8 copy];
      humanActionIdentifiersToHighlight = self->_humanActionIdentifiersToHighlight;
      self->_humanActionIdentifiersToHighlight = v6;

      [(PXDisplayAssetView *)self _invalidateViewModelProperties];
    }
  }
}

- (void)setAudioIdentifiersToHighlight:(id)a3
{
  double v8 = (NSArray *)a3;
  double v4 = self->_audioIdentifiersToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSArray *)[(NSArray *)v8 copy];
      audioIdentifiersToHighlight = self->_audioIdentifiersToHighlight;
      self->_audioIdentifiersToHighlight = v6;

      [(PXDisplayAssetView *)self _invalidateViewModelProperties];
    }
  }
}

- (void)setSceneIdentifiersToHighlight:(id)a3
{
  double v8 = (NSArray *)a3;
  double v4 = self->_sceneIdentifiersToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSArray *)[(NSArray *)v8 copy];
      sceneIdentifiersToHighlight = self->_sceneIdentifiersToHighlight;
      self->_sceneIdentifiersToHighlight = v6;

      [(PXDisplayAssetView *)self _invalidateViewModelProperties];
    }
  }
}

- (void)setStringsToHighlight:(id)a3
{
  double v8 = (NSArray *)a3;
  double v4 = self->_stringsToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSArray *)[(NSArray *)v8 copy];
      stringsToHighlight = self->_stringsToHighlight;
      self->_stringsToHighlight = v6;

      [(PXDisplayAssetView *)self _invalidateViewModelProperties];
    }
  }
}

- (void)setAllowsTextSelection:(BOOL)a3
{
  if (self->_allowsTextSelection != a3)
  {
    self->_allowsTextSelection = a3;
    [(PXDisplayAssetView *)self _invalidateViewModelProperties];
  }
}

- (void)setContentMode:(int64_t)a3
{
  if ([(PXDisplayAssetView *)self contentMode] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXDisplayAssetView;
    [(PXDisplayAssetView *)&v5 setContentMode:a3];
    [(PXDisplayAssetView *)self _invalidateViewModelProperties];
    [(PXDisplayAssetView *)self _invalidateContentViewLayout];
  }
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  if (self->_preferredImageDynamicRange != a3)
  {
    self->_preferredImageDynamicRange = a3;
    objc_super v5 = [(PXDisplayAssetView *)self contentView];
    [v5 setPreferredImageDynamicRange:a3];

    [(PXDisplayAssetView *)self _invalidateDebugOverlayView];
  }
}

- (void)setMediaProvider:(id)a3
{
  double v7 = (PXUIMediaProvider *)a3;
  objc_super v5 = self->_mediaProvider;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXUIMediaProvider *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mediaProvider, a3);
      [(PXDisplayAssetView *)self _invalidateContentViewProperties];
    }
  }
}

- (void)setAsset:(id)a3
{
  objc_super v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    [(PXDisplayAssetView *)self _invalidateViewModelProperties];
    [(PXDisplayAssetView *)self _invalidateContentView];
    [(PXDisplayAssetView *)self _invalidateContentViewLayout];
    objc_super v5 = v6;
  }
}

- (void)_addDebugOverlayViewIfNeeded
{
  if (PUPhotosAssetViewShowDebugOverlayView() && !self->_debugOverlayView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F39968]);
    double v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    char v6 = (PUPhotosAssetDebugOverlayView *)[v3 initWithClientIdentifier:v5];
    debugOverlayView = self->_debugOverlayView;
    self->_debugOverlayView = v6;

    [(PUPhotosAssetDebugOverlayView *)self->_debugOverlayView setDelegate:self];
    [(PXDisplayAssetView *)self _updateDebugOverlayView];
    double v8 = self->_debugOverlayView;
    [(PXDisplayAssetView *)self addSubview:v8];
  }
}

- (void)dealloc
{
  id v3 = self->_contentView;
  if (v3)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    double v7 = __29__PXDisplayAssetView_dealloc__block_invoke;
    double v8 = &unk_1E5DD36F8;
    double v9 = v3;
    px_dispatch_on_main_queue();
  }

  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetView;
  [(PXDisplayAssetView *)&v4 dealloc];
}

uint64_t __29__PXDisplayAssetView_dealloc__block_invoke(uint64_t a1)
{
  return +[PXDisplayAssetContentView checkInView:*(void *)(a1 + 32)];
}

- (void)didAddSubview:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXDisplayAssetView;
  [(PXDisplayAssetView *)&v5 didAddSubview:v4];
  if (self->_debugOverlayView)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(PXDisplayAssetView *)self bringSubviewToFront:self->_debugOverlayView];
    }
  }
}

- (void)_commonPXDisplayAssetViewInit
{
  [(PXDisplayAssetView *)self setContentMode:1];
  self->_preferredImageDynamicRange = 0;
  id v3 = (PXUpdater *)[objc_alloc((Class)off_1E5DA9778) initWithTarget:self needsUpdateSelector:sel__setNeedsUpdate];
  updater = self->_updater;
  self->_updater = v3;

  [(PXUpdater *)self->_updater addUpdateSelector:sel__updateViewModelProperties];
  [(PXUpdater *)self->_updater addUpdateSelector:sel__updateContentView];
  [(PXUpdater *)self->_updater addUpdateSelector:sel__updateContentViewProperties];
  [(PXUpdater *)self->_updater addUpdateSelector:sel__updateContentViewLayout];
  [(PXUpdater *)self->_updater addUpdateSelector:sel__updateDebugOverlayView];
  objc_super v5 = objc_alloc_init(PXDisplayAssetViewModel);
  viewModel = self->_viewModel;
  self->_viewModel = v5;

  [(PXDisplayAssetViewModel *)self->_viewModel registerChangeObserver:self context:ViewModelObservationContext_286970];
  [(PXDisplayAssetView *)self _invalidateViewModelProperties];
  if (([(PXDisplayAssetView *)self options] & 1) == 0)
  {
    double v7 = [[PXDisplayAssetCombinedOverlayView alloc] initWithViewModel:self->_viewModel];
    overlayView = self->_overlayView;
    self->_overlayView = v7;

    [(PXDisplayAssetView *)self addSubview:self->_overlayView];
  }
  [(PXDisplayAssetView *)self _addDebugOverlayViewIfNeeded];
}

- (PXDisplayAssetView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXDisplayAssetView;
  id v3 = [(PXDisplayAssetView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(PXDisplayAssetView *)v3 _commonPXDisplayAssetViewInit];
  }
  return v4;
}

- (PXDisplayAssetView)initWithFrame:(CGRect)a3 options:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PXDisplayAssetView;
  objc_super v5 = -[PXDisplayAssetView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v6 = v5;
  if (v5)
  {
    v5->_options = a4;
    [(PXDisplayAssetView *)v5 _commonPXDisplayAssetViewInit];
  }
  return v6;
}

- (PXDisplayAssetView)initWithFrame:(CGRect)a3
{
  return -[PXDisplayAssetView initWithFrame:options:](self, "initWithFrame:options:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (void)setCurrentLocaleForTesting:(id)a3
{
}

+ (NSLocale)currentLocaleForTesting
{
  return (NSLocale *)(id)_currentLocaleForTesting;
}

+ (CGRect)preferredContentsRectForAsset:(id)a3 targetSize:(CGSize)a4
{
  +[PXDisplayAssetContentView preferredContentsRectForAsset:targetSize:](PXDisplayAssetContentView, "preferredContentsRectForAsset:targetSize:", a3, a4.width, a4.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (id)localizedTitleForAsset:(id)a3
{
  id v4 = a3;
  double v5 = [v4 localizedGeoDescription];
  if (!v5)
  {
    double v6 = [v4 localCreationDate];
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v7 setDateStyle:3];
      [v7 setTimeStyle:1];
      objc_super v8 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
      [v7 setTimeZone:v8];

      double v9 = [a1 currentLocaleForTesting];
      [v7 setLocale:v9];

      double v5 = [v7 stringFromDate:v6];
    }
    else
    {
      double v5 = 0;
    }
  }
  if (v5) {
    double v10 = v5;
  }
  else {
    double v10 = &stru_1F00B0030;
  }
  double v11 = v10;

  return v11;
}

@end