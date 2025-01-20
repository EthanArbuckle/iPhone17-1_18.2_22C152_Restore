@interface _UIKBLightEffectsBackground
- (BOOL)clientBackdropInUse;
- (BOOL)isAnimating;
- (BOOL)isClientBackdropInUse;
- (BOOL)isUsingAnimatedBackdrop;
- (BOOL)shouldShowBackdrop;
- (BOOL)shouldShowWaveView;
- (BOOL)supportsLightEffects;
- (BOOL)useLightConfigEffects;
- (NSArray)backdropClippingConstraints;
- (NSLayoutConstraint)minimumAboveKeyboardHeightConstraint;
- (NSMutableArray)lightSourceConstraints;
- (UIKBBackdropView)transitionStartBackdropView;
- (UILayoutGuide)aboveKeyboardLayoutGuide;
- (UILayoutGuide)assistantLayoutGuide;
- (UILayoutGuide)fullBackdropLayoutGuide;
- (UIView)assistantBarMaskView;
- (UIView)backdropClippingView;
- (UIView)behindAssistantView;
- (UIView)behindFullBackdropView;
- (UIView)fullBackdropMaskView;
- (UIView)mirroredLightBorderView;
- (UIView)mirroredShadowView;
- (_UIGradientView)backdropGradientMaskView;
- (_UIKBLightEffectsBackground)initWithFrame:(CGRect)a3;
- (id)bringupWaveEffectViewForDisplayScale:(double)a3;
- (id)extraBackdropViewForConfig:(id)a3;
- (id)layerForPositionMatchMove;
- (int64_t)clippingStyle;
- (void)_addContentEffectsForConfig:(id)a3;
- (void)_setRenderConfig:(id)a3;
- (void)addLayoutGuidesIfNeeded;
- (void)addLightSourceViews;
- (void)animatedTransitionToRenderConfig:(id)a3;
- (void)changeClippingStyle:(int64_t)a3;
- (void)completeTransitionToRenderConfig:(id)a3;
- (void)layoutInputBackdropToFullWithRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)maskEffectsBackdrop;
- (void)performTransitionToRenderConfig:(id)a3 fromRenderConfig:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6;
- (void)removeAnimatedBackdropEffects;
- (void)setAboveKeyboardLayoutGuide:(id)a3;
- (void)setAssistantBarMaskView:(id)a3;
- (void)setAssistantLayoutGuide:(id)a3;
- (void)setBackdropClippingConstraints:(id)a3;
- (void)setBackdropClippingView:(id)a3;
- (void)setBackdropGradientMaskView:(id)a3;
- (void)setBehindAssistantView:(id)a3;
- (void)setBehindFullBackdropView:(id)a3;
- (void)setClientBackdropInUse:(BOOL)a3;
- (void)setClippingStyle:(int64_t)a3;
- (void)setFullBackdropLayoutGuide:(id)a3;
- (void)setFullBackdropMaskView:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setIsUsingAnimatedBackdrop:(BOOL)a3;
- (void)setLightSourceConstraints:(id)a3;
- (void)setMinimumAboveKeyboardHeightConstraint:(id)a3;
- (void)setMirroredLightBorderView:(id)a3;
- (void)setMirroredShadowView:(id)a3;
- (void)setTransitionStartBackdropView:(id)a3;
- (void)setUseLightConfigEffects:(BOOL)a3;
- (void)showShadowEffects:(BOOL)a3;
- (void)transitionToStyle:(int64_t)a3 isSplit:(BOOL)a4;
- (void)updateAlphaForAnimationStart:(BOOL)a3;
- (void)updateConstraints;
- (void)updateEffectsForLightKeyboard:(BOOL)a3 forceUpdate:(BOOL)a4;
- (void)useMaskedKeyplaneBackdrop:(id)a3 assistantBackdrop:(id)a4;
@end

@implementation _UIKBLightEffectsBackground

- (_UIKBLightEffectsBackground)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_UIKBLightEffectsBackground;
  v7 = -[UIKBInputBackdropView initWithFrame:](&v11, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_clientBackdropInUse = 0;
    -[_UIKBLightEffectsBackground layoutInputBackdropToFullWithRect:](v7, "layoutInputBackdropToFullWithRect:", x, y, width, height);
    v9 = [(UIView *)v8 _inheritedRenderConfig];
    v8->_useLightConfigEffects = [v9 lightKeyboard];
  }
  return v8;
}

- (BOOL)supportsLightEffects
{
  return 1;
}

- (BOOL)shouldShowBackdrop
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    || [(_UIKBLightEffectsBackground *)self clippingStyle])
  {
    return 1;
  }
  else
  {
    return ![(_UIKBLightEffectsBackground *)self isClientBackdropInUse];
  }
}

- (void)setClientBackdropInUse:(BOOL)a3
{
  if (self->_clientBackdropInUse != a3) {
    self->_clientBackdropInUse = a3;
  }
}

- (BOOL)isClientBackdropInUse
{
  return (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1 && self->_clientBackdropInUse;
}

- (void)transitionToStyle:(int64_t)a3 isSplit:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 3904)
  {
    v6 = [(UIView *)self layer];
    [v6 setAllowsGroupBlending:0];

    [(_UIKBLightEffectsBackground *)self setIsUsingAnimatedBackdrop:1];
    v7 = [(UIView *)self _inheritedRenderConfig];
    [(_UIKBLightEffectsBackground *)self _addContentEffectsForConfig:v7];

    [(_UIKBLightEffectsBackground *)self addLightSourceViews];
    if ([(_UIKBLightEffectsBackground *)self shouldShowBackdrop]) {
      a3 = 3904;
    }
    else {
      a3 = 3903;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIKBLightEffectsBackground;
  [(UIKBInputBackdropView *)&v8 transitionToStyle:a3 isSplit:v4];
}

- (void)_addContentEffectsForConfig:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIKBLightEffectsBackground *)self shouldShowBackdrop])
  {
    int v5 = [v4 lightKeyboard];
    if (!v4 || v5)
    {
      long long v14 = xmmword_186B9A8C0;
      long long v15 = xmmword_186B9A8D0;
      long long v6 = xmmword_186B9A8E0;
      long long v7 = xmmword_186B9A8F0;
    }
    else
    {
      long long v14 = xmmword_186B9A880;
      long long v15 = xmmword_186B9A890;
      long long v6 = xmmword_186B9A8A0;
      long long v7 = xmmword_186B9A8B0;
    }
    long long v16 = v6;
    long long v17 = v7;
    long long v18 = xmmword_186B92B40;
    v10 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v14 alpha:1.0];
    v19[0] = v10;
    objc_super v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 1, v14, v15);
    v12 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v12 setContentEffects:v11];

    v13 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v13 setBackgroundColor:0];
  }
  else
  {
    objc_super v8 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v8 setContentEffects:MEMORY[0x1E4F1CBF0]];

    v9 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v9 setBackgroundColor:0];
  }
}

