@interface WFWorkflowProgressView
- (CALayer)runningContainerLayer;
- (CAShapeLayer)backgroundCircleLayer;
- (CAShapeLayer)partialRingLayer;
- (CAShapeLayer)stopGlyphLayer;
- (UIColor)resolvedTintColor;
- (UIImageView)checkmarkImageView;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (WFWorkflowProgressView)initWithFrame:(CGRect)a3;
- (double)fractionCompleted;
- (double)progressStrokeWidth;
- (double)stopSize;
- (int64_t)currentState;
- (void)beginBreatheAnimation;
- (void)endBreatheAnimation;
- (void)layoutSubviews;
- (void)reset;
- (void)setCurrentState:(int64_t)a3;
- (void)setFractionCompleted:(double)a3;
- (void)setProgressStrokeWidth:(double)a3;
- (void)setResolvedTintColor:(id)a3;
- (void)setStopSize:(double)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionCompletedLayerToVisible:(BOOL)a3 animated:(BOOL)a4 haptic:(BOOL)a5;
- (void)transitionRunningLayerToVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)transitionToState:(int64_t)a3;
- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4;
- (void)updatePaths;
@end

@implementation WFWorkflowProgressView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_stopGlyphLayer, 0);
  objc_storeStrong((id *)&self->_partialRingLayer, 0);
  objc_storeStrong((id *)&self->_backgroundCircleLayer, 0);
  objc_storeStrong((id *)&self->_runningContainerLayer, 0);
  objc_storeStrong((id *)&self->_resolvedTintColor, 0);
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (CAShapeLayer)stopGlyphLayer
{
  return self->_stopGlyphLayer;
}

- (CAShapeLayer)partialRingLayer
{
  return self->_partialRingLayer;
}

- (CAShapeLayer)backgroundCircleLayer
{
  return self->_backgroundCircleLayer;
}

- (CALayer)runningContainerLayer
{
  return self->_runningContainerLayer;
}

- (UIColor)resolvedTintColor
{
  return self->_resolvedTintColor;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (double)progressStrokeWidth
{
  return self->_progressStrokeWidth;
}

- (double)stopSize
{
  return self->_stopSize;
}

- (double)fractionCompleted
{
  return self->_fractionCompleted;
}

- (void)endBreatheAnimation
{
  v3 = [(WFWorkflowProgressView *)self stopGlyphLayer];
  [v3 removeAnimationForKey:@"breathe.scale"];

  id v4 = [(WFWorkflowProgressView *)self stopGlyphLayer];
  [v4 removeAnimationForKey:@"breathe.opacity"];
}

- (void)beginBreatheAnimation
{
  id v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  [v11 setFromValue:&unk_26C7D3D60];
  [v11 setToValue:&unk_26C7D3D70];
  [v11 setDuration:0.9];
  [v11 setAutoreverses:1];
  LODWORD(v3) = 2139095040;
  [v11 setRepeatCount:v3];
  uint64_t v4 = *MEMORY[0x263F15EB8];
  v5 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v11 setTimingFunction:v5];

  v6 = [(WFWorkflowProgressView *)self stopGlyphLayer];
  [v6 addAnimation:v11 forKey:@"breathe.scale"];

  v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v7 setFromValue:&unk_26C7D3D60];
  [v7 setToValue:&unk_26C7D3D80];
  [v7 setDuration:0.9];
  [v7 setAutoreverses:1];
  LODWORD(v8) = 2139095040;
  [v7 setRepeatCount:v8];
  v9 = [MEMORY[0x263F15808] functionWithName:v4];
  [v7 setTimingFunction:v9];

  v10 = [(WFWorkflowProgressView *)self stopGlyphLayer];
  [v10 addAnimation:v7 forKey:@"breathe.opacity"];
}

