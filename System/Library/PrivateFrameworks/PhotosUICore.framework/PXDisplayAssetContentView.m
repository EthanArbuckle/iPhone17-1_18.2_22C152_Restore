@interface PXDisplayAssetContentView
+ (CGRect)preferredContentsRectForAsset:(id)a3 targetSize:(CGSize)a4;
+ (PXReusableObjectPool)viewPool;
+ (id)checkOutViewForAsset:(id)a3;
+ (id)checkOutViewForAsset:(id)a3 withPlaybackStyle:(int64_t)a4;
+ (void)checkInView:(id)a3;
- (BOOL)canDisplayLoadingIndicator;
- (BOOL)disableImageRequestsOnResize;
- (BOOL)isAnimatedContentEnabled;
- (BOOL)isDisplayingFullQualityContent;
- (BOOL)toneMapVideoToStandardDynamicRange;
- (CGRect)contentBounds;
- (CGRect)contentsRect;
- (CGSize)targetSize;
- (NSArray)placeholderImageFilters;
- (NSError)error;
- (NSError)latestError;
- (OS_os_log)log;
- (PXDisplayAsset)asset;
- (PXDisplayAssetContentView)initWithFrame:(CGRect)a3;
- (PXDisplayAssetContentViewDelegate)delegate;
- (PXDisplayAssetViewModel)viewModel;
- (PXDisplayScreenDynamicRangeMonitor)screenDynamicRangeMonitor;
- (PXImageRequester)imageRequester;
- (PXLoadingFailureBadgeView)failureView;
- (PXRoundProgressView)progressView;
- (PXUIMediaProvider)mediaProvider;
- (UIImage)image;
- (UIView)contentView;
- (double)imageProgress;
- (double)loadingProgress;
- (double)placeholderTransitionDuration;
- (int64_t)effectivePreferredImageDynamicRange;
- (int64_t)playbackStyle;
- (int64_t)preferredImageDynamicRange;
- (int64_t)requestID;
- (void)_invalidateError;
- (void)_invalidateViewModelProperties;
- (void)_loadContentView;
- (void)_resetPreferredImageDynamicRange;
- (void)_startHeadroomMonitoringIfPossible;
- (void)_stopHeadroomMonitoring;
- (void)_updateEffectiveImageDynamicRange;
- (void)_updateError;
- (void)_updateFailureView;
- (void)_updateIfNeeded;
- (void)_updateProgressView;
- (void)_updateTargetSize;
- (void)_updateViewModelProperties;
- (void)becomeReusable;
- (void)didMoveToWindow;
- (void)effectivePreferredImageDynamicRangeDidChange;
- (void)handleError:(id)a3;
- (void)invalidateLoadingProgress;
- (void)isDisplayingFullQualityContentDidChange;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)preferredImageDynamicRangeDidChange;
- (void)setAnimatedContentEnabled:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setCanDisplayLoadingIndicator:(BOOL)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableImageRequestsOnResize:(BOOL)a3;
- (void)setEffectivePreferredImageDynamicRange:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setFailureView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageProgress:(double)a3;
- (void)setImageRequester:(id)a3;
- (void)setIsDisplayingFullQualityContent:(BOOL)a3;
- (void)setLatestError:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)setNeedsLayout;
- (void)setNeedsUpdateContent;
- (void)setPlaceholderImageFilters:(id)a3;
- (void)setPlaceholderTransitionDuration:(double)a3;
- (void)setPreferredImageDynamicRange:(int64_t)a3;
- (void)setProgressView:(id)a3;
- (void)setRequestID:(int64_t)a3;
- (void)setScreenDynamicRangeMonitor:(id)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setToneMapVideoToStandardDynamicRange:(BOOL)a3;
- (void)setViewModel:(id)a3;
- (void)updateContent;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PXDisplayAssetContentView

PXDisplayAssetImageContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_2()
{
  v0 = objc_alloc_init(PXDisplayAssetImageContentView);
  return v0;
}