- (void)updateEffectsForLightKeyboard:(BOOL)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(_UIKBLightEffectsBackground *)self isAnimating] || v4)
  {
    long long v7 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
    [v7 setAlpha:1.0];

    objc_super v8 = [(_UIKBLightEffectsBackground *)self behindFullBackdropView];
    [v8 setAlpha:1.0];

    if (v5) {
      double v9 = 0.62;
    }
    else {
      double v9 = 0.25;
    }
    v10 = [(_UIKBLightEffectsBackground *)self behindAssistantView];
    [v10 setAlpha:v9];
  }
  objc_super v11 = [(UIView *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;

  double v14 = 80.0;
  if (v5) {
    double v14 = 140.0;
  }
  double v15 = v14 / v13;
  id v17 = [(_UIKBLightEffectsBackground *)self fullBackdropMaskView];
  long long v16 = [v17 layer];
  [v16 setShadowRadius:v15];
}

- (void)_setRenderConfig:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIKBLightEffectsBackground;
  [(UIKBInputBackdropView *)&v5 _setRenderConfig:v4];
  if ([(_UIKBLightEffectsBackground *)self isUsingAnimatedBackdrop]
    && ([v4 animatedBackground] & 1) == 0)
  {
    [(_UIKBLightEffectsBackground *)self removeAnimatedBackdropEffects];
  }
  -[_UIKBLightEffectsBackground setUseLightConfigEffects:](self, "setUseLightConfigEffects:", [v4 lightKeyboard]);
  if ([v4 animatedBackground])
  {
    [(_UIKBLightEffectsBackground *)self setIsUsingAnimatedBackdrop:1];
    [(UIView *)self bounds];
    [(_UIKBLightEffectsBackground *)self layoutInputBackdropToFullWithRect:"layoutInputBackdropToFullWithRect:"];
    -[_UIKBLightEffectsBackground updateEffectsForLightKeyboard:forceUpdate:](self, "updateEffectsForLightKeyboard:forceUpdate:", [v4 lightKeyboard], 0);
  }
  -[_UIKBLightEffectsBackground transitionToStyle:isSplit:](self, "transitionToStyle:isSplit:", [v4 backdropStyle], 0);
}

- (void)removeAnimatedBackdropEffects
{
  [(_UIKBLightEffectsBackground *)self setIsUsingAnimatedBackdrop:0];
  v3 = [(_UIKBLightEffectsBackground *)self behindFullBackdropView];

  if (v3)
  {
    id v4 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v4 setContentEffects:MEMORY[0x1E4F1CBF0]];

    objc_super v5 = +[UIColor systemBackgroundColor];
    long long v6 = [v5 colorWithAlphaComponent:0.1];
    long long v7 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v7 setBackgroundColor:v6];

    objc_super v8 = (void *)MEMORY[0x1E4F5B268];
    double v9 = [(_UIKBLightEffectsBackground *)self lightSourceConstraints];
    [v8 deactivateConstraints:v9];

    [(_UIKBLightEffectsBackground *)self setLightSourceConstraints:0];
    v10 = [(_UIKBLightEffectsBackground *)self behindFullBackdropView];
    [v10 removeFromSuperview];

    objc_super v11 = [(_UIKBLightEffectsBackground *)self behindAssistantView];
    [v11 removeFromSuperview];

    double v12 = [(_UIKBLightEffectsBackground *)self backdropGradientMaskView];
    [v12 removeFromSuperview];

    [(_UIKBLightEffectsBackground *)self setBehindFullBackdropView:0];
    [(_UIKBLightEffectsBackground *)self setBehindAssistantView:0];
    [(_UIKBLightEffectsBackground *)self setAssistantBarMaskView:0];
    [(_UIKBLightEffectsBackground *)self setFullBackdropMaskView:0];
    [(_UIKBLightEffectsBackground *)self setBackdropGradientMaskView:0];
  }
}

- (void)performTransitionToRenderConfig:(id)a3 fromRenderConfig:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v10 animatedBackground]) {
    goto LABEL_9;
  }
  [(_UIKBLightEffectsBackground *)self setIsUsingAnimatedBackdrop:1];
  [(UIView *)self bounds];
  [(_UIKBLightEffectsBackground *)self layoutInputBackdropToFullWithRect:"layoutInputBackdropToFullWithRect:"];
  if ([(_UIKBLightEffectsBackground *)self shouldShowWaveView]
    && !_AXSEnhanceBackgroundContrastEnabled())
  {
    if (v11)
    {
      v27 = [(_UIKBLightEffectsBackground *)self transitionStartBackdropView];

      if (!v27)
      {
        v28 = [(_UIKBLightEffectsBackground *)self extraBackdropViewForConfig:v11];
        [(_UIKBLightEffectsBackground *)self setTransitionStartBackdropView:v28];
      }
      v29 = [(_UIKBLightEffectsBackground *)self transitionStartBackdropView];
      objc_msgSend(v29, "transitionToStyle:", objc_msgSend(v11, "backdropStyle"));

      v30 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      [v30 transitionToStyle:3903];

      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        goto LABEL_5;
      }
      v31 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      [v31 setAlpha:0.0];
    }
    else
    {
      v31 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      [v31 transitionToStyle:3903];
    }
  }
  else
  {
    [(_UIKBLightEffectsBackground *)self transitionToStyle:3904 isSplit:0];
  }
LABEL_5:
  [(_UIKBLightEffectsBackground *)self setIsAnimating:1];
  double v14 = [(UIView *)self traitCollection];
  [v14 displayScale];
  double v16 = v15;

  if ([(_UIKBLightEffectsBackground *)self shouldShowWaveView])
  {
    id v17 = [(_UIKBLightEffectsBackground *)self bringupWaveEffectViewForDisplayScale:v16];
    [(UIView *)self addSubview:v17];
    long long v18 = [v17 topAnchor];
    v19 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
    v20 = [v19 topAnchor];
    v21 = [v18 constraintEqualToAnchor:v20 constant:720.0 / v16];

    [v21 setActive:1];
  }
  else
  {
    id v17 = 0;
    v21 = 0;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke;
  v42[3] = &unk_1E52D9F70;
  v42[4] = self;
  +[UIView performWithoutAnimation:v42];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_2;
  aBlock[3] = &unk_1E52FC2E0;
  aBlock[4] = self;
  id v22 = v17;
  id v37 = v22;
  id v38 = v21;
  double v41 = v16;
  id v39 = v10;
  id v40 = v12;
  id v23 = v21;
  v24 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_3;
  v32[3] = &unk_1E52FC308;
  id v33 = v22;
  id v34 = v24;
  v32[4] = self;
  id v35 = v13;
  id v25 = v22;
  id v26 = v24;
  +[UIView _performWithAnimation:v32];

LABEL_9:
}

- (BOOL)shouldShowWaveView
{
  return _AXSReduceMotionEnabled() == 0;
}

