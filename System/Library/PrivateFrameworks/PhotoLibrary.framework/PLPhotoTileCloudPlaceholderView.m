@interface PLPhotoTileCloudPlaceholderView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (PLPhotoTileCloudPlaceholderView)initWithFrame:(CGRect)a3;
- (void)_retryDownload;
- (void)dealloc;
- (void)fadeOutSoonIfNeededAndRemoveFromSuperview:(BOOL)a3;
- (void)layoutSubviews;
- (void)setImageRect:(CGRect)a3;
- (void)setRetryDelegate:(id)a3;
- (void)setToolbarVisible:(BOOL)a3;
- (void)showErrorIndicator;
- (void)showLoadingIndicator;
- (void)showLoadingIndicatorWhenReady;
- (void)updateCloudDownloadProgress:(double)a3;
@end

@implementation PLPhotoTileCloudPlaceholderView

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)PLPhotoTileCloudPlaceholderView;
  [(PLPhotoTileCloudPlaceholderView *)&v34 layoutSubviews];
  [(PLPhotoTileCloudPlaceholderView *)self bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarOrientation");
  v12 = (void *)MEMORY[0x1E4F42F60];
  unint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL;
  if ((unint64_t)(v11 - 1) < 2 || v13 == 1) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 2;
  }
  [v12 defaultHeightForBarSize:v15];
  CGFloat v17 = 0.0;
  if (!self->_toolbarVisible) {
    double v16 = 0.0;
  }
  double v18 = v10 - v16;
  if (CGRectIsEmpty(self->_imageRect))
  {
    CGFloat v17 = v6;
  }
  else
  {
    double height = self->_imageRect.size.height;
    double y = self->_imageRect.origin.y;
    if (self->_imageRect.size.width + self->_imageRect.origin.x < v8) {
      double v8 = self->_imageRect.size.width + self->_imageRect.origin.x;
    }
    if (height + y < v18) {
      double v18 = height + y;
    }
    CGFloat v4 = 0.0;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v21 = 44.0;
  }
  else {
    double v21 = 22.0;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v22 = 44.0;
  }
  else {
    double v22 = 22.0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  double v25 = v21;
  double v26 = CGRectGetMaxX(*(CGRect *)(&v22 - 3)) + 8.0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v27 = 44.0;
  }
  else {
    double v27 = 22.0;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v28 = 44.0;
  }
  else {
    double v28 = 22.0;
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  double v31 = v27;
  CGFloat v32 = CGRectGetMaxY(*(CGRect *)(&v28 - 3)) + 8.0;
  v35.origin.x = v4;
  v35.origin.double y = v17;
  v35.size.width = v8;
  v35.size.double height = v18;
  CGFloat v33 = CGRectGetMaxX(v35) - v26;
  v36.origin.x = v4;
  v36.origin.double y = v17;
  v36.size.width = v8;
  v36.size.double height = v18;
  -[UIView setFrame:](self->_loadingContainerView, "setFrame:", v33, CGRectGetMaxY(v36) - v32, v26, v32);
}

- (void)setImageRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_imageRect = &self->_imageRect;
  if (!CGRectEqualToRect(self->_imageRect, a3))
  {
    p_imageRect->origin.CGFloat x = x;
    p_imageRect->origin.CGFloat y = y;
    p_imageRect->size.CGFloat width = width;
    p_imageRect->size.CGFloat height = height;
    [(PLPhotoTileCloudPlaceholderView *)self setNeedsLayout];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  if (!self->_showingError) {
    return 0;
  }
  loadingErrorButton = self->_loadingErrorButton;
  -[UIButton convertPoint:fromView:](loadingErrorButton, "convertPoint:fromView:", self, a3.x, a3.y);
  return -[UIButton pointInside:withEvent:](loadingErrorButton, "pointInside:withEvent:", a4);
}

