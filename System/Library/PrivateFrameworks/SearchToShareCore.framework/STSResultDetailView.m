@interface STSResultDetailView
- (BOOL)isFullscreen;
- (BOOL)showReportConcern;
- (BOOL)useBackgroundBlur;
- (CGRect)contentFrameForBounds:(CGRect)a3 traitCollection:(id)a4;
- (CGSize)contentSize;
- (CGSize)providerIconSize;
- (NSString)providerName;
- (STSAnimatedImageInfo)thumbnailInfo;
- (STSResultDetailView)initWithFrame:(CGRect)a3;
- (STSResultDetailViewDelegate)delegate;
- (UIButton)reportConcernButton;
- (UIEdgeInsets)layoutMargins;
- (UIImage)providerIcon;
- (UIImage)thumbnail;
- (UIView)customContentView;
- (void)_calculateFramesForBounds:(CGRect)a3 traitCollection:(id)a4 andSetFrames:(BOOL)a5 contentFrame:(CGRect *)a6;
- (void)_didTapProvider:(id)a3;
- (void)_didTapReportConcern:(id)a3;
- (void)_didTapSend:(id)a3;
- (void)layoutSubviews;
- (void)setContentSize:(CGSize)a3;
- (void)setCustomContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsFullscreen:(BOOL)a3;
- (void)setProviderIcon:(id)a3;
- (void)setProviderIconSize:(CGSize)a3;
- (void)setProviderName:(id)a3;
- (void)setReportConcernButton:(id)a3;
- (void)setShowReportConcern:(BOOL)a3;
- (void)setUseBackgroundBlur:(BOOL)a3;
- (void)updateReportConcernButtonTitle;
- (void)updateWithThumbnail:(id)a3 orThumbnailInfo:(id)a4;
@end

@implementation STSResultDetailView

- (STSResultDetailView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)STSResultDetailView;
  v3 = -[STSResultDetailView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x263F825C8], "sts_detailViewBackgroundColor");
    [(STSResultDetailView *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x263F825C8] whiteColor];
    [(STSResultDetailView *)v3 setTintColor:v5];

    v6 = [STSResultDetailFooter alloc];
    uint64_t v7 = -[STSResultDetailFooter initWithFrame:](v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    footer = v3->_footer;
    v3->_footer = (STSResultDetailFooter *)v7;

    v9 = [(STSResultDetailFooter *)v3->_footer providerButton];
    [v9 addTarget:v3 action:sel__didTapProvider_ forControlEvents:64];

    v10 = [(STSResultDetailFooter *)v3->_footer sendButton];
    [v10 addTarget:v3 action:sel__didTapSend_ forControlEvents:64];

    [(STSResultDetailView *)v3 addSubview:v3->_footer];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(STSResultDetailView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(STSResultDetailView *)self traitCollection];
  -[STSResultDetailView _calculateFramesForBounds:traitCollection:andSetFrames:contentFrame:](self, "_calculateFramesForBounds:traitCollection:andSetFrames:contentFrame:", v11, 1, 0, v4, v6, v8, v10);
}

