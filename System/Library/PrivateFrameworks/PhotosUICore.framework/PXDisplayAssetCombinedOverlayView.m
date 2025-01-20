@interface PXDisplayAssetCombinedOverlayView
- (BOOL)canShowLoadingProgress;
- (CGSize)viewportSize;
- (PXDisplayAsset)loadingAsset;
- (PXDisplayAssetCombinedOverlayView)initWithCoder:(id)a3;
- (PXDisplayAssetCombinedOverlayView)initWithFrame:(CGRect)a3;
- (PXDisplayAssetCombinedOverlayView)initWithViewModel:(id)a3;
- (PXDisplayAssetImageAnalysisOverlayView)imageAnalysisOverlayView;
- (PXDisplayAssetViewModel)viewModel;
- (PXLivePhotoBadgeView)livePhotoBadgeView;
- (PXLoadingFailureBadgeView)loadingFailureBadgeView;
- (PXRoundProgressView)loadingProgressBadgeView;
- (PXUpdater)updater;
- (void)_ensureImageAnalysisOverlayView;
- (void)_ensureLivePhotoBadgeView;
- (void)_ensureLoadingFailureBadgeView;
- (void)_ensureLoadingProgressBadgeView;
- (void)_invalidateCanShowLoadingProgress;
- (void)_invalidateImageAnalysisOverlay;
- (void)_invalidateLayout;
- (void)_invalidateLivePhotoBadge;
- (void)_invalidateLoadingFailureBadgeView;
- (void)_invalidateLoadingProgressBadgeView;
- (void)_loadingProgressDelayElapsed;
- (void)_setNeedsUpdate;
- (void)_updateCanShowLoadingProgress;
- (void)_updateImageAnalysisOverlay;
- (void)_updateLayout;
- (void)_updateLivePhotoBadge;
- (void)_updateLoadingFailureBadgeView;
- (void)_updateLoadingProgressBadgeView;
- (void)layoutSubviews;
- (void)livePhotoBadgeView:(id)a3 wantsPlayback:(BOOL)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCanShowLoadingProgress:(BOOL)a3;
- (void)setLoadingAsset:(id)a3;
- (void)setViewportSize:(CGSize)a3;
@end

@implementation PXDisplayAssetCombinedOverlayView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalysisOverlayView, 0);
  objc_storeStrong((id *)&self->_loadingAsset, 0);
  objc_storeStrong((id *)&self->_loadingProgressBadgeView, 0);
  objc_storeStrong((id *)&self->_loadingFailureBadgeView, 0);
  objc_storeStrong((id *)&self->_livePhotoBadgeView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PXDisplayAssetImageAnalysisOverlayView)imageAnalysisOverlayView
{
  return self->_imageAnalysisOverlayView;
}

- (void)setLoadingAsset:(id)a3
{
}

- (PXDisplayAsset)loadingAsset
{
  return self->_loadingAsset;
}

- (PXRoundProgressView)loadingProgressBadgeView
{
  return self->_loadingProgressBadgeView;
}

- (PXLoadingFailureBadgeView)loadingFailureBadgeView
{
  return self->_loadingFailureBadgeView;
}

- (PXLivePhotoBadgeView)livePhotoBadgeView
{
  return self->_livePhotoBadgeView;
}

- (BOOL)canShowLoadingProgress
{
  return self->_canShowLoadingProgress;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXDisplayAssetViewModel)viewModel
{
  return self->_viewModel;
}

- (void)livePhotoBadgeView:(id)a3 wantsPlayback:(BOOL)a4
{
  v5 = [(PXDisplayAssetCombinedOverlayView *)self viewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PXDisplayAssetCombinedOverlayView_livePhotoBadgeView_wantsPlayback___block_invoke;
  v6[3] = &__block_descriptor_33_e42_v16__0___PXMutableDisplayAssetViewModel__8l;
  BOOL v7 = a4;
  [v5 performChanges:v6];
}

uint64_t __70__PXDisplayAssetCombinedOverlayView_livePhotoBadgeView_wantsPlayback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsLivePhotoPlayback:*(unsigned __int8 *)(a1 + 32)];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v10 = a3;
  if ((void *)ViewModelObservationContext_133240 != a5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXDisplayAssetCombinedOverlayView.m" lineNumber:319 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (a4) {
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateCanShowLoadingProgress];
  }
  if ((a4 & 0xC) != 0) {
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateLayout];
  }
  if ((a4 & 2) != 0) {
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateLivePhotoBadge];
  }
  if ((a4 & 0x400) != 0) {
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateLoadingFailureBadgeView];
  }
  if ((a4 & 0x602) != 0) {
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateLoadingProgressBadgeView];
  }
  if (+[PXDisplayAssetImageAnalysisOverlayView changedImageAnalysisOverlayNeededForViewModelChange:a4])
  {
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateImageAnalysisOverlay];
  }
}

