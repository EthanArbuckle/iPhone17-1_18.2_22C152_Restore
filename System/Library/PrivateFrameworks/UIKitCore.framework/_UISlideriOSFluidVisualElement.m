@interface _UISlideriOSFluidVisualElement
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)cancelMouseTracking;
- (BOOL)cancelTouchTracking;
- (BOOL)changeWithVolumeButtons;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)driver:(id)a3 shouldAdjustValueForProposedValue:(double)a4 adjustedValue:(double *)a5 startValue:(double *)a6 endValue:(double *)a7;
- (BOOL)driver:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)overriddenTrackingState;
- (CGRect)_modifiedTrackRect:(CGRect)a3;
- (_UISlideriOSFluidVisualElement)initWithFrame:(CGRect)a3;
- (id)_updatedConfigurationForTrackSize:(CGSize)a3;
- (unint64_t)fluidUpdateSource;
- (void)_setValue:(float)a3 minimum:(float)a4 maximum:(float)a5 animated:(BOOL)a6;
- (void)_setupInteraction;
- (void)_updateConfigurationForFrameChange:(BOOL)a3;
- (void)_updateModelValue:(double)a3 sendAction:(BOOL)a4;
- (void)didSetEnabled;
- (void)didSetFluidTrackHidden;
- (void)didSetSpeedMultiplier;
- (void)didSetUserInteractionEnabled;
- (void)didSetValues;
- (void)setBounds:(CGRect)a3;
- (void)setChangeWithVolumeButtons:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSlider:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
@end

@implementation _UISlideriOSFluidVisualElement

- (_UISlideriOSFluidVisualElement)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UISlideriOSFluidVisualElement;
  result = -[_UISlideriOSVisualElement initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    uint64_t v4 = MEMORY[0x1E4F1DAB8];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_trackTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_trackTransform.c = v5;
    *(_OWORD *)&result->_trackTransform.tx = *(_OWORD *)(v4 + 32);
    result->_changeWithVolumeButtons = 1;
  }
  return result;
}

- (void)setSlider:(id)a3
{
  id v4 = a3;
  if (self->_fluidInteraction)
  {
    long long v5 = [(_UISlideriOSVisualElement *)self slider];
    [v5 removeInteraction:self->_fluidInteraction];

    fluidInteraction = self->_fluidInteraction;
    self->_fluidInteraction = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)_UISlideriOSFluidVisualElement;
  [(_UISlideriOSVisualElement *)&v7 setSlider:v4];
  if (v4) {
    [(_UISlideriOSFluidVisualElement *)self _setupInteraction];
  }
}

- (id)_updatedConfigurationForTrackSize:(CGSize)a3
{
  id v4 = +[_UIFluidSliderInteractionConfiguration configurationWithTrackSize:](_UIFluidSliderInteractionConfiguration, "configurationWithTrackSize:", a3.width, a3.height);
  long long v5 = v4;
  if (self->_changeWithVolumeButtons) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 1;
  }
  [v4 setPreferredInputMethods:v6];
  objc_super v7 = [(_UISlideriOSVisualElement *)self data];
  [v7 sliderSpeedMultiplier];
  [v5 setVelocityMultiplier:v8];

  return v5;
}

