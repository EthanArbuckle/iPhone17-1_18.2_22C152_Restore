@interface UITextMagnifier
+ (Class)renderClass;
- (BOOL)isHorizontal;
- (BOOL)terminalPointPlacedCarefully;
- (CGPoint)animationPoint;
- (CGPoint)magnificationPoint;
- (CGPoint)terminalPoint;
- (UITextInput)text;
- (UITextMagnifier)initWithFrame:(CGRect)a3;
- (UIView)target;
- (double)offsetFromMagnificationPoint;
- (void)animateToAutoscrollRenderer;
- (void)animateToMagnifierRenderer;
- (void)autoscrollWillNotStart;
- (void)beginMagnifyingTarget:(id)a3 text:(id)a4 magnificationPoint:(CGPoint)a5 offset:(CGPoint)a6 animated:(BOOL)a7;
- (void)beginZoomDownAnimation:(id)a3 withDuration:(double)a4 postponeHandler:(id)a5;
- (void)beginZoomUpAnimation:(id)a3 withDuration:(double)a4;
- (void)detectLostTouches:(id)a3;
- (void)postAutoscrollPoint:(CGPoint)a3;
- (void)remove;
- (void)setAnimationPoint:(CGPoint)a3;
- (void)setAutoscrollDirections:(int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMagnificationPoint:(CGPoint)a3;
- (void)setNeedsDisplay;
- (void)setTarget:(id)a3;
- (void)setText:(id)a3;
- (void)setToMagnifierRenderer;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrameAndOffset;
- (void)windowWillRotate:(id)a3;
- (void)zoomDownAnimation;
- (void)zoomUpAnimation;
@end

@implementation UITextMagnifier

- (UITextMagnifier)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)UITextMagnifier;
  v7 = -[UIView initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    v8 = +[UIColor clearColor];
    [(UIView *)v7 setBackgroundColor:v8];

    v9 = objc_alloc_init(UITextMagnifierTimeWeightedPoint);
    weightedPoint = v7->_weightedPoint;
    v7->_weightedPoint = v9;

    uint64_t v11 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "renderClass")), "initWithFrame:", x, y, width, height);
    magnifierRenderer = v7->_magnifierRenderer;
    v7->_magnifierRenderer = (UIView *)v11;

    [(UIView *)v7 addSubview:v7->_magnifierRenderer];
  }
  return v7;
}

- (CGPoint)magnificationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[UITextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  -[UITextMagnifier adjustMagnificationPoint:](self, "adjustMagnificationPoint:", x, y);
  CGFloat v8 = v6;
  CGFloat v9 = v7;
  if (v6 != self->_magnificationPoint.x || v7 != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.double x = v6;
    self->_magnificationPoint.double y = v7;
    if (!self->_isAnimating)
    {
      [(UITextMagnifier *)self updateFrameAndOffset];
      [(UITextMagnifier *)self setNeedsDisplay];
    }
  }
  self->_animationPoint.double x = v8;
  self->_animationPoint.double y = v9;
}

- (CGPoint)terminalPoint
{
  [(UITextMagnifierTimeWeightedPoint *)self->_weightedPoint weightedPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  return 1;
}

- (void)postAutoscrollPoint:(CGPoint)a3
{
}

- (void)animateToAutoscrollRenderer
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__UITextMagnifier_animateToAutoscrollRenderer__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.1];
}

uint64_t __46__UITextMagnifier_animateToAutoscrollRenderer__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:0.0];
  double v2 = *(void **)(*(void *)(a1 + 32) + 496);
  return [v2 setAlpha:0.8];
}

- (void)setToMagnifierRenderer
{
  [(UIView *)self->_magnifierRenderer setAlpha:1.0];
  [(UIView *)self->_autoscrollRenderer setAlpha:0.0];
  magnifierRenderer = self->_magnifierRenderer;
  [(UIView *)magnifierRenderer setNeedsDisplay];
}

- (void)animateToMagnifierRenderer
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__UITextMagnifier_animateToMagnifierRenderer__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.1];
}

uint64_t __45__UITextMagnifier_animateToMagnifierRenderer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setToMagnifierRenderer];
}

- (void)setAutoscrollDirections:(int)a3
{
  if (a3)
  {
    if (self->_autoscrollDirections != a3 || ([(UIView *)self->_autoscrollRenderer alpha], v5 <= 0.0))
    {
      if (!self->_autoscrollRenderer)
      {
        id v6 = objc_alloc((Class)[(id)objc_opt_class() renderClass]);
        [(UIView *)self bounds];
        double v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
        autoscrollRenderer = self->_autoscrollRenderer;
        self->_autoscrollRenderer = v7;

        [(UIView *)self addSubview:self->_autoscrollRenderer];
        [(UIView *)self->_autoscrollRenderer setAlpha:0.0];
      }
      self->_autoscrollDirections = a3;
      [(UIView *)self->_autoscrollRenderer setNeedsDisplay];
      [(UIView *)self->_autoscrollRenderer alpha];
      if (v9 == 0.0)
      {
        [(UITextMagnifier *)self animateToAutoscrollRenderer];
      }
    }
  }
  else
  {
    [(UITextMagnifier *)self animateToMagnifierRenderer];
    self->_autoscrollDirections = 0;
  }
}

- (void)autoscrollWillNotStart
{
  self->_autoscrollDirections = 0;
  [(UITextMagnifier *)self animateToMagnifierRenderer];
}

- (void)setFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITextMagnifier;
  -[UIView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  [(UIView *)self bounds];
  -[UIView setFrame:](magnifierRenderer, "setFrame:");
  autoscrollRenderer = self->_autoscrollRenderer;
  [(UIView *)self bounds];
  -[UIView setFrame:](autoscrollRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)UITextMagnifier;
  [(UIView *)&v3 setNeedsDisplay];
  [(UIView *)self->_magnifierRenderer setNeedsDisplay];
}

