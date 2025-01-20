@interface PXUIPlayButtonTile
+ (CGSize)preferredSize;
- (BOOL)_isAnimatingGeometry;
- (BOOL)_needsUpdate;
- (BOOL)allowsBackdropStatisticsSuppression;
- (CGPoint)imageViewportLocation;
- (CGSize)playButtonSize;
- (NSString)playButtonTitle;
- (PXImageRequester)imageRequester;
- (PXUIPlayButtonTile)init;
- (PXUIPlayButtonTileDelegate)delegate;
- (UIImage)_backgroundImage;
- (UIView)view;
- (int64_t)_style;
- (int64_t)playButtonStyle;
- (unint64_t)_animationCount;
- (void)_handleExtractionResult:(id)a3 isPlaceholder:(BOOL)a4 extraction:(id)a5;
- (void)_invalidateBackgroundImage;
- (void)_invalidatePlayButton;
- (void)_resetHifiPlayButton;
- (void)_setAnimatingGeometry:(BOOL)a3;
- (void)_setAnimationCount:(unint64_t)a3;
- (void)_setBackgroundImage:(id)a3;
- (void)_setStyle:(int64_t)a3;
- (void)_updateBackgroundImageIfNeeded;
- (void)_updateIfNeeded;
- (void)_updatePlayButtonViewIfNeeded;
- (void)becomeReusable;
- (void)didAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5;
- (void)didTapButton:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)prepareForReuse;
- (void)setAllowsBackdropStatisticsSuppression:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setImageRequester:(id)a3;
- (void)setImageViewportLocation:(CGPoint)a3;
- (void)setPlayButtonSize:(CGSize)a3;
- (void)setPlayButtonStyle:(int64_t)a3;
- (void)setPlayButtonTitle:(id)a3;
- (void)willAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5;
@end

@implementation PXUIPlayButtonTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundImage, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_playButtonTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetForImageExtraction, 0);
  objc_storeStrong((id *)&self->_imageExtraction, 0);
  objc_storeStrong((id *)&self->_playButtonBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_labeledPlayButtonView, 0);
  objc_storeStrong((id *)&self->_playButtonView, 0);
  objc_storeStrong((id *)&self->_hifiPlayButtonView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (UIImage)_backgroundImage
{
  return self->__backgroundImage;
}

- (unint64_t)_animationCount
{
  return self->__animationCount;
}

- (BOOL)_isAnimatingGeometry
{
  return self->__animatingGeometry;
}

- (void)_setStyle:(int64_t)a3
{
  self->__style = a3;
}

- (int64_t)_style
{
  return self->__style;
}

- (BOOL)allowsBackdropStatisticsSuppression
{
  return self->_allowsBackdropStatisticsSuppression;
}

- (CGPoint)imageViewportLocation
{
  double x = self->_imageViewportLocation.x;
  double y = self->_imageViewportLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (NSString)playButtonTitle
{
  return self->_playButtonTitle;
}

- (int64_t)playButtonStyle
{
  return self->_playButtonStyle;
}

- (CGSize)playButtonSize
{
  double width = self->_playButtonSize.width;
  double height = self->_playButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (PXUIPlayButtonTileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXUIPlayButtonTileDelegate *)WeakRetained;
}

- (void)didAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  unint64_t v6 = [(PXUIPlayButtonTile *)self _animationCount] - 1;
  [(PXUIPlayButtonTile *)self _setAnimationCount:v6];
}

- (void)willAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  unint64_t v6 = [(PXUIPlayButtonTile *)self _animationCount] + 1;
  [(PXUIPlayButtonTile *)self _setAnimationCount:v6];
}

- (UIView)view
{
  if (!self->_view)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    view = self->_view;
    self->_view = v3;
  }
  [(PXUIPlayButtonTile *)self _updateIfNeeded];
  v5 = self->_view;
  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 0x800) != 0 && (void *)PXImageRequesterObserverContext == a5)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__PXUIPlayButtonTile_observable_didChange_context___block_invoke;
    v5[3] = &unk_1E5DB8C40;
    v5[4] = self;
    [(PXUIPlayButtonTile *)self performChanges:v5];
  }
}