- (void)_setupInteraction
{
  if (self->_fluidInteraction)
  {
    v3 = [(_UISlideriOSVisualElement *)self slider];
    [v3 removeInteraction:self->_fluidInteraction];

    fluidInteraction = self->_fluidInteraction;
    self->_fluidInteraction = 0;
  }
  long long v5 = [(_UISlideriOSVisualElement *)self slider];
  [(UIView *)self bounds];
  objc_msgSend(v5, "trackRectForBounds:");
  double v7 = v6;
  double v9 = v8;

  v10 = -[_UISlideriOSFluidVisualElement _updatedConfigurationForTrackSize:](self, "_updatedConfigurationForTrackSize:", v7, v9);
  v11 = [_UIFluidSliderInteraction alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51___UISlideriOSFluidVisualElement__setupInteraction__block_invoke;
  v15[3] = &unk_1E52FE938;
  v15[4] = self;
  v12 = [(_UIFluidSliderInteraction *)v11 initWithConfiguration:v10 handler:v15];
  v13 = self->_fluidInteraction;
  self->_fluidInteraction = v12;

  [(_UIFluidSliderInteraction *)self->_fluidInteraction _setDirectDrivingDelegate:self];
  v14 = [(_UISlideriOSVisualElement *)self slider];
  [v14 addInteraction:self->_fluidInteraction];
}

- (CGRect)_modifiedTrackRect:(CGRect)a3
{
  CGFloat v3 = self->_trackBounds.size.width - a3.size.width;
  CGFloat v4 = self->_trackBounds.size.height - a3.size.height;
  v7.origin.x = a3.origin.x - v3 * 0.5;
  v7.size.width = a3.size.width + v3;
  v7.origin.y = a3.origin.y - v4 * 0.5;
  v7.size.height = a3.size.height + v4;
  long long v5 = *(_OWORD *)&self->_trackTransform.c;
  *(_OWORD *)&v6.a = *(_OWORD *)&self->_trackTransform.a;
  *(_OWORD *)&v6.c = v5;
  *(_OWORD *)&v6.tx = *(_OWORD *)&self->_trackTransform.tx;
  return CGRectApplyAffineTransform(v7, &v6);
}

- (void)_updateConfigurationForFrameChange:(BOOL)a3
{
  long long v5 = [(_UISlideriOSVisualElement *)self slider];
  [(UIView *)self bounds];
  objc_msgSend(v5, "trackRectForBounds:");
  double v7 = v6;
  double v9 = v8;

  v10 = [(_UIFluidSliderInteraction *)self->_fluidInteraction configuration];
  [v10 trackSize];
  double v12 = v11;
  double v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    v16 = -[_UISlideriOSFluidVisualElement _updatedConfigurationForTrackSize:](self, "_updatedConfigurationForTrackSize:", v7, v9);
    v17 = v16;
    if (a3)
    {
      [(_UIFluidSliderInteraction *)self->_fluidInteraction setConfiguration:v16];
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __69___UISlideriOSFluidVisualElement__updateConfigurationForFrameChange___block_invoke;
      v18[3] = &unk_1E52D9F98;
      v18[4] = self;
      id v19 = v16;
      +[UIView performWithoutAnimation:v18];
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISlideriOSFluidVisualElement;
  -[_UISlideriOSVisualElement setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UISlideriOSFluidVisualElement *)self _updateConfigurationForFrameChange:+[UIView _isInAnimationBlockWithAnimationsEnabled]];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISlideriOSFluidVisualElement;
  -[_UISlideriOSVisualElement setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UISlideriOSFluidVisualElement *)self _updateConfigurationForFrameChange:+[UIView _isInAnimationBlockWithAnimationsEnabled]];
}

- (void)setChangeWithVolumeButtons:(BOOL)a3
{
  if (self->_changeWithVolumeButtons != a3)
  {
    self->_changeWithVolumeButtons = a3;
    [(_UISlideriOSFluidVisualElement *)self _setupInteraction];
  }
}

- (void)didSetEnabled
{
  v5.receiver = self;
  v5.super_class = (Class)_UISlideriOSFluidVisualElement;
  [(_UISlideriOSVisualElement *)&v5 didSetEnabled];
  CGFloat v3 = [(_UISlideriOSVisualElement *)self data];
  if ([v3 isEnabled])
  {
    objc_super v4 = [(_UISlideriOSVisualElement *)self data];
    -[_UIFluidSliderInteraction setUserInteractionEnabled:](self->_fluidInteraction, "setUserInteractionEnabled:", [v4 isUserInteractionEnabled]);
  }
  else
  {
    [(_UIFluidSliderInteraction *)self->_fluidInteraction setUserInteractionEnabled:0];
  }
}

- (void)didSetUserInteractionEnabled
{
  id v4 = [(_UISlideriOSVisualElement *)self data];
  if ([v4 isEnabled])
  {
    CGFloat v3 = [(_UISlideriOSVisualElement *)self data];
    -[_UIFluidSliderInteraction setUserInteractionEnabled:](self->_fluidInteraction, "setUserInteractionEnabled:", [v3 isUserInteractionEnabled]);
  }
  else
  {
    [(_UIFluidSliderInteraction *)self->_fluidInteraction setUserInteractionEnabled:0];
  }
}

- (unint64_t)fluidUpdateSource
{
  return self->_fluidUpdateSource;
}

- (BOOL)driver:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double x = a4.x;
  double v6 = [(_UISlideriOSVisualElement *)self data];
  int v7 = [v6 isFluidTrackHidden];

  if (!v7) {
    return 1;
  }
  double v8 = [(_UISlideriOSVisualElement *)self slider];
  [(UIView *)self bounds];
  objc_msgSend(v8, "trackRectForBounds:");
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v18.origin.double x = v10;
  v18.origin.y = v12;
  v18.size.width = v14;
  v18.size.height = v16;
  if (x < CGRectGetMinX(v18)) {
    return 1;
  }
  v19.origin.double x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  return x < CGRectGetMinX(v19);
}

