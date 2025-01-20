@interface UIStepperHorizontalVisualElement
+ (CGSize)initialSize;
+ (UIEdgeInsets)initialAlignmentRectInsets;
+ (id)_highlightOpacityAnimation;
+ (id)_highlightSizeAnimation;
- (BOOL)autorepeat;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isContinuous;
- (BOOL)isEnabled;
- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)wraps;
- (CGRect)_leftHighlightFrame;
- (CGRect)_leftHighlightInsetFrame;
- (CGRect)_rightHighlightFrame;
- (CGRect)_rightHighlightInsetFrame;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (UIEdgeInsets)alignmentRectInsetsForControl:(id)a3;
- (UIStepperControl)stepperControl;
- (UIStepperHorizontalVisualElement)initWithFrame:(CGRect)a3;
- (double)maximumValue;
- (double)minimumValue;
- (double)stepValue;
- (double)value;
- (id)_alphaAnimator:(BOOL)a3;
- (id)backgroundImageForState:(unint64_t)a3;
- (id)decrementImageForState:(unint64_t)a3;
- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)incrementImageForState:(unint64_t)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_commonStepperInit;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_startTimer;
- (void)_stopTimer;
- (void)_updateBackgroundForButtonState;
- (void)_updateButton:(id)a3 backgroundView:(id)a4 highlightView:(id)a5 backgroundImage:(id)a6 highlightImage:(id)a7 onRight:(BOOL)a8;
- (void)_updateButtonEnabled;
- (void)_updateCount:(id)a3;
- (void)_updateDividerImageForButtonState;
- (void)_updateHighlight:(id)a3 button:(id)a4 onRight:(BOOL)a5;
- (void)_updateHighlightingAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAutorepeat:(BOOL)a3;
- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4;
- (void)setContinuous:(BOOL)a3;
- (void)setDecrementImage:(id)a3 forState:(unint64_t)a4;
- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5;
- (void)setEnabled:(BOOL)a3;
- (void)setIncrementImage:(id)a3 forState:(unint64_t)a4;
- (void)setMaximumValue:(double)a3;
- (void)setMinimumValue:(double)a3;
- (void)setStepValue:(double)a3;
- (void)setStepperControl:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setValue:(double)minimumValue;
- (void)setWraps:(BOOL)a3;
@end

@implementation UIStepperHorizontalVisualElement

- (UIStepperHorizontalVisualElement)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIStepperHorizontalVisualElement;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIStepperHorizontalVisualElement *)v3 _commonStepperInit];
    [(UIStepperHorizontalVisualElement *)v4 _updateButtonEnabled];
  }
  return v4;
}

- (void)setValue:(double)minimumValue
{
  if (self->_minimumValue > minimumValue) {
    minimumValue = self->_minimumValue;
  }
  if (minimumValue >= self->_maximumValue) {
    minimumValue = self->_maximumValue;
  }
  if (minimumValue != self->_value)
  {
    self->_value = minimumValue;
    [(UIStepperHorizontalVisualElement *)self _updateButtonEnabled];
    id v4 = [(UIStepperHorizontalVisualElement *)self stepperControl];
    [v4 visualElementDidSetValue:self];
  }
}

- (void)setMinimumValue:(double)a3
{
  if (self->_minimumValue != a3)
  {
    if (self->_maximumValue < a3) {
      [(UIStepperHorizontalVisualElement *)self setMaximumValue:a3];
    }
    self->_minimumValue = a3;
    double value = self->_value;
    if (value < a3) {
      double value = a3;
    }
    [(UIStepperHorizontalVisualElement *)self setValue:value];
    [(UIStepperHorizontalVisualElement *)self _updateButtonEnabled];
  }
}

- (void)setMaximumValue:(double)a3
{
  if (self->_maximumValue != a3)
  {
    if (self->_minimumValue > a3) {
      [(UIStepperHorizontalVisualElement *)self setMinimumValue:a3];
    }
    self->_maximumValue = a3;
    double value = self->_value;
    if (value >= a3) {
      double value = a3;
    }
    [(UIStepperHorizontalVisualElement *)self setValue:value];
    [(UIStepperHorizontalVisualElement *)self _updateButtonEnabled];
  }
}

- (void)setStepValue:(double)a3
{
  if (self->_stepValue != a3)
  {
    if (a3 <= 0.0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"stepValue must be greater than 0"];
    }
    self->_stepValue = a3;
  }
}

- (void)setEnabled:(BOOL)a3
{
  if ([(UIStepperHorizontalVisualElement *)self isEnabled] != a3)
  {
    self->_enabled = a3;
    [(UIStepperHorizontalVisualElement *)self _updateButtonEnabled];
    double v5 = 1.0;
    if (a3 || ([(UIView *)self alpha], v7 = v6, double v5 = 0.5, v7 > 0.5))
    {
      [(UIView *)self setAlpha:v5];
    }
  }
}

+ (CGSize)initialSize
{
  +[UISegmentedControl _defaultHeight];
  double v3 = v2;
  double v4 = 94.0;
  result.height = v3;
  result.width = v4;
  return result;
}