- (void)_updateLayout
{
  v3 = [(PXDisplayAssetCombinedOverlayView *)self viewModel];
  [(PXDisplayAssetCombinedOverlayView *)self bounds];
  if (!CGRectIsEmpty(v4))
  {
    [v3 assetAspectRatio];
    if ([v3 contentMode] == 1) {
      PXRectWithAspectRatioFittingRect();
    }
    PXRectWithAspectRatioFillingRect();
  }
}

void __50__PXDisplayAssetCombinedOverlayView__updateLayout__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  if (v11)
  {
    id v15 = v11;
    if (*(unsigned char *)(a1 + 72))
    {
      a3 = MEMORY[0x1AD10B740](a3, a4, a5, a6, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
      a4 = v12;
      a5 = v13;
      a6 = v14;
    }
    objc_msgSend(v15, "setFrame:", a3, a4, a5, a6);
    [*(id *)(a1 + 32) bringSubviewToFront:v15];
    id v11 = v15;
  }
}

void __50__PXDisplayAssetCombinedOverlayView__updateLayout__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGRect v4 = v3;
  if (v3)
  {
    double v14 = v3;
    char v5 = [v3 isHidden];
    CGRect v4 = v14;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v14, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      double v11 = *(double *)(v10 + 32);
      double v12 = *(double *)(v10 + 40);
      (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(v11, v12, v6, v8);
      v16.origin.x = v11;
      v16.origin.y = v12;
      v16.size.double width = v7;
      v16.size.double height = v9;
      CGFloat MaxX = CGRectGetMaxX(v16);
      CGRect v4 = v14;
      *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = MaxX + 10.0;
    }
  }
}

void __50__PXDisplayAssetCombinedOverlayView__updateLayout__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGRect v4 = v3;
  if (v3)
  {
    double v14 = v3;
    char v5 = [v3 isHidden];
    CGRect v4 = v14;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v14, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      CGFloat v11 = *(double *)(v10 + 32) - v6;
      CGFloat v12 = *(double *)(v10 + 40) - v8;
      (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(v11, v12, v6, v8);
      v16.origin.x = v11;
      v16.origin.y = v12;
      v16.size.double width = v7;
      v16.size.double height = v9;
      CGFloat MinX = CGRectGetMinX(v16);
      CGRect v4 = v14;
      *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = MinX + -10.0;
    }
  }
}