- (BOOL)driver:(id)a3 shouldAdjustValueForProposedValue:(double)a4 adjustedValue:(double *)a5 startValue:(double *)a6 endValue:(double *)a7
{
  if (self && (*(unsigned char *)&self->super._sliderFlags & 8) != 0)
  {
    CGFloat v12 = [(_UISlideriOSVisualElement *)self slider];
    double v13 = [v12 _sliderConfiguration];

    uint64_t v17 = 0;
    *(float *)&double v14 = a4;
    float v16 = 0.0;
    int v7 = [v13 adjustPositionForTargetPosition:(char *)&v17 + 4 adjustedPosition:&v17 startPosition:&v16 endPosition:v14];
    if (v7)
    {
      if (a5) {
        *a5 = *((float *)&v17 + 1);
      }
      if (a6) {
        *a6 = *(float *)&v17;
      }
      if (a7) {
        *a7 = v16;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)didSetFluidTrackHidden
{
  uint64_t v3 = [(_UISlideriOSVisualElement *)self data];
  if (v3
    && (id v4 = (void *)v3,
        [(_UISlideriOSVisualElement *)self data],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isFluidTrackHidden],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    int v7 = 0;
    double v8 = 0.0;
  }
  else
  {
    double v8 = 1.0;
    int v7 = 1;
  }
  double v9 = [(_UISlideriOSVisualElement *)self _minTrackClipView];
  [v9 setAlpha:v8];

  CGFloat v10 = [(_UISlideriOSVisualElement *)self _maxTrackClipView];
  [v10 setAlpha:v8];

  double v11 = [(_UISlideriOSVisualElement *)self slider];
  if ([v11 _isThumbEnabled])
  {
    CGFloat v12 = [(_UISlideriOSVisualElement *)self data];
    int v13 = [v12 isMinimumTrackVisible];
  }
  else
  {
    int v13 = 0;
  }

  if ((v7 & v13) != 0) {
    double v14 = 1.0;
  }
  else {
    double v14 = 0.0;
  }
  id v15 = [(_UISlideriOSVisualElement *)self thumbView];
  [v15 setAlpha:v14];
}

- (void)didSetSpeedMultiplier
{
  id v6 = [(_UIFluidSliderInteraction *)self->_fluidInteraction configuration];
  uint64_t v3 = [(_UISlideriOSVisualElement *)self data];
  [v3 sliderSpeedMultiplier];
  objc_super v5 = (void *)[v6 copyWithVelocityMultiplier:v4];
  [(_UIFluidSliderInteraction *)self->_fluidInteraction setConfiguration:v5];
}

- (void)_setValue:(float)a3 minimum:(float)a4 maximum:(float)a5 animated:(BOOL)a6
{
  double v6 = (float)((float)(a3 - a4) / (float)(a5 - a4));
  if (a6)
  {
    fluidInteraction = self->_fluidInteraction;
    [(_UIFluidSliderInteraction *)fluidInteraction setValue:v6];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69___UISlideriOSFluidVisualElement__setValue_minimum_maximum_animated___block_invoke;
    v8[3] = &unk_1E52D9CD0;
    v8[4] = self;
    *(double *)&v8[5] = v6;
    +[UIView performWithoutAnimation:v8];
  }
}

- (void)_updateModelValue:(double)a3 sendAction:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = [(_UISlideriOSVisualElement *)self data];
  [v7 minimumValue];
  float v9 = v8;

  CGFloat v10 = [(_UISlideriOSVisualElement *)self data];
  [v10 maximumValue];
  float v12 = v11 - v9;

  float v13 = v12 * a3 + v9;
  double v14 = [(_UISlideriOSVisualElement *)self data];
  [v14 value];
  float v16 = v15;

  if (v16 != v13)
  {
    uint64_t v17 = [(_UISlideriOSVisualElement *)self data];
    *(float *)&double v18 = v13;
    [v17 setValue:v18];

    if ((self->_fluidUpdateSource & 7) != 0) {
      [(_UISlideriOSVisualElement *)self _bounceMinMaxValueImageViewsIfNeeded];
    }
    if (v4)
    {
      id v19 = [(_UISlideriOSVisualElement *)self slider];
      [v19 sendActionsForControlEvents:4096];
    }
  }
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = [(_UISlideriOSVisualElement *)self data];
  [v14 minimumValue];
  int v8 = v7;
  float v9 = [(_UISlideriOSVisualElement *)self data];
  [v9 maximumValue];
  LODWORD(v11) = v10;
  *(float *)&double v12 = a3;
  LODWORD(v13) = v8;
  [(_UISlideriOSFluidVisualElement *)self _setValue:v4 minimum:v12 maximum:v13 animated:v11];
}

- (void)didSetValues
{
  id v13 = [(_UISlideriOSVisualElement *)self data];
  [v13 value];
  int v4 = v3;
  objc_super v5 = [(_UISlideriOSVisualElement *)self data];
  [v5 value];
  int v7 = v6;
  int v8 = [(_UISlideriOSVisualElement *)self data];
  [v8 value];
  LODWORD(v10) = v9;
  LODWORD(v11) = v4;
  LODWORD(v12) = v7;
  [(_UISlideriOSFluidVisualElement *)self _setValue:0 minimum:v11 maximum:v12 animated:v10];
}

- (BOOL)overriddenTrackingState
{
  return self->_overriddenTrackingState;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)cancelMouseTracking
{
  return 0;
}

- (BOOL)cancelTouchTracking
{
  return 0;
}

- (BOOL)changeWithVolumeButtons
{
  return self->_changeWithVolumeButtons;
}

- (void).cxx_destruct
{
}

@end