+ (UIEdgeInsets)initialAlignmentRectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double v4 = -[UIButton backgroundImageForState:](self->_plusButton, "backgroundImageForState:", 0, a3.width, a3.height);
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  v9 = [(UIButton *)self->_minusButton backgroundImageForState:0];
  [v9 size];
  double v11 = v10;

  double v12 = fmax(v6 + v11, 94.0);
  +[UISegmentedControl _defaultHeight];
  if (v13 >= v8) {
    double v14 = v13;
  }
  else {
    double v14 = v8;
  }
  double v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)setWraps:(BOOL)a3
{
  self->_wraps = a3;
  [(UIStepperHorizontalVisualElement *)self _updateButtonEnabled];
}

- (void)_commonStepperInit
{
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self setClipsToBounds:1];
    double v3 = [(UIView *)self traitCollection];
    +[UISegmentedControl _cornerRadiusForTraitCollection:v3 size:0];
    -[UIView _setCornerRadius:](self, "_setCornerRadius:");
  }
  self->_isRtoL = [(UIView *)self _shouldReverseLayoutDirection];
  double v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dividerImages = self->_dividerImages;
  self->_dividerImages = v4;

  double v6 = objc_alloc_init(UIImageView);
  middleView = self->_middleView;
  self->_middleView = v6;

  [(UIView *)self addSubview:self->_middleView];
  id v13 = +[UIButton buttonWithType:0];
  [v13 setLeft:1];
  [v13 setAdjustsImageWhenHighlighted:0];
  [(UIView *)self addSubview:v13];
  double v8 = +[UIButton buttonWithType:0];
  [v8 setLeft:0];
  [v8 setAdjustsImageWhenHighlighted:0];
  [(UIView *)self addSubview:v8];
  if (self->_isRtoL) {
    v9 = v13;
  }
  else {
    v9 = v8;
  }
  if (self->_isRtoL) {
    double v10 = v8;
  }
  else {
    double v10 = v13;
  }
  objc_storeStrong((id *)&self->_plusButton, v9);
  double v11 = v10;
  minusButton = self->_minusButton;
  self->_minusButton = v11;

  [(UIStepperHorizontalVisualElement *)self setBackgroundImage:0 forState:0];
  [(UIStepperHorizontalVisualElement *)self setBackgroundImage:0 forState:2];
  [(UIStepperHorizontalVisualElement *)self setBackgroundImage:0 forState:3];
  [(UIStepperHorizontalVisualElement *)self setBackgroundImage:0 forState:1];
  [(UIStepperHorizontalVisualElement *)self _updateBackgroundForButtonState];
  [(UIStepperHorizontalVisualElement *)self setDividerImage:0 forLeftSegmentState:0 rightSegmentState:0];
  [(UIStepperHorizontalVisualElement *)self setDividerImage:0 forLeftSegmentState:1 rightSegmentState:0];
  [(UIStepperHorizontalVisualElement *)self setDividerImage:0 forLeftSegmentState:0 rightSegmentState:1];
  [(UIStepperHorizontalVisualElement *)self setIncrementImage:0 forState:0];
  [(UIStepperHorizontalVisualElement *)self setDecrementImage:0 forState:0];
}

- (void)_updateButtonEnabled
{
  plusButton = self->_plusButton;
  BOOL v4 = self->_wraps || self->_value < self->_maximumValue;
  [(UIButton *)plusButton setEnabled:v4];
  BOOL v5 = self->_wraps || self->_value > self->_minimumValue;
  [(UIButton *)self->_minusButton setEnabled:v5];
  if (![(UIControl *)self->_plusButton isEnabled]) {
    [(UIButton *)self->_plusButton setHighlighted:0];
  }
  if (![(UIControl *)self->_minusButton isEnabled]) {
    [(UIButton *)self->_minusButton setHighlighted:0];
  }
  [(UIStepperHorizontalVisualElement *)self _updateBackgroundForButtonState];
  [(UIStepperHorizontalVisualElement *)self _updateDividerImageForButtonState];
}

- (void)_updateHighlightingAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double x = a3.x;
  if (-[UIStepperHorizontalVisualElement pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", a4, a3.x, a3.y))
  {
    [(UIView *)self bounds];
    double MidX = CGRectGetMidX(v13);
    BOOL v7 = x < MidX;
    BOOL v8 = x >= MidX;
    if (self->_isRtoL) {
      BOOL v9 = x < MidX;
    }
    else {
      BOOL v9 = x >= MidX;
    }
    [(UIButton *)self->_plusButton setHighlighted:v9];
    minusButton = self->_minusButton;
    if (self->_isRtoL) {
      BOOL v11 = v8;
    }
    else {
      BOOL v11 = v7;
    }
  }
  else
  {
    [(UIButton *)self->_minusButton setHighlighted:0];
    minusButton = self->_plusButton;
    BOOL v11 = 0;
  }
  [(UIButton *)minusButton setHighlighted:v11];
  [(UIStepperHorizontalVisualElement *)self _updateBackgroundForButtonState];
  [(UIStepperHorizontalVisualElement *)self _updateDividerImageForButtonState];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UIStepperHorizontalVisualElement;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  if (dyld_program_sdk_at_least())
  {
    [(UIStepperHorizontalVisualElement *)self _updateBackgroundForButtonState];
    [(UIStepperHorizontalVisualElement *)self _updateDividerImageForButtonState];
  }
}

+ (id)_highlightSizeAnimation
{
  double v2 = [[UISpringTimingParameters alloc] initWithDampingRatio:1.0 response:0.28];
  objc_super v3 = [[UIViewPropertyAnimator alloc] initWithDuration:v2 timingParameters:0.0];

  return v3;
}

+ (id)_highlightOpacityAnimation
{
  double v2 = [[UISpringTimingParameters alloc] initWithDampingRatio:2.0 response:0.12];
  objc_super v3 = [[UIViewPropertyAnimator alloc] initWithDuration:v2 timingParameters:0.0];
  [(UIViewPropertyAnimator *)v3 setInterruptible:0];

  return v3;
}

- (CGRect)_leftHighlightFrame
{
  uint64_t v2 = 4;
  if (!self->_isRtoL) {
    uint64_t v2 = 5;
  }
  id v3 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v2]));
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10 + 1.0;

  double v12 = v5;
  double v13 = v7;
  double v14 = v11;
  double v15 = v9;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)_leftHighlightInsetFrame
{
  [(UIStepperHorizontalVisualElement *)self _leftHighlightFrame];
  return CGRectInset(*(CGRect *)&v2, 4.0, 4.0);
}