- (void)_calculateFramesForBounds:(CGRect)a3 traitCollection:(id)a4 andSetFrames:(BOOL)a5 contentFrame:(CGRect *)a6
{
  BOOL v7 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  [(STSResultDetailView *)self layoutMargins];
  double v50 = y;
  double v16 = width - (v14 + v15);
  double v19 = height - (v17 + v18);
  if ([v13 horizontalSizeClass] == 1 || objc_msgSend(v13, "verticalSizeClass") == 1)
  {
    double v48 = dbl_22F40E7D0[v16 < v19];
  }
  else
  {
    v53.origin.double x = x;
    v53.origin.CGFloat y = y;
    v53.size.double width = width;
    v53.size.double height = height;
    double v20 = CGRectGetWidth(v53);
    v54.origin.double x = x;
    v54.origin.CGFloat y = y;
    v54.size.double width = width;
    v54.size.double height = height;
    double v21 = CGRectGetHeight(v54);
    if (v20 < v21) {
      double v21 = v20;
    }
    if (v21 >= 1024.0) {
      double v48 = dbl_22F40E7B0[v16 < v19];
    }
    else {
      double v48 = dbl_22F40E7C0[v16 < v19];
    }
  }
  if (v16 >= v19) {
    double v22 = v19;
  }
  else {
    double v22 = v16;
  }
  UICeilToViewScale();
  double v24 = v23;
  [(STSResultDetailView *)self contentSize];
  UISizeAspectFitSizeInSizeScale(v25, v26, v22, v24, 0.0);
  UIRectCenteredIntegralRectScale();
  double v30 = v29;
  double v32 = v31;
  remainder.origin.double x = v29;
  remainder.origin.CGFloat y = v31;
  remainder.size.double width = v27;
  remainder.size.double height = v28;
  if (self->_isFullscreen)
  {
    v55.origin.double x = x;
    v55.origin.CGFloat y = y;
    CGFloat rect = v27;
    v55.size.double width = width;
    CGFloat v33 = v28;
    v55.size.double height = height;
    CGFloat v34 = v30;
    double v35 = CGRectGetHeight(v55);
    v56.origin.double x = v34;
    v56.origin.CGFloat y = v32;
    v56.size.double width = rect;
    v56.size.double height = v33;
    double v36 = v35 - CGRectGetMaxY(v56);
    v57.origin.double x = x;
    v57.origin.CGFloat y = v50;
    v57.size.double width = width;
    v57.size.double height = height;
    CGFloat v37 = CGRectGetHeight(v57);
    CGFloat v28 = v33;
    CGFloat v27 = rect;
    double v30 = v34;
    if (v36 < v48 * v37)
    {
      v58.origin.double x = x;
      v58.origin.CGFloat y = v50;
      v58.size.double width = width;
      v58.size.double height = height;
      CGRectGetHeight(v58);
      UICeilToViewScale();
      CGFloat v28 = v33;
      CGFloat v27 = rect;
      double v30 = v34;
      double v32 = v32 - v38;
      remainder.origin.CGFloat y = v32;
    }
  }
  CGSize v39 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  slice.origin = (CGPoint)*MEMORY[0x263F001A8];
  slice.CGSize size = v39;
  double v40 = v30;
  v39.double width = v32;
  CGRectDivide(*(CGRect *)(&v27 - 2), &slice, &remainder, 52.0, CGRectMaxYEdge);
  slice.origin.double x = slice.origin.x + -10.0;
  slice.size.double width = slice.size.width + 20.0;
  if (self->_showReportConcern)
  {
    [(UIButton *)self->_reportConcernButton sizeToFit];
    [(UIButton *)self->_reportConcernButton frame];
    double v42 = width - v41 + -16.0;
    [(UIButton *)self->_reportConcernButton frame];
    double v44 = height - v43 + -24.0;
    [(UIButton *)self->_reportConcernButton frame];
    double v46 = v45;
    [(UIButton *)self->_reportConcernButton frame];
    -[UIButton setFrame:](self->_reportConcernButton, "setFrame:", v42, v44, v46);
  }
  if (a6)
  {
    CGSize size = remainder.size;
    a6->origin = remainder.origin;
    a6->CGSize size = size;
  }
  if (v7)
  {
    -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:", x, v50, width, height);
    -[UIView setFrame:](self->_customContentView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    -[UIImageView setFrame:](self->_thumbnailView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    -[STSResultDetailFooter setFrame:](self->_footer, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
}

- (UIEdgeInsets)layoutMargins
{
  double v2 = 0.0;
  double v3 = 6.0;
  double v4 = 0.0;
  double v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_didTapProvider:(id)a3
{
  id v4 = [(STSResultDetailView *)self delegate];
  [v4 detailViewDidTapProvider:self];
}

- (void)_didTapSend:(id)a3
{
  id v4 = [(STSResultDetailView *)self delegate];
  [v4 detailViewDidTapSend:self];
}

- (void)_didTapReportConcern:(id)a3
{
  id v4 = [(STSResultDetailView *)self delegate];
  [v4 detailViewDidTapReportConcern:self];
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
  [(STSResultDetailView *)self setNeedsLayout];
}

- (void)setCustomContentView:(id)a3
{
  double v5 = (UIView *)a3;
  p_customContentView = &self->_customContentView;
  customContentView = self->_customContentView;
  id v11 = v5;
  if (customContentView != v5)
  {
    [(UIView *)customContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_customContentView, a3);
    if (*p_customContentView)
    {
      p_thumbnailView = (id *)&self->_thumbnailView;
      double v9 = [(UIImageView *)self->_thumbnailView superview];
      if (!v9) {
        p_thumbnailView = (id *)&self->_footer;
      }
      id v10 = *p_thumbnailView;

      [(STSResultDetailView *)self insertSubview:*p_customContentView belowSubview:v10];
      [(STSResultDetailView *)self setNeedsLayout];
      [(STSResultDetailView *)self layoutIfNeeded];
    }
  }
}

- (void)updateWithThumbnail:(id)a3 orThumbnailInfo:(id)a4
{
  id v19 = a3;
  id v7 = a4;
  p_thumbnail = &self->_thumbnail;
  if (*(_OWORD *)&self->_thumbnail != __PAIR128__((unint64_t)v7, (unint64_t)v19))
  {
    objc_storeStrong((id *)&self->_thumbnail, a3);
    p_thumbnailInfo = &self->_thumbnailInfo;
    objc_storeStrong((id *)&self->_thumbnailInfo, a4);
    if (*p_thumbnail || *p_thumbnailInfo)
    {
      thumbnailView = self->_thumbnailView;
      if (!thumbnailView)
      {
        id v11 = objc_alloc(MEMORY[0x263F82828]);
        objc_super v12 = (UIImageView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        id v13 = self->_thumbnailView;
        self->_thumbnailView = v12;

        double v14 = self->_thumbnailView;
        double v15 = [MEMORY[0x263F825C8] blackColor];
        [(UIImageView *)v14 setBackgroundColor:v15];

        [(UIImageView *)self->_thumbnailView setContentMode:1];
        [(STSResultDetailView *)self insertSubview:self->_thumbnailView belowSubview:self->_footer];
        [(STSResultDetailView *)self setNeedsLayout];
        [(STSResultDetailView *)self layoutIfNeeded];
        thumbnailView = self->_thumbnailView;
      }
      double v16 = [(UIImageView *)thumbnailView layer];
      [v16 removeAllAnimations];

      double v17 = self->_thumbnailView;
      if (*p_thumbnailInfo)
      {
        [(UIImageView *)v17 setImage:0];
        [(UIImageView *)self->_thumbnailView sts_addAnimationsForSTSAnimatedImageInfo:*p_thumbnailInfo];
      }
      else
      {
        [(UIImageView *)v17 setImage:*p_thumbnail];
      }
    }
    else
    {
      [(UIImageView *)self->_thumbnailView removeFromSuperview];
      double v18 = self->_thumbnailView;
      self->_thumbnailView = 0;
    }
  }
}

- (CGRect)contentFrameForBounds:(CGRect)a3 traitCollection:(id)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v9 = *MEMORY[0x263F001A8];
  long long v10 = v4;
  -[STSResultDetailView _calculateFramesForBounds:traitCollection:andSetFrames:contentFrame:](self, "_calculateFramesForBounds:traitCollection:andSetFrames:contentFrame:", a4, 0, &v9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = *((double *)&v9 + 1);
  double v5 = *(double *)&v9;
  double v8 = *((double *)&v10 + 1);
  double v7 = *(double *)&v10;
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.CGFloat y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGSize)providerIconSize
{
  [(STSResultDetailFooter *)self->_footer providerIconSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setProviderIconSize:(CGSize)a3
{
}

- (UIImage)providerIcon
{
  return [(STSResultDetailFooter *)self->_footer providerIcon];
}

- (void)setProviderIcon:(id)a3
{
}

- (NSString)providerName
{
  double v2 = [(STSResultDetailFooter *)self->_footer providerButton];
  double v3 = [v2 titleForState:0];

  return (NSString *)v3;
}

- (void)setProviderName:(id)a3
{
  footer = self->_footer;
  id v4 = a3;
  id v5 = [(STSResultDetailFooter *)footer providerButton];
  [v5 setTitle:v4 forState:0];
}

- (void)setIsFullscreen:(BOOL)a3
{
  if (self->_isFullscreen != a3)
  {
    self->_isFullscreen = a3;
    [(STSResultDetailView *)self setNeedsLayout];
  }
}

- (void)setUseBackgroundBlur:(BOOL)a3
{
  if (self->_useBackgroundBlur != a3)
  {
    self->_useBackgroundBlur = a3;
    if (a3)
    {
      id v4 = [MEMORY[0x263F825C8] clearColor];
      [(STSResultDetailView *)self setBackgroundColor:v4];

      id v9 = [MEMORY[0x263F824D8] effectWithStyle:2];
      id v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v9];
      backgroundView = self->_backgroundView;
      self->_backgroundView = v5;

      double v7 = self->_backgroundView;
      [(STSResultDetailView *)self bounds];
      -[UIVisualEffectView setFrame:](v7, "setFrame:");
      [(STSResultDetailView *)self addSubview:self->_backgroundView];
      [(STSResultDetailView *)self sendSubviewToBack:self->_backgroundView];
    }
    else
    {
      [(UIVisualEffectView *)self->_backgroundView removeFromSuperview];
      double v8 = self->_backgroundView;
      self->_backgroundView = 0;

      objc_msgSend(MEMORY[0x263F825C8], "sts_detailViewBackgroundColor");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      -[STSResultDetailView setBackgroundColor:](self, "setBackgroundColor:");
    }
  }
}

- (void)setShowReportConcern:(BOOL)a3
{
  if (self->_showReportConcern != a3)
  {
    self->_showReportConcern = a3;
    reportConcernButton = self->_reportConcernButton;
    if (a3)
    {
      if (!reportConcernButton)
      {
        id v5 = [MEMORY[0x263F824E8] buttonWithType:1];
        double v6 = self->_reportConcernButton;
        self->_reportConcernButton = v5;

        double v7 = self->_reportConcernButton;
        double v8 = [MEMORY[0x263F825C8] systemPinkColor];
        [(UIButton *)v7 setTitleColor:v8 forState:0];

        -[UIButton setContentEdgeInsets:](self->_reportConcernButton, "setContentEdgeInsets:", 10.0, 0.0, 10.0, 0.0);
        id v9 = [(UIButton *)self->_reportConcernButton titleLabel];
        long long v10 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
        [v9 setFont:v10];

        [(UIButton *)self->_reportConcernButton addTarget:self action:sel__didTapReportConcern_ forControlEvents:64];
        [(STSResultDetailView *)self addSubview:self->_reportConcernButton];
      }
    }
    else if (reportConcernButton)
    {
      [(UIButton *)reportConcernButton removeFromSuperview];
      id v11 = self->_reportConcernButton;
      self->_reportConcernButton = 0;
    }
    [(STSResultDetailView *)self setNeedsLayout];
    [(STSResultDetailView *)self layoutIfNeeded];
  }
}

- (void)updateReportConcernButtonTitle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke;
  block[3] = &unk_264A053F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 472) setEnabled:0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_2;
  v4[3] = &unk_264A053F0;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_3;
  v3[3] = &unk_264A057A0;
  v3[4] = v5;
  return [MEMORY[0x263F82E00] animateWithDuration:v4 animations:v3 completion:0.25];
}

uint64_t __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:0.0];
}

uint64_t __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 472) setTitle:@"Feedback submitted" forState:0];
  [*(id *)(*(void *)(a1 + 32) + 472) sizeToFit];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_4;
  v3[3] = &unk_264A053F0;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F82E00] animateWithDuration:v3 animations:0.25];
}

uint64_t __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:1.0];
}

- (STSResultDetailViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSResultDetailViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)customContentView
{
  return self->_customContentView;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (STSAnimatedImageInfo)thumbnailInfo
{
  return self->_thumbnailInfo;
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (BOOL)useBackgroundBlur
{
  return self->_useBackgroundBlur;
}

- (UIButton)reportConcernButton
{
  return self->_reportConcernButton;
}

- (void)setReportConcernButton:(id)a3
{
}

- (BOOL)showReportConcern
{
  return self->_showReportConcern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportConcernButton, 0);
  objc_storeStrong((id *)&self->_thumbnailInfo, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end