- (void)updateAlphaForAnimationStart:(BOOL)a3
{
  if (a3
    && [(_UIKBLightEffectsBackground *)self shouldShowWaveView]
    && !_AXSEnhanceBackgroundContrastEnabled())
  {
    if ([(_UIKBLightEffectsBackground *)self clippingStyle] == 3)
    {
      objc_super v5 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      [v5 transitionToStyle:3903];
    }
    long long v6 = [(_UIKBLightEffectsBackground *)self behindFullBackdropView];
    [v6 setAlpha:0.2];

    id v7 = [(_UIKBLightEffectsBackground *)self behindAssistantView];
    [v7 setAlpha:0.2];
  }
  else
  {
    BOOL v4 = [(_UIKBLightEffectsBackground *)self useLightConfigEffects];
    [(_UIKBLightEffectsBackground *)self updateEffectsForLightKeyboard:v4 forceUpdate:1];
  }
}

- (void)animatedTransitionToRenderConfig:(id)a3
{
  id v4 = a3;
  -[_UIKBLightEffectsBackground setIsUsingAnimatedBackdrop:](self, "setIsUsingAnimatedBackdrop:", [v4 animatedBackground]);
  if ([v4 animatedBackground])
  {
    [(_UIKBLightEffectsBackground *)self transitionToStyle:3904 isSplit:0];
    -[_UIKBLightEffectsBackground setUseLightConfigEffects:](self, "setUseLightConfigEffects:", [v4 lightKeyboard]);
    [(_UIKBLightEffectsBackground *)self updateAlphaForAnimationStart:0];
  }
}

- (void)completeTransitionToRenderConfig:(id)a3
{
  id v4 = [(_UIKBLightEffectsBackground *)self transitionStartBackdropView];
  [v4 removeFromSuperview];

  [(_UIKBLightEffectsBackground *)self setTransitionStartBackdropView:0];
  [(_UIKBLightEffectsBackground *)self setIsAnimating:0];
  id v5 = [(_UIKBLightEffectsBackground *)self behindAssistantView];
  [(UIView *)self bringSubviewToFront:v5];
}

- (id)bringupWaveEffectViewForDisplayScale:(double)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(_UIGradientView);
  [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = *MEMORY[0x1E4F3A3A0];
  id v7 = [(_UIGradientView *)v5 gradientLayer];
  [v7 setType:v6];

  uint64_t v8 = *MEMORY[0x1E4F3A2E8];
  double v9 = [(_UIGradientView *)v5 gradientLayer];
  [v9 setCompositingFilter:v8];

  id v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  v36[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  id v12 = [(_UIGradientView *)v5 gradientLayer];
  [v12 setInterpolations:v11];

  id v13 = [(_UIGradientView *)v5 gradientLayer];
  objc_msgSend(v13, "setStartPoint:", 0.5, 0.5);

  double v14 = [(_UIGradientView *)v5 gradientLayer];
  objc_msgSend(v14, "setEndPoint:", 0.0, 0.0);

  double v15 = [(_UIGradientView *)v5 gradientLayer];
  [v15 setLocations:&unk_1ED3F0820];

  id v16 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  v35[0] = [v16 CGColor];
  id v17 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.38];
  v35[1] = [v17 CGColor];
  id v18 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.36];
  v35[2] = [v18 CGColor];
  id v19 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  v35[3] = [v19 CGColor];
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
  v21 = [(_UIGradientView *)v5 gradientLayer];
  [v21 setColors:v20];

  [(UIView *)self addSubview:v5];
  v32 = (void *)MEMORY[0x1E4F5B268];
  id v33 = [(UIView *)v5 heightAnchor];
  id v22 = [v33 constraintEqualToConstant:3360.0 / a3];
  v34[0] = v22;
  id v23 = [(UIView *)v5 centerXAnchor];
  v24 = [(UIKBInputBackdropView *)self inputBackdropFullView];
  id v25 = [v24 centerXAnchor];
  id v26 = [v23 constraintEqualToAnchor:v25];
  v34[1] = v26;
  v27 = [(UIView *)v5 widthAnchor];
  v28 = [(UIView *)v5 heightAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v34[2] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  [v32 activateConstraints:v30];

  return v5;
}

