@interface SFProgressView
- (CGSize)intrinsicContentSize;
- (SFProgressView)initWithFrame:(CGRect)a3;
- (UIColor)trackTintColor;
- (double)progress;
- (double)radius;
- (double)trackWidth;
- (int64_t)style;
- (void)_updateRectangularProgressFill;
- (void)layoutSubviews;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setRadius:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTrackTintColor:(id)a3;
- (void)setTrackWidth:(double)a3;
@end

@implementation SFProgressView

- (SFProgressView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SFProgressView;
  v3 = -[SFProgressView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SFRingView);
    trackRing = v3->_trackRing;
    v3->_trackRing = v4;

    v6 = [MEMORY[0x1E4FB1618] systemFillColor];
    [(SFRingView *)v3->_trackRing setTintColor:v6];

    [(SFProgressView *)v3 addSubview:v3->_trackRing];
    v7 = objc_alloc_init(SFRingView);
    progressRing = v3->_progressRing;
    v3->_progressRing = v7;

    v9 = [(SFRingView *)v3->_progressRing shapeLayer];
    [v9 setStrokeEnd:0.0];

    [(SFProgressView *)v3 addSubview:v3->_progressRing];
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    rectangularFillView = v3->_rectangularFillView;
    v3->_rectangularFillView = v10;

    -[UIView setFrame:](v3->_rectangularFillView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v3->_rectangularFillView _setContinuousCornerRadius:1.0];
    [(UIView *)v3->_rectangularFillView setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v13 = [v12 colorWithAlphaComponent:0.33];
    [(UIView *)v3->_rectangularFillView setBackgroundColor:v13];

    [(UIView *)v3->_rectangularFillView setHidden:1];
    [(SFProgressView *)v3 addSubview:v3->_rectangularFillView];
    v14 = v3;
  }

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if ((unint64_t)a3 <= 2)
    {
      BOOL v4 = (a3 & 7) == 2;
      uint64_t v5 = (3u >> a3) & 1;
      [(SFRingView *)self->_trackRing setHidden:v4];
      [(SFRingView *)self->_progressRing setHidden:v4];
      rectangularFillView = self->_rectangularFillView;
      [(UIView *)rectangularFillView setHidden:v5];
    }
  }
}

- (void)setProgress:(double)a3
{
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__SFProgressView_setProgress_animated_completion___block_invoke;
  aBlock[3] = &unk_1E54EB568;
  id v9 = v8;
  id v18 = v9;
  v10 = (void (**)(void))_Block_copy(aBlock);
  v11 = v10;
  if (self->_progress == a3)
  {
    v10[2](v10);
  }
  else
  {
    self->_progress = a3;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__SFProgressView_setProgress_animated_completion___block_invoke_2;
    v16[3] = &unk_1E54E9DC8;
    v16[4] = self;
    *(double *)&v16[5] = a3;
    v12 = _Block_copy(v16);
    v13 = (void *)MEMORY[0x1E4FB1EB0];
    if (v5)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __50__SFProgressView_setProgress_animated_completion___block_invoke_3;
      v14[3] = &unk_1E54E9D78;
      v15 = v11;
      [v13 _animateUsingDefaultTimingWithOptions:0 animations:v12 completion:v14];
    }
    else
    {
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v12];
      v11[2](v11);
    }
  }
}

uint64_t __50__SFProgressView_setProgress_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __50__SFProgressView_setProgress_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 432);
  if (v3 >= 2)
  {
    if (v3 == 2)
    {
      [(id)v2 _updateRectangularProgressFill];
    }
  }
  else
  {
    double v4 = *(double *)(a1 + 40);
    id v5 = [*(id *)(v2 + 416) shapeLayer];
    [v5 setStrokeEnd:v4];
  }
}

uint64_t __50__SFProgressView_setProgress_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRadius:(double)a3
{
  if (self->_radius != a3)
  {
    self->_radius = a3;
    [(SFProgressView *)self invalidateIntrinsicContentSize];
    [(SFProgressView *)self setNeedsLayout];
  }
}

- (void)setTrackWidth:(double)a3
{
  if (self->_trackWidth != a3)
  {
    self->_trackWidth = a3;
    [(SFProgressView *)self setNeedsLayout];
  }
}

- (UIColor)trackTintColor
{
  return (UIColor *)[(SFRingView *)self->_trackRing tintColor];
}

- (void)setTrackTintColor:(id)a3
{
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SFProgressView;
  [(SFProgressView *)&v9 layoutSubviews];
  double trackWidth = self->_trackWidth;
  double v4 = trackWidth * 0.5;
  double v5 = self->_radius - trackWidth * 0.5 + self->_radius - trackWidth * 0.5;
  v6 = [(SFRingView *)self->_trackRing shapeLayer];
  [v6 setLineWidth:trackWidth];

  [(SFRingView *)self->_trackRing setRadius:self->_radius - trackWidth * 0.5];
  -[SFRingView setFrame:](self->_trackRing, "setFrame:", trackWidth * 0.5, trackWidth * 0.5, v5, v5);
  double v7 = self->_trackWidth;
  id v8 = [(SFRingView *)self->_progressRing shapeLayer];
  [v8 setLineWidth:v7];

  [(SFRingView *)self->_progressRing setRadius:self->_radius - v4];
  -[SFRingView setFrame:](self->_progressRing, "setFrame:", v4, v4, v5, v5);
  [(SFProgressView *)self _updateRectangularProgressFill];
}

- (CGSize)intrinsicContentSize
{
  double v2 = self->_radius + self->_radius;
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_updateRectangularProgressFill
{
  [(SFProgressView *)self bounds];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double v7 = CGRectGetWidth(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v17);
  double v9 = _SFRoundFloatToPixels(v7 * 0.6);
  double v10 = _SFRoundFloatToPixels(v8 * 0.55 * fmin(self->_progress, 1.0));
  double v11 = _SFRoundFloatToPixels(0.25);
  double v12 = _SFRoundFloatToPixels(2.47);
  double v13 = _SFRoundFloatToPixels((v7 - v9) * 0.5) - v11;
  rectangularFillView = self->_rectangularFillView;

  -[UIView setFrame:](rectangularFillView, "setFrame:", v13, v8 - v10 - v12, v9, v10);
}

- (int64_t)style
{
  return self->_style;
}

- (double)progress
{
  return self->_progress;
}

- (double)radius
{
  return self->_radius;
}

- (double)trackWidth
{
  return self->_trackWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectangularFillView, 0);
  objc_storeStrong((id *)&self->_progressRing, 0);

  objc_storeStrong((id *)&self->_trackRing, 0);
}

@end