- (void)transitionCompletedLayerToVisible:(BOOL)a3 animated:(BOOL)a4 haptic:(BOOL)a5
{
  if (a3)
  {
    if (a4)
    {
      BOOL v6 = a5;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke;
      v14[3] = &unk_2642A5EA0;
      v14[4] = self;
      [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v14 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.4 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
      dispatch_time_t v7 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_2;
      block[3] = &unk_2642A5EA0;
      block[4] = self;
      dispatch_after(v7, MEMORY[0x263EF83A0], block);
      if (v6)
      {
        double v8 = [(WFWorkflowProgressView *)self feedbackGenerator];
        [v8 impactOccurred];
      }
      return;
    }
    id v9 = [(WFWorkflowProgressView *)self checkmarkImageView];
    objc_msgSend(v9, "setAlpha:", 1.0, v9);
  }
  else
  {
    if (a4)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_4;
      v12[3] = &unk_2642A5EA0;
      v12[4] = self;
      objc_msgSend(MEMORY[0x263F82E00], "animateWithDuration:animations:", v12, a4, a5, 0.200000003);
      return;
    }
    id v11 = [(WFWorkflowProgressView *)self checkmarkImageView];
    objc_msgSend(v11, "setAlpha:", 0.0, v11);
  }
}

void __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) checkmarkImageView];
  [v2 setAlpha:1.0];

  CATransform3DMakeScale(&v5, 1.20000005, 1.20000005, 0.0);
  double v3 = [*(id *)(a1 + 32) layer];
  CATransform3D v4 = v5;
  [v3 setTransform:&v4];
}

uint64_t __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_3;
  v2[3] = &unk_2642A5EA0;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v2 tracking:0 dampingRatioSmoothing:0.55 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
}

void __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) checkmarkImageView];
  [v1 setAlpha:0.0];
}

void __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  long long v2 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v6[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v6[5] = v2;
  long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v6[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v6[7] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v6[0] = *MEMORY[0x263F15740];
  v6[1] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v6[3] = v5;
  [v1 setTransform:v6];
}

- (void)transitionRunningLayerToVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    id v20 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    BOOL v6 = [(WFWorkflowProgressView *)self runningContainerLayer];
    dispatch_time_t v7 = [v6 presentationLayer];
    double v8 = [v7 valueForKeyPath:@"opacity"];
    [v20 setFromValue:v8];

    LODWORD(v9) = 1.0;
    id v10 = [NSNumber numberWithFloat:v9];
    [v20 setToValue:v10];

    [v20 setDuration:0.200000003];
    id v11 = [(WFWorkflowProgressView *)self runningContainerLayer];
    v12 = v11;
    LODWORD(v13) = 1.0;
  }
  else
  {
    v14 = [(WFWorkflowProgressView *)self stopGlyphLayer];
    [v14 setOpacity:0.0];

    id v20 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    v15 = [(WFWorkflowProgressView *)self runningContainerLayer];
    v16 = [v15 presentationLayer];
    v17 = [v16 valueForKeyPath:@"opacity"];
    [v20 setFromValue:v17];

    v18 = [NSNumber numberWithFloat:0.0];
    [v20 setToValue:v18];

    [v20 setDuration:0.200000003];
    id v11 = [(WFWorkflowProgressView *)self runningContainerLayer];
    v12 = v11;
    double v13 = 0.0;
  }
  [v11 setOpacity:v13];

  if (v4)
  {
    v19 = [(WFWorkflowProgressView *)self runningContainerLayer];
    [v19 addAnimation:v20 forKey:0];
  }
}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(WFWorkflowProgressView *)self currentState] != a3)
  {
    [(WFWorkflowProgressView *)self transitionRunningLayerToVisible:a3 == 0 animated:v4];
    [(WFWorkflowProgressView *)self transitionCompletedLayerToVisible:a3 != 0 animated:v4 haptic:1];
    self->_currentState = a3;
  }
}

- (void)transitionToState:(int64_t)a3
{
  [(WFWorkflowProgressView *)self transitionToState:a3 animated:1];
  if (a3)
  {
    [(WFWorkflowProgressView *)self endBreatheAnimation];
  }
  else
  {
    long long v5 = [(WFWorkflowProgressView *)self stopGlyphLayer];
    BOOL v6 = [v5 animationKeys];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      [(WFWorkflowProgressView *)self beginBreatheAnimation];
    }
  }
}