- (void)_invalidateLayout
{
  id v2 = [(PXDisplayAssetCombinedOverlayView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateLayout];
}

- (void)_updateImageAnalysisOverlay
{
  id v3 = [(PXDisplayAssetCombinedOverlayView *)self viewModel];
  BOOL v4 = +[PXDisplayAssetImageAnalysisOverlayView isImageAnalysisOverlayNeededForViewModel:v3];

  if (v4) {
    [(PXDisplayAssetCombinedOverlayView *)self _ensureImageAnalysisOverlayView];
  }
  id v5 = [(PXDisplayAssetCombinedOverlayView *)self imageAnalysisOverlayView];
  [v5 setHidden:!v4];
}

- (void)_invalidateImageAnalysisOverlay
{
  id v2 = [(PXDisplayAssetCombinedOverlayView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateImageAnalysisOverlay];
}

- (void)_updateLoadingProgressBadgeView
{
  id v3 = [(PXDisplayAssetCombinedOverlayView *)self viewModel];
  BOOL v4 = [v3 asset];
  [v3 loadingProgress];
  float v6 = v5;
  if (v5 > 0.0 && v5 <= 1.0)
  {
    double v8 = [v3 loadingError];
    if (v8)
    {
    }
    else
    {
      BOOL v9 = [(PXDisplayAssetCombinedOverlayView *)self canShowLoadingProgress];
      if (v6 == 1.0 && v9)
      {
        uint64_t v10 = [(PXDisplayAssetCombinedOverlayView *)self loadingProgressBadgeView];
        CGFloat v11 = v10;
        if (v10 && ([v10 isHidden] & 1) == 0)
        {
          LODWORD(v12) = 1.0;
          [v11 setProgress:v12];
          double v13 = (void *)MEMORY[0x1E4FB1EB0];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __68__PXDisplayAssetCombinedOverlayView__updateLoadingProgressBadgeView__block_invoke;
          v25[3] = &unk_1E5DD36F8;
          id v26 = v11;
          uint64_t v20 = MEMORY[0x1E4F143A8];
          uint64_t v21 = 3221225472;
          v22 = __68__PXDisplayAssetCombinedOverlayView__updateLoadingProgressBadgeView__block_invoke_2;
          v23 = &unk_1E5DD2188;
          id v24 = v26;
          [v13 animateWithDuration:0 delay:v25 options:&v20 animations:0.2 completion:0.3];
          loadingProgressBadgeView = self->_loadingProgressBadgeView;
          self->_loadingProgressBadgeView = 0;
        }
      }
      else if (v9)
      {
        [(PXDisplayAssetCombinedOverlayView *)self _ensureLoadingProgressBadgeView];
        uint64_t v15 = 0;
        goto LABEL_16;
      }
    }
  }
  uint64_t v15 = 1;
LABEL_16:
  CGRect v16 = [(PXDisplayAssetCombinedOverlayView *)self loadingProgressBadgeView];
  v17 = [(PXDisplayAssetCombinedOverlayView *)self loadingAsset];

  if (v4 != v17)
  {
    [v16 prepareForReuse];
    [(PXDisplayAssetCombinedOverlayView *)self setLoadingAsset:v4];
  }
  *(float *)&double v18 = v6;
  [v16 setProgress:v18];
  if ([v3 playbackStyle] == 3) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 1;
  }
  [v16 setStyle:v19];
  [v16 setHidden:v15];
  [(PXDisplayAssetCombinedOverlayView *)self _invalidateLayout];
}

uint64_t __68__PXDisplayAssetCombinedOverlayView__updateLoadingProgressBadgeView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __68__PXDisplayAssetCombinedOverlayView__updateLoadingProgressBadgeView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_invalidateLoadingProgressBadgeView
{
  id v2 = [(PXDisplayAssetCombinedOverlayView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateLoadingProgressBadgeView];
}

- (void)_updateLoadingFailureBadgeView
{
  id v3 = [(PXDisplayAssetCombinedOverlayView *)self viewModel];
  id v5 = [v3 loadingError];

  if (v5) {
    [(PXDisplayAssetCombinedOverlayView *)self _ensureLoadingFailureBadgeView];
  }
  BOOL v4 = [(PXDisplayAssetCombinedOverlayView *)self loadingFailureBadgeView];
  [v4 setError:v5];
  [v4 setHidden:v5 == 0];
  [(PXDisplayAssetCombinedOverlayView *)self _invalidateLayout];
}

- (void)_invalidateLoadingFailureBadgeView
{
  id v2 = [(PXDisplayAssetCombinedOverlayView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateLoadingFailureBadgeView];
}

- (void)_updateLivePhotoBadge
{
  id v3 = [(PXDisplayAssetCombinedOverlayView *)self viewModel];
  uint64_t v4 = [v3 playbackStyle];

  if (v4 == 3) {
    [(PXDisplayAssetCombinedOverlayView *)self _ensureLivePhotoBadgeView];
  }
  id v5 = [(PXDisplayAssetCombinedOverlayView *)self livePhotoBadgeView];
  [v5 setHidden:v4 != 3];

  [(PXDisplayAssetCombinedOverlayView *)self _invalidateLayout];
}

- (void)_invalidateLivePhotoBadge
{
  id v2 = [(PXDisplayAssetCombinedOverlayView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateLivePhotoBadge];
}

- (void)_loadingProgressDelayElapsed
{
}

- (void)_updateCanShowLoadingProgress
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__loadingProgressDelayElapsed object:0];
  [(PXDisplayAssetCombinedOverlayView *)self setCanShowLoadingProgress:0];
  id v3 = [(PXDisplayAssetCombinedOverlayView *)self viewModel];
  uint64_t v4 = [v3 asset];

  if (v4)
  {
    v6[0] = *MEMORY[0x1E4F1C4B0];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [(PXDisplayAssetCombinedOverlayView *)self performSelector:sel__loadingProgressDelayElapsed withObject:0 afterDelay:v5 inModes:1.0];
  }
}

- (void)_invalidateCanShowLoadingProgress
{
  id v2 = [(PXDisplayAssetCombinedOverlayView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCanShowLoadingProgress];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingLayout) {
    [(PXDisplayAssetCombinedOverlayView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PXDisplayAssetCombinedOverlayView;
  [(PXDisplayAssetCombinedOverlayView *)&v8 layoutSubviews];
  if (self->_isPerformingLayout)
  {
    CGFloat v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXDisplayAssetCombinedOverlayView.m", 129, @"Invalid parameter not satisfying: %@", @"!_isPerformingLayout" object file lineNumber description];
  }
  self->_isPerformingLayout = 1;
  [(PXDisplayAssetCombinedOverlayView *)self bounds];
  -[PXDisplayAssetCombinedOverlayView setViewportSize:](self, "setViewportSize:", v4, v5);
  float v6 = [(PXDisplayAssetCombinedOverlayView *)self updater];
  [v6 updateIfNeeded];

  self->_isPerformingLayout = 0;
}

- (void)_ensureImageAnalysisOverlayView
{
  if (!self->_imageAnalysisOverlayView)
  {
    id v3 = [PXDisplayAssetImageAnalysisOverlayView alloc];
    double v4 = [(PXDisplayAssetCombinedOverlayView *)self viewModel];
    double v5 = [(PXDisplayAssetImageAnalysisOverlayView *)v3 initWithViewModel:v4];
    imageAnalysisOverlayView = self->_imageAnalysisOverlayView;
    self->_imageAnalysisOverlayView = v5;

    [(PXDisplayAssetCombinedOverlayView *)self addSubview:self->_imageAnalysisOverlayView];
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateLayout];
  }
}

- (void)_ensureLoadingProgressBadgeView
{
  if (!self->_loadingProgressBadgeView)
  {
    +[PXRoundProgressView sizeForSizeClass:2];
    id v2 = [PXRoundProgressView alloc];
    PXRectWithOriginAndSize();
  }
}

- (void)_ensureLoadingFailureBadgeView
{
  if (!self->_loadingFailureBadgeView)
  {
    +[PXLoadingFailureBadgeView sizeForSizeClass:2];
    id v2 = [PXLoadingFailureBadgeView alloc];
    PXRectWithOriginAndSize();
  }
}

- (void)_ensureLivePhotoBadgeView
{
  if (!self->_livePhotoBadgeView)
  {
    id v3 = objc_alloc_init(PXLivePhotoBadgeView);
    livePhotoBadgeView = self->_livePhotoBadgeView;
    self->_livePhotoBadgeView = v3;

    [(PXLivePhotoBadgeView *)self->_livePhotoBadgeView setDelegate:self];
    [(PXDisplayAssetCombinedOverlayView *)self addSubview:self->_livePhotoBadgeView];
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateLayout];
  }
}

- (void)setCanShowLoadingProgress:(BOOL)a3
{
  if (self->_canShowLoadingProgress != a3)
  {
    self->_canShowLoadingProgress = a3;
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateLoadingProgressBadgeView];
  }
}

- (void)setViewportSize:(CGSize)a3
{
  if (a3.width != self->_viewportSize.width || a3.height != self->_viewportSize.height)
  {
    self->_viewportSize = a3;
    [(PXDisplayAssetCombinedOverlayView *)self _invalidateLayout];
  }
}

- (PXDisplayAssetCombinedOverlayView)initWithViewModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXDisplayAssetCombinedOverlayView;
  float v6 = -[PXDisplayAssetCombinedOverlayView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    uint64_t v7 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v6 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v6->_updater;
    v6->_updater = (PXUpdater *)v7;

    [(PXUpdater *)v6->_updater addUpdateSelector:sel__updateCanShowLoadingProgress];
    [(PXUpdater *)v6->_updater addUpdateSelector:sel__updateLivePhotoBadge];
    [(PXUpdater *)v6->_updater addUpdateSelector:sel__updateLoadingFailureBadgeView];
    [(PXUpdater *)v6->_updater addUpdateSelector:sel__updateLoadingProgressBadgeView];
    [(PXUpdater *)v6->_updater addUpdateSelector:sel__updateImageAnalysisOverlay];
    [(PXUpdater *)v6->_updater addUpdateSelector:sel__updateLayout];
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(PXDisplayAssetViewModel *)v6->_viewModel registerChangeObserver:v6 context:ViewModelObservationContext_133240];
    [(PXDisplayAssetCombinedOverlayView *)v6 _invalidateCanShowLoadingProgress];
    [(PXDisplayAssetCombinedOverlayView *)v6 _invalidateLivePhotoBadge];
    [(PXDisplayAssetCombinedOverlayView *)v6 _invalidateLoadingFailureBadgeView];
    [(PXDisplayAssetCombinedOverlayView *)v6 _invalidateLoadingProgressBadgeView];
    [(PXDisplayAssetCombinedOverlayView *)v6 _invalidateImageAnalysisOverlay];
    [(PXDisplayAssetCombinedOverlayView *)v6 _invalidateLayout];
  }

  return v6;
}

- (PXDisplayAssetCombinedOverlayView)initWithCoder:(id)a3
{
  id v5 = a3;
  float v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDisplayAssetCombinedOverlayView.m", 47, @"%s is not available as initializer", "-[PXDisplayAssetCombinedOverlayView initWithCoder:]");

  abort();
}

- (PXDisplayAssetCombinedOverlayView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDisplayAssetCombinedOverlayView.m", 43, @"%s is not available as initializer", "-[PXDisplayAssetCombinedOverlayView initWithFrame:]");

  abort();
}

@end