- (CGRect)_rightHighlightFrame
{
  uint64_t v2 = 4;
  if (self->_isRtoL) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  double v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v3]);
  if (self->_isRtoL) {
    uint64_t v2 = 5;
  }
  double v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v2]);
  id v6 = v4;
  [v5 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11 + -1.0;
  double v14 = v13 + 1.0;

  double v15 = v12;
  double v16 = v8;
  double v17 = v14;
  double v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)_rightHighlightInsetFrame
{
  [(UIStepperHorizontalVisualElement *)self _rightHighlightFrame];
  return CGRectInset(*(CGRect *)&v2, 4.0, 4.0);
}

- (id)_alphaAnimator:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 11;
  if (a3) {
    uint64_t v5 = 10;
  }
  id v6 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v5]));
  if (v6)
  {
    double v7 = v6;
    if ([v6 isRunning]) {
      [v7 stopAnimation:1];
    }
  }
  else
  {
    double v7 = +[UIStepperHorizontalVisualElement _highlightOpacityAnimation];
    if (v3) {
      uint64_t v8 = 504;
    }
    else {
      uint64_t v8 = 496;
    }
    objc_storeStrong((id *)((char *)&self->super.super.super.isa + v8), v7);
  }
  return v7;
}

- (void)_updateHighlight:(id)a3 button:(id)a4 onRight:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [a4 state];
  [v8 alpha];
  if (v9 == 1)
  {
    if (v10 != 1.0)
    {
      double v11 = [(UIStepperHorizontalVisualElement *)self _alphaAnimator:v5];
      uint64_t v12 = 13;
      if (v5) {
        uint64_t v12 = 12;
      }
      id v13 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                              + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v12]));
      if (v13)
      {
        double v14 = v13;
        if (!v5) {
          goto LABEL_14;
        }
      }
      else
      {
        double v14 = +[UIStepperHorizontalVisualElement _highlightSizeAnimation];
        if (!v5)
        {
          objc_storeStrong((id *)&self->_leftFrameAnimator, v14);
LABEL_14:
          [(UIStepperHorizontalVisualElement *)self _leftHighlightFrame];
          goto LABEL_15;
        }
        objc_storeStrong((id *)&self->_rightFrameAnimator, v14);
      }
      [(UIStepperHorizontalVisualElement *)self _rightHighlightFrame];
LABEL_15:
      uint64_t v20 = v16;
      uint64_t v21 = v17;
      uint64_t v22 = v18;
      uint64_t v23 = v19;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_3;
      v34[3] = &unk_1E52D9F70;
      id v24 = v8;
      id v35 = v24;
      [v11 addAnimations:v34];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_4;
      v28 = &unk_1E52DA520;
      id v29 = v24;
      uint64_t v30 = v20;
      uint64_t v31 = v21;
      uint64_t v32 = v22;
      uint64_t v33 = v23;
      [v14 addAnimations:&v25];
      objc_msgSend(v11, "startAnimation", v25, v26, v27, v28);
      [v14 startAnimation];

      goto LABEL_16;
    }
  }
  else if (v10 != 0.0)
  {
    double v11 = [(UIStepperHorizontalVisualElement *)self _alphaAnimator:v5];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke;
    v39[3] = &unk_1E52D9F70;
    id v15 = v8;
    id v40 = v15;
    [v11 addAnimations:v39 delayFactor:0.566969897];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_2;
    v36[3] = &unk_1E52EA7D8;
    BOOL v38 = v5;
    v36[4] = self;
    id v37 = v15;
    [v11 addCompletion:v36];
    [v11 startAnimation];

    double v14 = v40;
LABEL_16:
  }
}

uint64_t __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = result;
    int v4 = *(unsigned __int8 *)(result + 48);
    BOOL v5 = *(void **)(result + 32);
    if (v4) {
      [v5 _rightHighlightFrame];
    }
    else {
      [v5 _leftHighlightFrame];
    }
    CGRect v11 = CGRectInset(*(CGRect *)&v6, 4.0, 4.0);
    double v10 = *(void **)(v3 + 40);
    return objc_msgSend(v10, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  }
  return result;
}