- (void)updatePaths
{
  [(WFWorkflowProgressView *)self fractionCompleted];
  double v4 = v3;
  id v25 = [(WFWorkflowProgressView *)self stopGlyphLayer];
  long long v5 = [(WFWorkflowProgressView *)self backgroundCircleLayer];
  BOOL v6 = [(WFWorkflowProgressView *)self partialRingLayer];
  [(WFWorkflowProgressView *)self stopSize];
  double v8 = v7;
  objc_msgSend(v25, "setBounds:", 0.0, 0.0, v8, v8);
  [v25 setCornerRadius:v8 * 0.26];
  [v25 setCornerCurve:*MEMORY[0x263F15A20]];
  [(WFWorkflowProgressView *)self bounds];
  double MidX = CGRectGetMidX(v27);
  [(WFWorkflowProgressView *)self bounds];
  objc_msgSend(v25, "setPosition:", MidX, CGRectGetMidY(v28));
  id v10 = [(WFWorkflowProgressView *)self resolvedTintColor];
  objc_msgSend(v25, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  [(WFWorkflowProgressView *)self bounds];
  objc_msgSend(v5, "setFrame:");
  [(WFWorkflowProgressView *)self bounds];
  [v5 setCornerRadius:v11 * 0.5];
  v12 = [(WFWorkflowProgressView *)self resolvedTintColor];
  id v13 = [v12 colorWithAlphaComponent:0.100000001];
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

  [(WFWorkflowProgressView *)self progressStrokeWidth];
  double v15 = v14;
  [(WFWorkflowProgressView *)self bounds];
  CGRect v30 = CGRectInset(v29, v15 + v15, v15 + v15);
  objc_msgSend(v6, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  [(WFWorkflowProgressView *)self bounds];
  double v17 = v16;
  [(WFWorkflowProgressView *)self bounds];
  if (v17 >= v18) {
    double v19 = v18;
  }
  else {
    double v19 = v17;
  }
  double v20 = (v19 - v15) * 0.5;
  [v6 bounds];
  double v21 = CGRectGetMidX(v31);
  [v6 bounds];
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v21, CGRectGetMidY(v32), v20, -1.57079633, 4.71238898);
  id v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", objc_msgSend(v22, "CGPath"));

  id v23 = [(WFWorkflowProgressView *)self resolvedTintColor];
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v23, "CGColor"));

  [v6 setLineWidth:v15];
  id v24 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v24, "CGColor"));

  [v6 setLineCap:*MEMORY[0x263F15E70]];
  [v6 setStrokeEnd:v4];
}

- (void)setResolvedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedTintColor, a3);
  id v5 = a3;
  [(WFWorkflowProgressView *)self updatePaths];
  id v6 = [(WFWorkflowProgressView *)self checkmarkImageView];
  [v6 setTintColor:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WFWorkflowProgressView;
  id v4 = a3;
  [(WFWorkflowProgressView *)&v11 traitCollectionDidChange:v4];
  id v5 = [(WFWorkflowProgressView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    double v8 = [(WFWorkflowProgressView *)self tintColor];
    double v9 = [(WFWorkflowProgressView *)self traitCollection];
    id v10 = [v8 resolvedColorWithTraitCollection:v9];
    [(WFWorkflowProgressView *)self setResolvedTintColor:v10];
  }
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)WFWorkflowProgressView;
  [(WFWorkflowProgressView *)&v6 tintColorDidChange];
  double v3 = [(WFWorkflowProgressView *)self tintColor];
  id v4 = [(WFWorkflowProgressView *)self traitCollection];
  id v5 = [v3 resolvedColorWithTraitCollection:v4];
  [(WFWorkflowProgressView *)self setResolvedTintColor:v5];
}

- (void)setProgressStrokeWidth:(double)a3
{
  if (self->_progressStrokeWidth != a3)
  {
    self->_progressStrokeWidth = a3;
    [(WFWorkflowProgressView *)self updatePaths];
  }
}