- (PXDisplayAssetContentView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXDisplayAssetContentView;
  v3 = -[PXDisplayAssetContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PXDisplayAssetContentView *)v3 _resetPreferredImageDynamicRange];
    v5 = [(PXDisplayAssetContentView *)v4 contentView];
    [(PXDisplayAssetContentView *)v4 addSubview:v5];

    [(PXDisplayAssetContentView *)v4 _updateTargetSize];
    [(PXDisplayAssetContentView *)v4 _updateProgressView];
    [(PXDisplayAssetContentView *)v4 setAccessibilityIgnoresInvertColors:1];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v4 selector:sel__applicationDidEnterBackground name:*MEMORY[0x1E4FB2640] object:0];
  }
  return v4;
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  if (self->_preferredImageDynamicRange != a3)
  {
    self->_preferredImageDynamicRange = a3;
    [(PXDisplayAssetContentView *)self preferredImageDynamicRangeDidChange];
  }
}

- (int64_t)effectivePreferredImageDynamicRange
{
  return self->_effectivePreferredImageDynamicRange;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetContentView;
  [(PXDisplayAssetContentView *)&v3 didMoveToWindow];
  [(PXDisplayAssetContentView *)self _updateTargetSize];
  [(PXDisplayAssetContentView *)self _startHeadroomMonitoringIfPossible];
}

- (void)_updateTargetSize
{
  objc_super v3 = [(PXDisplayAssetContentView *)self window];
  v4 = [v3 screen];
  [v4 scale];
  double v6 = v5;

  if (v6 != 0.0)
  {
    [(PXDisplayAssetContentView *)self bounds];
    PXSizeScale();
  }
}

- (void)setTargetSize:(CGSize)a3
{
  if (a3.width != self->_targetSize.width || a3.height != self->_targetSize.height)
  {
    self->_targetSize = a3;
    [(PXDisplayAssetContentView *)self setNeedsUpdateContent];
  }
}

- (void)_updateProgressView
{
}

- (PXRoundProgressView)progressView
{
  return self->_progressView;
}

- (double)imageProgress
{
  return self->_imageProgress;
}

- (BOOL)canDisplayLoadingIndicator
{
  return self->_canDisplayLoadingIndicator;
}

- (void)_resetPreferredImageDynamicRange
{
}

uint64_t __37__PXDisplayAssetContentView_viewPool__block_invoke()
{
  id v0 = objc_alloc_init((Class)off_1E5DA8338);
  v1 = (void *)viewPool_pool;
  viewPool_pool = (uint64_t)v0;

  [(id)viewPool_pool registerReusableObjectForReuseIdentifier:0 creationHandler:&__block_literal_global_193_89181];
  [(id)viewPool_pool registerReusableObjectForReuseIdentifier:4 creationHandler:&__block_literal_global_196];
  [(id)viewPool_pool registerReusableObjectForReuseIdentifier:1 creationHandler:&__block_literal_global_199];
  [(id)viewPool_pool registerReusableObjectForReuseIdentifier:2 creationHandler:&__block_literal_global_202_89182];
  v2 = (void *)viewPool_pool;
  return [v2 registerReusableObjectForReuseIdentifier:3 creationHandler:&__block_literal_global_204_89183];
}

+ (id)checkOutViewForAsset:(id)a3 withPlaybackStyle:(int64_t)a4
{
  if ((unint64_t)(a4 - 2) > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1AB35AC40[a4 - 2];
  }
  id v6 = a3;
  v7 = [a1 viewPool];
  objc_super v8 = [v7 checkOutReusableObjectWithReuseIdentifier:v5];

  [v8 setAsset:v6];
  return v8;
}

- (void)setPlaceholderTransitionDuration:(double)a3
{
  if (self->_placeholderTransitionDuration != a3)
  {
    self->_placeholderTransitionDuration = a3;
    [(PXDisplayAssetContentView *)self placeholderTransitionDurationDidChange];
  }
}

- (void)setMediaProvider:(id)a3
{
  uint64_t v5 = (PXUIMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PXDisplayAssetContentView *)self setNeedsUpdateContent];
    uint64_t v5 = v6;
  }
}