- (void)_retryDownload
{
  if (self->_delegate)
  {
    [(PLRoundProgressView *)self->_loadingIndicatorView resetProgress];
    [(PLPhotoTileCloudPlaceholderView *)self showLoadingIndicator];
    delegate = self->_delegate;
    [(PLPhotoTileCloudPlaceholderViewDelegate *)delegate retryDownload];
  }
}

- (void)setRetryDelegate:(id)a3
{
  self->_delegate = (PLPhotoTileCloudPlaceholderViewDelegate *)a3;
}

- (void)setToolbarVisible:(BOOL)a3
{
  if (self->_toolbarVisible != a3)
  {
    self->_toolbarVisible = a3;
    [(PLPhotoTileCloudPlaceholderView *)self setNeedsLayout];
  }
}

- (void)showErrorIndicator
{
  if (self->_indicatorIsVisible)
  {
    if (self->_loadingErrorButton)
    {
      p_showingError = &self->_showingError;
      if (self->_showingError && !self->_showingLoading) {
        return;
      }
    }
    else
    {
      CGFloat v4 = NSString;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v5 = @"_iPad";
      }
      else {
        double v5 = &stru_1F1A10F90;
      }
      uint64_t v6 = [v4 stringWithFormat:@"Loading_Error%@.png", v5];
      uint64_t v7 = [MEMORY[0x1E4F42A80] imageNamed:v6 inBundle:PLPhotoLibraryFrameworkBundle()];
      double v8 = (UIButton *)(id)[MEMORY[0x1E4F427E0] buttonWithType:0];
      self->_loadingErrorButton = v8;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v9 = 44.0;
      }
      else {
        double v9 = 22.0;
      }
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v10 = 60.0;
      }
      else {
        double v10 = 40.0;
      }
      double v11 = v9 - v10;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v12 = 44.0;
      }
      else {
        double v12 = 22.0;
      }
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v13 = 60.0;
      }
      else {
        double v13 = 40.0;
      }
      double v14 = v12 - v13;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v15 = 60.0;
      }
      else {
        double v15 = 40.0;
      }
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v16 = 60.0;
      }
      else {
        double v16 = 40.0;
      }
      -[UIButton setFrame:](v8, "setFrame:", v11, v14, v15, v16);
      [(UIButton *)self->_loadingErrorButton setImage:v7 forState:0];
      loadingErrorButton = self->_loadingErrorButton;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v18 = 60.0;
      }
      else {
        double v18 = 40.0;
      }
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v19 = 44.0;
      }
      else {
        double v19 = 22.0;
      }
      double v20 = v18 - v19;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v21 = 60.0;
      }
      else {
        double v21 = 40.0;
      }
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v22 = 44.0;
      }
      else {
        double v22 = 22.0;
      }
      -[UIButton setImageEdgeInsets:](loadingErrorButton, "setImageEdgeInsets:", v20, v21 - v22, 0.0, 0.0);
      [(UIButton *)self->_loadingErrorButton addTarget:self action:sel__retryDownload forControlEvents:64];
      [(UIButton *)self->_loadingErrorButton setAlpha:0.0];
      [(UIView *)self->_loadingContainerView addSubview:self->_loadingErrorButton];
      p_showingError = &self->_showingError;
      self->_showingError = 0;
    }
    BOOL *p_showingError = 1;
    self->_showingLoading = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __53__PLPhotoTileCloudPlaceholderView_showErrorIndicator__block_invoke;
    v23[3] = &unk_1E63D2660;
    v23[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v23 options:&__block_literal_global_1439 animations:0.25 completion:0.0];
  }
}

uint64_t __53__PLPhotoTileCloudPlaceholderView_showErrorIndicator__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) stopProgressTimer];
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 424);
  return [v2 setAlpha:1.0];
}

