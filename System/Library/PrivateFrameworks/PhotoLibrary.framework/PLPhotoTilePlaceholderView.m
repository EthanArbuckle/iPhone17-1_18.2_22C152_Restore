@interface PLPhotoTilePlaceholderView
- (PLPhotoTilePlaceholderView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)fadeOutSoonIfNeededAndRemoveFromSuperview:(BOOL)a3;
- (void)layoutSubviews;
- (void)showLoadingIndicatorWhenReady;
@end

@implementation PLPhotoTilePlaceholderView

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PLPhotoTilePlaceholderView;
  [(PLPhotoTilePlaceholderView *)&v16 layoutSubviews];
  [(PLPhotoTilePlaceholderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIActivityIndicatorView setFrame:](self->_loadingIndicatorView, "setFrame:", 10.0, 10.0, 20.0, 20.0);
  -[UILabel sizeThatFits:](self->_loadingLabel, "sizeThatFits:", v8, v10);
  double v12 = v11;
  double v14 = v13;
  v17.origin.x = 10.0;
  v17.origin.y = 10.0;
  v17.size.width = 20.0;
  v17.size.height = 20.0;
  CGFloat v15 = CGRectGetMaxX(v17) + 5.0;
  -[UILabel setFrame:](self->_loadingLabel, "setFrame:", v15, 11.0, v12, v14);
  v18.origin.y = 11.0;
  v18.origin.x = v15;
  v18.size.width = v12;
  v18.size.height = v14;
  CGRectGetMaxX(v18);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  CGRectGetMidY(v19);
  UIRectCenteredXInRect();
  -[UIView setFrame:](self->_loadingContainerView, "setFrame:");
}

- (void)showLoadingIndicatorWhenReady
{
  if (!self->_indicatorIsVisible)
  {
    self->_indicatorIsVisible = 1;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __59__PLPhotoTilePlaceholderView_showLoadingIndicatorWhenReady__block_invoke;
    v3[3] = &unk_1E63D2660;
    v3[4] = self;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __59__PLPhotoTilePlaceholderView_showLoadingIndicatorWhenReady__block_invoke_2;
    v2[3] = &unk_1E63D2688;
    v2[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v3 options:v2 animations:0.25 completion:1.0];
  }
}

uint64_t __59__PLPhotoTilePlaceholderView_showLoadingIndicatorWhenReady__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
}

uint64_t __59__PLPhotoTilePlaceholderView_showLoadingIndicatorWhenReady__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 432) = v3;
  return result;
}

- (void)fadeOutSoonIfNeededAndRemoveFromSuperview:(BOOL)a3
{
  BOOL v3 = a3;
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
    v11[2] = __72__PLPhotoTilePlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke;
    v11[3] = &unk_1E63D2660;
    v11[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PLPhotoTilePlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke_2;
    v10[3] = &unk_1E63D2688;
    v10[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v11 options:v10 animations:0.3 completion:v9];
  }
  else
  {
    [(PLPhotoTilePlaceholderView *)self removeFromSuperview];
  }
}

uint64_t __72__PLPhotoTilePlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __72__PLPhotoTilePlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTilePlaceholderView;
  [(PLPhotoTilePlaceholderView *)&v3 dealloc];
}

- (PLPhotoTilePlaceholderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoTilePlaceholderView;
  objc_super v3 = -[PLPhotoTilePlaceholderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v3->_lastViewPhaseChangeDate = v4;
    [(PLPhotoTilePlaceholderView *)v3 setUserInteractionEnabled:0];
    -[PLPhotoTilePlaceholderView setBackgroundColor:](v3, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
    v3->_loadingContainerView = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2020];
    [(UIView *)v3->_loadingContainerView addSubview:v5];
    [(UIView *)v3->_loadingContainerView sendSubviewToBack:v5];
    [(UIView *)v3->_loadingContainerView setClipsToBounds:1];
    [(CALayer *)[(UIView *)v3->_loadingContainerView layer] setCornerRadius:9.0];
    double v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    v3->_loadingIndicatorView = v6;
    [(UIActivityIndicatorView *)v6 startAnimating];
    [(UIView *)v3->_loadingContainerView addSubview:v3->_loadingIndicatorView];
    double v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    v3->_loadingLabel = v7;
    [(UILabel *)v7 setOpaque:0];
    -[UILabel setBackgroundColor:](v3->_loadingLabel, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
    -[UILabel setFont:](v3->_loadingLabel, "setFont:", [MEMORY[0x1E4F42A30] boldSystemFontOfSize:16.0]);
    [(UILabel *)v3->_loadingLabel setAlpha:0.5];
    -[UILabel setTextColor:](v3->_loadingLabel, "setTextColor:", [MEMORY[0x1E4F428B8] blackColor]);
    [(UILabel *)v3->_loadingLabel setText:PLLocalizedFrameworkString()];
    [(UIView *)v3->_loadingContainerView addSubview:v3->_loadingLabel];
    [(PLPhotoTilePlaceholderView *)v3 addSubview:v3->_loadingContainerView];
  }
  return v3;
}

@end