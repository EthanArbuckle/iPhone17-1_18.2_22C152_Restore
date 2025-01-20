@interface STSCellDownloadOverlayView
- (STSCellDownloadOverlayView)initWithFrame:(CGRect)a3;
- (STSRoundProgressView)progressView;
- (void)layoutSubviews;
@end

@implementation STSCellDownloadOverlayView

- (STSCellDownloadOverlayView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STSCellDownloadOverlayView;
  v3 = -[STSCellDownloadOverlayView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [(STSCellDownloadOverlayView *)v3 setBackgroundColor:v4];

    v5 = [STSRoundProgressView alloc];
    uint64_t v6 = -[STSRoundProgressView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    progressView = v3->_progressView;
    v3->_progressView = (STSRoundProgressView *)v6;

    [(STSCellDownloadOverlayView *)v3 addSubview:v3->_progressView];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(STSCellDownloadOverlayView *)self bounds];
  UIRectCenteredIntegralRectScale();
  progressView = self->_progressView;

  -[STSRoundProgressView setFrame:](progressView, "setFrame:");
}

- (STSRoundProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
}

@end