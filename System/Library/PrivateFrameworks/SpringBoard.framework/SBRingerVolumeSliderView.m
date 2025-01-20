@interface SBRingerVolumeSliderView
- (BOOL)isRoundedStyle;
- (SBRingerVolumeSliderView)initWithFrame:(CGRect)a3;
- (UIView)backgroundView;
- (UIView)fillView;
- (UIViewFloatAnimatableProperty)valueSpring;
- (double)value;
- (int64_t)layoutAxis;
- (unint64_t)style;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setFillView:(id)a3;
- (void)setLayoutAxis:(int64_t)a3;
- (void)setRoundedStyle:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setValue:(double)a3;
- (void)setValue:(double)a3 animated:(BOOL)a4;
- (void)setValueSpring:(id)a3;
@end

@implementation SBRingerVolumeSliderView

- (SBRingerVolumeSliderView)initWithFrame:(CGRect)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SBRingerVolumeSliderView;
  v3 = -[SBRingerVolumeSliderView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SBRingerVolumeSliderView *)v3 setClipsToBounds:0];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;

    [(UIView *)v4->_backgroundView setClipsToBounds:1];
    [(SBRingerVolumeSliderView *)v4 addSubview:v4->_backgroundView];
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    fillView = v4->_fillView;
    v4->_fillView = v7;

    [(UIView *)v4->_backgroundView addSubview:v4->_fillView];
    v4->_style = -1;
    [(SBRingerVolumeSliderView *)v4 setStyle:0];
    v4->_layoutAxis = 0;
    v4->_roundedStyle = 0;
    v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
    valueSpring = v4->_valueSpring;
    v4->_valueSpring = v9;

    objc_initWeak(&location, v4);
    v11 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = v4->_valueSpring;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__SBRingerVolumeSliderView_initWithFrame___block_invoke;
    v14[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v15, &location);
    [v11 _createTransformerWithInputAnimatableProperties:v12 presentationValueChangedCallback:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __42__SBRingerVolumeSliderView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setNeedsLayout];
    [v2 layoutIfNeeded];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  [(UIViewFloatAnimatableProperty *)self->_valueSpring invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBRingerVolumeSliderView;
  [(SBRingerVolumeSliderView *)&v3 dealloc];
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    backgroundView = self->_backgroundView;
    if (a3)
    {
      v5 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
      [(UIView *)backgroundView setBackgroundColor:v5];

      fillView = self->_fillView;
      [MEMORY[0x1E4F428B8] labelColor];
    }
    else
    {
      v7 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
      [(UIView *)backgroundView setBackgroundColor:v7];

      fillView = self->_fillView;
      [MEMORY[0x1E4F428B8] secondaryLabelColor];
    }
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](fillView, "setBackgroundColor:");
  }
}

- (void)setLayoutAxis:(int64_t)a3
{
  if (self->_layoutAxis != a3)
  {
    self->_layoutAxis = a3;
    [(SBRingerVolumeSliderView *)self setNeedsLayout];
    [(SBRingerVolumeSliderView *)self layoutIfNeeded];
  }
}

- (void)setValue:(double)a3
{
}

- (void)setValue:(double)a3 animated:(BOOL)a4
{
  if (self->_value != a3)
  {
    self->_value = a3;
    if (a4)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __46__SBRingerVolumeSliderView_setValue_animated___block_invoke;
      v5[3] = &unk_1E6AF4A70;
      v5[4] = self;
      *(double *)&v5[5] = a3;
      [MEMORY[0x1E4F42FF0] _animateUsingSpringWithTension:0 friction:v5 interactive:0 animations:281.84 completion:33.58];
    }
    else
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __46__SBRingerVolumeSliderView_setValue_animated___block_invoke_2;
      v4[3] = &unk_1E6AF4A70;
      v4[4] = self;
      *(double *)&v4[5] = a3;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v4];
    }
  }
}

uint64_t __46__SBRingerVolumeSliderView_setValue_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setValue:*(double *)(a1 + 40)];
}

uint64_t __46__SBRingerVolumeSliderView_setValue_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setValue:*(double *)(a1 + 40)];
}

- (void)layoutSubviews
{
  [(SBRingerVolumeSliderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIViewFloatAnimatableProperty *)self->_valueSpring presentationValue];
  double v12 = v11;
  long long v37 = 0u;
  BYTE8(v37) = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  double v14 = v13;
  if (v13 >= 0.0)
  {
    double v14 = 0.0;
    if (v13 > 1.0) {
      double v14 = v13 + -1.0;
    }
  }
  int64_t v15 = [(SBRingerVolumeSliderView *)self layoutAxis];
  int64_t v16 = v15;
  double v17 = v8 + fabs(v8 * v14 * 0.5 / 3.0);
  double v18 = fabs(v10 * v14 * 4.0 / 3.0);
  double v19 = -0.0;
  if (v14 < 0.0) {
    double v19 = v8 * v14 * 0.5 / 3.0;
  }
  double v20 = v6 + v18 * 0.5;
  double v21 = fabs(v8 * v14 * 4.0 / 3.0);
  double v22 = v8 - v21;
  double v23 = v21 * 0.5;
  double v24 = fabs(v10 * v14 * 0.5 / 3.0);
  double v25 = v24 * 0.5;
  if (v14 < 0.0)
  {
    double v25 = v24;
    double v24 = 0.0;
  }
  double v26 = v6 - v24;
  double v27 = v10 + v25;
  if (v15 == 1) {
    double v28 = v22;
  }
  else {
    double v28 = v10 - v18;
  }
  if (v15 == 1) {
    double v29 = v27;
  }
  else {
    double v29 = v10 - v18;
  }
  if (v15 == 1) {
    double v30 = v22;
  }
  else {
    double v30 = v17;
  }
  if (v15 == 1) {
    double v20 = v26;
  }
  else {
    double v23 = v19;
  }
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4 + v23, v20, v30, v29, v22);
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:v28 * 0.5];
  if ([(SBRingerVolumeSliderView *)self isRoundedStyle]) {
    [(UIView *)self->_fillView _setContinuousCornerRadius:v28 * 0.5];
  }
  double v31 = fmin(fmax(v12, 0.0625), 1.0);
  double v32 = v30 * v31;
  double v33 = 0.0;
  double v34 = v29 - v31 * v29;
  double v35 = v29 * v31;
  if (v16 == 1)
  {
    double v33 = v34;
    double v32 = v30;
    double v36 = v35;
  }
  else
  {
    double v36 = v29;
  }
  -[UIView setFrame:](self->_fillView, "setFrame:", 0.0, v33, v32, v36);
}

- (unint64_t)style
{
  return self->_style;
}

- (int64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (BOOL)isRoundedStyle
{
  return self->_roundedStyle;
}

- (void)setRoundedStyle:(BOOL)a3
{
  self->_roundedStyle = a3;
}

- (double)value
{
  return self->_value;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)fillView
{
  return self->_fillView;
}

- (void)setFillView:(id)a3
{
}

- (UIViewFloatAnimatableProperty)valueSpring
{
  return self->_valueSpring;
}

- (void)setValueSpring:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSpring, 0);
  objc_storeStrong((id *)&self->_fillView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end