@interface MusicDownloadProgressView
- (MusicDownloadProgressView)initWithFrame:(CGRect)a3;
- (UIImage)centerImage;
- (UIImageView)centerImageView;
- (UIView)outerRingView;
- (_MusicDownloadProgressRingView)progressView;
- (double)downloadProgress;
- (void)layoutSubviews;
- (void)setCenterImage:(id)a3;
- (void)setCenterImageView:(id)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setOuterRingColor:(id)a3;
- (void)setOuterRingView:(id)a3;
- (void)setProgressView:(id)a3;
- (void)tintColorDidChange;
- (void)updateOuterRingColor;
@end

@implementation MusicDownloadProgressView

- (MusicDownloadProgressView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MusicDownloadProgressView;
  v3 = -[MusicDownloadProgressView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIView);
    [(MusicDownloadProgressView *)v3 bounds];
    v5 = [v4 initWithFrame:];
    outerRingView = v3->_outerRingView;
    v3->_outerRingView = v5;

    [(UIView *)v3->_outerRingView setClipsToBounds:1];
    [(MusicDownloadProgressView *)v3 addSubview:v3->_outerRingView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)MusicDownloadProgressView;
  [(MusicDownloadProgressView *)&v28 layoutSubviews];
  v3 = [(MusicDownloadProgressView *)self traitCollection];
  [v3 displayScale];
  MTMPUFloatGetSafeScaleForValue();
  double v5 = v4;
  double v26 = v4;

  [(MusicDownloadProgressView *)self bounds];
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  double v10 = CGRectGetWidth(v29);
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  double v11 = CGRectGetHeight(v30);
  if (v10 < v11) {
    double v11 = v10;
  }
  double v27 = v11 * 0.5;
  -[_MusicDownloadProgressRingView setFrame:](self->_progressView, "setFrame:", x, y, width, height);
  [(UIImageView *)self->_centerImageView frame];
  -[UIImageView sizeThatFits:](self->_centerImageView, "sizeThatFits:", width, height);
  double v25 = v5;
  UIRectCenteredIntegralRectScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(UIImage *)self->_centerImage alignmentRectInsets];
  -[UIImageView setFrame:](self->_centerImageView, "setFrame:", v13 + v23, v15 + v20, v17 - (v23 + v21), v19 - (v20 + v22));
  -[UIView setFrame:](self->_outerRingView, "setFrame:", x, y, width, height);
  v24 = [(UIView *)self->_outerRingView layer];
  [v24 setCornerRadius:v27];
  [v24 setBorderWidth:1.0 / v26 + 2.0];
  [(MusicDownloadProgressView *)self updateOuterRingColor];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MusicDownloadProgressView;
  [(MusicDownloadProgressView *)&v3 tintColorDidChange];
  [(MusicDownloadProgressView *)self updateOuterRingColor];
}

- (void)setCenterImage:(id)a3
{
  double v5 = (UIImage *)a3;
  p_centerImage = &self->_centerImage;
  if (self->_centerImage != v5)
  {
    double v10 = v5;
    objc_storeStrong((id *)&self->_centerImage, a3);
    centerImageView = self->_centerImageView;
    if (*p_centerImage)
    {
      if (!centerImageView)
      {
        objc_super v8 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        v9 = self->_centerImageView;
        self->_centerImageView = v8;

        [(MusicDownloadProgressView *)self addSubview:self->_centerImageView];
        centerImageView = self->_centerImageView;
      }
      [(UIImageView *)centerImageView setHidden:0];
      [(UIImageView *)self->_centerImageView setImage:*p_centerImage];
    }
    else
    {
      [(UIImageView *)centerImageView setHidden:1];
    }
    [(MusicDownloadProgressView *)self setNeedsLayout];
    double v5 = v10;
  }
}

- (void)setDownloadProgress:(double)a3
{
  if ((MTMPUFloatEqualToFloat() & 1) == 0)
  {
    self->_downloadProgress = a3;
    int v5 = MTMPUFloatLessThanOrEqualToFloat();
    progressView = self->_progressView;
    if (v5)
    {
      [(_MusicDownloadProgressRingView *)progressView removeFromSuperview];
      v7 = self->_progressView;
      self->_progressView = 0;
    }
    else
    {
      if (!progressView)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = __49__MusicDownloadProgressView_setDownloadProgress___block_invoke;
        v8[3] = &unk_420108;
        v8[4] = self;
        +[UIView performWithoutAnimation:v8];
        progressView = self->_progressView;
      }
      [(_MusicDownloadProgressRingView *)progressView setProgress:self->_downloadProgress];
    }
  }
}

void __49__MusicDownloadProgressView_setDownloadProgress___block_invoke(uint64_t a1)
{
  v2 = [_MusicDownloadProgressRingView alloc];
  [*(id *)(a1 + 32) bounds];
  objc_super v3 = -[_MusicDownloadProgressRingView initWithFrame:](v2, "initWithFrame:");
  [*(id *)(a1 + 32) setProgressView:v3];

  double v4 = [*(id *)(a1 + 32) progressView];
  [v4 setProgress:0.0];

  int v5 = *(void **)(a1 + 32);
  id v6 = [v5 progressView];
  [v5 addSubview:v6];
}

- (void)updateOuterRingColor
{
  id v3 = +[UIColor secondarySystemBackgroundColor];
  [(MusicDownloadProgressView *)self setOuterRingColor:v3];
}

- (void)setOuterRingColor:(id)a3
{
  outerRingView = self->_outerRingView;
  id v4 = a3;
  id v7 = [(UIView *)outerRingView layer];
  id v5 = v4;
  id v6 = [v5 CGColor];

  [v7 setBorderColor:v6];
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (UIImageView)centerImageView
{
  return self->_centerImageView;
}

- (void)setCenterImageView:(id)a3
{
}

- (UIView)outerRingView
{
  return self->_outerRingView;
}

- (void)setOuterRingView:(id)a3
{
}

- (_MusicDownloadProgressRingView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_outerRingView, 0);
  objc_storeStrong((id *)&self->_centerImageView, 0);

  objc_storeStrong((id *)&self->_centerImage, 0);
}

@end