- (void)setStopSize:(double)a3
{
  if (self->_stopSize != a3)
  {
    self->_stopSize = a3;
    [(WFWorkflowProgressView *)self updatePaths];
  }
}

- (void)setFractionCompleted:(double)a3
{
  double fractionCompleted = self->_fractionCompleted;
  if (fractionCompleted != a3)
  {
    if (fractionCompleted > a3) {
      a3 = self->_fractionCompleted;
    }
    self->_double fractionCompleted = a3;
    [(WFWorkflowProgressView *)self updatePaths];
  }
}

- (void)reset
{
  self->_double fractionCompleted = 0.0;
  [(WFWorkflowProgressView *)self updatePaths];
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)WFWorkflowProgressView;
  [(WFWorkflowProgressView *)&v25 layoutSubviews];
  [(WFWorkflowProgressView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(WFWorkflowProgressView *)self runningContainerLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(WFWorkflowProgressView *)self bounds];
  v12 = [(WFWorkflowProgressView *)self traitCollection];
  [v12 displayScale];
  BSFloatRoundForScale();
  double v14 = v13;

  [(WFWorkflowProgressView *)self bounds];
  double v16 = v14 + v15;
  double v18 = v14 + v17;
  double v19 = v14 + v14;
  double v21 = v20 - (v14 + v14);
  double v23 = v22 - v19;
  id v24 = [(WFWorkflowProgressView *)self checkmarkImageView];
  objc_msgSend(v24, "setFrame:", v16, v18, v21, v23);

  [(WFWorkflowProgressView *)self updatePaths];
}

- (WFWorkflowProgressView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)WFWorkflowProgressView;
  double v3 = -[WFWorkflowProgressView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_stopSize = 8.0;
    v3->_progressStrokeWidth = 2.0;
    double v5 = [MEMORY[0x263F157E8] layer];
    double v6 = [(WFWorkflowProgressView *)v4 layer];
    [v6 addSublayer:v5];

    runningContainerLayer = v4->_runningContainerLayer;
    v4->_runningContainerLayer = v5;
    double v8 = v5;

    double v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    [(CAShapeLayer *)v9 setAllowsGroupBlending:0];
    uint64_t v10 = *MEMORY[0x263F15D58];
    [(CAShapeLayer *)v9 setCompositingFilter:*MEMORY[0x263F15D58]];
    objc_super v11 = [(WFWorkflowProgressView *)v4 layer];
    [v11 addSublayer:v9];

    backgroundCircleLayer = v4->_backgroundCircleLayer;
    v4->_backgroundCircleLayer = v9;
    double v13 = v9;

    double v14 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    [(CAShapeLayer *)v14 setAllowsGroupBlending:0];
    [(CAShapeLayer *)v14 setCompositingFilter:v10];
    [(CALayer *)v8 addSublayer:v14];
    partialRingLayer = v4->_partialRingLayer;
    v4->_partialRingLayer = v14;
    double v16 = v14;

    double v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    [(CAShapeLayer *)v17 setAllowsGroupBlending:0];
    [(CAShapeLayer *)v17 setCompositingFilter:v10];
    [(CALayer *)v8 addSublayer:v17];
    stopGlyphLayer = v4->_stopGlyphLayer;
    v4->_stopGlyphLayer = v17;
    double v19 = v17;

    double v20 = (void *)MEMORY[0x263F82818];
    double v21 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81800]];
    double v22 = [v20 configurationWithFont:v21];

    double v23 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark" withConfiguration:v22];
    id v24 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v23];
    [(UIImageView *)v24 setAlpha:0.0];
    [(WFWorkflowProgressView *)v4 addSubview:v24];
    checkmarkImageView = v4->_checkmarkImageView;
    v4->_checkmarkImageView = v24;
    v26 = v24;

    uint64_t v27 = [objc_alloc(MEMORY[0x263F82830]) initWithStyle:3];
    feedbackGenerator = v4->_feedbackGenerator;
    v4->_feedbackGenerator = (UIImpactFeedbackGenerator *)v27;

    [(WFWorkflowProgressView *)v4 updatePaths];
    CGRect v29 = v4;
  }
  return v4;
}

@end