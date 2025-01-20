@interface _UIPrototypingMenuSlider
- (CGPoint)knobCenter;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (UIEdgeInsets)_thumbHitEdgeInsets;
- (UIImageView)knobBGView;
- (UILabel)currentValueLabel;
- (UIView)knobView;
- (_UIPortalView)knobPortal;
- (_UIPrototypingMenuSlider)initWithFrame:(CGRect)a3;
- (double)stepSize;
- (float)value;
- (void)_setKnobViewProminent:(BOOL)a3 animated:(BOOL)a4;
- (void)decrement;
- (void)increment;
- (void)layoutSubviews;
- (void)setCurrentValueLabel:(id)a3;
- (void)setKnobBGView:(id)a3;
- (void)setKnobPortal:(id)a3;
- (void)setKnobView:(id)a3;
- (void)setStepSize:(double)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UIPrototypingMenuSlider

- (_UIPrototypingMenuSlider)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)_UIPrototypingMenuSlider;
  v3 = -[UISlider initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    knobView = v3->_knobView;
    v3->_knobView = (UIView *)v9;

    [(UIView *)v3->_knobView setAutoresizesSubviews:1];
    [(UIView *)v3->_knobView setUserInteractionEnabled:0];
    [(UIView *)v3 addSubview:v3->_knobView];
    v11 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v5, v6, v7, v8);
    knobBGView = v3->_knobBGView;
    v3->_knobBGView = v11;

    v13 = _UIImageWithName(@"UISwitchKnob");
    [(UIImageView *)v3->_knobBGView setImage:v13];

    [(UIView *)v3->_knobBGView setAutoresizingMask:18];
    [(UIView *)v3->_knobView addSubview:v3->_knobBGView];
    v14 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v5, v6, v7, v8);
    currentValueLabel = v3->_currentValueLabel;
    v3->_currentValueLabel = v14;

    v16 = [off_1E52D39B8 monospacedDigitSystemFontOfSize:14.0 weight:*(double *)off_1E52D6BF8];
    [(UILabel *)v3->_currentValueLabel setFont:v16];

    [(UILabel *)v3->_currentValueLabel setTextAlignment:1];
    v17 = +[UIColor blackColor];
    [(UILabel *)v3->_currentValueLabel setTextColor:v17];

    [(UIView *)v3->_knobView addSubview:v3->_currentValueLabel];
    v18 = +[UIImageSymbolConfiguration configurationWithPointSize:8.0];
    v19 = +[UIImage systemImageNamed:@"circle.fill" withConfiguration:v18];

    [(UISlider *)v3 setThumbImage:v19 forState:0];
    [(UISlider *)v3 _setSliderStyle:100];
    v20 = [(UIView *)v3 layer];
    [v20 setCreatesCompositingGroup:1];
  }
  return v3;
}

- (CGPoint)knobCenter
{
  v2 = [(_UIPrototypingMenuSlider *)self knobView];
  [v2 center];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)increment
{
  [(_UIPrototypingMenuSlider *)self value];
  double v4 = v3;
  [(_UIPrototypingMenuSlider *)self stepSize];
  double v6 = v5 + v4;
  *(float *)&double v6 = v6;
  [(_UIPrototypingMenuSlider *)self setValue:1 animated:v6];
}

- (void)decrement
{
  [(_UIPrototypingMenuSlider *)self value];
  double v4 = v3;
  [(_UIPrototypingMenuSlider *)self stepSize];
  double v6 = v4 - v5;
  *(float *)&double v6 = v6;
  [(_UIPrototypingMenuSlider *)self setValue:1 animated:v6];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPrototypingMenuSlider;
  [(UISlider *)&v4 layoutSubviews];
  if (!self->_didBringKnobToFront)
  {
    self->_didBringKnobToFront = 1;
    float v3 = [(_UIPrototypingMenuSlider *)self knobView];
    [(UIView *)self bringSubviewToFront:v3];
  }
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(_UIPrototypingMenuSlider *)self stepSize];
  float v9 = v7;
  if (v9 > 0.0)
  {
    float v12 = 0.0;
    float v10 = a3 / v9;
    modff(v10, &v12);
    *(float *)&double v7 = v12;
    *(float *)&double v8 = v10 - v12;
    if ((float)(v10 - v12) >= 0.5) {
      *(float *)&double v7 = v12 + 1.0;
    }
    a3 = *(float *)&v7 * v9;
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIPrototypingMenuSlider;
  *(float *)&double v7 = a3;
  -[UISlider setValue:animated:](&v11, sel_setValue_animated_, v4, v7, v8);
}