uint64_t __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_updateButton:(id)a3 backgroundView:(id)a4 highlightView:(id)a5 backgroundImage:(id)a6 highlightImage:(id)a7 onRight:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  double v14 = (UIImageView *)a4;
  id v15 = (UIImageView *)a5;
  id v16 = a6;
  if (v8) {
    uint64_t v17 = @"right";
  }
  else {
    uint64_t v17 = @"left";
  }
  id v18 = a7;
  uint64_t v26 = __UIImageCacheKeyWithSentinel(v16, v19, v20, v21, v22, v23, v24, v25, v17, @"__UIImageCacheKeySentinel");
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __118__UIStepperHorizontalVisualElement__updateButton_backgroundView_highlightView_backgroundImage_highlightImage_onRight___block_invoke;
  v37[3] = &unk_1E530D2A8;
  id v27 = v16;
  id v38 = v27;
  BOOL v39 = v8;
  v28 = +[UIImage _cachedImageForKey:v26 fromBlock:v37];

  if (v14)
  {
    [(UIImageView *)v14 setImage:v28];
    [(UIImageView *)v15 setImage:v18];
    id v29 = v13;
    uint64_t v30 = self;
  }
  else
  {
    uint64_t v31 = [UIImageView alloc];
    id v29 = v13;
    [v13 frame];
    double v14 = -[UIImageView initWithFrame:](v31, "initWithFrame:");
    [(UIImageView *)v14 setImage:v28];
    uint64_t v32 = [UIImageView alloc];
    [v13 frame];
    uint64_t v33 = -[UIImageView initWithFrame:](v32, "initWithFrame:");

    [(UIImageView *)v33 setImage:v18];
    [(UIView *)v33 setAlpha:0.0];
    uint64_t v30 = self;
    [(UIView *)self insertSubview:v14 atIndex:0];
    [(UIView *)v30 insertSubview:v33 aboveSubview:v30->_middleView];
    if (v8) {
      v34 = &OBJC_IVAR___UIStepperHorizontalVisualElement__rightBackground;
    }
    else {
      v34 = &OBJC_IVAR___UIStepperHorizontalVisualElement__leftBackground;
    }
    objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v34), v14);
    uint64_t v35 = v34[1];
    id v15 = v33;
    id v18 = *(Class *)((char *)&self->super.super.super.isa + v35);
    *(Class *)((char *)&self->super.super.super.isa + v35) = (Class)v15;
  }

  [(UIStepperHorizontalVisualElement *)v30 _updateHighlight:v15 button:v29 onRight:v8];
}

id __118__UIStepperHorizontalVisualElement__updateButton_backgroundView_highlightView_backgroundImage_highlightImage_onRight___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = 14;
  }
  else {
    uint64_t v3 = 11;
  }
  int v4 = [v2 _resizableImageWithCapMask:v3];
  BOOL v5 = objc_msgSend(v4, "imageWithRenderingMode:", objc_msgSend(*(id *)(a1 + 32), "renderingMode"));

  return v5;
}

- (void)_updateBackgroundForButtonState
{
  if (dyld_program_sdk_at_least())
  {
    if (self->_isRtoL) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = 5;
    }
    id v17 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                            + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v3]));
    if (self->_isRtoL) {
      uint64_t v4 = 5;
    }
    else {
      uint64_t v4 = 4;
    }
    id v5 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v4]));
    uint64_t v6 = objc_msgSend(v17, "backgroundImageForState:", objc_msgSend(v17, "state"));

    double v7 = objc_msgSend(v5, "backgroundImageForState:", objc_msgSend(v5, "state"));

    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      [(UIView *)self->_leftBackground removeFromSuperview];
      [(UIView *)self->_leftHighlight removeFromSuperview];
      [(UIView *)self->_rightBackground removeFromSuperview];
      [(UIView *)self->_rightHighlight removeFromSuperview];
    }
    +[UISegmentedControl _defaultHeight];
    double v10 = v9;
    CGRect v11 = [(UIView *)self traitCollection];
    uint64_t v12 = +[UISegmentedControl _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](UISegmentedControl, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 0, 0, 0, v11, 0, 0, 94.0, v10);

    +[UISegmentedControl _defaultHeight];
    double v14 = v13;
    id v15 = [(UIView *)self traitCollection];
    id v16 = +[UISegmentedControl _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](UISegmentedControl, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 0, 0, 1, v15, 0, 0, 94.0, v14);

    if (v6)
    {
      [(UIView *)self->_leftBackground removeFromSuperview];
      [(UIView *)self->_leftHighlight removeFromSuperview];
    }
    else
    {
      [(UIStepperHorizontalVisualElement *)self _updateButton:v17 backgroundView:self->_leftBackground highlightView:self->_leftHighlight backgroundImage:v12 highlightImage:v16 onRight:0];
    }
    if (v7)
    {
      [(UIView *)self->_rightBackground removeFromSuperview];
      [(UIView *)self->_rightHighlight removeFromSuperview];
    }
    else
    {
      [(UIStepperHorizontalVisualElement *)self _updateButton:v5 backgroundView:self->_rightBackground highlightView:self->_rightHighlight backgroundImage:v12 highlightImage:v16 onRight:1];
    }
  }
}

