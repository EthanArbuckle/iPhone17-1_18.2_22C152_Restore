@interface VUIAppInstallView
+ (CGSize)_appIconSize;
+ (double)_appIconRadius;
+ (id)_progressMaskImage;
- (CGSize)intrinsicContentSize;
- (UIImage)appIcon;
- (VUIAppInstallView)initWithFrame:(CGRect)a3;
- (double)installProgress;
- (void)_makeImageBorderVisible:(BOOL)a3;
- (void)dealloc;
- (void)finishInstallationWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)progressViewCanBeRemoved:(id)a3;
- (void)setAppIcon:(id)a3;
- (void)setInstallProgress:(double)a3;
- (void)setWaiting;
@end

@implementation VUIAppInstallView

- (VUIAppInstallView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v23.receiver = self;
  v23.super_class = (Class)VUIAppInstallView;
  v7 = -[VUIAppInstallView initWithFrame:](&v23, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", x, y, width, height);
    appIconImageView = v7->_appIconImageView;
    v7->_appIconImageView = (UIImageView *)v8;

    [(UIImageView *)v7->_appIconImageView setClipsToBounds:1];
    [(UIImageView *)v7->_appIconImageView setAutoresizingMask:18];
    if (([MEMORY[0x1E4FB3C90] isTV] & 1) == 0)
    {
      v10 = v7->_appIconImageView;
      +[VUIAppInstallView _appIconRadius];
      -[UIImageView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:");
      v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v11 scale];
      double v13 = 1.0 / v12;

      v7->_imageBorderWidth = v13;
      v14 = [(UIImageView *)v7->_appIconImageView layer];
      [v14 setBorderWidth:v13];

      v15 = [(UIImageView *)v7->_appIconImageView layer];
      id v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
      objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

      v17 = [(UIImageView *)v7->_appIconImageView layer];
      [v17 setBorderPathIsBounds:1];
    }
    [(VUIAppInstallView *)v7 addSubview:v7->_appIconImageView];
    v18 = -[VUISBIconProgressView initWithFrame:]([VUISBIconProgressView alloc], "initWithFrame:", x, y, width, height);
    progressView = v7->_progressView;
    v7->_progressView = v18;

    [(VUISBIconProgressView *)v7->_progressView setDelegate:v7];
    v20 = v7->_progressView;
    v21 = [(id)objc_opt_class() _progressMaskImage];
    [(VUISBIconProgressView *)v20 setOverlayImage:v21];

    [(VUISBIconProgressView *)v7->_progressView setAutoresizingMask:18];
    [(UIImageView *)v7->_appIconImageView addSubview:v7->_progressView];
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  v2 = objc_opt_class();
  [v2 _appIconSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)VUIAppInstallView;
  [(VUIAppInstallView *)&v11 layoutSubviews];
  [(VUIAppInstallView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->_appIconImageView, "setFrame:");
  -[VUISBIconProgressView setFrame:](self->_progressView, "setFrame:", v4, v6, v8, v10);
}

- (void)dealloc
{
  [(VUISBIconProgressView *)self->_progressView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)VUIAppInstallView;
  [(VUIAppInstallView *)&v3 dealloc];
}

- (void)progressViewCanBeRemoved:(id)a3
{
  completion = (void (**)(id, SEL, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a2, a3);
    id v5 = self->_completion;
    self->_completion = 0;

    [(VUIAppInstallView *)self _makeImageBorderVisible:1];
  }
}

- (void)finishInstallationWithCompletion:(id)a3
{
  double v4 = (void *)[a3 copy];
  id completion = self->_completion;
  self->_id completion = v4;

  progressView = self->_progressView;
  [(VUISBIconProgressView *)progressView setState:0 paused:0 fractionLoaded:1 animated:1.0];
}

- (void)setAppIcon:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_appIcon != v5)
  {
    objc_storeStrong((id *)&self->_appIcon, a3);
    [(UIImageView *)self->_appIconImageView setImage:v5];
  }
}

- (void)setInstallProgress:(double)a3
{
  if (vabdd_f64(self->_installProgress, a3) > 0.00000011920929)
  {
    self->_installProgress = a3;
    -[VUISBIconProgressView setState:paused:fractionLoaded:animated:](self->_progressView, "setState:paused:fractionLoaded:animated:", 2, 0, 1);
    [(VUIAppInstallView *)self _makeImageBorderVisible:0];
  }
}

- (void)setWaiting
{
  [(VUISBIconProgressView *)self->_progressView setState:1 paused:0 fractionLoaded:0 animated:0.0];
  [(VUIAppInstallView *)self _makeImageBorderVisible:0];
}

- (void)_makeImageBorderVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x1E4FB3C90] isTV] & 1) == 0)
  {
    id v5 = [(UIImageView *)self->_appIconImageView layer];
    double imageBorderWidth = 0.0;
    if (v3) {
      double imageBorderWidth = self->_imageBorderWidth;
    }
    id v7 = v5;
    [v5 setBorderWidth:imageBorderWidth];
  }
}

+ (id)_progressMaskImage
{
  BOOL v3 = (void *)_progressMaskImage__progressMaskImage;
  if (!_progressMaskImage__progressMaskImage)
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [a1 _appIconSize];
    double v7 = v6;
    double v9 = v8;
    double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    CGFloat v12 = v11;
    v21.double width = v7;
    v21.double height = v9;
    UIGraphicsBeginImageContextWithOptions(v21, 0, v12);

    double v13 = [MEMORY[0x1E4FB1618] blackColor];
    [v13 setFill];

    v14 = (void *)MEMORY[0x1E4FB14C0];
    [a1 _appIconRadius];
    id v16 = objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v4, v5, v7, v9, v15);
    [v16 fillWithBlendMode:17 alpha:1.0];

    uint64_t v17 = UIGraphicsGetImageFromCurrentImageContext();
    v18 = (void *)_progressMaskImage__progressMaskImage;
    _progressMaskImage__progressMaskImage = v17;

    UIGraphicsEndImageContext();
    BOOL v3 = (void *)_progressMaskImage__progressMaskImage;
  }
  return v3;
}

+ (double)_appIconRadius
{
  [a1 _appIconSize];
  +[VUIAppIconImageService iconCornerRadiusForSize:](VUIAppIconImageService, "iconCornerRadiusForSize:");
  return result;
}

+ (CGSize)_appIconSize
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 2;

  double v4 = dbl_1E38FE210[v3];
  double v5 = dbl_1E38FE220[v3];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (double)installProgress
{
  return self->_installProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_backgroundKnockoutView, 0);
  objc_storeStrong((id *)&self->_appIconImageView, 0);
}

@end