- (id)extraBackdropViewForConfig:(id)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [UIKBBackdropView alloc];
  uint64_t v6 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [v4 backdropStyle];

  id v16 = -[UIKBBackdropView initWithFrame:style:](v5, "initWithFrame:style:", v15, v8, v10, v12, v14);
  [(UIView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = [(UIKBInputBackdropView *)self inputBackdropFullView];
  [(UIView *)self insertSubview:v16 aboveSubview:v17];

  v29 = (void *)MEMORY[0x1E4F5B268];
  id v35 = [(UIView *)v16 topAnchor];
  v36 = [(_UIKBLightEffectsBackground *)self fullBackdropLayoutGuide];
  id v34 = [v36 topAnchor];
  id v33 = [v35 constraintEqualToAnchor:v34];
  v37[0] = v33;
  v31 = [(UIView *)v16 leadingAnchor];
  v32 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
  v30 = [v32 leadingAnchor];
  v28 = [v31 constraintEqualToAnchor:v30];
  v37[1] = v28;
  id v18 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
  id v19 = [v18 bottomAnchor];
  v20 = [(UIView *)v16 bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v37[2] = v21;
  id v22 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
  id v23 = [v22 trailingAnchor];
  v24 = [(UIView *)v16 trailingAnchor];
  id v25 = [v23 constraintEqualToAnchor:v24];
  v37[3] = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v29 activateConstraints:v26];

  return v16;
}

- (id)layerForPositionMatchMove
{
  if ([(_UIKBLightEffectsBackground *)self shouldShowBackdrop])
  {
    v3 = [(_UIKBLightEffectsBackground *)self backdropGradientMaskView];
    id v4 = [v3 layer];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)addLayoutGuidesIfNeeded
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(_UIKBLightEffectsBackground *)self backdropClippingView];

  if (!v3)
  {
    v66 = objc_alloc_init(UIView);
    [(UIView *)v66 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v4 = [(UIKBInputBackdropView *)self captureView];
    [(UIView *)self insertSubview:v66 atIndex:v4 != 0];

    [(_UIKBLightEffectsBackground *)self setBackdropClippingView:v66];
    id v5 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
    [v5 setClipsToBounds:1];

    uint64_t v6 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
    double v7 = [v6 layer];
    [v7 setAllowsGroupBlending:0];

    double v8 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
    double v9 = [v8 layer];
    [v9 setAllowsGroupOpacity:0];

    double v10 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
    double v11 = [v10 layer];
    [v11 setAllowsEdgeAntialiasing:0];

    [(_UIKBLightEffectsBackground *)self changeClippingStyle:0];
    double v12 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
    double v13 = [v12 leadingAnchor];
    double v14 = [(UIView *)self leadingAnchor];
    uint64_t v15 = [v13 constraintEqualToAnchor:v14];
    v72[0] = v15;
    id v16 = [(UIView *)self trailingAnchor];
    id v17 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
    id v18 = [v17 trailingAnchor];
    id v19 = [v16 constraintEqualToAnchor:v18];
    v72[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
    [v69 addObjectsFromArray:v20];
  }
  if (!self->_fullBackdropLayoutGuide)
  {
    v21 = objc_alloc_init(UILayoutGuide);
    fullBackdropLayoutGuide = self->_fullBackdropLayoutGuide;
    self->_fullBackdropLayoutGuide = v21;

    [(UIView *)self addLayoutGuide:self->_fullBackdropLayoutGuide];
  }
  if (!self->_assistantLayoutGuide)
  {
    id v23 = objc_alloc_init(UILayoutGuide);
    assistantLayoutGuide = self->_assistantLayoutGuide;
    self->_assistantLayoutGuide = v23;

    [(UIView *)self addLayoutGuide:self->_assistantLayoutGuide];
    v67 = [(_UIKBLightEffectsBackground *)self assistantLayoutGuide];
    v64 = [v67 leadingAnchor];
    id v25 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
    id v26 = [v25 leadingAnchor];
    v27 = [v64 constraintEqualToAnchor:v26 constant:50.0];
    v71[0] = v27;
    v28 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
    v29 = [v28 trailingAnchor];
    v30 = [(_UIKBLightEffectsBackground *)self assistantLayoutGuide];
    v31 = [v30 trailingAnchor];
    v32 = [v29 constraintEqualToAnchor:v31 constant:50.0];
    v71[1] = v32;
    id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
    [v69 addObjectsFromArray:v33];
  }
  if (!self->_aboveKeyboardLayoutGuide)
  {
    id v34 = objc_alloc_init(UILayoutGuide);
    aboveKeyboardLayoutGuide = self->_aboveKeyboardLayoutGuide;
    self->_aboveKeyboardLayoutGuide = v34;

    [(UIView *)self addLayoutGuide:self->_aboveKeyboardLayoutGuide];
    v36 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
    id v37 = [v36 heightAnchor];
    id v38 = [(_UIKBLightEffectsBackground *)self assistantLayoutGuide];
    id v39 = [v38 heightAnchor];
    id v40 = [v37 constraintEqualToAnchor:v39];

    LODWORD(v41) = 1148829696;
    v65 = v40;
    [v40 setPriority:v41];
    v42 = [(UIView *)self traitCollection];
    +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:v42];
    double v44 = v43;

    v45 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
    v46 = [v45 heightAnchor];
    v47 = [v46 constraintGreaterThanOrEqualToConstant:v44];
    [(_UIKBLightEffectsBackground *)self setMinimumAboveKeyboardHeightConstraint:v47];

    v68 = [(_UIKBLightEffectsBackground *)self fullBackdropLayoutGuide];
    v62 = [v68 topAnchor];
    v63 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
    v61 = [v63 bottomAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v70[0] = v60;
    v70[1] = v40;
    v59 = [(_UIKBLightEffectsBackground *)self minimumAboveKeyboardHeightConstraint];
    v70[2] = v59;
    v58 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
    v48 = [v58 leadingAnchor];
    v49 = [(_UIKBLightEffectsBackground *)self assistantLayoutGuide];
    v50 = [v49 leadingAnchor];
    v51 = [v48 constraintEqualToAnchor:v50];
    v70[3] = v51;
    v52 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
    v53 = [v52 trailingAnchor];
    v54 = [(_UIKBLightEffectsBackground *)self assistantLayoutGuide];
    v55 = [v54 trailingAnchor];
    v56 = [v53 constraintEqualToAnchor:v55];
    v70[4] = v56;
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:5];
    [v69 addObjectsFromArray:v57];
  }
  if ([v69 count]) {
    [MEMORY[0x1E4F5B268] activateConstraints:v69];
  }
}

- (void)changeClippingStyle:(int64_t)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  [(_UIKBLightEffectsBackground *)self addLayoutGuidesIfNeeded];
  id v5 = (void *)MEMORY[0x1E4F5B268];
  uint64_t v6 = [(_UIKBLightEffectsBackground *)self backdropClippingConstraints];
  [v5 deactivateConstraints:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  self->_clippingStyle = a3;
  switch(a3)
  {
    case -1:
      double v8 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      double v9 = [v8 topAnchor];
      id v35 = [(UIView *)self topAnchor];
      double v10 = objc_msgSend(v9, "constraintEqualToAnchor:");
      v41[0] = v10;
      double v11 = [(UIView *)self bottomAnchor];
      double v12 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      double v13 = [v12 bottomAnchor];
      double v14 = [v11 constraintEqualToAnchor:v13];
      v41[1] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
      goto LABEL_10;
    case 1:
      double v8 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      id v34 = [v8 topAnchor];
      id v35 = [(_UIKBLightEffectsBackground *)self assistantLayoutGuide];
      double v10 = [v35 bottomAnchor];
      double v11 = [v34 constraintEqualToAnchor:v10];
      v40[0] = v11;
      double v12 = [(UIView *)self bottomAnchor];
      double v13 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      double v14 = [v13 bottomAnchor];
      uint64_t v24 = [v12 constraintEqualToAnchor:v14];
      v40[1] = v24;
      id v25 = (void *)MEMORY[0x1E4F1C978];
      id v26 = v40;
      goto LABEL_8;
    case 2:
      v32 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      id v34 = [v32 topAnchor];
      id v35 = [(_UIKBLightEffectsBackground *)self assistantLayoutGuide];
      double v10 = [v35 topAnchor];
      double v11 = [v34 constraintEqualToAnchor:v10];
      v39[0] = v11;
      double v12 = [(_UIKBLightEffectsBackground *)self assistantLayoutGuide];
      double v13 = [v12 bottomAnchor];
      double v14 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      uint64_t v24 = [v14 bottomAnchor];
      [v13 constraintEqualToAnchor:v24];
      v27 = v7;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v39[1] = v7;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];

      double v8 = v32;
      goto LABEL_9;
    case 3:
      v28 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      [v28 setClipsToBounds:0];

      double v8 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      id v34 = [v8 topAnchor];
      id v35 = [(_UIKBLightEffectsBackground *)self fullBackdropLayoutGuide];
      double v10 = [v35 topAnchor];
      double v11 = [v34 constraintEqualToAnchor:v10];
      v38[0] = v11;
      double v12 = [(UIView *)self bottomAnchor];
      double v13 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      double v14 = [v13 bottomAnchor];
      uint64_t v24 = [v12 constraintEqualToAnchor:v14 constant:0.0];
      v38[1] = v24;
      id v25 = (void *)MEMORY[0x1E4F1C978];
      id v26 = v38;
LABEL_8:
      uint64_t v15 = [v25 arrayWithObjects:v26 count:2];
LABEL_9:

      id v7 = (id)v24;
      double v9 = v34;
LABEL_10:

      unint64_t v23 = 0x1E4F5B000uLL;
      goto LABEL_11;
    default:
      v36 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      v31 = [v36 topAnchor];
      id v33 = [(_UIKBLightEffectsBackground *)self fullBackdropLayoutGuide];
      id v16 = [v33 topAnchor];
      id v17 = [v31 constraintEqualToAnchor:v16];
      v37[0] = v17;
      [(UIView *)self bottomAnchor];
      v19 = id v18 = v7;
      v20 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      v21 = [v20 bottomAnchor];
      id v22 = [v19 constraintEqualToAnchor:v21];
      v37[1] = v22;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];

      unint64_t v23 = 0x1E4F5B000;
      if (!a3) {
        goto LABEL_13;
      }
LABEL_11:
      if (![(_UIKBLightEffectsBackground *)self isAnimating])
      {
        [(_UIKBLightEffectsBackground *)self setIsUsingAnimatedBackdrop:1];
        [(UIView *)self bounds];
        [(_UIKBLightEffectsBackground *)self layoutInputBackdropToFullWithRect:"layoutInputBackdropToFullWithRect:"];
        [(_UIKBLightEffectsBackground *)self transitionToStyle:3904 isSplit:0];
      }
LABEL_13:
      [(_UIKBLightEffectsBackground *)self setBackdropClippingConstraints:v15];
      v29 = *(void **)(v23 + 616);
      v30 = [(_UIKBLightEffectsBackground *)self backdropClippingConstraints];
      [v29 activateConstraints:v30];

      return;
  }
}