- (void)_updateDividerImageForButtonState
{
  if (self->_isRtoL) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  id v14 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                          + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v3]));
  if (self->_isRtoL) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 4;
  }
  id v5 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v4]));
  uint64_t v6 = [(UIView *)self->_middleView subviews];
  double v7 = [v6 firstObject];

  BOOL v8 = -[UIStepperHorizontalVisualElement dividerImageForLeftSegmentState:rightSegmentState:](self, "dividerImageForLeftSegmentState:rightSegmentState:", [v14 state], objc_msgSend(v5, "state"));
  if (v8 || (dyld_program_sdk_at_least() & 1) == 0)
  {
    if (v7) {
      [(UIView *)v7 removeFromSuperview];
    }
    [(UIImageView *)self->_middleView setImage:v8];
  }
  else
  {
    double v9 = [(UIView *)self traitCollection];
    double v10 = +[UISegmentedControl _modernDividerImageBackground:1 traitCollection:v9 tintColor:0 size:0];

    CGRect v11 = [(UIView *)self traitCollection];
    uint64_t v12 = +[UISegmentedControl _modernDividerImageBackground:0 traitCollection:v11 tintColor:0 size:0];

    [(UIImageView *)self->_middleView setImage:v10];
    if (v7)
    {
      [(UIImageView *)v7 setImage:v12];
    }
    else
    {
      double v13 = [UIImageView alloc];
      [(UIView *)self->_middleView bounds];
      double v7 = -[UIImageView initWithFrame:](v13, "initWithFrame:");
      [(UIView *)v7 setAutoresizingMask:18];
      [(UIImageView *)v7 setImage:v12];
      [(UIView *)self->_middleView insertSubview:v7 atIndex:0];
    }
  }
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UIView *)self _touchInsets];
  double v17 = v9 + v16;
  double v19 = v11 + v18;
  double v21 = v13 - (v16 + v20);
  double v23 = v15 - (v18 + v22);
  double v24 = _UIControlMostlyInsideEdgeInsets();
  CGFloat v25 = v19 + v24;
  CGFloat v28 = v21 - (v26 + v27);
  v33.size.height = v23 - (v24 + v29);
  v33.origin.double x = v17 + v26;
  v33.origin.double y = v25;
  v33.size.width = v28;
  v32.double x = x;
  v32.double y = y;
  BOOL v30 = CGRectContainsPoint(v33, v32) || -[UIView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y);

  return v30;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = self;
  v9.receiver = self;
  v9.super_class = (Class)UIStepperHorizontalVisualElement;
  uint64_t v5 = -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v6 = (void *)v5;
  if ((UIButton *)v5 != v4->_plusButton && (UIButton *)v5 != v4->_minusButton) {
    uint64_t v4 = (UIStepperHorizontalVisualElement *)v5;
  }
  id v7 = v4;

  return v7;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UIStepperHorizontalVisualElement *)self _startTimer];
  [v7 locationInView:self];
  double v9 = v8;
  double v11 = v10;

  -[UIStepperHorizontalVisualElement _updateHighlightingAtPoint:withEvent:](self, "_updateHighlightingAtPoint:withEvent:", v6, v9, v11);
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  [a3 locationInView:self];
  -[UIStepperHorizontalVisualElement _updateHighlightingAtPoint:withEvent:](self, "_updateHighlightingAtPoint:withEvent:", v6);

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[UIStepperHorizontalVisualElement _updateCount:](self, "_updateCount:", self, a4);
  [(UIButton *)self->_plusButton setHighlighted:0];
  [(UIButton *)self->_minusButton setHighlighted:0];
  [(UIStepperHorizontalVisualElement *)self _stopTimer];
  [(UIStepperHorizontalVisualElement *)self _updateBackgroundForButtonState];
  [(UIStepperHorizontalVisualElement *)self _updateDividerImageForButtonState];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  [(UIButton *)self->_plusButton setHighlighted:0];
  [(UIButton *)self->_minusButton setHighlighted:0];
  [(UIStepperHorizontalVisualElement *)self _stopTimer];
  [(UIStepperHorizontalVisualElement *)self _updateBackgroundForButtonState];
  [(UIStepperHorizontalVisualElement *)self _updateDividerImageForButtonState];
}

- (UIEdgeInsets)alignmentRectInsetsForControl:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIStepperHorizontalVisualElement;
  [(UIView *)&v7 alignmentRectInsets];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_startTimer
{
  if (self->_autorepeat)
  {
    double v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__updateCount_ selector:0 userInfo:1 repeats:0.5];
    repeatTimer = self->_repeatTimer;
    self->_repeatTimer = v3;
  }
  self->_repeatCount = 0;
}

- (void)_stopTimer
{
  [(NSTimer *)self->_repeatTimer invalidate];
  repeatTimer = self->_repeatTimer;
  self->_repeatTimer = 0;
}

- (void)_updateCount:(id)a3
{
  repeatTimer = self->_repeatTimer;
  if ([(UIControl *)self->_plusButton isHighlighted]) {
    BOOL v6 = [(UIControl *)self->_plusButton isEnabled];
  }
  else {
    BOOL v6 = 0;
  }
  if ([(UIControl *)self->_minusButton isHighlighted]) {
    BOOL v7 = [(UIControl *)self->_minusButton isEnabled];
  }
  else {
    BOOL v7 = 0;
  }
  if (repeatTimer == a3)
  {
    if (!v6 && !v7) {
      goto LABEL_29;
    }
  }
  else
  {
    int64_t repeatCount = self->_repeatCount;
    int v9 = v6 || v7;
    if (repeatCount || (v9 & 1) == 0)
    {
      if (v9)
      {
        self->_int64_t repeatCount = repeatCount + 1;
LABEL_28:
        int v17 = 1;
        goto LABEL_31;
      }
      goto LABEL_29;
    }
  }
  double stepValue = self->_stepValue;
  if (!v6) {
    double stepValue = -stepValue;
  }
  double maximumValue = self->_value + stepValue;
  if (self->_wraps)
  {
    if (maximumValue <= self->_maximumValue)
    {
      if (maximumValue < self->_minimumValue) {
        double maximumValue = self->_maximumValue;
      }
    }
    else
    {
      double maximumValue = self->_minimumValue;
    }
  }
  [(UIStepperHorizontalVisualElement *)self setValue:maximumValue];
  if (self->_continuous)
  {
    double v12 = [(UIStepperHorizontalVisualElement *)self stepperControl];
    [v12 visualElementSendValueChangedEvent:self];
  }
  if (v6 || v7)
  {
    int64_t v13 = self->_repeatCount;
    self->_int64_t repeatCount = v13 + 1;
    if (repeatTimer == a3)
    {
      double v14 = dbl_186B9DB40[v13 > 18];
      if (v13 <= 3) {
        double v14 = 0.5;
      }
      double v15 = self->_repeatTimer;
      double v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v14];
      [(NSTimer *)v15 setFireDate:v16];
    }
    goto LABEL_28;
  }