- (void)setContentMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetContentView;
  [(PXDisplayAssetContentView *)&v4 setContentMode:a3];
  [(PXDisplayAssetContentView *)self contentModeDidChange];
}

- (void)setCanDisplayLoadingIndicator:(BOOL)a3
{
  self->_canDisplayLoadingIndicator = a3;
}

- (void)setAsset:(id)a3
{
  uint64_t v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    [(PXDisplayAssetContentView *)self setNeedsUpdateContent];
    [(PXDisplayAssetContentView *)self setLatestError:0];
    uint64_t v5 = v6;
  }
}

- (void)setNeedsUpdateContent
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
      id v6 = [NSString stringWithUTF8String:"-[PXDisplayAssetContentView setNeedsUpdateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXDisplayAssetContentView.m", 348, @"invalidating %lu after it already has been updated", 1);

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
    [(PXDisplayAssetContentView *)self setNeedsLayout];
  }
}

- (void)setNeedsLayout
{
  v2.receiver = self;
  v2.super_class = (Class)PXDisplayAssetContentView;
  [(PXDisplayAssetContentView *)&v2 setNeedsLayout];
}

- (void)setLatestError:(id)a3
{
  v7 = (NSError *)a3;
  uint64_t v5 = self->_latestError;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSError *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_latestError, a3);
      [(PXDisplayAssetContentView *)self _invalidateError];
    }
  }
}

+ (PXReusableObjectPool)viewPool
{
  if (viewPool_onceToken != -1) {
    dispatch_once(&viewPool_onceToken, &__block_literal_global_89178);
  }
  objc_super v2 = (void *)viewPool_pool;
  return (PXReusableObjectPool *)v2;
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetContentView;
  [(PXDisplayAssetContentView *)&v4 willMoveToWindow:a3];
  [(PXDisplayAssetContentView *)self _stopHeadroomMonitoring];
}

- (void)_startHeadroomMonitoringIfPossible
{
  objc_super v3 = [(PXDisplayAssetContentView *)self window];

  if (v3)
  {
    uint64_t v4 = [(PXDisplayAssetContentView *)self screenDynamicRangeMonitor];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      char v6 = [(PXDisplayAssetContentView *)self screenDynamicRangeMonitor];
      char v7 = [v6 isMonitoring];

      if ((v7 & 1) == 0)
      {
        objc_initWeak(&location, self);
        objc_super v8 = [(PXDisplayAssetContentView *)self screenDynamicRangeMonitor];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __63__PXDisplayAssetContentView__startHeadroomMonitoringIfPossible__block_invoke;
        v9[3] = &unk_1E5DB8570;
        objc_copyWeak(&v10, &location);
        [v8 startMonitoringWithScreenProvider:v9];

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_stopHeadroomMonitoring
{
  objc_super v3 = [(PXDisplayAssetContentView *)self screenDynamicRangeMonitor];

  if (v3)
  {
    uint64_t v4 = [(PXDisplayAssetContentView *)self screenDynamicRangeMonitor];
    [v4 stopMonitoring];

    [(PXDisplayAssetContentView *)self setScreenDynamicRangeMonitor:0];
  }
}

- (PXDisplayScreenDynamicRangeMonitor)screenDynamicRangeMonitor
{
  return self->_screenDynamicRangeMonitor;
}

uint64_t __58__PXDisplayAssetContentView_observable_didChange_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if ((v2 & 0x80) != 0)
  {
    objc_super v3 = [*(id *)(a1 + 32) imageRequester];
    [v3 contentsRect];
    objc_msgSend(*(id *)(a1 + 32), "setContentsRect:");

    uint64_t v2 = *(void *)(a1 + 40);
  }
  if ((v2 & 0x1008) != 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) imageRequester];
    char v5 = [v4 hasFullQuality];
    double v6 = 1.0;
    if ((v5 & 1) == 0) {
      objc_msgSend(v4, "loadingProgress", 1.0);
    }
    [*(id *)(a1 + 32) setImageProgress:v6];

    uint64_t v2 = *(void *)(a1 + 40);
  }
  if ((v2 & 0x2000) != 0)
  {
    char v7 = *(void **)(a1 + 32);
    objc_super v8 = [v7 imageRequester];
    v9 = [v8 loadingError];
    [v7 handleError:v9];

    uint64_t v2 = *(void *)(a1 + 40);
  }
  if ((v2 & 4) != 0)
  {
    id v10 = [*(id *)(a1 + 32) imageRequester];
    v11 = [v10 image];
    [*(id *)(a1 + 32) setImage:v11];

    uint64_t v2 = *(void *)(a1 + 40);
  }
  v12 = *(void **)(a1 + 32);
  return [v12 imageRequesterDidChange:v2];
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (void)setImage:(id)a3
{
  char v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [(PXDisplayAssetContentView *)self imageDidChange];
    double v6 = [(PXDisplayAssetContentView *)self delegate];
    [v6 displayAssetContentViewDidChangeImage:self];

    char v5 = v7;
  }
}