uint64_t __51__PXUIPlayButtonTile_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateBackgroundImage];
}

- (void)prepareForReuse
{
  id v2 = [(PXUIPlayButtonTile *)self view];
  [v2 setHidden:0];
}

- (void)becomeReusable
{
  v3 = [(PXUIPlayButtonTile *)self view];
  [v3 setHidden:1];

  [(PXUIPlayButtonTile *)self performChanges:&__block_literal_global_18_81852];
}

uint64_t __36__PXUIPlayButtonTile_becomeReusable__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setImageRequester:0];
}

- (void)didTapButton:(id)a3
{
  id v4 = [(PXUIPlayButtonTile *)self delegate];
  [v4 playButtonTileWasTapped:self];
}

- (void)_handleExtractionResult:(id)a3 isPlaceholder:(BOOL)a4 extraction:(id)a5
{
  id v11 = a3;
  v8 = (PXImageExtraction *)a5;
  if (![(PXImageExtraction *)v8 isCancelled])
  {
    imageExtraction = self->_imageExtraction;
    if (!imageExtraction || imageExtraction == v8)
    {
      v10 = [(PXUIPlayButtonTile *)self _backgroundImage];

      if (!v10 || !a4) {
        [(PXUIPlayButtonTile *)self _setBackgroundImage:v11];
      }
    }
  }
}

- (void)_updateIfNeeded
{
  if ([(PXUIPlayButtonTile *)self _needsUpdate])
  {
    [(PXUIPlayButtonTile *)self _updateBackgroundImageIfNeeded];
    [(PXUIPlayButtonTile *)self _updatePlayButtonViewIfNeeded];
    if ([(PXUIPlayButtonTile *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2, self, @"PXUIPlayButtonTile.m", 331, @"[%@] update needed at end of update pass", self object file lineNumber description];
    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdate.playButton || self->_needsUpdate.backgroundImage;
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  id v6 = v4;
  if (v4)
  {
    (*((void (**)(id, PXUIPlayButtonTile *))v4 + 2))(v4, self);
    id v4 = v6;
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXUIPlayButtonTile *)self _updateIfNeeded];
    id v4 = v6;
  }
}

- (void)_updateBackgroundImageIfNeeded
{
  if (self->_needsUpdate.backgroundImage)
  {
    self->_needsUpdate.backgroundImage = 0;
    v3 = [(PXUIPlayButtonTile *)self imageRequester];
    id v4 = [v3 opportunisticImage];
    imageExtraction = self->_imageExtraction;
    if (v4)
    {
      if (!imageExtraction)
      {
LABEL_15:
        v14 = [v3 asset];
        assetForImageExtraction = self->_assetForImageExtraction;
        self->_assetForImageExtraction = v14;

        [v3 contentsRect];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        [v3 viewportSize];
        double v25 = v24;
        double v27 = v26;
        [(PXUIPlayButtonTile *)self imageViewportLocation];
        double v29 = v28;
        double v31 = v30;
        objc_initWeak(&location, self);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __52__PXUIPlayButtonTile__updateBackgroundImageIfNeeded__block_invoke;
        v34[3] = &unk_1E5DB7728;
        objc_copyWeak(&v35, &location);
        objc_msgSend(v4, "px_extractPlayOverlayBackgroundImageFromLocation:inViewportWithSize:contentMode:contentsRect:asynchronously:handler:", 2, 1, v34, v29, v31, v25, v27, v17, v19, v21, v23);
        v32 = (PXImageExtraction *)objc_claimAutoreleasedReturnValue();
        v33 = self->_imageExtraction;
        self->_imageExtraction = v32;

        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
        goto LABEL_16;
      }
      id v6 = self->_assetForImageExtraction;
      v7 = [v3 asset];
      v8 = v6;
      v9 = v7;
      if (v8 != v9)
      {
        v10 = v9;
        if (v8 && v9)
        {
          uint64_t v11 = [(PXDisplayAsset *)v8 isContentEqualTo:v9];
          if (!v11) {
            uint64_t v11 = [(PXDisplayAsset *)v10 isContentEqualTo:v8];
          }

          if (v11 == 2) {
            goto LABEL_16;
          }
        }
        else
        {
        }
        goto LABEL_15;
      }
    }
    else
    {
      [(PXImageExtraction *)imageExtraction cancel];
      v12 = self->_assetForImageExtraction;
      self->_assetForImageExtraction = 0;

      v13 = self->_imageExtraction;
      self->_imageExtraction = 0;

      objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 2);
      v8 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
      [(PXUIPlayButtonTile *)self _setBackgroundImage:v8];
    }

LABEL_16:
  }
}