LABEL_29:
  int v17 = 0;
  if (self->_repeatCount >= 1) {
    self->_int64_t repeatCount = 1;
  }
LABEL_31:
  BOOL v18 = [(UIStepperHorizontalVisualElement *)self isContinuous];
  if (v17 && !v18 && repeatTimer != a3)
  {
    id v19 = [(UIStepperHorizontalVisualElement *)self stepperControl];
    [v19 visualElementSendValueChangedEvent:self];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  if (!dyld_program_sdk_at_least())
  {
    double v23 = 0;
    goto LABEL_19;
  }
  if (self->_isRtoL) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 5;
  }
  id v8 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v7]));
  if (self->_isRtoL) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = 4;
  }
  id v10 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                          + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v9]));
  [v8 frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [v6 location];
  v27.double x = v19;
  v27.double y = v20;
  v28.origin.double x = v12;
  v28.origin.double y = v14;
  v28.size.width = v16;
  v28.size.height = v18;
  if (!CGRectContainsPoint(v28, v27))
  {
    double v24 = objc_msgSend(v10, "backgroundImageForState:", objc_msgSend(v10, "state"));

    if (!v24 && [v10 isEnabled])
    {
      [v10 frame];
      double v22 = @"UIStepperRightPointerRegion";
      goto LABEL_16;
    }
LABEL_17:
    double v23 = 0;
    goto LABEL_18;
  }
  double v21 = objc_msgSend(v8, "backgroundImageForState:", objc_msgSend(v8, "state"));

  if (v21 || ![v8 isEnabled]) {
    goto LABEL_17;
  }
  [v8 frame];
  double v22 = @"UIStepperLeftPointerRegion";
LABEL_16:
  double v23 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v22);
LABEL_18:

LABEL_19:
  return v23;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  if (self->_isRtoL) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 5;
  }
  id v7 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v6]));
  if (self->_isRtoL) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 4;
  }
  id v9 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v8]));
  id v10 = [a4 identifier];
  int v11 = [v10 isEqual:@"UIStepperLeftPointerRegion"];

  if (v11) {
    CGFloat v12 = v7;
  }
  else {
    CGFloat v12 = v9;
  }
  id v13 = v12;
  CGFloat v14 = [(UIView *)self traitCollection];
  +[UISegmentedControl _cornerRadiusForTraitCollection:v14 size:0];

  [v13 frame];
  double v15 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
  CGFloat v16 = [[UITargetedPreview alloc] initWithView:v13];
  double v17 = +[UIPointerEffect effectWithPreview:v16];
  CGFloat v18 = +[UIPointerStyle styleWithEffect:v17 shape:v15];

  return v18;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  double v5 = [(UIView *)self->_middleView subviews];
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__UIStepperHorizontalVisualElement_pointerInteraction_willEnterRegion_animator___block_invoke;
    v7[3] = &unk_1E52D9F70;
    id v8 = v6;
    +[UIView animateWithDuration:327716 delay:v7 options:0 animations:0.41 completion:0.0];
  }
}

uint64_t __80__UIStepperHorizontalVisualElement_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  double v5 = [(UIView *)self->_middleView subviews];
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__UIStepperHorizontalVisualElement_pointerInteraction_willExitRegion_animator___block_invoke;
    v7[3] = &unk_1E52D9F70;
    id v8 = v6;
    +[UIView animateWithDuration:327716 delay:v7 options:0 animations:0.41 completion:0.0];
  }
}