- (UIImage)image
{
  return self->_image;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXImageRequesterObserverContext_89145 == a5) {
    px_dispatch_on_main_queue();
  }
  if ((void *)ViewModelObservationContext_89146 == a5)
  {
    [(PXDisplayAssetContentView *)self viewModelDidChange:a4];
  }
  else
  {
    if ((void *)PXDisplayScreenDynamicRangeObservationContext != a5)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXDisplayAssetContentView.m" lineNumber:333 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (a4) {
      [(PXDisplayAssetContentView *)self _updateEffectiveImageDynamicRange];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_screenDynamicRangeMonitor, 0);
  objc_storeStrong((id *)&self->_failureView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_latestError, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_placeholderImageFilters, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (int64_t)requestID
{
  return self->_requestID;
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

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFailureView:(id)a3
{
}

- (PXLoadingFailureBadgeView)failureView
{
  return self->_failureView;
}

- (NSError)latestError
{
  return self->_latestError;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setDelegate:(id)a3
{
}

- (PXDisplayAssetContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXDisplayAssetContentViewDelegate *)WeakRetained;
}

- (PXDisplayAssetViewModel)viewModel
{
  return self->_viewModel;
}

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (BOOL)toneMapVideoToStandardDynamicRange
{
  return self->_toneMapVideoToStandardDynamicRange;
}

- (BOOL)isAnimatedContentEnabled
{
  return self->_animatedContentEnabled;
}

- (NSError)error
{
  return self->_error;
}

- (void)setDisableImageRequestsOnResize:(BOOL)a3
{
  self->_disableImageRequestsOnResize = a3;
}

- (BOOL)disableImageRequestsOnResize
{
  return self->_disableImageRequestsOnResize;
}

- (void)setIsDisplayingFullQualityContent:(BOOL)a3
{
  self->_isDisplayingFullQualityContent = a3;
}

- (BOOL)isDisplayingFullQualityContent
{
  return self->_isDisplayingFullQualityContent;
}

- (double)placeholderTransitionDuration
{
  return self->_placeholderTransitionDuration;
}

- (NSArray)placeholderImageFilters
{
  return self->_placeholderImageFilters;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

id __63__PXDisplayAssetContentView__startHeadroomMonitoringIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained window];
  objc_super v3 = [v2 screen];

  return v3;
}

- (void)_updateEffectiveImageDynamicRange
{
  objc_super v3 = [(PXDisplayAssetContentView *)self screenDynamicRangeMonitor];
  int v4 = [v3 screenSupportsHDR];

  if (v4) {
    int64_t v5 = [(PXDisplayAssetContentView *)self preferredImageDynamicRange];
  }
  else {
    int64_t v5 = 0;
  }
  [(PXDisplayAssetContentView *)self setEffectivePreferredImageDynamicRange:v5];
}

- (void)effectivePreferredImageDynamicRangeDidChange
{
  [(PXDisplayAssetContentView *)self setNeedsUpdateContent];
  id v3 = [(PXDisplayAssetContentView *)self delegate];
  objc_msgSend(v3, "displayAssetContentView:didChangeEffectivePreferredImageDynamicRange:", self, -[PXDisplayAssetContentView effectivePreferredImageDynamicRange](self, "effectivePreferredImageDynamicRange"));
}

- (void)preferredImageDynamicRangeDidChange
{
}

- (void)_loadContentView
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  int64_t v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDisplayAssetContentView.m", 713, @"Method %s is a responsibility of subclass %@", "-[PXDisplayAssetContentView _loadContentView]", v6 object file lineNumber description];

  abort();
}