- (float)value
{
  v10.receiver = self;
  v10.super_class = (Class)_UIPrototypingMenuSlider;
  [(UISlider *)&v10 value];
  float v4 = v3;
  [(_UIPrototypingMenuSlider *)self stepSize];
  float v6 = v5;
  if (v6 > 0.0)
  {
    float v11 = 0.0;
    float v7 = v4 / v6;
    modff(v7, &v11);
    float v8 = v11;
    if ((float)(v7 - v11) >= 0.5) {
      float v8 = v11 + 1.0;
    }
    return v8 * v6;
  }
  return v4;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  v60.receiver = self;
  v60.super_class = (Class)_UIPrototypingMenuSlider;
  CGFloat x = a4.origin.x;
  -[UISlider thumbRectForBounds:trackRect:value:](&v60, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, LODWORD(a5));
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(_UIPrototypingMenuSlider *)self knobView];
  v18 = [(_UIPrototypingMenuSlider *)self knobBGView];
  v19 = [v18 image];

  uint64_t v20 = [v19 leftCapWidth];
  v21 = [(_UIPrototypingMenuSlider *)self currentValueLabel];
  objc_super v22 = [v21 text];
  [(_UIPrototypingMenuSlider *)self stepSize];
  float v24 = v23;
  CGFloat v49 = width;
  CGFloat v50 = height;
  if (v24 <= 0.0)
  {
    double v26 = v12;
LABEL_5:
    uint64_t v27 = 2;
    goto LABEL_6;
  }
  long double v25 = v24;
  double v26 = v12;
  if (fmod(v24, 1.0) == 0.0)
  {
    uint64_t v27 = 0;
    goto LABEL_6;
  }
  if (fmod(v25, 0.1) != 0.0) {
    goto LABEL_5;
  }
  uint64_t v27 = 1;
LABEL_6:
  double v28 = (double)v20;
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%.*f", v27, a5);
  [v21 setText:v29];

  uint64_t v30 = [v22 length];
  v31 = [v21 text];
  uint64_t v32 = [v31 length];

  if (v30 != v32)
  {
    objc_msgSend(v21, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v34 = v33;
    uint64_t v36 = v35;
    [v19 size];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __63___UIPrototypingMenuSlider_thumbRectForBounds_trackRect_value___block_invoke;
    v51[3] = &unk_1E5307600;
    double v54 = v34;
    uint64_t v55 = v36;
    if (v28 + v28 + v34 + -8.0 >= v37) {
      double v37 = v28 + v28 + v34 + -8.0;
    }
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    double v58 = v37;
    uint64_t v59 = v38;
    id v52 = v21;
    id v53 = v17;
    +[UIView animateWithDuration:v51 animations:0 completion:0.15];
  }
  [v17 bounds];
  CGFloat v39 = (CGRectGetWidth(v61) - v28) * 0.5;
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = v49;
  v62.size.CGFloat height = v50;
  double v40 = CGRectGetMinX(v62) + v39;
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = v49;
  v63.size.CGFloat height = v50;
  double v41 = fmax(v40, fmin(v10 + v14 * 0.5, CGRectGetMaxX(v63) - v39));
  v42 = [v17 superview];
  objc_msgSend(v42, "convertPoint:fromView:", self, v41, v26 + v16 * 0.5 + 3.0);
  objc_msgSend(v17, "setCenter:");

  double v44 = v26;
  double v43 = v10;
  double v45 = v14;
  double v46 = v16;
  result.size.CGFloat height = v46;
  result.size.CGFloat width = v45;
  result.origin.CGFloat y = v44;
  result.origin.CGFloat x = v43;
  return result;
}