void __52__PXUIPlayButtonTile__updateBackgroundImageIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleExtractionResult:v8 isPlaceholder:a3 extraction:v7];
}

- (void)_invalidateBackgroundImage
{
  self->_needsUpdate.backgroundImage = 1;
}

- (void)_updatePlayButtonViewIfNeeded
{
  if (!self->_needsUpdate.playButton) {
    return;
  }
  self->_needsUpdate.playButton = 0;
  v3 = [(PXUIPlayButtonTile *)self view];
  [(PXUIPlayButtonTile *)self playButtonSize];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  int64_t v8 = [(PXUIPlayButtonTile *)self playButtonStyle];
  if (v8 != 1)
  {
    int64_t v11 = v8;
    if ([(PXUIPlayButtonTile *)self _isAnimatingGeometry])
    {
      v12 = [(PXUIPlayButtonTile *)self _backgroundImage];
      BOOL v10 = v12 != 0;

      if (v11)
      {
LABEL_6:
        char v9 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v10 = 0;
      if (v11) {
        goto LABEL_6;
      }
    }
    char v9 = ![(PXUIPlayButtonTile *)self _isAnimatingGeometry];
    goto LABEL_9;
  }
  char v9 = 0;
  BOOL v10 = 1;
LABEL_9:
  v13 = (void *)MEMORY[0x1E4FB1EB0];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke;
  v36[3] = &unk_1E5DB7700;
  char v41 = v9;
  v36[4] = self;
  id v14 = v3;
  id v37 = v14;
  long long v24 = *MEMORY[0x1E4F1DAD8];
  long long v38 = *MEMORY[0x1E4F1DAD8];
  uint64_t v39 = v5;
  uint64_t v40 = v7;
  char v42 = 0;
  [v13 performWithoutAnimation:v36];
  if (v10)
  {
    v15 = (void *)MEMORY[0x1E4FB1EB0];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_2;
    v31[3] = &unk_1E5DB8FA0;
    v31[4] = self;
    id v32 = v14;
    long long v33 = v24;
    uint64_t v34 = v5;
    uint64_t v35 = v7;
    [v15 performWithoutAnimation:v31];
  }
  else
  {
    playButtonView = self->_playButtonView;
    if (playButtonView)
    {
      double v17 = playButtonView;
      double v18 = self->_playButtonBackgroundImageView;
      double v19 = (void *)MEMORY[0x1E4FB1EB0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_3;
      v28[3] = &unk_1E5DD32A8;
      double v29 = v17;
      double v30 = v18;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_4;
      v25[3] = &unk_1E5DD0058;
      double v26 = v29;
      double v27 = v30;
      double v20 = v30;
      double v21 = v29;
      [v19 animateWithDuration:v28 animations:v25 completion:2.0];
      double v22 = self->_playButtonView;
      self->_playButtonView = 0;

      playButtonBackgroundImageView = self->_playButtonBackgroundImageView;
      self->_playButtonBackgroundImageView = 0;
    }
  }
}

void __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)v3[2];
  if (v2)
  {
    if (!v4)
    {
      uint64_t v5 = [v3 allowsBackdropStatisticsSuppression];
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonWithStyle:allowBackdropStatisticsSupression:", 0, v5);
      uint64_t v7 = *(void *)(a1 + 32);
      int64_t v8 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = v6;

      [*(id *)(*(void *)(a1 + 32) + 16) setAutoresizingMask:0];
      [*(id *)(a1 + 40) insertSubview:*(void *)(*(void *)(a1 + 32) + 16) atIndex:0];
      uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
    }
    objc_msgSend(v4, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  else if (v4)
  {
    [v4 removeFromSuperview];
    uint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = 0;
  }
  int64_t v11 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(unsigned char *)(a1 + 81))
  {
    if (!v11)
    {
      v12 = objc_opt_new();
      [v12 setStyle:5];
      [v12 setLocalizedTitle:*(void *)(*(void *)(a1 + 32) + 88)];
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonWithConfiguration:", v12);
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(v14 + 32);
      *(void *)(v14 + 32) = v13;

      [*(id *)(*(void *)(a1 + 32) + 32) setAutoresizingMask:0];
      [*(id *)(*(void *)(a1 + 32) + 32) setTarget:*(void *)(a1 + 32) action:sel_didTapButton_];
      [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(a1 + 32) + 32)];

      int64_t v11 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    double v16 = *(double *)(a1 + 48);
    double v17 = *(double *)(a1 + 56);
    double v18 = *(double *)(a1 + 64);
    double v19 = *(double *)(a1 + 72);
    objc_msgSend(v11, "setFrame:", v16, v17, v18, v19);
  }
  else if (v11)
  {
    [v11 removeFromSuperview];
    uint64_t v20 = *(void *)(a1 + 32);
    double v21 = *(void **)(v20 + 32);
    *(void *)(v20 + 32) = 0;
  }
}

void __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 24))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    [*(id *)(*(void *)(a1 + 32) + 40) setAutoresizingMask:0];
    [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(a1 + 32) + 40)];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonWithStyle:", 4);
    uint64_t v7 = *(void *)(a1 + 32);
    int64_t v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v6;

    [*(id *)(*(void *)(a1 + 32) + 24) setAutoresizingMask:0];
    [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(a1 + 32) + 24)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v9 = [*(id *)(a1 + 32) _backgroundImage];
  [*(id *)(*(void *)(a1 + 32) + 40) setImage:v9];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