- (void)setProgressView:(id)a3
{
  int64_t v5 = (PXRoundProgressView *)a3;
  progressView = self->_progressView;
  if (progressView != v5)
  {
    char v7 = v5;
    [(PXRoundProgressView *)progressView removeFromSuperview];
    objc_storeStrong((id *)&self->_progressView, a3);
    [(PXDisplayAssetContentView *)self addSubview:self->_progressView];
    [(PXDisplayAssetContentView *)self setNeedsLayout];
    int64_t v5 = v7;
  }
}

- (void)_updateFailureView
{
  if (![(PXDisplayAssetContentView *)self canDisplayLoadingIndicator])
  {
    int v4 = [(PXDisplayAssetContentView *)self failureView];
    goto LABEL_7;
  }
  id v3 = [(PXDisplayAssetContentView *)self error];

  int v4 = [(PXDisplayAssetContentView *)self failureView];
  if (!v3)
  {
LABEL_7:
    id v6 = v4;
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  if (!v4)
  {
    +[PXLoadingFailureBadgeView sizeForSizeClass:1];
    PXRectWithOriginAndSize();
  }
  id v6 = v4;
  uint64_t v5 = 0;
LABEL_8:
  [v4 setHidden:v5];
}

- (void)_updateIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = [NSString stringWithUTF8String:"-[PXDisplayAssetContentView _updateIfNeeded]"];
      [v8 handleFailureInFunction:v9, @"PXDisplayAssetContentView.m", 638, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXDisplayAssetContentView *)self updateContent];
      if (!p_updateFlags->isPerformingUpdate)
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        v16 = [NSString stringWithUTF8String:"-[PXDisplayAssetContentView _updateIfNeeded]"];
        [v15 handleFailureInFunction:v16, @"PXDisplayAssetContentView.m", 642, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXDisplayAssetContentView *)self _updateProgressView];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = [NSString stringWithUTF8String:"-[PXDisplayAssetContentView _updateIfNeeded]"];
      [v10 handleFailureInFunction:v11, @"PXDisplayAssetContentView.m", 645, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXDisplayAssetContentView *)self _updateError];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = [NSString stringWithUTF8String:"-[PXDisplayAssetContentView _updateIfNeeded]"];
      [v12 handleFailureInFunction:v13, @"PXDisplayAssetContentView.m", 648, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXDisplayAssetContentView *)self _updateViewModelProperties];
      unint64_t v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[PXDisplayAssetContentView _updateIfNeeded]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXDisplayAssetContentView.m", 652, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
}

- (void)_updateViewModelProperties
{
  id v3 = [(PXDisplayAssetContentView *)self viewModel];
  id v4 = [v3 asset];
  id v5 = [(PXDisplayAssetContentView *)self asset];
  if (v4 == v5)
  {
  }
  else
  {
    unint64_t v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0) {
      goto LABEL_6;
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PXDisplayAssetContentView__updateViewModelProperties__block_invoke;
  v8[3] = &unk_1E5DD0EA0;
  v8[4] = self;
  [v3 performChanges:v8];
LABEL_6:
}

void __55__PXDisplayAssetContentView__updateViewModelProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 image];
  [v4 setCurrentImage:v5];

  objc_msgSend(v4, "setIsDisplayingFullQualityContent:", objc_msgSend(*(id *)(a1 + 32), "isDisplayingFullQualityContent"));
  [*(id *)(a1 + 32) loadingProgress];
  *(float *)&double v6 = v6;
  [v4 setLoadingProgress:v6];
  id v7 = [*(id *)(a1 + 32) error];
  [v4 setLoadingError:v7];
}

- (void)_invalidateViewModelProperties
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXDisplayAssetContentView _invalidateViewModelProperties]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXDisplayAssetContentView.m", 615, @"invalidating %lu after it already has been updated", 8);

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
    [(PXDisplayAssetContentView *)self setNeedsLayout];
  }
}

