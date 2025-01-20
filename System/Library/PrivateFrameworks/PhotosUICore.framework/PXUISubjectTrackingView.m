@interface PXUISubjectTrackingView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CALayer)edrGainLayer;
- (PXUISubjectTrackingView)initWithMediaView:(id)a3 cineController:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didAddSubview:(id)a3;
- (void)layoutSubviews;
- (void)setEdrGainLayer:(id)a3;
- (void)setUpEDRGainLayer;
- (void)viewDoubleTapped:(id)a3;
- (void)viewLongPressed:(id)a3;
- (void)viewTapped:(id)a3;
@end

@implementation PXUISubjectTrackingView

- (void).cxx_destruct
{
}

- (void)setEdrGainLayer:(id)a3
{
}

- (CALayer)edrGainLayer
{
  return self->_edrGainLayer;
}

- (void)didAddSubview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXUISubjectTrackingView;
  [(PXUISubjectTrackingView *)&v8 didAddSubview:a3];
  v4 = [(PXUISubjectTrackingView *)self edrGainLayer];

  if (v4)
  {
    v5 = [(PXUISubjectTrackingView *)self edrGainLayer];
    [v5 removeFromSuperlayer];

    v6 = [(PXUISubjectTrackingView *)self layer];
    v7 = [(PXUISubjectTrackingView *)self edrGainLayer];
    [v6 addSublayer:v7];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PXUISubjectTrackingView;
  [(PXSubjectTrackingView *)&v12 layoutSubviews];
  [(PXUISubjectTrackingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PXUISubjectTrackingView *)self edrGainLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)viewLongPressed:(id)a3
{
  id v9 = a3;
  if ([(PXSubjectTrackingView *)self viewEnabled])
  {
    [(PXSubjectTrackingView *)self handleInteractionBegan];
    if ([v9 state] == 1)
    {
      double v4 = [(PXSubjectTrackingView *)self mediaView];
      [v9 locationInView:v4];
      double v6 = v5;
      double v8 = v7;

      -[PXSubjectTrackingView handleLongSelectOnPoint:](self, "handleLongSelectOnPoint:", v6, v8);
    }
  }
}

- (void)viewDoubleTapped:(id)a3
{
  id v9 = a3;
  if ([(PXSubjectTrackingView *)self viewEnabled])
  {
    [(PXSubjectTrackingView *)self handleInteractionBegan];
    if ([v9 state] == 3)
    {
      double v4 = [(PXSubjectTrackingView *)self mediaView];
      [v9 locationInView:v4];
      double v6 = v5;
      double v8 = v7;

      -[PXSubjectTrackingView handleDoubleSelectOnPoint:](self, "handleDoubleSelectOnPoint:", v6, v8);
    }
  }
}

- (void)viewTapped:(id)a3
{
  id v9 = a3;
  if ([(PXSubjectTrackingView *)self viewEnabled])
  {
    [(PXSubjectTrackingView *)self handleInteractionBegan];
    if ([v9 state] == 3)
    {
      double v4 = [(PXSubjectTrackingView *)self mediaView];
      [v9 locationInView:v4];
      double v6 = v5;
      double v8 = v7;

      -[PXSubjectTrackingView handleSingleSelectOnPoint:](self, "handleSingleSelectOnPoint:", v6, v8);
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [(PXSubjectTrackingView *)self mediaView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  -[PXSubjectTrackingView normalizedPointForViewPoint:](self, "normalizedPointForViewPoint:", v7, v9);
  BOOL v12 = v11 >= 0.0;
  if (v11 > 1.0) {
    BOOL v12 = 0;
  }
  if (v10 < 0.0) {
    BOOL v12 = 0;
  }
  return v10 <= 1.0 && v12;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(PXSubjectTrackingView *)self mediaView];
  double v9 = objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);

  return v9;
}

- (void)setUpEDRGainLayer
{
  id v4 = +[PXEDRGainLayer layer];
  [(PXUISubjectTrackingView *)self setEdrGainLayer:v4];
  double v3 = [(PXUISubjectTrackingView *)self layer];
  [v3 addSublayer:v4];
}

- (PXUISubjectTrackingView)initWithMediaView:(id)a3 cineController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXUISubjectTrackingView.m", 26, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PXUISubjectTrackingView.m", 27, @"Invalid parameter not satisfying: %@", @"cineController != nil" object file lineNumber description];

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)PXUISubjectTrackingView;
  double v10 = [(PXSubjectTrackingView *)&v24 initWithMediaView:v7 cineController:v9];
  if (v10)
  {
    double v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v10 action:sel_viewTapped_];
    [v11 setDelegate:v10];
    BOOL v12 = [(PXSubjectTrackingView *)v10 mediaView];
    [v12 addGestureRecognizer:v11];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v10 action:sel_viewDoubleTapped_];
    [v13 setNumberOfTapsRequired:2];
    [v13 setDelegate:v10];
    v14 = [(PXSubjectTrackingView *)v10 mediaView];
    [v14 addGestureRecognizer:v13];

    [v11 requireGestureRecognizerToFail:v13];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v10 action:sel_viewLongPressed_];
    [v15 setDelegate:v10];
    v16 = [(PXSubjectTrackingView *)v10 mediaView];
    [v16 addGestureRecognizer:v15];

    uint64_t v17 = [v9 asset];
    if (v17)
    {
      v18 = (void *)v17;
      v19 = [v9 asset];
      int v20 = [v19 isHDRVideo];

      if (v20) {
        [(PXUISubjectTrackingView *)v10 setUpEDRGainLayer];
      }
    }
  }
  return v10;
}

@end