- (void)showShadowEffects:(BOOL)a3
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    uint64_t v5 = [(_UIKBLightEffectsBackground *)self mirroredShadowView];
    if (!v5
      || (uint64_t v6 = (void *)v5,
          [(_UIKBLightEffectsBackground *)self mirroredLightBorderView],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          !v7))
    {
      if (a3)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __49___UIKBLightEffectsBackground_showShadowEffects___block_invoke;
        v10[3] = &unk_1E52D9F70;
        v10[4] = self;
        +[UIView performWithoutAnimation:v10];
      }
      else
      {
        double v8 = [(_UIKBLightEffectsBackground *)self mirroredShadowView];
        [v8 removeFromSuperview];

        id v9 = [(_UIKBLightEffectsBackground *)self mirroredLightBorderView];
        [v9 removeFromSuperview];
      }
    }
  }
}

- (void)addLightSourceViews
{
  BOOL v3 = [(_UIKBLightEffectsBackground *)self shouldShowBackdrop];
  id v4 = [(_UIKBLightEffectsBackground *)self behindAssistantView];
  uint64_t v5 = v4;
  if (v3)
  {
    if (v4)
    {
      uint64_t v6 = [(_UIKBLightEffectsBackground *)self behindAssistantView];
      id v7 = [v6 superview];

      if (!v7)
      {
        double v8 = (void *)MEMORY[0x1E4F5B268];
        id v9 = [(_UIKBLightEffectsBackground *)self lightSourceConstraints];
        [v8 deactivateConstraints:v9];

        double v10 = [(_UIKBLightEffectsBackground *)self lightSourceConstraints];
        [v10 removeAllObjects];

        [(_UIKBLightEffectsBackground *)self setBehindFullBackdropView:0];
        [(_UIKBLightEffectsBackground *)self setBehindAssistantView:0];
      }
    }
    double v11 = [(_UIKBLightEffectsBackground *)self behindAssistantView];

    if (!v11)
    {
      v36 = objc_alloc_init(UIView);
      double v12 = objc_alloc_init(UIView);
      if (TIGetShowDebugBackdropValue_onceToken != -1) {
        dispatch_once(&TIGetShowDebugBackdropValue_onceToken, &__block_literal_global_350);
      }
      double v13 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
      double v14 = [v13 valueForPreferenceKey:@"ShowDebugBackdrop"];

      if (v14 && [v14 BOOLValue])
      {
        uint64_t v15 = +[UIColor systemPurpleColor];
        [(UIView *)v36 setBackgroundColor:v15];

        id v16 = +[UIColor systemRedColor];
        [(UIView *)v12 setBackgroundColor:v16];
      }
      else
      {
        id v22 = [_UIIntelligenceSystemLightView alloc];
        unint64_t v23 = [(UIView *)self superview];
        [v23 bounds];
        uint64_t v24 = -[_UIIntelligenceSystemLightView initWithFrame:preferringAudioReactivity:](v22, "initWithFrame:preferringAudioReactivity:", 0);

        id v25 = [_UIIntelligenceSystemLightView alloc];
        id v16 = [(UIView *)self superview];
        [v16 bounds];
        uint64_t v26 = -[_UIIntelligenceSystemLightView initWithFrame:preferringAudioReactivity:](v25, "initWithFrame:preferringAudioReactivity:", 0);

        double v12 = (UIView *)v26;
        v36 = (UIView *)v24;
      }

      [(UIView *)v36 setTranslatesAutoresizingMaskIntoConstraints:0];
      if ([(_UIKBLightEffectsBackground *)self isAnimating])
      {
        v27 = [(UIView *)self _inheritedRenderConfig];
        int v28 = [v27 lightKeyboard];
        double v29 = 0.2;
        if (v28) {
          double v29 = 0.0;
        }
        [(UIView *)v36 setAlpha:v29];
      }
      else
      {
        [(UIView *)v36 setAlpha:1.0];
      }
      v30 = [(UIView *)v36 layer];
      [v30 setAllowsEdgeAntialiasing:0];

      v31 = [(UIView *)v36 layer];
      [v31 setAllowsGroupBlending:0];

      v32 = [(UIView *)v36 layer];
      [v32 setAllowsGroupOpacity:0];

      [(UIView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v33 = [(UIView *)v12 layer];
      [v33 setAllowsEdgeAntialiasing:0];

      id v34 = [(UIView *)v12 layer];
      [v34 setAllowsGroupBlending:0];

      id v35 = [(UIView *)v12 layer];
      [v35 setAllowsGroupOpacity:0];

      [(_UIKBLightEffectsBackground *)self useMaskedKeyplaneBackdrop:v36 assistantBackdrop:v12];
    }
  }
  else
  {

    if (v5)
    {
      id v17 = (void *)MEMORY[0x1E4F5B268];
      id v18 = [(_UIKBLightEffectsBackground *)self lightSourceConstraints];
      [v17 deactivateConstraints:v18];

      id v19 = [(_UIKBLightEffectsBackground *)self lightSourceConstraints];
      [v19 removeAllObjects];

      v20 = [(_UIKBLightEffectsBackground *)self behindAssistantView];
      [v20 removeFromSuperview];

      v21 = [(_UIKBLightEffectsBackground *)self behindFullBackdropView];
      [v21 removeFromSuperview];

      [(_UIKBLightEffectsBackground *)self setBehindAssistantView:0];
      [(_UIKBLightEffectsBackground *)self setBehindFullBackdropView:0];
    }
  }
}

- (void)useMaskedKeyplaneBackdrop:(id)a3 assistantBackdrop:(id)a4
{
  v101[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    double v8 = [(_UIKBLightEffectsBackground *)self behindFullBackdropView];
    char v9 = [v8 isEqual:v6];

    if ((v9 & 1) == 0)
    {
      v96 = v7;
      [(_UIKBLightEffectsBackground *)self addLayoutGuidesIfNeeded];
      id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v10 = [(UIView *)self traitCollection];
      [v10 displayScale];
      double v12 = v11;

      double v13 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      double v14 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      [v13 insertSubview:v6 belowSubview:v14];

      v94 = [v6 leadingAnchor];
      v91 = [(UIView *)self leadingAnchor];
      v88 = [v94 constraintEqualToAnchor:v91];
      v101[0] = v88;
      v85 = [v6 topAnchor];
      uint64_t v15 = [(UIView *)self topAnchor];
      id v16 = [v85 constraintEqualToAnchor:v15];
      v101[1] = v16;
      id v17 = [(UIView *)self bottomAnchor];
      id v18 = [v6 bottomAnchor];
      id v19 = [v17 constraintEqualToAnchor:v18];
      v101[2] = v19;
      v20 = [(UIView *)self trailingAnchor];
      [v6 trailingAnchor];
      v21 = v97 = v6;
      id v22 = [v20 constraintEqualToAnchor:v21];
      v101[3] = v22;
      unint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:4];
      [v98 addObjectsFromArray:v23];

      uint64_t v24 = [(UIView *)self _inheritedRenderConfig];
      if ([v24 lightKeyboard]) {
        double v25 = 140.0;
      }
      else {
        double v25 = 80.0;
      }

      uint64_t v26 = objc_alloc_init(UIView);
      v27 = +[UIColor clearColor];
      [(UIView *)v26 setBackgroundColor:v27];

      id v28 = +[UIColor blackColor];
      uint64_t v29 = [v28 CGColor];
      v30 = [(UIView *)v26 layer];
      [v30 setShadowColor:v29];

      v31 = [(UIView *)v26 layer];
      LODWORD(v32) = 1.0;
      [v31 setShadowOpacity:v32];

      id v33 = [(UIView *)v26 layer];
      [v33 setShadowRadius:v25 / v12];

      id v34 = [(UIView *)v26 layer];
      [v34 setShadowPathIsBounds:1];

      double v35 = *MEMORY[0x1E4F1DB30];
      double v36 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      id v37 = [(UIView *)v26 layer];
      objc_msgSend(v37, "setShadowOffset:", v35, v36);

      id v38 = [(UIView *)v26 layer];
      [v38 setAllowsGroupOpacity:0];

      id v39 = [(UIView *)v26 layer];
      [v39 setAllowsGroupBlending:0];

      id v40 = [(UIView *)v26 layer];
      [v40 setAllowsEdgeAntialiasing:0];

      [v97 setMaskView:v26];
      [(_UIKBLightEffectsBackground *)self setBehindFullBackdropView:v97];
      v95 = v26;
      [(_UIKBLightEffectsBackground *)self setFullBackdropMaskView:v26];
      double v41 = objc_alloc_init(UIView);
      [(UIView *)v41 setTranslatesAutoresizingMaskIntoConstraints:0];
      v42 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
      double v43 = [(UIView *)v41 layer];
      [v43 setCompositingFilter:v42];

      if ([(_UIKBLightEffectsBackground *)self isAnimating])
      {
        [(UIView *)v41 setAlpha:0.0];
      }
      else
      {
        double v44 = [(UIView *)self _inheritedRenderConfig];
        int v45 = [v44 lightKeyboard];
        double v46 = 0.62;
        if (!v45) {
          double v46 = 0.25;
        }
        [(UIView *)v41 setAlpha:v46];
      }
      v47 = [(UIView *)v41 layer];
      [v47 setAllowsGroupOpacity:0];

      v48 = [(UIView *)v41 layer];
      [v48 setAllowsGroupBlending:0];

      [(UIView *)v41 addSubview:v96];
      v49 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
      v50 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      [v49 insertSubview:v41 aboveSubview:v50];

      v92 = [v96 topAnchor];
      v89 = [(UIView *)v41 topAnchor];
      v86 = [v92 constraintEqualToAnchor:v89];
      v100[0] = v86;
      v83 = [v96 leadingAnchor];
      v81 = [(UIView *)v41 leadingAnchor];
      v51 = [v83 constraintEqualToAnchor:v81];
      v100[1] = v51;
      v52 = [(UIView *)v41 bottomAnchor];
      v53 = [v96 bottomAnchor];
      v54 = [v52 constraintEqualToAnchor:v53];
      v100[2] = v54;
      v55 = [(UIView *)v41 trailingAnchor];
      v56 = [v96 trailingAnchor];
      v57 = [v55 constraintEqualToAnchor:v56];
      v100[3] = v57;
      v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:4];
      [v98 addObjectsFromArray:v58];

      v90 = [(UIView *)v41 topAnchor];
      v93 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
      v87 = [v93 topAnchor];
      v84 = [v90 constraintEqualToAnchor:v87];
      v99[0] = v84;
      v82 = [(UIView *)v41 leadingAnchor];
      v80 = [(UIView *)self leadingAnchor];
      v59 = [v82 constraintEqualToAnchor:v80];
      v99[1] = v59;
      v60 = [(UIView *)self bottomAnchor];
      v61 = [(UIView *)v41 bottomAnchor];
      v62 = [v60 constraintEqualToAnchor:v61];
      v99[2] = v62;
      v63 = [(UIView *)self trailingAnchor];
      v64 = [(UIView *)v41 trailingAnchor];
      v65 = [v63 constraintEqualToAnchor:v64];
      v99[3] = v65;
      v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:4];
      [v98 addObjectsFromArray:v66];

      v67 = objc_alloc_init(UIView);
      v68 = +[UIColor clearColor];
      [(UIView *)v67 setBackgroundColor:v68];

      id v69 = [(UIView *)v67 layer];
      [v69 setAllowsGroupBlending:0];

      v70 = [(UIView *)v67 layer];
      [v70 setAllowsGroupOpacity:0];

      v71 = [(UIView *)v67 layer];
      [v71 setAllowsEdgeAntialiasing:0];

      id v72 = +[UIColor blackColor];
      uint64_t v73 = [v72 CGColor];
      v74 = [(UIView *)v67 layer];
      [v74 setShadowColor:v73];

      id v7 = v96;
      v75 = [(UIView *)v67 layer];
      LODWORD(v76) = 1.0;
      [v75 setShadowOpacity:v76];

      v77 = [(UIView *)v67 layer];
      [v77 setShadowRadius:80.0 / v12];

      v78 = [(UIView *)v67 layer];
      [v78 setShadowPathIsBounds:1];

      v79 = [(UIView *)v67 layer];
      objc_msgSend(v79, "setShadowOffset:", v35, v36);

      [v96 setMaskView:v67];
      [(_UIKBLightEffectsBackground *)self setBehindAssistantView:v41];
      [(_UIKBLightEffectsBackground *)self setAssistantBarMaskView:v67];
      [MEMORY[0x1E4F5B268] activateConstraints:v98];
      [(_UIKBLightEffectsBackground *)self setLightSourceConstraints:v98];
      [(UIView *)self setNeedsLayout];

      id v6 = v97;
    }
  }
}

