@interface PXUIPortraitFocusView
- (BOOL)drawingEnabled;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CALayer)edrGainLayer;
- (PXUIPortraitFocusView)initWithMediaView:(id)a3 isHDR:(BOOL)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_viewTapped:(id)a3;
- (void)animateNextRender;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDrawingEnabled:(BOOL)a3;
- (void)setEdrGainLayer:(id)a3;
- (void)setUpEDRGainLayer;
@end

@implementation PXUIPortraitFocusView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edrGainLayer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_fixedFocusView, 0);
}

- (void)setEdrGainLayer:(id)a3
{
}

- (CALayer)edrGainLayer
{
  return self->_edrGainLayer;
}

- (void)setDrawingEnabled:(BOOL)a3
{
  self->_drawingEnabled = a3;
}

- (BOOL)drawingEnabled
{
  return self->_drawingEnabled;
}

- (void)drawRect:(CGRect)a3
{
  if ([(PXUIPortraitFocusView *)self drawingEnabled])
  {
    v4 = [(PXPortraitFocusView *)self focusViewDelegate];
    [v4 currentFocusRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    -[CEKSubjectIndicatorView setFrame:](self->_fixedFocusView, "setFrame:", v6, v8, v10, v12);
    id v15 = [(CEKSubjectIndicatorView *)self->_fixedFocusView layer];
    [v15 removeAllAnimations];
    if (self->_animateNextRender)
    {
      self->_animateNextRender = 0;
      v13 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale"];
      [v13 setDuration:0.2];
      v14 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v13 setTimingFunction:v14];

      [v13 setFromValue:&unk_1F02DA830];
      [v13 setToValue:&unk_1F02DA840];
      [v13 setRepeatCount:0.0];
      [v13 setAutoreverses:0];
      [v15 addAnimation:v13 forKey:@"shrink"];
    }
  }
}

- (void)animateNextRender
{
  self->_animateNextRender = 1;
}

- (void)_viewTapped:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [v4 locationInView:self];
    -[PXPortraitFocusView focusPointChanged:](self, "focusPointChanged:");
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  if (self->_tapGestureRecognizer == v4)
  {
    double v6 = [(PXPortraitFocusView *)self mediaView];

    if (v6)
    {
      double v7 = [(PXPortraitFocusView *)self mediaView];
      double v8 = [v7 superview];
      [(UITapGestureRecognizer *)v4 locationInView:v8];
      CGFloat v10 = v9;
      CGFloat v12 = v11;

      v13 = [(PXPortraitFocusView *)self mediaView];
      [v13 imageFrame];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;

      v24.origin.x = v15;
      v24.origin.y = v17;
      v24.size.width = v19;
      v24.size.height = v21;
      v23.x = v10;
      v23.y = v12;
      BOOL v5 = CGRectContainsPoint(v24, v23);
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PXUIPortraitFocusView;
  [(PXUIPortraitFocusView *)&v13 layoutSubviews];
  v3 = [(PXUIPortraitFocusView *)self edrGainLayer];

  if (v3)
  {
    [(PXUIPortraitFocusView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    CGFloat v12 = [(PXUIPortraitFocusView *)self edrGainLayer];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(PXPortraitFocusView *)self mediaView];
  double v9 = objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);

  return v9;
}

- (void)setUpEDRGainLayer
{
  id v4 = +[PXEDRGainLayer layer];
  [(PXUIPortraitFocusView *)self setEdrGainLayer:v4];
  v3 = [(PXUIPortraitFocusView *)self layer];
  [v3 addSublayer:v4];
}

- (PXUIPortraitFocusView)initWithMediaView:(id)a3 isHDR:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXUIPortraitFocusView.m", 29, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PXUIPortraitFocusView;
  double v8 = [(PXPortraitFocusView *)&v17 initWithMediaView:v7 isHDR:v4];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F57D70]);
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    fixedFocusView = v8->_fixedFocusView;
    v8->_fixedFocusView = (CEKSubjectIndicatorView *)v10;

    [(CEKSubjectIndicatorView *)v8->_fixedFocusView setShape:3];
    [(PXUIPortraitFocusView *)v8 addSubview:v8->_fixedFocusView];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v8 action:sel__viewTapped_];
    tapGestureRecognizer = v8->_tapGestureRecognizer;
    v8->_tapGestureRecognizer = (UITapGestureRecognizer *)v12;

    [(UITapGestureRecognizer *)v8->_tapGestureRecognizer setDelegate:v8];
    double v14 = [(PXPortraitFocusView *)v8 mediaView];
    [v14 addGestureRecognizer:v8->_tapGestureRecognizer];

    if (v4) {
      [(PXUIPortraitFocusView *)v8 setUpEDRGainLayer];
    }
  }

  return v8;
}

@end