- (void)showLoadingIndicator
{
  if (self->_indicatorIsVisible && (self->_showingError || !self->_showingLoading))
  {
    self->_showingError = 0;
    self->_showingLoading = 1;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__PLPhotoTileCloudPlaceholderView_showLoadingIndicator__block_invoke;
    v3[3] = &unk_1E63D2660;
    v3[4] = self;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __55__PLPhotoTileCloudPlaceholderView_showLoadingIndicator__block_invoke_2;
    v2[3] = &unk_1E63D2688;
    v2[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v3 options:v2 animations:0.25 completion:1.0];
  }
}

uint64_t __55__PLPhotoTileCloudPlaceholderView_showLoadingIndicator__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 408) startProgressTimer];
  v2 = *(void **)(*(void *)(a1 + 32) + 424);
  return [v2 setAlpha:0.0];
}

uint64_t __55__PLPhotoTileCloudPlaceholderView_showLoadingIndicator__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 480) = v3;
  return result;
}

- (void)showLoadingIndicatorWhenReady
{
  if (!self->_indicatorIsVisible)
  {
    self->_indicatorIsVisible = 1;
    [(PLPhotoTileCloudPlaceholderView *)self showLoadingIndicator];
  }
}

- (void)updateCloudDownloadProgress:(double)a3
{
}

- (void)fadeOutSoonIfNeededAndRemoveFromSuperview:(BOOL)a3
{
  BOOL v3 = a3;
  self->_delegate = 0;
  [(PLRoundProgressView *)self->_loadingIndicatorView setProgress:1.0];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (v3)
  {
    double v6 = v5 - self->_lastViewPhaseChangeDate;
    double v7 = 0.3 - v6;
    BOOL v8 = v6 < 0.3;
    double v9 = 0.0;
    if (v8) {
      double v9 = v7;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__PLPhotoTileCloudPlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke;
    v11[3] = &unk_1E63D2660;
    v11[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__PLPhotoTileCloudPlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke_2;
    v10[3] = &unk_1E63D2688;
    v10[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:2 delay:v11 options:v10 animations:0.3 completion:v9];
  }
  else
  {
    [(PLRoundProgressView *)self->_loadingIndicatorView stopProgressTimer];
    [(PLPhotoTileCloudPlaceholderView *)self removeFromSuperview];
  }
}

uint64_t __77__PLPhotoTileCloudPlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __77__PLPhotoTileCloudPlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) stopProgressTimer];
  v2 = *(void **)(a1 + 32);
  return [v2 removeFromSuperview];
}

- (void)dealloc
{
  self->_loadingErrorButton = 0;
  [(PLRoundProgressView *)self->_loadingIndicatorView stopProgressTimer];

  self->_loadingIndicatorView = 0;
  self->_loadingContainerView = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTileCloudPlaceholderView;
  [(PLPhotoTileCloudPlaceholderView *)&v3 dealloc];
}

- (PLPhotoTileCloudPlaceholderView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PLPhotoTileCloudPlaceholderView;
  objc_super v3 = -[PLPhotoTileCloudPlaceholderView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v3->_lastViewPhaseChangeDate = v4;
    [(PLPhotoTileCloudPlaceholderView *)v3 setUserInteractionEnabled:0];
    -[PLPhotoTileCloudPlaceholderView setBackgroundColor:](v3, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
    id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v3->_loadingContainerView = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = [PLRoundProgressView alloc];
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v7 = 44.0;
    }
    else {
      double v7 = 22.0;
    }
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v8 = 44.0;
    }
    else {
      double v8 = 22.0;
    }
    uint64_t v9 = -[PLRoundProgressView initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, v7, v8);
    v3->_loadingIndicatorView = (PLRoundProgressView *)v9;
    [(UIView *)v3->_loadingContainerView addSubview:v9];
    [(PLPhotoTileCloudPlaceholderView *)v3 addSubview:v3->_loadingContainerView];
    [(PLPhotoTileCloudPlaceholderView *)v3 setUserInteractionEnabled:1];
    v3->_toolbarVisible = 1;
  }
  return v3;
}

@end