- (void)_updateError
{
  if ([(PXDisplayAssetContentView *)self isDisplayingFullQualityContent])
  {
    [(PXDisplayAssetContentView *)self setError:0];
  }
  else
  {
    id v3 = [(PXDisplayAssetContentView *)self latestError];
    [(PXDisplayAssetContentView *)self setError:v3];
  }
}

- (void)_invalidateError
{
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXDisplayAssetContentView _invalidateError]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXDisplayAssetContentView.m", 605, @"invalidating %lu after it already has been updated", 4);

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
    [(PXDisplayAssetContentView *)self setNeedsLayout];
  }
}

- (void)updateContent
{
  id v3 = [(PXDisplayAssetContentView *)self asset];
  uint64_t v4 = [(PXDisplayAssetContentView *)self mediaProvider];
  id v5 = (void *)v4;
  if (v3 && v4)
  {
    if (![(PXDisplayAssetContentView *)self disableImageRequestsOnResize]
      || ([(PXDisplayAssetContentView *)self imageRequester],
          double v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 hasFullQuality],
          v6,
          (v7 & 1) == 0))
    {
      objc_super v8 = [(PXDisplayAssetContentView *)self imageRequester];

      if (!v8)
      {
        id v9 = [[PXImageRequester alloc] initWithMediaProvider:v5 asset:v3];
        [(PXDisplayAssetContentView *)self setImageRequester:v9];
      }
      [(PXDisplayAssetContentView *)self contentView];
      [(id)objc_claimAutoreleasedReturnValue() bounds];
      PXSizeIsEmpty();
    }
  }
  else
  {
    [(PXDisplayAssetContentView *)self setImageRequester:0];
  }
}

void __42__PXDisplayAssetContentView_updateContent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setContentSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  objc_msgSend(v3, "setDesiredContentsRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v3, "setViewportSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  [v3 setScale:*(double *)(a1 + 96)];
  [v3 setPreferHDR:*(unsigned __int8 *)(a1 + 104)];
  if (*(unsigned char *)(a1 + 104)) {
    [v3 setTargetHDRHeadroom:0.0];
  }
}

- (void)isDisplayingFullQualityContentDidChange
{
  [(PXDisplayAssetContentView *)self _updateProgressView];
  [(PXDisplayAssetContentView *)self _invalidateError];
  [(PXDisplayAssetContentView *)self _invalidateViewModelProperties];
}

- (void)invalidateLoadingProgress
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      char v7 = [NSString stringWithUTF8String:"-[PXDisplayAssetContentView invalidateLoadingProgress]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXDisplayAssetContentView.m", 519, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate) {
    [(PXDisplayAssetContentView *)self setNeedsLayout];
  }
LABEL_7:
  [(PXDisplayAssetContentView *)self _invalidateViewModelProperties];
}

- (void)setScreenDynamicRangeMonitor:(id)a3
{
  id v5 = (PXDisplayScreenDynamicRangeMonitor *)a3;
  screenDynamicRangeMonitor = self->_screenDynamicRangeMonitor;
  if (screenDynamicRangeMonitor != v5)
  {
    char v7 = v5;
    [(PXDisplayScreenDynamicRangeMonitor *)screenDynamicRangeMonitor unregisterChangeObserver:self context:PXDisplayScreenDynamicRangeObservationContext];
    objc_storeStrong((id *)&self->_screenDynamicRangeMonitor, a3);
    [(PXDisplayScreenDynamicRangeMonitor *)self->_screenDynamicRangeMonitor registerChangeObserver:self context:PXDisplayScreenDynamicRangeObservationContext];
    id v5 = v7;
  }
}

- (void)setEffectivePreferredImageDynamicRange:(int64_t)a3
{
  if (self->_effectivePreferredImageDynamicRange != a3)
  {
    self->_effectivePreferredImageDynamicRange = a3;
    [(PXDisplayAssetContentView *)self effectivePreferredImageDynamicRangeDidChange];
  }
}