uint64_t __79__UIStepperHorizontalVisualElement_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)layoutSubviews
{
  BOOL isRtoL = self->_isRtoL;
  if (isRtoL != [(UIView *)self _shouldReverseLayoutDirection])
  {
    BOOL v4 = [(UIView *)self _shouldReverseLayoutDirection];
    self->_BOOL isRtoL = v4;
    if (v4) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 5;
    }
    if (v4) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = 4;
    }
    [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v5]) setLeft:1];
    [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v6]) setLeft:0];
  }
  if (self->_isRtoL) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 5;
  }
  id v40 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                          + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v7]));
  if (self->_isRtoL) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 4;
  }
  id v9 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v8]));
  dividerImages = self->_dividerImages;
  int v11 = _UIStepperDividerKey(0, 0);
  CGFloat v12 = [(NSMutableDictionary *)dividerImages objectForKey:v11];

  if (v12)
  {
    [v12 size];
    double v14 = v13;
  }
  else
  {
    double v15 = [(UIView *)self traitCollection];
    +[UISegmentedControl _dividerWidthForTraitCollection:v15 size:0];
    double v14 = v16;
  }
  [(UIView *)self size];
  -[UIStepperHorizontalVisualElement sizeThatFits:](self, "sizeThatFits:");
  double v18 = v17;
  double v20 = v19;
  double v21 = (v17 - v14) * 0.5;
  objc_msgSend(v40, "setFrame:", 0.0, 0.0, v21, v19);
  objc_msgSend(v9, "setFrame:", v14 + v21, 0.0, v18 - v21 - v14, v20);
  if (dyld_program_sdk_at_least())
  {
    -[UIImageView setFrame:](self->_leftBackground, "setFrame:", 0.0, 0.0, v21, v20);
    [(UIView *)self->_leftHighlight alpha];
    if (v22 == 0.0) {
      [(UIStepperHorizontalVisualElement *)self _leftHighlightInsetFrame];
    }
    else {
      [(UIStepperHorizontalVisualElement *)self _leftHighlightFrame];
    }
    double v38 = v24;
    double v39 = v23;
    double v27 = v25;
    double v28 = v26;
    if ([(UIViewPropertyAnimator *)self->_leftAlphaAnimator state] != 1)
    {
      [(UIView *)self->_leftHighlight frame];
      v44.origin.double y = v38;
      v44.origin.double x = v39;
      v44.size.width = v27;
      v44.size.height = v28;
      if (!CGRectEqualToRect(v42, v44)) {
        -[UIImageView setFrame:](self->_leftHighlight, "setFrame:", v39, v38, v27, v28);
      }
    }
    -[UIImageView setFrame:](self->_rightBackground, "setFrame:", v14 + v21, 0.0, v18 - v21 - v14, v20);
    [(UIView *)self->_rightHighlight alpha];
    if (v29 == 0.0) {
      [(UIStepperHorizontalVisualElement *)self _rightHighlightInsetFrame];
    }
    else {
      [(UIStepperHorizontalVisualElement *)self _rightHighlightFrame];
    }
    double v34 = v30;
    double v35 = v31;
    double v36 = v32;
    double v37 = v33;
    if ([(UIViewPropertyAnimator *)self->_rightAlphaAnimator state] != 1)
    {
      [(UIView *)self->_rightHighlight frame];
      v45.origin.double x = v34;
      v45.origin.double y = v35;
      v45.size.width = v36;
      v45.size.height = v37;
      if (!CGRectEqualToRect(v43, v45)) {
        -[UIImageView setFrame:](self->_rightHighlight, "setFrame:", v34, v35, v36, v37);
      }
    }
  }
  -[UIImageView setFrame:](self->_middleView, "setFrame:", v21, 0.0, v14, v20);
  -[UIView setSize:](self, "setSize:", v18, v20);
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  if (v6) {
    goto LABEL_10;
  }
  if (dyld_program_sdk_at_least()) {
    goto LABEL_3;
  }
  if (a4 - 2 >= 2)
  {
    if (a4 == 1)
    {
      +[UISegmentedControl _defaultHeight];
      double v13 = v12;
      id v9 = [(UIView *)self traitCollection];
      double v10 = v13;
      uint64_t v11 = 1;
      goto LABEL_9;
    }
    if (a4)
    {
LABEL_3:
      id v6 = 0;
      goto LABEL_10;
    }
  }
  +[UISegmentedControl _defaultHeight];
  double v8 = v7;
  id v9 = [(UIView *)self traitCollection];
  double v10 = v8;
  uint64_t v11 = 0;
LABEL_9:
  +[UISegmentedControl _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](UISegmentedControl, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 0, 0, v11, v9, 0, 0, 94.0, v10);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (self->_isRtoL) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 5;
  }
  id v36 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                          + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v14]));
  if (self->_isRtoL) {
    uint64_t v15 = 5;
  }
  else {
    uint64_t v15 = 4;
  }
  id v16 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                          + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v15]));
  if (v6)
  {
    if (([v6 _isResizable] & 1) == 0)
    {
      [v6 size];
      double v18 = v17 * 0.5;
      [v6 size];
      double v20 = (double)(uint64_t)v18;
      double v21 = (double)(uint64_t)(v19 * 0.5 + -1.0);
      [v6 size];
      double v23 = v22 - v20 + -1.0;
      [v6 size];
      uint64_t v25 = objc_msgSend(v6, "resizableImageWithCapInsets:", v20, v21, v23, v24 - v21 + -1.0);

      id v6 = (id)v25;
    }
    +[UISegmentedControl _defaultHeight];
    double v27 = v26;
    [v6 size];
    double v29 = v28;
    [v6 size];
    if (v27 < v30) {
      double v27 = v30;
    }
    if (v29 <= 94.0) {
      double v31 = 47.0;
    }
    else {
      double v31 = v29 * 0.5;
    }
    _UIGraphicsBeginImageContextWithOptions(0, 0, v31, v27, 0.0);
    objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v31 + v31, v27);
    double v32 = _UIGraphicsGetImageFromCurrentImageContext(0);
    double v33 = objc_msgSend(v32, "imageWithRenderingMode:", objc_msgSend(v6, "renderingMode"));

    [v36 setBackgroundImage:v33 forState:a4];
    UIGraphicsEndImageContext();
    _UIGraphicsBeginImageContextWithOptions(0, 0, v31, v27, 0.0);
    objc_msgSend(v6, "drawInRect:", -v31, 0.0, v31 + v31, v27);
    double v34 = _UIGraphicsGetImageFromCurrentImageContext(0);
    double v35 = objc_msgSend(v34, "imageWithRenderingMode:", objc_msgSend(v6, "renderingMode"));

    [v16 setBackgroundImage:v35 forState:a4];
    UIGraphicsEndImageContext();
  }
  else
  {
    [v36 setBackgroundImage:0 forState:a4];
    [v16 setBackgroundImage:0 forState:a4];
  }
  if (dyld_program_sdk_at_least()) {
    [(UIStepperHorizontalVisualElement *)self _updateBackgroundForButtonState];
  }
  if (!a4) {
    [(UIView *)self setNeedsLayout];
  }
}