- (void)layoutInputBackdropToFullWithRect:(CGRect)a3
{
  v48[4] = *MEMORY[0x1E4F143B8];
  [(_UIKBLightEffectsBackground *)self addLayoutGuidesIfNeeded];
  id v4 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
  uint64_t v5 = [v4 superview];
  if (v5)
  {
  }
  else
  {
    id v6 = [(UIKBInputBackdropView *)self inputBackdropRightView];
    id v7 = [v6 superview];

    if (!v7) {
      goto LABEL_5;
    }
  }
  double v8 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
  [v8 removeFromSuperview];

  char v9 = [(UIKBInputBackdropView *)self inputBackdropRightView];
  [v9 removeFromSuperview];

LABEL_5:
  double v10 = [(_UIKBLightEffectsBackground *)self behindAssistantView];

  double v11 = [(_UIKBLightEffectsBackground *)self backdropClippingView];
  double v12 = [(UIKBInputBackdropView *)self inputBackdropFullView];
  if (v10)
  {
    double v13 = [(_UIKBLightEffectsBackground *)self behindAssistantView];
    [v11 insertSubview:v12 belowSubview:v13];
  }
  else
  {
    [v11 addSubview:v12];
  }

  double v14 = [(UIKBInputBackdropView *)self fullWidthConstraints];

  if (!v14)
  {
    v47 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    int v45 = [v47 leftAnchor];
    double v46 = [(_UIKBLightEffectsBackground *)self fullBackdropLayoutGuide];
    double v44 = [v46 leftAnchor];
    double v43 = [v45 constraintEqualToAnchor:v44 constant:0.0];
    v48[0] = v43;
    v42 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
    id v40 = [v42 topAnchor];
    double v41 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    id v39 = [v41 topAnchor];
    id v38 = [v40 constraintEqualToAnchor:v39 constant:0.0];
    v48[1] = v38;
    id v37 = [(_UIKBLightEffectsBackground *)self fullBackdropLayoutGuide];
    double v36 = [v37 rightAnchor];
    uint64_t v15 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    id v16 = [v15 rightAnchor];
    id v17 = [v36 constraintEqualToAnchor:v16 constant:0.0];
    v48[2] = v17;
    id v18 = [(_UIKBLightEffectsBackground *)self fullBackdropLayoutGuide];
    id v19 = [v18 bottomAnchor];
    v20 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    v21 = [v20 bottomAnchor];
    id v22 = [v19 constraintEqualToAnchor:v21 constant:0.0];
    v48[3] = v22;
    unint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
    [(UIKBInputBackdropView *)self setFullWidthConstraints:v23];
  }
  uint64_t v24 = [(UIKBInputBackdropView *)self fullWidthConstraints];
  double v25 = [v24 firstObject];
  char v26 = [v25 isActive];

  if ((v26 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E4F5B268];
    id v28 = [(UIKBInputBackdropView *)self fullWidthConstraints];
    [v27 activateConstraints:v28];
  }
  if (![(_UIKBLightEffectsBackground *)self shouldShowBackdrop])
  {
    v30 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v30 setBackgroundColor:0];

    v31 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    uint64_t v32 = MEMORY[0x1E4F1CBF0];
    [v31 setBackgroundEffects:MEMORY[0x1E4F1CBF0]];

    id v33 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v33 setContentEffects:v32];

    id v34 = [(_UIKBLightEffectsBackground *)self backdropGradientMaskView];
    [v34 removeFromSuperview];

    [(_UIKBLightEffectsBackground *)self setBackdropGradientMaskView:0];
    return;
  }
  uint64_t v29 = [(UIView *)self _inheritedRenderConfig];
  if ([v29 animatedBackground])
  {
  }
  else
  {
    BOOL v35 = [(_UIKBLightEffectsBackground *)self isUsingAnimatedBackdrop];

    if (!v35) {
      return;
    }
  }
  [(_UIKBLightEffectsBackground *)self maskEffectsBackdrop];
}