- (void)_invalidatePlayButton
{
  self->_needsUpdate.playButton = 1;
}

- (void)_setBackgroundImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  if (self->__backgroundImage != v5)
  {
    objc_storeStrong((id *)&self->__backgroundImage, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__PXUIPlayButtonTile__setBackgroundImage___block_invoke;
    v6[3] = &unk_1E5DB8C40;
    v6[4] = self;
    [(PXUIPlayButtonTile *)self performChanges:v6];
  }
}

uint64_t __42__PXUIPlayButtonTile__setBackgroundImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePlayButton];
}

- (void)_setAnimatingGeometry:(BOOL)a3
{
  if (self->__animatingGeometry != a3)
  {
    self->__animatingGeometrdouble y = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __44__PXUIPlayButtonTile__setAnimatingGeometry___block_invoke;
    v3[3] = &unk_1E5DB8C40;
    v3[4] = self;
    [(PXUIPlayButtonTile *)self performChanges:v3];
  }
}

uint64_t __44__PXUIPlayButtonTile__setAnimatingGeometry___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePlayButton];
}

- (void)_setAnimationCount:(unint64_t)a3
{
  if (self->__animationCount != a3)
  {
    self->__animationCount = a3;
    [(PXUIPlayButtonTile *)self _setAnimatingGeometry:a3 != 0];
  }
}

- (void)_resetHifiPlayButton
{
  [(PXVideoOverlayButton *)self->_hifiPlayButtonView removeFromSuperview];
  hifiPlayButtonView = self->_hifiPlayButtonView;
  self->_hifiPlayButtonView = 0;

  [(PXUIPlayButtonTile *)self _invalidatePlayButton];
}

