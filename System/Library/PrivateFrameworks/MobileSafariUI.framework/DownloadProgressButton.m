@interface DownloadProgressButton
- (BOOL)showsProgressRing;
- (DownloadProgressButton)initWithFrame:(CGRect)a3;
- (double)progress;
- (void)layoutSubviews;
- (void)setProgress:(double)a3;
- (void)setShowsProgressRing:(BOOL)a3;
@end

@implementation DownloadProgressButton

- (DownloadProgressButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)DownloadProgressButton;
  v7 = -[DownloadProgressButton initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F78320]), "initWithFrame:", x, y, width, height);
    progressView = v7->_progressView;
    v7->_progressView = (SFProgressView *)v8;

    [(SFProgressView *)v7->_progressView setTrackWidth:3.0];
    v10 = [MEMORY[0x1E4FB1618] labelColor];
    [(SFProgressView *)v7->_progressView setTintColor:v10];

    v11 = [MEMORY[0x1E4FB1618] systemFillColor];
    [(SFProgressView *)v7->_progressView setTrackTintColor:v11];

    [(SFProgressView *)v7->_progressView setUserInteractionEnabled:0];
    [(DownloadProgressButton *)v7 addSubview:v7->_progressView];
    v12 = v7;
  }

  return v7;
}

- (double)progress
{
  [(SFProgressView *)self->_progressView progress];
  return result;
}

- (void)setProgress:(double)a3
{
}

- (BOOL)showsProgressRing
{
  return [(SFProgressView *)self->_progressView isHidden];
}

- (void)setShowsProgressRing:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)DownloadProgressButton;
  [(DownloadProgressButton *)&v10 layoutSubviews];
  [(DownloadProgressButton *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double v7 = CGRectGetWidth(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v12);
  if (v7 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  -[SFProgressView setFrame:](self->_progressView, "setFrame:", (v7 - v9) * 0.5, (v8 - v9) * 0.5, v9, v9);
  [(SFProgressView *)self->_progressView setRadius:v9 * 0.5];
}

- (void).cxx_destruct
{
}

@end