- (void)maskEffectsBackdrop
{
  v51[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIKBLightEffectsBackground *)self shouldShowBackdrop];
  id v4 = [(_UIKBLightEffectsBackground *)self backdropGradientMaskView];
  uint64_t v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      id v6 = objc_alloc_init(_UIGradientView);
      [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v7 = *MEMORY[0x1E4F3A390];
      double v8 = [(_UIGradientView *)v6 gradientLayer];
      [v8 setType:v7];

      char v9 = [(_UIGradientView *)v6 gradientLayer];
      objc_msgSend(v9, "setStartPoint:", 0.5, 0.0);

      double v10 = [(_UIGradientView *)v6 gradientLayer];
      objc_msgSend(v10, "setEndPoint:", 0.5, 0.2);

      double v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      v51[0] = v11;
      double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      double v13 = [(_UIGradientView *)v6 gradientLayer];
      [v13 setInterpolations:v12];

      double v14 = +[UIColor colorWithRed:1.0 green:0.1491 blue:0.0 alpha:0.0];
      uint64_t v15 = +[UIColor colorWithRed:0.2549 green:0.5725 blue:0.9647 alpha:1.0];
      id v48 = v14;
      v50[0] = [v48 CGColor];
      id v47 = v15;
      v50[1] = [v47 CGColor];
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
      id v17 = [(_UIGradientView *)v6 gradientLayer];
      [v17 setColors:v16];

      id v18 = [(_UIGradientView *)v6 gradientLayer];
      [v18 setAllowsEdgeAntialiasing:0];

      id v19 = [(_UIGradientView *)v6 gradientLayer];
      [v19 setAllowsGroupBlending:0];

      double v46 = v6;
      v20 = [(_UIGradientView *)v6 gradientLayer];
      [v20 setAllowsGroupOpacity:0];

      [(_UIKBLightEffectsBackground *)self setBackdropGradientMaskView:v6];
      v21 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      id v22 = [v21 contentView];
      unint64_t v23 = [(_UIKBLightEffectsBackground *)self backdropGradientMaskView];
      [v22 addSubview:v23];

      double v36 = (void *)MEMORY[0x1E4F5B268];
      int v45 = [(_UIKBLightEffectsBackground *)self backdropGradientMaskView];
      double v43 = [v45 topAnchor];
      double v44 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      v42 = [v44 topAnchor];
      double v41 = [v43 constraintEqualToAnchor:v42 constant:0.0];
      v49[0] = v41;
      id v40 = [(_UIKBLightEffectsBackground *)self backdropGradientMaskView];
      id v38 = [v40 leadingAnchor];
      id v39 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      id v37 = [v39 leadingAnchor];
      BOOL v35 = [v38 constraintEqualToAnchor:v37];
      v49[1] = v35;
      id v34 = [(_UIKBLightEffectsBackground *)self backdropGradientMaskView];
      uint64_t v24 = [v34 bottomAnchor];
      double v25 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      char v26 = [v25 bottomAnchor];
      v27 = [v24 constraintEqualToAnchor:v26];
      v49[2] = v27;
      id v28 = [(_UIKBLightEffectsBackground *)self backdropGradientMaskView];
      uint64_t v29 = [v28 trailingAnchor];
      v30 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      v31 = [v30 trailingAnchor];
      uint64_t v32 = [v29 constraintEqualToAnchor:v31];
      v49[3] = v32;
      id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
      [v36 activateConstraints:v33];
    }
  }
  else
  {
    [v4 removeFromSuperview];

    [(_UIKBLightEffectsBackground *)self setBackdropGradientMaskView:0];
  }
}

