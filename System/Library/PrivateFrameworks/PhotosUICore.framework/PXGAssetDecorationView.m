@interface PXGAssetDecorationView
+ (BOOL)_wantsActivityIndicatorForConfiguration:(id)a3;
+ (BOOL)_wantsProgressIndicatorForConfiguration:(id)a3;
+ (BOOL)wantsDecorationViewForConfiguration:(id)a3;
- (CGRect)clippingRect;
- (PXGAssetDecorationView)initWithFrame:(CGRect)a3;
- (PXGAssetDecorationViewConfiguration)userData;
- (void)_invalidateProgressIndicator;
- (void)_updateProgressIndicator;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXGAssetDecorationView

+ (BOOL)wantsDecorationViewForConfiguration:(id)a3
{
  v3 = [a3 loadStatus];
  BOOL v4 = [v3 state] == 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_progressIndicatorDelayTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (PXGAssetDecorationViewConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)prepareForReuse
{
  [(NSTimer *)self->_progressIndicatorDelayTimer invalidate];
  progressIndicatorDelayTimer = self->_progressIndicatorDelayTimer;
  self->_progressIndicatorDelayTimer = 0;

  [(PXGAssetDecorationView *)self setUserData:0];
}

- (void)_updateProgressIndicator
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PXGAssetDecorationView *)self userData];
  int v4 = [(id)objc_opt_class() _wantsProgressIndicatorForConfiguration:v3];
  int v5 = [(id)objc_opt_class() _wantsActivityIndicatorForConfiguration:v3];
  if (v4)
  {
    progressIndicatorDelayTimer = self->_progressIndicatorDelayTimer;
    if (!progressIndicatorDelayTimer)
    {
LABEL_5:
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x1E4F1CB00];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __50__PXGAssetDecorationView__updateProgressIndicator__block_invoke;
      v28[3] = &unk_1E5DCD920;
      objc_copyWeak(&v29, &location);
      v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v28 block:1.0];
      v9 = self->_progressIndicatorDelayTimer;
      self->_progressIndicatorDelayTimer = v8;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
    if ([(NSTimer *)progressIndicatorDelayTimer isValid])
    {
      if (self->_progressIndicatorDelayTimer) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
    if (!self->_progressIndicatorView)
    {
      +[PXRoundProgressView sizeForSizeClass:1];
      PXRectWithOriginAndSize();
    }
    v12 = [v3 loadStatus];
    [v12 progress];
    *(float *)&double v13 = v13;
    [(PXRoundProgressView *)self->_progressIndicatorView setProgress:v13];
  }
  else
  {
    progressIndicatorView = self->_progressIndicatorView;
    if (progressIndicatorView)
    {
      [(PXRoundProgressView *)progressIndicatorView removeFromSuperview];
      v11 = self->_progressIndicatorView;
      self->_progressIndicatorView = 0;
    }
  }
LABEL_11:
  activityIndicatorView = self->_activityIndicatorView;
  if (v5)
  {
    if (!activityIndicatorView)
    {
      v15 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
      p_activityIndicatorView = &self->_activityIndicatorView;
      v17 = self->_activityIndicatorView;
      self->_activityIndicatorView = v15;

      [(UIActivityIndicatorView *)self->_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
      v18 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIActivityIndicatorView *)self->_activityIndicatorView setColor:v18];

      [(PXGAssetDecorationView *)self addSubview:self->_activityIndicatorView];
      v19 = (void *)MEMORY[0x1E4F28DC8];
      v20 = [(UIActivityIndicatorView *)self->_activityIndicatorView centerXAnchor];
      v21 = [(PXGAssetDecorationView *)self centerXAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v31[0] = v22;
      v23 = [(UIActivityIndicatorView *)self->_activityIndicatorView centerYAnchor];
      v24 = [(PXGAssetDecorationView *)self centerYAnchor];
      v25 = [v23 constraintEqualToAnchor:v24];
      v31[1] = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      [v19 activateConstraints:v26];

      [(UIActivityIndicatorView *)*p_activityIndicatorView startAnimating];
    }
  }
  else if (activityIndicatorView)
  {
    [(UIActivityIndicatorView *)activityIndicatorView removeFromSuperview];
    v27 = self->_activityIndicatorView;
    self->_activityIndicatorView = 0;
  }
}

void __50__PXGAssetDecorationView__updateProgressIndicator__block_invoke(uint64_t a1, void *a2)
{
  [a2 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateProgressIndicator];
}

- (void)_invalidateProgressIndicator
{
}

- (void)layoutSubviews
{
}

- (void)setUserData:(id)a3
{
  v8 = (PXGAssetDecorationViewConfiguration *)a3;
  int v4 = self->_userData;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXGAssetDecorationViewConfiguration *)v8 isEqual:v4];

    if (!v5)
    {
      v6 = (PXGAssetDecorationViewConfiguration *)[(PXGAssetDecorationViewConfiguration *)v8 copy];
      userData = self->_userData;
      self->_userData = v6;

      [(PXGAssetDecorationView *)self _invalidateProgressIndicator];
    }
  }
}

- (PXGAssetDecorationView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXGAssetDecorationView;
  v3 = -[PXGAssetDecorationView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v3 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateProgressIndicator];
  }
  return v3;
}

+ (BOOL)_wantsActivityIndicatorForConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 loadStatus];
  if ([v4 state] == 1)
  {
    BOOL v5 = [v3 loadStatus];
    char v6 = [v5 isIndeterminate];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)_wantsProgressIndicatorForConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 loadStatus];
  if ([v4 state] == 1)
  {
    BOOL v5 = [v3 loadStatus];
    int v6 = [v5 isIndeterminate] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end