- (id)backgroundImageForState:(unint64_t)a3
{
  return [(UIButton *)self->_plusButton backgroundImageForState:a3];
}

- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5
{
  id v11 = a3;
  if (!v11)
  {
    if (dyld_program_sdk_at_least())
    {
      id v11 = 0;
    }
    else
    {
      double v8 = [(UIView *)self traitCollection];
      id v11 = +[UISegmentedControl _modernDividerImageBackground:1 traitCollection:v8 tintColor:0 size:0];
    }
  }
  dividerImages = self->_dividerImages;
  double v10 = _UIStepperDividerKey(a4, a5);
  [(NSMutableDictionary *)dividerImages setObject:v11 forKeyedSubscript:v10];

  [(UIStepperHorizontalVisualElement *)self _updateDividerImageForButtonState];
  if (!(a5 | a4)) {
    [(UIView *)self setNeedsLayout];
  }
}

- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4
{
  dividerImages = self->_dividerImages;
  double v8 = _UIStepperDividerKey(a3, a4);
  id v9 = [(NSMutableDictionary *)dividerImages objectForKey:v8];

  if (!v9)
  {
    if ((a3 & 2) != 0) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = a3;
    }
    if ((a4 & 2) != 0) {
      unint64_t v11 = 0;
    }
    else {
      unint64_t v11 = a4;
    }
    double v12 = self->_dividerImages;
    double v13 = _UIStepperDividerKey(v10, v11);
    id v9 = [(NSMutableDictionary *)v12 objectForKey:v13];
  }
  return v9;
}

- (void)setIncrementImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  if (v6 || a4)
  {
    id v9 = v6;
    if (dyld_program_sdk_at_least()) {
      [(UIButton *)self->_plusButton setTintColor:0];
    }
  }
  else
  {
    id v9 = +[UIImage _systemImageNamed:@"plus" fallback:@"UIStepperPlus"];
    if (dyld_program_sdk_at_least())
    {
      plusButton = self->_plusButton;
      double v8 = +[UIColor labelColor];
      [(UIButton *)plusButton setTintColor:v8];
    }
  }
  [(UIButton *)self->_plusButton setImage:v9 forState:a4];
}

- (id)incrementImageForState:(unint64_t)a3
{
  uint64_t v4 = 4;
  if (!self->_isRtoL) {
    uint64_t v4 = 5;
  }
  plusButton = self->_plusButton;
  id v6 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v4]));
  double v7 = [(UIButton *)plusButton imageForState:a3];

  return v7;
}

- (void)setDecrementImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  if (v6 || a4)
  {
    id v9 = v6;
    if (dyld_program_sdk_at_least()) {
      [(UIButton *)self->_minusButton setTintColor:0];
    }
  }
  else
  {
    id v9 = +[UIImage _systemImageNamed:@"minus" fallback:@"UIStepperMinus"];
    if (dyld_program_sdk_at_least())
    {
      minusButton = self->_minusButton;
      double v8 = +[UIColor labelColor];
      [(UIButton *)minusButton setTintColor:v8];
    }
  }
  [(UIButton *)self->_minusButton setImage:v9 forState:a4];
}

- (id)decrementImageForState:(unint64_t)a3
{
  return [(UIButton *)self->_minusButton imageForState:a3];
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIStepperHorizontalVisualElement;
  [(UIView *)&v4 setTintColor:a3];
  [(UIStepperHorizontalVisualElement *)self _updateBackgroundForButtonState];
  [(UIStepperHorizontalVisualElement *)self _updateDividerImageForButtonState];
}

- (double)value
{
  return self->_value;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (BOOL)autorepeat
{
  return self->_autorepeat;
}

- (void)setAutorepeat:(BOOL)a3
{
  self->_autorepeat = a3;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIStepperControl)stepperControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stepperControl);
  return (UIStepperControl *)WeakRetained;
}

- (void)setStepperControl:(id)a3
{
}

- (double)stepValue
{
  return self->_stepValue;
}

- (BOOL)wraps
{
  return self->_wraps;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stepperControl);
  objc_storeStrong((id *)&self->_rightFrameAnimator, 0);
  objc_storeStrong((id *)&self->_leftFrameAnimator, 0);
  objc_storeStrong((id *)&self->_rightAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_leftAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_dividerImages, 0);
  objc_storeStrong((id *)&self->_repeatTimer, 0);
  objc_storeStrong((id *)&self->_minusButton, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_middleView, 0);
  objc_storeStrong((id *)&self->_rightHighlight, 0);
  objc_storeStrong((id *)&self->_leftHighlight, 0);
  objc_storeStrong((id *)&self->_rightBackground, 0);
  objc_storeStrong((id *)&self->_leftBackground, 0);
}

@end