- (void)setToneMapVideoToStandardDynamicRange:(BOOL)a3
{
  if (self->_toneMapVideoToStandardDynamicRange != a3)
  {
    self->_toneMapVideoToStandardDynamicRange = a3;
    [(PXDisplayAssetContentView *)self toneMapVideoToStandardDynamicRangeDidChange];
  }
}

- (void)setImageProgress:(double)a3
{
}

- (void)setAnimatedContentEnabled:(BOOL)a3
{
  if (self->_animatedContentEnabled != a3)
  {
    self->_animatedContentEnabled = a3;
    [(PXDisplayAssetContentView *)self animatedContentEnabledDidChange];
  }
}

- (void)setError:(id)a3
{
  id v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    [(PXDisplayAssetContentView *)self _invalidateViewModelProperties];
    [(PXDisplayAssetContentView *)self _updateFailureView];
    [(PXDisplayAssetContentView *)self _updateProgressView];
    id v5 = v6;
  }
}

- (void)setRequestID:(int64_t)a3
{
  int64_t requestID = self->_requestID;
  if (requestID != a3)
  {
    if (requestID)
    {
      double v6 = [(PXDisplayAssetContentView *)self mediaProvider];
      [v6 cancelImageRequest:self->_requestID];
    }
    self->_int64_t requestID = a3;
  }
}

- (void)setImageRequester:(id)a3
{
  id v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  objc_super v8 = v5;
  if (imageRequester != v5)
  {
    [(PXImageRequester *)imageRequester unregisterChangeObserver:self context:PXImageRequesterObserverContext_89145];
    objc_storeStrong((id *)&self->_imageRequester, a3);
    [(PXImageRequester *)v8 registerChangeObserver:self context:PXImageRequesterObserverContext_89145];
    char v7 = [(PXImageRequester *)v8 image];
    [(PXDisplayAssetContentView *)self setImage:v7];

    [(PXImageRequester *)v8 contentsRect];
    -[PXDisplayAssetContentView setContentsRect:](self, "setContentsRect:");
    [(PXImageRequester *)v8 loadingProgress];
    -[PXDisplayAssetContentView setImageProgress:](self, "setImageProgress:");
    [(PXDisplayAssetContentView *)self imageRequesterDidChange:-1];
  }
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    CGFloat x = *(double *)off_1E5DAB010;
    CGFloat y = *((double *)off_1E5DAB010 + 1);
    CGFloat width = *((double *)off_1E5DAB010 + 2);
    CGFloat height = *((double *)off_1E5DAB010 + 3);
  }
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  if (!CGRectEqualToRect(v9, self->_contentsRect))
  {
    self->_contentsRect.origin.CGFloat x = x;
    self->_contentsRect.origin.CGFloat y = y;
    self->_contentsRect.size.CGFloat width = width;
    self->_contentsRect.size.CGFloat height = height;
    [(PXDisplayAssetContentView *)self contentsRectDidChange];
  }
}

- (void)setContentBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentBounds = &self->_contentBounds;
  if (!CGRectEqualToRect(a3, self->_contentBounds))
  {
    p_contentBounds->origin.CGFloat x = x;
    p_contentBounds->origin.CGFloat y = y;
    p_contentBounds->size.CGFloat width = width;
    p_contentBounds->size.CGFloat height = height;
    [(PXDisplayAssetContentView *)self _updateTargetSize];
    [(PXDisplayAssetContentView *)self setNeedsUpdateContent];
  }
}

- (void)setPlaceholderImageFilters:(id)a3
{
  objc_super v8 = (NSArray *)a3;
  uint64_t v4 = self->_placeholderImageFilters;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSArray *)[(NSArray *)v8 copy];
      placeholderImageFilters = self->_placeholderImageFilters;
      self->_placeholderImageFilters = v6;

      [(PXDisplayAssetContentView *)self placeholderImageFiltersDidChange];
    }
  }
}