- (void)_setKnobViewProminent:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  float v7 = [(_UIPrototypingMenuSlider *)self knobView];
  if (v5)
  {
    float v8 = [(_UIPrototypingMenuSlider *)self knobPortal];

    if (!v8)
    {
      double v9 = [[_UIPortalView alloc] initWithSourceView:v7];
      [(_UIPrototypingMenuSlider *)self setKnobPortal:v9];

      double v10 = [(_UIPrototypingMenuSlider *)self knobPortal];
      [v10 setMatchesAlpha:1];

      double v11 = [(_UIPrototypingMenuSlider *)self knobPortal];
      [v11 setMatchesPosition:1];

      double v12 = [(_UIPrototypingMenuSlider *)self knobPortal];
      [v12 setMatchesTransform:1];

      double v13 = [(_UIPrototypingMenuSlider *)self knobPortal];
      [v13 setHidesSourceView:1];
    }
    double v14 = [(UIView *)self window];
    double v15 = [(_UIPrototypingMenuSlider *)self knobPortal];
    [v14 addSubview:v15];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIPrototypingMenuSlider__setKnobViewProminent_animated___block_invoke;
  aBlock[3] = &unk_1E52D9FC0;
  BOOL v26 = v5;
  id v16 = v7;
  id v25 = v16;
  v17 = (void (**)(void))_Block_copy(aBlock);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59___UIPrototypingMenuSlider__setKnobViewProminent_animated___block_invoke_2;
  v22[3] = &unk_1E53064F0;
  BOOL v23 = v5;
  v22[4] = self;
  v18 = (void (**)(void *, uint64_t, void))_Block_copy(v22);
  if (v4)
  {
    double v19 = 0.3;
    if (!v5) {
      double v19 = 0.2;
    }
    double v20 = 0.7;
    if (!v5) {
      double v20 = 1.0;
    }
    v21 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:v20 response:v19];
    +[UIView _animateUsingSpringBehavior:v21 tracking:0 animations:v17 completion:v18];
  }
  else
  {
    v17[2](v17);
    v18[2](v18, 1, 0);
  }
}

- (UIEdgeInsets)_thumbHitEdgeInsets
{
  float v3 = [(_UIPrototypingMenuSlider *)self knobView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(UISlider *)self currentThumbImage];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  v22.origin.CGFloat x = v5;
  v22.origin.CGFloat y = v7;
  v22.size.CGFloat width = v9;
  v22.size.CGFloat height = v11;
  CGFloat v17 = (CGRectGetWidth(v22) - v14) * -0.5;
  v23.origin.CGFloat x = v5;
  v23.origin.CGFloat y = v7;
  v23.size.CGFloat width = v9;
  v23.size.CGFloat height = v11;
  double v18 = (CGRectGetHeight(v23) - v16) * -0.5;
  double v19 = v17;
  double v20 = v18;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPrototypingMenuSlider;
  [(UIControl *)&v5 touchesBegan:a3 withEvent:a4];
  [(_UIPrototypingMenuSlider *)self _setKnobViewProminent:1 animated:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPrototypingMenuSlider;
  [(UIControl *)&v5 touchesEnded:a3 withEvent:a4];
  [(_UIPrototypingMenuSlider *)self _setKnobViewProminent:0 animated:1];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPrototypingMenuSlider;
  [(UIControl *)&v5 touchesCancelled:a3 withEvent:a4];
  [(_UIPrototypingMenuSlider *)self _setKnobViewProminent:0 animated:1];
}

- (double)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(double)a3
{
  self->_stepSize = a3;
}

- (UIView)knobView
{
  return self->_knobView;
}

- (void)setKnobView:(id)a3
{
}

- (UIImageView)knobBGView
{
  return self->_knobBGView;
}

- (void)setKnobBGView:(id)a3
{
}

- (_UIPortalView)knobPortal
{
  return self->_knobPortal;
}

- (void)setKnobPortal:(id)a3
{
}

- (UILabel)currentValueLabel
{
  return self->_currentValueLabel;
}

- (void)setCurrentValueLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValueLabel, 0);
  objc_storeStrong((id *)&self->_knobPortal, 0);
  objc_storeStrong((id *)&self->_knobBGView, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
}

@end