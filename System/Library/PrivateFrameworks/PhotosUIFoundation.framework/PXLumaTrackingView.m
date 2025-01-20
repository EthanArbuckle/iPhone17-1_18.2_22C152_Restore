@interface PXLumaTrackingView
- (BOOL)lumaTrackingEnabled;
- (PXLumaTrackingView)initWithCoder:(id)a3;
- (PXLumaTrackingView)initWithFrame:(CGRect)a3;
- (PXLumaTrackingView)initWithFrame:(CGRect)a3 threshold:(double)a4;
- (PXLumaTrackingView)initWithThreshold:(double)a3;
- (PXLumaTrackingViewDelegate)delegate;
- (double)thresholdLuma;
- (int64_t)lumaLevel;
- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setLumaLevel:(int64_t)a3;
- (void)setLumaTrackingEnabled:(BOOL)a3;
@end

@implementation PXLumaTrackingView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (double)thresholdLuma
{
  return self->_thresholdLuma;
}

- (BOOL)lumaTrackingEnabled
{
  return self->_lumaTrackingEnabled;
}

- (void)setDelegate:(id)a3
{
}

- (PXLumaTrackingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PXLumaTrackingViewDelegate *)WeakRetained;
}

- (int64_t)lumaLevel
{
  return self->_lumaLevel;
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  if (a4 == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = a4 == 2;
  }
  [(PXLumaTrackingView *)self setLumaLevel:v4];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXLumaTrackingView;
  [(PXLumaTrackingView *)&v3 layoutSubviews];
  [(PXLumaTrackingView *)self bounds];
  -[_UILumaTrackingBackdropView setFrame:](self->_backdropView, "setFrame:");
}

- (void)setLumaTrackingEnabled:(BOOL)a3
{
  if (self->_lumaTrackingEnabled != a3)
  {
    self->_lumaTrackingEnabled = a3;
    [(_UILumaTrackingBackdropView *)self->_backdropView setPaused:!a3];
  }
}

- (void)setLumaLevel:(int64_t)a3
{
  if (self->_lumaLevel != a3)
  {
    self->_lumaLevel = a3;
    id v5 = [(PXLumaTrackingView *)self delegate];
    [v5 lumaTrackingView:self didTransitionToLevel:a3];
  }
}

- (PXLumaTrackingView)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXLumaTrackingView.m", 54, @"%s is not available as initializer", "-[PXLumaTrackingView initWithCoder:]");

  abort();
}

- (PXLumaTrackingView)initWithFrame:(CGRect)a3
{
  return -[PXLumaTrackingView initWithFrame:threshold:](self, "initWithFrame:threshold:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.5);
}

- (PXLumaTrackingView)initWithThreshold:(double)a3
{
  return -[PXLumaTrackingView initWithFrame:threshold:](self, "initWithFrame:threshold:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), a3);
}

- (PXLumaTrackingView)initWithFrame:(CGRect)a3 threshold:(double)a4
{
  v17.receiver = self;
  v17.super_class = (Class)PXLumaTrackingView;
  id v5 = -[PXLumaTrackingView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_thresholdLuma = a4;
    id v7 = objc_alloc(MEMORY[0x263F83048]);
    double v8 = fmax(a4 + -0.05, 0.0);
    if (a4 + 0.05 <= 1.0) {
      double v9 = a4 + 0.05;
    }
    else {
      double v9 = 1.0;
    }
    [(PXLumaTrackingView *)v6 bounds];
    uint64_t v14 = objc_msgSend(v7, "initWithTransitionBoundaries:delegate:frame:", v6, v8, v9, v10, v11, v12, v13);
    backdropView = v6->_backdropView;
    v6->_backdropView = (_UILumaTrackingBackdropView *)v14;

    [(PXLumaTrackingView *)v6 addSubview:v6->_backdropView];
  }
  return v6;
}

@end