- (void)becomeReusable
{
  [(PXDisplayAssetContentView *)self setAsset:0];
  [(PXDisplayAssetContentView *)self setMediaProvider:0];
  [(PXDisplayAssetContentView *)self setCanDisplayLoadingIndicator:0];
  [(PXDisplayAssetContentView *)self setHidden:0];
  [(PXDisplayAssetContentView *)self setLatestError:0];
  [(PXDisplayAssetContentView *)self setError:0];
  [(PXDisplayAssetContentView *)self setAnimatedContentEnabled:0];
  [(PXDisplayAssetContentView *)self setPlaceholderImageFilters:0];
  [(PXDisplayAssetContentView *)self _resetPreferredImageDynamicRange];
  [(PXDisplayAssetContentView *)self _updateIfNeeded];
  [(PXDisplayAssetContentView *)self _stopHeadroomMonitoring];
}

- (OS_os_log)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_220_89150);
  }
  uint64_t v2 = (void *)log_log;
  return (OS_os_log *)v2;
}

void __32__PXDisplayAssetContentView_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "PXDisplayAssetContentView");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;
}

- (void)handleError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(PXDisplayAssetContentView *)self setLatestError:v4];
    char v5 = [(PXDisplayAssetContentView *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412546;
      char v7 = self;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_error_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "%@ received error : %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)setViewModel:(id)a3
{
  char v5 = (PXDisplayAssetViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    char v7 = v5;
    [(PXDisplayAssetViewModel *)viewModel unregisterChangeObserver:self context:ViewModelObservationContext_89146];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PXDisplayAssetViewModel *)self->_viewModel registerChangeObserver:self context:ViewModelObservationContext_89146];
    [(PXDisplayAssetContentView *)self viewModelDidChange:-1];
    char v5 = v7;
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PXDisplayAssetContentView;
  [(PXDisplayAssetContentView *)&v19 layoutSubviews];
  [(PXDisplayAssetContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PXDisplayAssetContentView *)self contentView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PXDisplayAssetContentView setContentBounds:](self, "setContentBounds:", v4, v6, v8, v10);
  [(PXDisplayAssetContentView *)self _updateIfNeeded];
  +[PXRoundProgressView sizeForSizeClass:1];
  double v13 = v12;
  double v15 = v14;
  v20.origin.CGFloat x = v4;
  v20.origin.CGFloat y = v6;
  v20.size.CGFloat width = v8;
  v20.size.CGFloat height = v10;
  CGFloat v16 = CGRectGetMaxX(v20) - v13 + -8.0;
  v21.origin.CGFloat x = v4;
  v21.origin.CGFloat y = v6;
  v21.size.CGFloat width = v8;
  v21.size.CGFloat height = v10;
  CGFloat v17 = CGRectGetMaxY(v21) - v15 + -8.0;
  v18 = [(PXDisplayAssetContentView *)self progressView];
  objc_msgSend(v18, "setFrame:", v16, v17, v13, v15);

  PXRectGetCenter();
}

+ (CGRect)preferredContentsRectForAsset:(id)a3 targetSize:(CGSize)a4
{
  id v4 = a3;
  PXSizeGetAspectRatioWithDefault();
}

+ (void)checkInView:(id)a3
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

void __41__PXDisplayAssetContentView_checkInView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) viewPool];
  [v2 checkInReusableObject:*(void *)(a1 + 32)];
}

+ (id)checkOutViewForAsset:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend(a1, "checkOutViewForAsset:withPlaybackStyle:", v4, objc_msgSend(v4, "playbackStyle"));

  return v5;
}

PXDisplayAssetImageContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_6()
{
  os_log_t v0 = objc_alloc_init(PXDisplayAssetImageContentView);
  return v0;
}

PXDisplayAssetLoopingVideoContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_5()
{
  os_log_t v0 = objc_alloc_init(PXDisplayAssetLoopingVideoContentView);
  return v0;
}

PXDisplayAssetLoopingVideoContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_4()
{
  os_log_t v0 = objc_alloc_init(PXDisplayAssetLoopingVideoContentView);
  return v0;
}

PXDisplayAssetLivePhotoContentView *__37__PXDisplayAssetContentView_viewPool__block_invoke_3()
{
  os_log_t v0 = objc_alloc_init(PXDisplayAssetLivePhotoContentView);
  return v0;
}

@end