- (void)setAllowsBackdropStatisticsSuppression:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_isPerformingChanges)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"PXUIPlayButtonTile.m", 116, @"[%@] %@ must be called from a performChanges block.", self, v7 object file lineNumber description];
  }
  if (self->_allowsBackdropStatisticsSuppression != v3)
  {
    self->_allowsBackdropStatisticsSuppression = v3;
    [(PXUIPlayButtonTile *)self _resetHifiPlayButton];
  }
}

- (void)setImageViewportLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_isPerformingChanges)
  {
    int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"PXUIPlayButtonTile.m", 106, @"[%@] %@ must be called from a performChanges block.", self, v9 object file lineNumber description];
  }
  if (x != self->_imageViewportLocation.x || y != self->_imageViewportLocation.y)
  {
    self->_imageViewportLocation.double x = x;
    self->_imageViewportLocation.double y = y;
    [(PXUIPlayButtonTile *)self _invalidateBackgroundImage];
  }
}

- (void)setImageRequester:(id)a3
{
  uint64_t v6 = (PXImageRequester *)a3;
  if (!self->_isPerformingChanges)
  {
    int64_t v11 = v6;
    int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"PXUIPlayButtonTile.m", 93, @"[%@] %@ must be called from a performChanges block.", self, v9 object file lineNumber description];

    uint64_t v6 = v11;
  }
  imageRequester = self->_imageRequester;
  if (imageRequester != v6)
  {
    BOOL v10 = v6;
    [(PXImageRequester *)imageRequester unregisterChangeObserver:self context:PXImageRequesterObserverContext];
    objc_storeStrong((id *)&self->_imageRequester, a3);
    [(PXUIPlayButtonTile *)self _invalidateBackgroundImage];
    [(PXImageRequester *)self->_imageRequester registerChangeObserver:self context:PXImageRequesterObserverContext];
    uint64_t v6 = v10;
  }
}

- (void)setPlayButtonTitle:(id)a3
{
  int64_t v8 = (NSString *)a3;
  uint64_t v4 = self->_playButtonTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      playButtonTitle = self->_playButtonTitle;
      self->_playButtonTitle = v6;

      [(PXUIPlayButtonTile *)self _invalidatePlayButton];
    }
  }
}

- (void)setPlayButtonStyle:(int64_t)a3
{
  if (!self->_isPerformingChanges)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"PXUIPlayButtonTile.m", 74, @"[%@] %@ must be called from a performChanges block.", self, v7 object file lineNumber description];
  }
  if (self->_playButtonStyle != a3)
  {
    self->_playButtonStyle = a3;
    [(PXUIPlayButtonTile *)self _invalidatePlayButton];
  }
}

- (void)setPlayButtonSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (!self->_isPerformingChanges)
  {
    int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"PXUIPlayButtonTile.m", 64, @"[%@] %@ must be called from a performChanges block.", self, v9 object file lineNumber description];
  }
  if (width != self->_playButtonSize.width || height != self->_playButtonSize.height)
  {
    self->_playButtonSize.double width = width;
    self->_playButtonSize.double height = height;
    [(PXUIPlayButtonTile *)self _invalidatePlayButton];
  }
}

- (PXUIPlayButtonTile)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXUIPlayButtonTile;
  uint64_t v2 = [(PXUIPlayButtonTile *)&v5 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_playButtonStyle = 0;
    v2->_allowsBackdropStatisticsSuppression = 1;
    [(PXUIPlayButtonTile *)v2 _invalidatePlayButton];
  }
  return v3;
}

+ (CGSize)preferredSize
{
  if (preferredSize_onceToken != -1) {
    dispatch_once(&preferredSize_onceToken, &__block_literal_global_81874);
  }
  double v2 = *(double *)&preferredSize_preferredSize_0;
  double v3 = *(double *)&preferredSize_preferredSize_1;
  result.double height = v3;
  result.double width = v2;
  return result;
}

uint64_t __35__PXUIPlayButtonTile_preferredSize__block_invoke()
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonSize");
  preferredSize_preferredSize_0 = v1;
  preferredSize_preferredSize_1 = v2;
  return result;
}

@end