- (void)beginZoomUpAnimation:(id)a3 withDuration:(double)a4
{
  if (self->_isAnimating)
  {
    self->_delayedAnimationType = 1;
  }
  else
  {
    self->_isAnimating = 1;
    self->_delayedAnimationType = 0;
    v4[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__UITextMagnifier_beginZoomUpAnimation_withDuration___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__UITextMagnifier_beginZoomUpAnimation_withDuration___block_invoke_2;
    v4[3] = &unk_1E52DC3A0;
    +[UIView animateWithDuration:v5 animations:v4 completion:a4];
  }
}

uint64_t __53__UITextMagnifier_beginZoomUpAnimation_withDuration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

void *__53__UITextMagnifier_beginZoomUpAnimation_withDuration___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
  [*(id *)(a1 + 32) setNeedsDisplay];
  CGPoint result = *(void **)(a1 + 32);
  if (result[64] == 2)
  {
    return (void *)[result zoomDownAnimation];
  }
  return result;
}

- (void)beginZoomDownAnimation:(id)a3 withDuration:(double)a4 postponeHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (self->_isAnimating)
  {
    self->_delayedAnimationType = 2;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
  else
  {
    self->_isAnimating = 1;
    self->_delayedAnimationType = 0;
    [(UITextMagnifier *)self setNeedsDisplay];
    [MEMORY[0x1E4F39CF8] flush];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__UITextMagnifier_beginZoomDownAnimation_withDuration_postponeHandler___block_invoke;
    v11[3] = &unk_1E52DC3A0;
    v11[4] = self;
    +[UIView animateWithDuration:v8 animations:v11 completion:a4];
  }
}

void *__71__UITextMagnifier_beginZoomDownAnimation_withDuration_postponeHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
  double v2 = [*(id *)(a1 + 32) target];

  if (!v2) {
    [*(id *)(a1 + 32) remove];
  }
  CGPoint result = *(void **)(a1 + 32);
  if (result[64] == 1)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v5[0] = *MEMORY[0x1E4F1DAB8];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [result setTransform:v5];
    [*(id *)(a1 + 32) updateFrameAndOffset];
    return (void *)[*(id *)(a1 + 32) zoomUpAnimation];
  }
  return result;
}

- (void)remove
{
  [(UIView *)self removeFromSuperview];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)self setTransform:v4];
}

- (void)detectLostTouches:(id)a3
{
  long long v4 = [(UITextMagnifier *)self target];

  if (v4)
  {
    if ([(id)UIApp _isTrackingAnyTouch])
    {
      [(UITextMagnifier *)self performSelector:sel_detectLostTouches_ withObject:0 afterDelay:0.75];
    }
    else
    {
      [(UITextMagnifier *)self stopMagnifying:0];
    }
  }
}

- (void)windowWillRotate:(id)a3
{
}

- (void)beginMagnifyingTarget:(id)a3 text:(id)a4 magnificationPoint:(CGPoint)a5 offset:(CGPoint)a6 animated:(BOOL)a7
{
  double y = a5.y;
  double x = a5.x;
  id v21 = a3;
  id v11 = a4;
  [(UITextMagnifier *)self setTarget:v21];
  [(UITextMagnifier *)self setText:v11];

  [(UITextMagnifier *)self performSelector:sel_detectLostTouches_ withObject:0 afterDelay:0.75];
  [(UITextMagnifierTimeWeightedPoint *)self->_weightedPoint clearHistory];
  [(UITextMagnifier *)self setToMagnifierRenderer];
  v12 = [(UIView *)self window];

  if (!v12)
  {
    v13 = [v21 _window];
    objc_super v14 = [v13 windowScene];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      +[UIWindowScene _keyWindowScene]();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    v18 = [v17 keyboardSceneDelegate];
    v19 = [v18 containerWindow];

    [v19 addSubview:self];
    [v21 _convertVisualAltitude:self toView:0.0];
    -[UIView _setVisualAltitude:](self, "_setVisualAltitude:");
  }
  [(UIView *)self->_autoscrollRenderer update];
  [(UIView *)self->_magnifierRenderer update];
  -[UITextMagnifier setMagnificationPoint:](self, "setMagnificationPoint:", x, y);
  [(UITextMagnifier *)self zoomUpAnimation];
  v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 addObserver:self selector:sel_windowWillRotate_ name:@"UIWindowWillRotateNotification" object:0];
}

- (void)stopMagnifying:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_detectLostTouches_ object:0];
  if (v3) {
    [(UITextMagnifier *)self zoomDownAnimation];
  }
  else {
    [(UITextMagnifier *)self remove];
  }
  [(UITextMagnifier *)self setTarget:0];
  [(UITextMagnifier *)self setText:0];
  self->_magnificationPoint = (CGPoint)vdupq_n_s64(0xC08F400000000000);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];
}

- (void)zoomUpAnimation
{
}

- (void)zoomDownAnimation
{
}

- (void)updateFrameAndOffset
{
}

+ (Class)renderClass
{
  return 0;
}

- (BOOL)isHorizontal
{
  return 1;
}

- (double)offsetFromMagnificationPoint
{
  return 0.0;
}

- (CGPoint)animationPoint
{
  double x = self->_animationPoint.x;
  double y = self->_animationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_animationPoint = a3;
}

- (UIView)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (UITextInput)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscrollRenderer, 0);
  objc_storeStrong((id *)&self->_magnifierRenderer, 0);
  objc_storeStrong((id *)&self->_weightedPoint, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end