- (void)updateConstraints
{
  BOOL v3 = [(UIView *)self traitCollection];
  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:v3];
  double v5 = v4;

  id v6 = [(_UIKBLightEffectsBackground *)self minimumAboveKeyboardHeightConstraint];
  [v6 setConstant:v5];

  v7.receiver = self;
  v7.super_class = (Class)_UIKBLightEffectsBackground;
  [(UIView *)&v7 updateConstraints];
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)_UIKBLightEffectsBackground;
  [(UIView *)&v26 layoutSubviews];
  BOOL v3 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
  [v3 layoutFrame];
  double v5 = v4;

  id v6 = [(_UIKBLightEffectsBackground *)self fullBackdropMaskView];

  if (v6)
  {
    objc_super v7 = [(_UIKBLightEffectsBackground *)self fullBackdropLayoutGuide];
    [v7 layoutFrame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    id v16 = [(_UIKBLightEffectsBackground *)self fullBackdropMaskView];
    objc_msgSend(v16, "setFrame:", v9 + -100.0, v11 - v5, v13 + 200.0, v15 - (-100.0 - v5));
  }
  id v17 = [(_UIKBLightEffectsBackground *)self assistantBarMaskView];

  if (v17)
  {
    id v18 = [(_UIKBLightEffectsBackground *)self aboveKeyboardLayoutGuide];
    [v18 layoutFrame];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    double v25 = [(_UIKBLightEffectsBackground *)self assistantBarMaskView];
    objc_msgSend(v25, "setFrame:", v20 + 0.0, v5 - v5 * 0.5, v22, v24 - (v5 * 0.5 - v5 * 0.5));
  }
}

- (BOOL)clientBackdropInUse
{
  return self->_clientBackdropInUse;
}

- (UILayoutGuide)fullBackdropLayoutGuide
{
  return self->_fullBackdropLayoutGuide;
}

- (void)setFullBackdropLayoutGuide:(id)a3
{
}

- (UILayoutGuide)assistantLayoutGuide
{
  return self->_assistantLayoutGuide;
}

- (void)setAssistantLayoutGuide:(id)a3
{
}

- (UIView)fullBackdropMaskView
{
  return self->_fullBackdropMaskView;
}

- (void)setFullBackdropMaskView:(id)a3
{
}

- (UIView)assistantBarMaskView
{
  return self->_assistantBarMaskView;
}

- (void)setAssistantBarMaskView:(id)a3
{
}

- (_UIGradientView)backdropGradientMaskView
{
  return self->_backdropGradientMaskView;
}

- (void)setBackdropGradientMaskView:(id)a3
{
}

- (UIView)behindFullBackdropView
{
  return self->_behindFullBackdropView;
}

- (void)setBehindFullBackdropView:(id)a3
{
}

- (UIView)behindAssistantView
{
  return self->_behindAssistantView;
}

- (void)setBehindAssistantView:(id)a3
{
}

- (UIView)mirroredShadowView
{
  return self->_mirroredShadowView;
}

- (void)setMirroredShadowView:(id)a3
{
}

- (UIView)mirroredLightBorderView
{
  return self->_mirroredLightBorderView;
}

- (void)setMirroredLightBorderView:(id)a3
{
}

- (UILayoutGuide)aboveKeyboardLayoutGuide
{
  return self->_aboveKeyboardLayoutGuide;
}

- (void)setAboveKeyboardLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)minimumAboveKeyboardHeightConstraint
{
  return self->_minimumAboveKeyboardHeightConstraint;
}

- (void)setMinimumAboveKeyboardHeightConstraint:(id)a3
{
}

- (UIView)backdropClippingView
{
  return self->_backdropClippingView;
}

- (void)setBackdropClippingView:(id)a3
{
}

- (NSArray)backdropClippingConstraints
{
  return self->_backdropClippingConstraints;
}

- (void)setBackdropClippingConstraints:(id)a3
{
}

- (NSMutableArray)lightSourceConstraints
{
  return self->_lightSourceConstraints;
}

- (void)setLightSourceConstraints:(id)a3
{
}

- (UIKBBackdropView)transitionStartBackdropView
{
  return self->_transitionStartBackdropView;
}

- (void)setTransitionStartBackdropView:(id)a3
{
}

- (int64_t)clippingStyle
{
  return self->_clippingStyle;
}

- (void)setClippingStyle:(int64_t)a3
{
  self->_clippingStyle = a3;
}

- (BOOL)isUsingAnimatedBackdrop
{
  return self->_isUsingAnimatedBackdrop;
}

- (void)setIsUsingAnimatedBackdrop:(BOOL)a3
{
  self->_isUsingAnimatedBackdrop = a3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (BOOL)useLightConfigEffects
{
  return self->_useLightConfigEffects;
}

- (void)setUseLightConfigEffects:(BOOL)a3
{
  self->_useLightConfigEffects = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionStartBackdropView, 0);
  objc_storeStrong((id *)&self->_lightSourceConstraints, 0);
  objc_storeStrong((id *)&self->_backdropClippingConstraints, 0);
  objc_storeStrong((id *)&self->_backdropClippingView, 0);
  objc_storeStrong((id *)&self->_minimumAboveKeyboardHeightConstraint, 0);
  objc_storeStrong((id *)&self->_aboveKeyboardLayoutGuide, 0);
  objc_storeStrong((id *)&self->_mirroredLightBorderView, 0);
  objc_storeStrong((id *)&self->_mirroredShadowView, 0);
  objc_storeStrong((id *)&self->_behindAssistantView, 0);
  objc_storeStrong((id *)&self->_behindFullBackdropView, 0);
  objc_storeStrong((id *)&self->_backdropGradientMaskView, 0);
  objc_storeStrong((id *)&self->_assistantBarMaskView, 0);
  objc_storeStrong((id *)&self->_fullBackdropMaskView, 0);
  objc_storeStrong((id *)&self->_assistantLayoutGuide, 0);
  objc_storeStrong((id *)&self->_fullBackdropLayoutGuide, 0);
}

@end