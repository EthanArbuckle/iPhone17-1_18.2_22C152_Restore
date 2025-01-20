@interface UISwitchModernVisualElement
+ (CGSize)preferredContentSize;
+ (UIEdgeInsets)preferredAlignmentRectInsets;
+ (id)_modernGradientImageWithOnColor:(id)a3 traitCollection:(id)a4;
+ (id)_modernThumbImageWithColor:(id)a3 mask:(unint64_t)a4 traitCollection:(id)a5;
- (BOOL)_feedbackEnabled;
- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)_shouldUseLightTintOverColor:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)on;
- (BOOL)pressed;
- (BOOL)showsOnOffLabel;
- (CGColor)_wellColorOn:(BOOL)a3;
- (CGPoint)_knobPositionOn:(BOOL)a3 pressed:(BOOL)a4 forBounds:(CGRect)a5;
- (CGPoint)_leftSwitchWellContainerPositionOn:(BOOL)a3 pressed:(BOOL)a4;
- (CGPoint)_offImagePosition;
- (CGPoint)_onImagePosition;
- (CGPoint)_switchWellContainerPositionOn:(BOOL)a3 pressed:(BOOL)a4;
- (CGPoint)_switchWellPositionOn:(BOOL)a3 pressed:(BOOL)a4;
- (CGPoint)_wellPositionOn:(BOOL)a3 forBounds:(CGRect)a4;
- (CGRect)_knobBoundsPressed:(BOOL)a3;
- (CGRect)_leftSwitchWellContainerBoundsOn:(BOOL)a3 pressed:(BOOL)a4;
- (CGRect)_switchWellContainerBoundsOn:(BOOL)a3 pressed:(BOOL)a4;
- (UIColor)thumbTintColor;
- (UIImage)offImage;
- (UIImage)onImage;
- (UILongPressGestureRecognizer)longPress;
- (UIPanGestureRecognizer)pan;
- (UISwitchMVEGestureTrackingSession)gestureTrackingSession;
- (UISwitchModernVisualElement)initWithFrame:(CGRect)a3;
- (UITapGestureRecognizer)selectGestureRecognizer;
- (double)_wellBorderWidthPressed:(BOOL)a3 on:(BOOL)a4;
- (id)_accessibleOffImage;
- (id)_accessibleOnImage;
- (id)_defaultOnTintColor;
- (id)_effectiveGradientImage;
- (id)_effectiveOffImage;
- (id)_effectiveOffImageTintColor;
- (id)_effectiveOffTextColor;
- (id)_effectiveOnImage;
- (id)_effectiveOnImageTintColor;
- (id)_effectiveOnTintColor;
- (id)_effectiveThumbImage;
- (id)_effectiveTintColor;
- (id)_labelOpacityAnimation;
- (id)_settings;
- (id)_switchKnobPositionSpringAnimationFromValue:(id)a3 toValue:(id)a4;
- (id)_switchKnobWidthSpringAnimationFromValue:(id)a3 toValue:(id)a4 pressed:(BOOL)a5;
- (id)_switchSpringAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 pressed:(BOOL)a6;
- (id)_switchTrackAnimationWithFromValue:(id)a3 toValue:(id)a4 on:(BOOL)a5;
- (id)_switchTrackColorAnimationWithFromValue:(id)a3 toValue:(id)a4;
- (id)_switchTrackPositionAnimationWithFromValue:(id)a3 toValue:(id)a4 on:(BOOL)a5;
- (id)_switchTrackPositionSpringAnimationFromValue:(id)a3 toValue:(id)a4 on:(BOOL)a5;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_handleLongPress:(id)a3;
- (void)_handleLongPressWithGestureLocationInBounds:(CGPoint)a3 gestureState:(int64_t)a4;
- (void)_handlePan:(id)a3;
- (void)_handlePanWithGestureLocationInBounds:(CGPoint)a3 horizontalTranslation:(double)a4 gestureState:(int64_t)a5 resetPanTranslationBlock:(id)a6;
- (void)_installSelectGestureRecognizer;
- (void)_invalidateControl;
- (void)_invalidateKnob;
- (void)_invalidateOnOffImages;
- (void)_invalidateUserInterfaceRenderingMode;
- (void)_invalidateWell;
- (void)_orderSubviews;
- (void)_selectGestureChanged:(id)a3;
- (void)_setPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5 shouldAnimateLabels:(BOOL)a6 completion:(id)a7;
- (void)_switchToStaticMode:(BOOL)a3;
- (void)_transitionImagesToPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5;
- (void)_transitionKnobToOn:(BOOL)a3 animated:(BOOL)a4;
- (void)_transitionKnobToPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)_transitionKnobToPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5;
- (void)_transitionWellViewToOn:(BOOL)a3 animated:(BOOL)a4;
- (void)_transitionWellViewToPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)_transitionWellViewToPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5;
- (void)_uninstallSelectGestureRecognizer;
- (void)_updateDisplayAnimated:(BOOL)a3;
- (void)_updateDisplayWithAnimationIfNeeded;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)interactiveChangeToDisplayedOn:(BOOL)a3;
- (void)performStateChangeFeedback;
- (void)sendStateChangeActions;
- (void)setGestureTrackingSession:(id)a3;
- (void)setLongPress:(id)a3;
- (void)setOffImage:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)setOn:(BOOL)a3 animated:(BOOL)a4;
- (void)setOnImage:(id)a3;
- (void)setOnTintColor:(id)a3;
- (void)setPan:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setSelectGestureRecognizer:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShowsOnOffLabel:(BOOL)a3;
- (void)setSwitchControl:(id)a3;
- (void)setThumbTintColor:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation UISwitchModernVisualElement

void __68__UISwitchModernVisualElement__transitionKnobToPressed_on_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 512) layer];
  objc_msgSend(v2, "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  id v3 = [*(id *)(*(void *)(a1 + 32) + 512) layer];
  objc_msgSend(v3, "setPosition:", *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __72__UISwitchModernVisualElement__transitionWellViewToPressed_on_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 480) layer];
  objc_msgSend(v2, "setPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke_3(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v9[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v9[1] = v3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  CFArrayRef v6 = [v4 arrayWithObjects:v9 count:2];
  v7 = CGGradientCreateWithColors(0, v6, 0);
  v8 = (CGContext *)[v5 CGContext];

  v11.x = *(double *)(a1 + 48) + -51.0;
  v10.x = 51.0;
  v10.y = 0.0;
  v11.y = 0.0;
  CGContextDrawLinearGradient(v8, v7, v10, v11, 3u);
  CGGradientRelease(v7);
}

- (void)setOnTintColor:(id)a3
{
  id v9 = a3;
  if (!-[UIColor isEqual:](self->_onTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_onTintColor, a3);
    switchWellOnImageView = self->_switchWellOnImageView;
    CFArrayRef v6 = [(UISwitchModernVisualElement *)self _effectiveOnImageTintColor];
    [(UIView *)switchWellOnImageView setTintColor:v6];

    if (dyld_program_sdk_at_least())
    {
      switchWellImageView = self->_switchWellImageView;
      v8 = [(UISwitchModernVisualElement *)self _effectiveGradientImage];
      [(UIImageView *)switchWellImageView setImage:v8];
    }
  }
  [(UISwitchModernVisualElement *)self _updateDisplayWithAnimationIfNeeded];
}

- (void)_invalidateWell
{
  int v3 = dyld_program_sdk_at_least();
  [(UIView *)self->_switchWellView removeFromSuperview];
  if (v3)
  {
    [(UIView *)self->_switchWellImageView removeFromSuperview];
    [(UIView *)self->_switchWellContainerView removeFromSuperview];
    v4 = [(UISwitchModernVisualElement *)self _effectiveGradientImage];
    id v5 = [[UIImageView alloc] initWithImage:v4];
    switchWellImageView = self->_switchWellImageView;
    self->_switchWellImageView = v5;

    [v4 size];
    -[UIImageView setFrame:](self->_switchWellImageView, "setFrame:", 0.0, 0.0, v7, 31.0);
    [(UIImageView *)self->_switchWellImageView setHidden:1];
    v8 = [UIView alloc];
    [(UIView *)self bounds];
    id v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
    switchWellContainerView = self->_switchWellContainerView;
    self->_switchWellContainerView = v9;

    [(UIView *)self->_switchWellContainerView _setAllowsHighContrastForBackgroundColor:1];
    [(UIView *)self->_switchWellContainerView _setShouldAdaptToMaterials:0];
    CGPoint v11 = [(UIView *)self->_switchWellContainerView layer];
    [v11 setCornerRadius:15.5];

    [(UIView *)self->_switchWellContainerView setClipsToBounds:0];
    [(UIView *)self->_switchWellContainerView addSubview:self->_switchWellImageView];
    v12 = [UIView alloc];
    [(UIView *)self bounds];
    v13 = -[UIView initWithFrame:](v12, "initWithFrame:");
    switchWellView = self->_switchWellView;
    self->_switchWellView = v13;

    [(UISwitchModernVisualElement *)self _invalidateUserInterfaceRenderingMode];
    v15 = self->_switchWellView;
    v16 = [(UISwitchModernVisualElement *)self _effectiveTintColor];
    [(UIView *)v15 setBackgroundColor:v16];

    v17 = [(UIView *)self->_switchWellView layer];
    [v17 setCornerRadius:15.5];

    [(UISwitchModernVisualElement *)self _orderSubviews];
    [(UISwitchModernVisualElement *)self _transitionWellViewToPressed:0 on:self->_on animated:0];
  }
  else
  {
    [(UIView *)self->_leftSwitchWellView removeFromSuperview];
    [(UIView *)self->_switchWellContainerView removeFromSuperview];
    [(UIView *)self->_leftSwitchWellContainerView removeFromSuperview];
    [(UIView *)self bounds];
    v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v19 - v18 * 0.5, v20, v18, v21);
    v23 = self->_switchWellView;
    self->_switchWellView = v22;

    v24 = [UIView alloc];
    [(UIView *)self bounds];
    v25 = -[UIView initWithFrame:](v24, "initWithFrame:");
    leftSwitchWellView = self->_leftSwitchWellView;
    self->_leftSwitchWellView = v25;

    v27 = [(UIView *)self->_leftSwitchWellView layer];
    [(UISwitchModernVisualElement *)self _wellBorderWidthPressed:1 on:1];
    objc_msgSend(v27, "setBorderWidth:");

    v28 = self->_switchWellView;
    v29 = +[UIColor clearColor];
    [(UIView *)v28 setBackgroundColor:v29];

    v30 = self->_leftSwitchWellView;
    v31 = +[UIColor clearColor];
    [(UIView *)v30 setBackgroundColor:v31];

    v32 = [(UIView *)self->_switchWellView layer];
    [v32 setCornerRadius:15.5];

    v33 = [(UIView *)self->_leftSwitchWellView layer];
    [v33 setCornerRadius:15.5];

    [(UIView *)self bounds];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40 * 0.5;
    v42 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v34, v36, v40 * 0.5, v38);
    leftSwitchWellContainerView = self->_leftSwitchWellContainerView;
    self->_leftSwitchWellContainerView = v42;

    [(UIView *)self->_leftSwitchWellContainerView setClipsToBounds:1];
    v44 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v35 + v41, v37, v41, v39);
    v45 = self->_switchWellContainerView;
    self->_switchWellContainerView = v44;

    [(UIView *)self->_switchWellContainerView setClipsToBounds:1];
    [(UIView *)self->_switchWellContainerView addSubview:self->_switchWellView];
    [(UIView *)self->_leftSwitchWellContainerView addSubview:self->_leftSwitchWellView];
    [(UISwitchModernVisualElement *)self _orderSubviews];
    [(UISwitchModernVisualElement *)self _transitionWellViewToPressed:0 animated:0];
    [(UISwitchModernVisualElement *)self _transitionWellViewToOn:self->_on animated:0];
  }
  BOOL pressed = self->_pressed;
  BOOL on = self->_on;
  [(UISwitchModernVisualElement *)self _transitionKnobToPressed:pressed on:on animated:0];
}

- (id)_effectiveGradientImage
{
  int v3 = [(UISwitchModernVisualElement *)self _effectiveOnTintColor];
  v4 = [(UIView *)self traitCollection];
  id v5 = +[UISwitchModernVisualElement _modernGradientImageWithOnColor:v3 traitCollection:v4];

  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    id v6 = [v5 imageWithHorizontallyFlippedOrientation];
  }
  else
  {
    id v6 = v5;
  }
  double v7 = v6;

  return v7;
}

- (id)_effectiveOnTintColor
{
  onTintColor = self->_onTintColor;
  if (onTintColor)
  {
    int v3 = onTintColor;
  }
  else
  {
    int v3 = [(UISwitchModernVisualElement *)self _defaultOnTintColor];
  }
  return v3;
}

+ (id)_modernGradientImageWithOnColor:(id)a3 traitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1EB25D078 != -1) {
    dispatch_once(&qword_1EB25D078, &__block_literal_global_154);
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke_2;
  v15[3] = &unk_1E52EB218;
  v17 = &v23;
  id v7 = v5;
  id v16 = v7;
  double v18 = &v19;
  +[UITraitCollection _performWithCurrentTraitCollection:usingBlock:]((uint64_t)UITraitCollection, (uint64_t)v6, (uint64_t)v15);
  v8 = [_UICGColorCacheKey alloc];
  id v9 = -[_UICGColorCacheKey initWithColors:](v8, "initWithColors:", v24[3], v20[3], 0);
  CGPoint v10 = [(id)qword_1EB25D070 objectForKey:v9];
  if (!v10)
  {
    CGPoint v11 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", 510.0, 1.0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke_3;
    v13[3] = &unk_1E52EB240;
    v13[4] = &v23;
    v13[5] = &v19;
    long long v14 = xmmword_186B94BE0;
    CGPoint v10 = [(UIGraphicsImageRenderer *)v11 imageWithActions:v13];
    if (v10) {
      [(id)qword_1EB25D070 setObject:v10 forKey:v9];
    }
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) cgColor];
  id v2 = [*(id *)(a1 + 32) colorWithAlphaComponent:0.0];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 cgColor];
}

- (id)_defaultOnTintColor
{
  return +[UIColor systemGreenColor];
}

- (void)_invalidateUserInterfaceRenderingMode
{
  int v3 = [(UIView *)self traitCollection];
  BOOL v4 = [v3 _userInterfaceRenderingMode] == 0;

  switchWellView = self->_switchWellView;
  [(UIView *)switchWellView _setOverrideUserInterfaceRenderingMode:2 * v4];
}

- (id)_effectiveTintColor
{
  if (dyld_program_sdk_at_least())
  {
    int v3 = +[UIColor _switchOffColor];
  }
  else
  {
    tintColor = self->_tintColor;
    if (tintColor)
    {
      int v3 = tintColor;
    }
    else
    {
      int v3 = +[UIColor colorWithWhite:0.9 alpha:1.0];
    }
  }
  return v3;
}

- (void)setTintColor:(id)a3
{
  id v7 = a3;
  if (!-[UIColor isEqual:](self->_tintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    switchWellOffImageView = self->_switchWellOffImageView;
    id v6 = [(UISwitchModernVisualElement *)self _effectiveOffImageTintColor];
    [(UIView *)switchWellOffImageView setTintColor:v6];
  }
  [(UISwitchModernVisualElement *)self _updateDisplayWithAnimationIfNeeded];
}

- (void)_invalidateOnOffImages
{
  [(UIView *)self->_switchWellOffImageView removeFromSuperview];
  [(UIView *)self->_switchWellOnImageView removeFromSuperview];
  [(UIView *)self->_switchWellImageViewContainer removeFromSuperview];
  int v3 = [UIImageView alloc];
  BOOL v4 = [(UISwitchModernVisualElement *)self _effectiveOffImage];
  id v5 = [(UIImageView *)v3 initWithImage:v4];
  switchWellOffImageView = self->_switchWellOffImageView;
  self->_switchWellOffImageView = v5;

  id v7 = [UIImageView alloc];
  v8 = [(UISwitchModernVisualElement *)self _effectiveOnImage];
  id v9 = [(UIImageView *)v7 initWithImage:v8];
  switchWellOnImageView = self->_switchWellOnImageView;
  self->_switchWellOnImageView = v9;

  CGPoint v11 = [UIView alloc];
  [(UIView *)self bounds];
  v12 = -[UIView initWithFrame:](v11, "initWithFrame:");
  switchWellImageViewContainer = self->_switchWellImageViewContainer;
  self->_switchWellImageViewContainer = v12;

  long long v14 = self->_switchWellOffImageView;
  [(UISwitchModernVisualElement *)self _offImagePosition];
  -[UIImageView setCenter:](v14, "setCenter:");
  v15 = self->_switchWellOnImageView;
  [(UISwitchModernVisualElement *)self _onImagePosition];
  -[UIImageView setCenter:](v15, "setCenter:");
  id v16 = self->_switchWellOffImageView;
  v17 = [(UISwitchModernVisualElement *)self _effectiveOffImageTintColor];
  [(UIView *)v16 setTintColor:v17];

  double v18 = self->_switchWellOnImageView;
  uint64_t v19 = [(UISwitchModernVisualElement *)self _effectiveOnImageTintColor];
  [(UIView *)v18 setTintColor:v19];

  [(UIView *)self->_switchWellImageViewContainer addSubview:self->_switchWellOffImageView];
  [(UIView *)self->_switchWellImageViewContainer addSubview:self->_switchWellOnImageView];
  [(UIView *)self addSubview:self->_switchWellImageViewContainer];
  [(UISwitchModernVisualElement *)self _transitionImagesToPressed:self->_pressed on:self->_on animated:0];
  [(UISwitchModernVisualElement *)self _orderSubviews];
}

- (void)_transitionImagesToPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4) {
    uint64_t v8 = 10;
  }
  else {
    uint64_t v8 = 9;
  }
  id v9 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UISwitchModernVisualElement__on[v8]);
  if (a4) {
    uint64_t v10 = 9;
  }
  else {
    uint64_t v10 = 10;
  }
  id v11 = v9;
  id v12 = *(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UISwitchModernVisualElement__on[v10]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__UISwitchModernVisualElement__transitionImagesToPressed_on_animated___block_invoke;
  aBlock[3] = &unk_1E52DC3D0;
  BOOL v20 = a3;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  v15 = _Block_copy(aBlock);
  id v16 = v15;
  if (v5) {
    +[UIView animateWithDuration:327680 delay:v15 options:0 animations:0.2 completion:0.0];
  }
  else {
    (*((void (**)(void *))v15 + 2))(v15);
  }
}

uint64_t __70__UISwitchModernVisualElement__transitionImagesToPressed_on_animated___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  BOOL v4 = *(void **)(a1 + 40);
  return [v4 setAlpha:0.0];
}

- (id)_effectiveOnImageTintColor
{
  if (self->_onTintColor
    && !-[UISwitchModernVisualElement _shouldUseLightTintOverColor:](self, "_shouldUseLightTintOverColor:"))
  {
    id v2 = +[UIColor colorWithWhite:0.0 alpha:1.0];
  }
  else
  {
    id v2 = +[UIColor whiteColor];
  }
  return v2;
}

- (id)_effectiveOffImageTintColor
{
  if (dyld_program_sdk_at_least()) {
    +[UIColor _switchOffImageColor];
  }
  else {
  id v2 = +[UIColor colorWithWhite:0.7 alpha:1.0];
  }
  return v2;
}

- (CGPoint)_offImagePosition
{
  [(UIView *)self bounds];
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", 1, 0);
  [(UIView *)self bounds];
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", 1, 1);
  UIFloorToViewScale(self);
  double v4 = v3;
  UIFloorToViewScale(self);
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (id)_effectiveOnImage
{
  if ([(UISwitchModernVisualElement *)self showsOnOffLabel])
  {
    double v3 = [(UISwitchModernVisualElement *)self _accessibleOnImage];
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (id)_effectiveOffImage
{
  if ([(UISwitchModernVisualElement *)self showsOnOffLabel])
  {
    double v3 = [(UISwitchModernVisualElement *)self _accessibleOffImage];
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (BOOL)showsOnOffLabel
{
  return self->_showsOnOffLabel;
}

- (void)_updateDisplayWithAnimationIfNeeded
{
  +[UIView inheritedAnimationDuration];
  [(UISwitchModernVisualElement *)self _updateDisplayAnimated:v3 > 0.0];
}

- (void)_invalidateKnob
{
  [(UIView *)self->_knobView removeFromSuperview];
  double v3 = [UIImageView alloc];
  double v4 = [(UISwitchModernVisualElement *)self _effectiveThumbImage];
  double v5 = [(UIImageView *)v3 initWithImage:v4];
  knobView = self->_knobView;
  self->_knobView = v5;

  [(UISwitchModernVisualElement *)self _transitionKnobToPressed:0 animated:0];
  [(UISwitchModernVisualElement *)self _transitionKnobToOn:self->_on animated:0];
  if (dyld_program_sdk_at_least())
  {
    switchWellContainerView = (UISwitchModernVisualElement *)self->_switchWellContainerView;
    uint64_t v8 = self->_knobView;
  }
  else
  {
    uint64_t v8 = self->_knobView;
    switchWellContainerView = self;
  }
  [(UIView *)switchWellContainerView addSubview:v8];
  [(UISwitchModernVisualElement *)self _orderSubviews];
}

- (void)_updateDisplayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UISwitchModernVisualElement *)self on];
  BOOL v6 = [(UISwitchModernVisualElement *)self pressed];
  if (dyld_program_sdk_at_least())
  {
    if (v3)
    {
      double v7 = [(UIView *)self->_knobView layer];
      uint64_t v8 = [v7 presentationLayer];
      if (v8)
      {
        id v9 = [(UIView *)self->_switchWellImageView layer];
        uint64_t v10 = [v9 presentationLayer];
        BOOL v3 = v10 != 0;
      }
      else
      {
        BOOL v3 = 0;
      }

      id v11 = self;
      BOOL v12 = v5;
      BOOL v13 = v3;
    }
    else
    {
      id v11 = self;
      BOOL v12 = v5;
      BOOL v13 = 0;
    }
    [(UISwitchModernVisualElement *)v11 _transitionKnobToOn:v12 animated:v13];
    [(UISwitchModernVisualElement *)self _transitionKnobToPressed:v6 animated:v3];
    [(UISwitchModernVisualElement *)self _transitionWellViewToPressed:v6 on:v5 animated:v3];
  }
  else
  {
    [(UISwitchModernVisualElement *)self _transitionKnobToOn:v5 animated:0];
    [(UISwitchModernVisualElement *)self _transitionWellViewToOn:v5 animated:0];
    [(UISwitchModernVisualElement *)self _transitionKnobToPressed:v6 animated:0];
    [(UISwitchModernVisualElement *)self _transitionWellViewToPressed:v6 animated:0];
    BOOL v3 = 0;
  }
  [(UISwitchModernVisualElement *)self _transitionImagesToPressed:v6 on:v5 animated:v3];
}

- (BOOL)on
{
  return self->_on;
}

- (void)_transitionKnobToPressed:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_transitionKnobToOn:(BOOL)a3 animated:(BOOL)a4
{
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (CGPoint)_onImagePosition
{
  [(UIView *)self bounds];
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", 0, 0);
  [(UIView *)self bounds];
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", 0, 1);
  UIFloorToViewScale(self);
  double v4 = v3;
  UIFloorToViewScale(self);
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)_transitionWellViewToPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v8 = [(UIView *)self->_switchWellImageView layer];
  id v9 = [v8 presentationLayer];
  [v9 position];
  double v11 = v10;
  double v13 = v12;

  id v14 = [(UIView *)self->_switchWellImageView layer];
  [v14 bounds];
  -[UISwitchModernVisualElement _wellPositionOn:forBounds:](self, "_wellPositionOn:forBounds:", v6);
  double v16 = v15;
  double v18 = v17;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__UISwitchModernVisualElement__transitionWellViewToPressed_on_animated___block_invoke;
  aBlock[3] = &unk_1E52DD178;
  void aBlock[4] = self;
  *(double *)&aBlock[5] = v16;
  *(double *)&aBlock[6] = v18;
  id v19 = _Block_copy(aBlock);
  BOOL v20 = v19;
  if (a5)
  {
    (*((void (**)(void *))v19 + 2))(v19);
    [(UISwitchModernVisualElement *)self _switchToStaticMode:0];
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v11, v13);
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v16, v18);
    uint64_t v23 = [(UISwitchModernVisualElement *)self _switchTrackPositionSpringAnimationFromValue:v21 toValue:v22 on:v6];

    [v23 setDelegate:self];
    v24 = [(UIView *)self->_switchWellImageView layer];
    [v24 addAnimation:v23 forKey:@"SwitchWellPosition"];
  }
  else
  {
    +[UIView performWithoutAnimation:v19];
    [(UISwitchModernVisualElement *)self _switchToStaticMode:1];
  }
}

- (void)_transitionKnobToPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = [(UIView *)self->_knobView layer];
  double v10 = [v9 presentationLayer];
  [v10 bounds];
  double v140 = v11;
  double v141 = v12;
  double v142 = v13;
  double v143 = v14;

  double v15 = [(UIView *)self->_knobView layer];
  double v16 = [v15 presentationLayer];
  [v16 position];
  double v18 = v17;
  double v20 = v19;

  [(UISwitchModernVisualElement *)self _knobBoundsPressed:v7];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", v6, v7);
  double v30 = v29;
  double v32 = v31;
  if (dyld_program_sdk_at_least())
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UISwitchModernVisualElement__transitionKnobToPressed_on_animated___block_invoke;
    aBlock[3] = &unk_1E52E7948;
    void aBlock[4] = self;
    *(double *)&aBlock[5] = v22;
    *(double *)&aBlock[6] = v24;
    *(double *)&void aBlock[7] = v26;
    *(double *)&aBlock[8] = v28;
    *(double *)&aBlock[9] = v30;
    *(double *)&aBlock[10] = v32;
    v33 = _Block_copy(aBlock);
    double v34 = v33;
    if (a5)
    {
      (*((void (**)(void *))v33 + 2))(v33);
      [(UISwitchModernVisualElement *)self _switchToStaticMode:0];
      double v35 = [(UIView *)self->_knobView layer];
      double v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v140, v141, v142, v143);
      double v37 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v22, v24, v26, v28);
      double v38 = [(UISwitchModernVisualElement *)self _switchKnobWidthSpringAnimationFromValue:v36 toValue:v37 pressed:v7];
      [v35 addAnimation:v38 forKey:@"TouchKnobBoundsAnimation"];

      double v39 = [(UIView *)self->_knobView layer];
      double v40 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v18, v20);
      double v41 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v30, v32);
      v42 = [(UISwitchModernVisualElement *)self _switchKnobPositionSpringAnimationFromValue:v40 toValue:v41];
      [v39 addAnimation:v42 forKey:@"TouchKnobPositionAnimation"];
    }
    else
    {
      +[UIView performWithoutAnimation:v33];
      [(UISwitchModernVisualElement *)self _switchToStaticMode:1];
    }
  }
  else
  {
    double v128 = v18;
    double v129 = v20;
    v43 = [(UIView *)self->_switchWellContainerView layer];
    v44 = [v43 presentationLayer];
    [v44 bounds];
    double v114 = v46;
    double v115 = v45;
    double v112 = v48;
    double v113 = v47;

    v49 = [(UIView *)self->_switchWellContainerView layer];
    v50 = [v49 presentationLayer];
    [v50 position];
    double v116 = v52;
    double v117 = v51;

    v53 = [(UIView *)self->_leftSwitchWellContainerView layer];
    v54 = [v53 presentationLayer];
    [v54 bounds];
    double v120 = v56;
    double v121 = v55;
    double v118 = v58;
    double v119 = v57;

    v59 = [(UIView *)self->_leftSwitchWellContainerView layer];
    v60 = [v59 presentationLayer];
    [v60 position];
    double v126 = v62;
    double v127 = v61;

    [(UISwitchModernVisualElement *)self _switchWellContainerBoundsOn:v6 pressed:v7];
    double v136 = v63;
    double v137 = v64;
    double v138 = v66;
    double v139 = v65;
    [(UISwitchModernVisualElement *)self _switchWellContainerPositionOn:v6 pressed:v7];
    double v134 = v68;
    double v135 = v67;
    [(UISwitchModernVisualElement *)self _leftSwitchWellContainerBoundsOn:v6 pressed:v7];
    double v70 = v69;
    double v130 = v72;
    double v131 = v71;
    double v132 = v73;
    [(UISwitchModernVisualElement *)self _leftSwitchWellContainerPositionOn:v6 pressed:v7];
    double v75 = v74;
    double v133 = v76;
    v77 = -[UIView _backing_outermostLayer](&self->_switchWellView->super.super.isa);
    v78 = [v77 presentationLayer];
    [v78 position];
    double v124 = v80;
    double v125 = v79;

    [(UISwitchModernVisualElement *)self _switchWellPositionOn:v6 pressed:v7];
    v144[0] = MEMORY[0x1E4F143A8];
    v144[1] = 3221225472;
    v144[2] = __68__UISwitchModernVisualElement__transitionKnobToPressed_on_animated___block_invoke_2;
    v144[3] = &unk_1E52EB1F0;
    v144[4] = self;
    *(double *)&v144[5] = v22;
    *(double *)&v144[6] = v24;
    *(double *)&v144[7] = v26;
    *(double *)&v144[8] = v28;
    *(double *)&v144[9] = v30;
    *(double *)&v144[10] = v32;
    *(double *)&v144[11] = v136;
    *(double *)&v144[12] = v139;
    *(double *)&v144[13] = v138;
    *(double *)&v144[14] = v137;
    *(double *)&v144[15] = v135;
    *(double *)&v144[16] = v134;
    *(double *)&v144[17] = v70;
    *(double *)&v144[18] = v131;
    *(double *)&v144[19] = v130;
    *(double *)&v144[20] = v132;
    *(double *)&v144[21] = v75;
    *(double *)&v144[22] = v133;
    *(double *)&v144[23] = v81;
    double v122 = v82;
    double v123 = v81;
    *(double *)&v144[24] = v82;
    v83 = _Block_copy(v144);
    double v34 = v83;
    if (a5)
    {
      (*((void (**)(void *))v83 + 2))(v83);
      v84 = [(UIView *)self->_knobView layer];
      v85 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v140, v141, v142, v143);
      v86 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v22, v24, v26, v28);
      v87 = [(UISwitchModernVisualElement *)self _switchSpringAnimationWithKeyPath:@"bounds" fromValue:v85 toValue:v86 pressed:v7];
      [v84 addAnimation:v87 forKey:@"TouchKnobBoundsAnimation"];

      v88 = [(UIView *)self->_knobView layer];
      v89 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v128, v129);
      v90 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v30, v32);
      v91 = [(UISwitchModernVisualElement *)self _switchSpringAnimationWithKeyPath:@"position" fromValue:v89 toValue:v90 pressed:v7];
      [v88 addAnimation:v91 forKey:@"TouchKnobPositionAnimation"];

      v92 = [(UIView *)self->_switchWellContainerView layer];
      v93 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v115, v114, v113, v112);
      v94 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v136, v139, v138, v137);
      v95 = [(UISwitchModernVisualElement *)self _switchSpringAnimationWithKeyPath:@"bounds" fromValue:v93 toValue:v94 pressed:v7];
      [v92 addAnimation:v95 forKey:@"WellContainerBounds"];

      v96 = [(UIView *)self->_switchWellContainerView layer];
      v97 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v117, v116);
      v98 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v135, v134);
      v99 = [(UISwitchModernVisualElement *)self _switchSpringAnimationWithKeyPath:@"position" fromValue:v97 toValue:v98 pressed:v7];
      [v96 addAnimation:v99 forKey:@"WellContainerPosition"];

      v100 = [(UIView *)self->_leftSwitchWellContainerView layer];
      v101 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v121, v120, v119, v118);
      v102 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v70, v131, v130, v132);
      v103 = [(UISwitchModernVisualElement *)self _switchSpringAnimationWithKeyPath:@"bounds" fromValue:v101 toValue:v102 pressed:v7];
      [v100 addAnimation:v103 forKey:@"LeftWellContainerBounds"];

      v104 = [(UIView *)self->_leftSwitchWellContainerView layer];
      v105 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v127, v126);
      v106 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v75, v133);
      v107 = [(UISwitchModernVisualElement *)self _switchSpringAnimationWithKeyPath:@"position" fromValue:v105 toValue:v106 pressed:v7];
      [v104 addAnimation:v107 forKey:@"LeftWellContainerPosition"];

      v108 = -[UIView _backing_outermostLayer](&self->_switchWellView->super.super.isa);
      v109 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v125, v124);
      v110 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v123, v122);
      v111 = [(UISwitchModernVisualElement *)self _switchSpringAnimationWithKeyPath:@"position" fromValue:v109 toValue:v110 pressed:v7];
      [v108 addAnimation:v111 forKey:@"WellPosition"];
    }
    else
    {
      +[UIView performWithoutAnimation:v83];
    }
  }
}

- (CGPoint)_knobPositionOn:(BOOL)a3 pressed:(BOOL)a4 forBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  dyld_program_sdk_at_least();
  if (self->_knobView) {
    knobView = self->_knobView;
  }
  else {
    knobView = self;
  }
  id v9 = [knobView layer];
  [v9 anchorPoint];
  double v11 = v10;
  double v13 = v12;

  double v14 = width * v11;
  UIRoundToViewScale(self);
  double v16 = v15;
  UIRoundToViewScale(self);
  double v18 = height * v13 + v17;
  double v19 = v16 + v14;
  result.y = v18;
  result.x = v19;
  return result;
}

- (void)_switchToStaticMode:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !a3;
  [(UIView *)self->_switchWellContainerView setClipsToBounds:!a3];
  [(UIImageView *)self->_switchWellImageView setHidden:v3];
  BOOL v6 = [(UISwitchModernVisualElement *)self _effectiveThumbImage];
  [(UIImageView *)self->_knobView setImage:v6];

  if (v5 || !self->_on)
  {
    switchWellContainerView = self->_switchWellContainerView;
    [(UIView *)switchWellContainerView setBackgroundColor:0];
  }
  else
  {
    id v8 = [(UISwitchModernVisualElement *)self _effectiveOnTintColor];
    [(UIView *)self->_switchWellContainerView setBackgroundColor:v8];
  }
}

- (id)_effectiveThumbImage
{
  if (dyld_program_sdk_at_least())
  {
    if ([(UIView *)self->_switchWellContainerView clipsToBounds])
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v7 = 1;
      if (!self->_on) {
        uint64_t v7 = 2;
      }
      uint64_t v8 = 1;
      if (self->_on) {
        uint64_t v8 = 2;
      }
      if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
        uint64_t v3 = v7;
      }
      else {
        uint64_t v3 = v8;
      }
    }
    thumbTintColor = self->_thumbTintColor;
    BOOL v5 = [(UIView *)self traitCollection];
    id v6 = +[UISwitchModernVisualElement _modernThumbImageWithColor:thumbTintColor mask:v3 traitCollection:v5];
  }
  else
  {
    double v4 = _UIImageWithName(@"UISwitchKnob");
    BOOL v5 = v4;
    if (self->_thumbTintColor)
    {
      objc_msgSend(v4, "_flatImageWithColor:");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = v4;
      BOOL v5 = v6;
    }
  }
  double v10 = v6;

  return v10;
}

+ (id)_modernThumbImageWithColor:(id)a3 mask:(unint64_t)a4 traitCollection:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (qword_1EB25D088 == -1)
  {
    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_1EB25D088, &__block_literal_global_194);
  if (!v7)
  {
LABEL_3:
    id v7 = +[UIColor whiteColor];
  }
LABEL_4:
  id v9 = [v7 resolvedColorWithTraitCollection:v8];
  uint64_t v10 = [v9 CGColor];

  double v11 = [[_UIModernSwitchVisualElementCacheKey alloc] initWithMask:a4 color:v10];
  double v12 = [(id)qword_1EB25D080 objectForKey:v11];
  if (!v12)
  {
    id v13 = +[UIColor _controlShadowColor];
    uint64_t v14 = [v13 CGColor];

    double v15 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", 43.0, 43.0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__UISwitchModernVisualElement__modernThumbImageWithColor_mask_traitCollection___block_invoke_2;
    v18[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v18[4] = a4;
    v18[5] = v14;
    v18[6] = v10;
    double v16 = [(UIGraphicsImageRenderer *)v15 imageWithActions:v18];
    double v12 = objc_msgSend(v16, "resizableImageWithCapInsets:", 0.0, 21.0, 0.0, 21.0);

    if (v12) {
      [(id)qword_1EB25D080 setObject:v12 forKey:v11];
    }
  }
  return v12;
}

- (CGRect)_knobBoundsPressed:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = dyld_program_sdk_at_least();
  double v6 = 50.0;
  if (!v5) {
    double v6 = 48.0;
  }
  if (v3) {
    double v7 = v6;
  }
  else {
    double v7 = 43.0;
  }
  UIRoundToViewScale(self);
  double v9 = v8;
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = v7;
  result.size.double height = v9;
  result.size.double width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGPoint)_wellPositionOn:(BOOL)a3 forBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  if ((((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0) ^ a3)) {
    [(UIView *)self size];
  }
  else {
    double v7 = 0.5;
  }
  if (self->_switchWellImageView) {
    switchWellImageView = self->_switchWellImageView;
  }
  else {
    switchWellImageView = self;
  }
  double v9 = objc_msgSend(switchWellImageView, "layer", v7);
  [v9 anchorPoint];
  double v11 = v10;
  double v13 = v12;

  double v14 = width * v11;
  UIRoundToViewScale(self);
  double v16 = v15;
  UIRoundToViewScale(self);
  double v18 = height * v13 + v17;
  double v19 = v16 + v14;
  result.y = v18;
  result.x = v19;
  return result;
}

- (BOOL)_shouldUseLightTintOverColor:(id)a3
{
  double v7 = 0.0;
  double v8 = 0.0;
  if (a3) {
    [a3 getWhite:&v8 alpha:0];
  }
  double v4 = [(UISwitchModernVisualElement *)self _defaultOnTintColor];
  int v5 = v4;
  if (v4) {
    [v4 getWhite:&v7 alpha:0];
  }

  return v8 <= v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pan, 0);
  objc_storeStrong((id *)&self->_longPress, 0);
  objc_storeStrong((id *)&self->_gestureTrackingSession, 0);
  objc_storeStrong((id *)&self->_offImage, 0);
  objc_storeStrong((id *)&self->_onImage, 0);
  objc_storeStrong((id *)&self->_thumbTintColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_onTintColor, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_switchWellOnImageView, 0);
  objc_storeStrong((id *)&self->_switchWellOffImageView, 0);
  objc_storeStrong((id *)&self->_switchWellImageViewContainer, 0);
  objc_storeStrong((id *)&self->_switchWellImageView, 0);
  objc_storeStrong((id *)&self->_leftSwitchWellContainerView, 0);
  objc_storeStrong((id *)&self->_switchWellContainerView, 0);
  objc_storeStrong((id *)&self->_leftSwitchWellView, 0);
  objc_storeStrong((id *)&self->_switchWellView, 0);
}

- (UISwitchModernVisualElement)initWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20[1] = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() preferredContentSize];
  v19.receiver = self;
  v19.super_class = (Class)UISwitchModernVisualElement;
  double v8 = -[UISwitchVisualElement initWithFrame:](&v19, sel_initWithFrame_, x, y, v6, v7);
  [(UISwitchModernVisualElement *)v8 _invalidateControl];
  [(UISwitchModernVisualElement *)v8 setPressed:0];
  double v9 = [[UILongPressGestureRecognizer alloc] initWithTarget:v8 action:sel__handleLongPress_];
  [(UILongPressGestureRecognizer *)v9 setMinimumPressDuration:0.01];
  [(UIGestureRecognizer *)v9 _setCanExcludeWithActiveRequirements:0];
  [(UIGestureRecognizer *)v9 setName:@"UISwitch-longPress"];
  [(UIView *)v8 addGestureRecognizer:v9];
  [(UISwitchModernVisualElement *)v8 setLongPress:v9];
  [(UIGestureRecognizer *)v9 setDelegate:v8];
  double v10 = [[UIPanGestureRecognizer alloc] initWithTarget:v8 action:sel__handlePan_];
  [(UIGestureRecognizer *)v10 _setCanExcludeWithActiveRequirements:0];
  [(UIGestureRecognizer *)v10 setName:@"UISwitch-pan"];
  [(UIView *)v8 addGestureRecognizer:v10];
  [(UISwitchModernVisualElement *)v8 setPan:v10];
  [(UIPanGestureRecognizer *)v10 setDelegate:v8];
  double v11 = +[_UIImpactFeedbackGeneratorConfiguration lightConfiguration];
  double v12 = [v11 tweakedConfigurationForClass:objc_opt_class() usage:@"valueChange"];

  double v13 = [(UIFeedbackGenerator *)[UIImpactFeedbackGenerator alloc] initWithConfiguration:v12 view:v8];
  [(UISwitchVisualElement *)v8 setImpactFeedbackGenerator:v13];
  double v14 = [[UISwitchMVEGestureTrackingSession alloc] initWithVisualElement:v8];
  gestureTrackingSessiBOOL on = v8->_gestureTrackingSession;
  v8->_gestureTrackingSessiBOOL on = v14;

  v20[0] = objc_opt_class();
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v17 = [(UIView *)v8 registerForTraitChanges:v16 withTarget:v8 action:sel__invalidateUserInterfaceRenderingMode];

  return v8;
}

- (void)setPressed:(BOOL)a3
{
  self->_BOOL pressed = a3;
}

- (void)setPan:(id)a3
{
}

- (void)setLongPress:(id)a3
{
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  UISemanticContentAttribute v5 = [(UIView *)self semanticContentAttribute];
  v6.receiver = self;
  v6.super_class = (Class)UISwitchModernVisualElement;
  [(UIView *)&v6 setSemanticContentAttribute:a3];
  if (v5 != [(UIView *)self semanticContentAttribute]) {
    [(UISwitchModernVisualElement *)self _invalidateControl];
  }
}

+ (CGSize)preferredContentSize
{
  double v2 = 51.0;
  double v3 = 31.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (UIEdgeInsets)preferredAlignmentRectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setSwitchControl:(id)a3
{
  id v4 = a3;
  [(UISwitchModernVisualElement *)self _uninstallSelectGestureRecognizer];
  v6.receiver = self;
  v6.super_class = (Class)UISwitchModernVisualElement;
  [(UISwitchVisualElement *)&v6 setSwitchControl:v4];

  double v5 = [(UISwitchVisualElement *)self switchControl];

  if (v5) {
    [(UISwitchModernVisualElement *)self _installSelectGestureRecognizer];
  }
}

- (void)setShowsOnOffLabel:(BOOL)a3
{
  self->_showsOnOffLabel = a3;
  [(UISwitchModernVisualElement *)self _invalidateOnOffImages];
}

- (void)_uninstallSelectGestureRecognizer
{
  double v3 = [(UISwitchModernVisualElement *)self selectGestureRecognizer];

  if (v3)
  {
    id v4 = [(UISwitchVisualElement *)self switchControl];
    double v5 = [(UISwitchModernVisualElement *)self selectGestureRecognizer];
    [v4 removeGestureRecognizer:v5];

    [(UISwitchModernVisualElement *)self setSelectGestureRecognizer:0];
  }
}

- (void)_installSelectGestureRecognizer
{
  double v3 = [(UISwitchModernVisualElement *)self selectGestureRecognizer];

  if (!v3)
  {
    id v4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__selectGestureChanged_];
    [(UISwitchModernVisualElement *)self setSelectGestureRecognizer:v4];

    double v5 = [(UISwitchModernVisualElement *)self selectGestureRecognizer];
    [v5 setAllowedPressTypes:&unk_1ED3EF968];

    objc_super v6 = [(UISwitchModernVisualElement *)self selectGestureRecognizer];
    [v6 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];

    double v7 = [(UISwitchModernVisualElement *)self selectGestureRecognizer];
    [v7 setDelegate:self];

    id v8 = [(UISwitchVisualElement *)self switchControl];
    [v8 addGestureRecognizer:self->_selectGestureRecognizer];
  }
}

- (UITapGestureRecognizer)selectGestureRecognizer
{
  return self->_selectGestureRecognizer;
}

- (void)setSelectGestureRecognizer:(id)a3
{
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(UISwitchModernVisualElement *)self gestureTrackingSession];
  [v7 setDisplayedOnValue:v5];

  self->_BOOL on = v5;
  [(UISwitchModernVisualElement *)self _updateDisplayAnimated:v4];
}

- (UISwitchMVEGestureTrackingSession)gestureTrackingSession
{
  return self->_gestureTrackingSession;
}

- (void)_invalidateControl
{
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      objc_super v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_invalidateControl___s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v8, 2u);
    }
  }
  double v3 = +[UITraitCollection _currentTraitCollectionIfExists]();
  BOOL v4 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v4];

  BOOL v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  [(UISwitchModernVisualElement *)self _invalidateWell];
  [(UISwitchModernVisualElement *)self _invalidateKnob];
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:v3];
  [(UISwitchModernVisualElement *)self _invalidateOnOffImages];
}

- (void)_orderSubviews
{
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self insertSubview:self->_switchWellView atIndex:0];
    [(UIView *)self insertSubview:self->_switchWellContainerView above:self->_switchWellView];
    p_knobView = &self->_knobView;
    [(UIView *)self->_switchWellContainerView bringSubviewToFront:self->_knobView];
    switchWellContainerView = (UISwitchModernVisualElement *)self->_switchWellContainerView;
  }
  else
  {
    [(UIView *)self insertSubview:self->_switchWellContainerView atIndex:0];
    [(UIView *)self insertSubview:self->_leftSwitchWellContainerView aboveSubview:self->_switchWellContainerView];
    p_knobView = &self->_knobView;
    [(UIView *)self bringSubviewToFront:self->_knobView];
    switchWellContainerView = self;
  }
  switchWellImageViewContainer = self->_switchWellImageViewContainer;
  objc_super v6 = *p_knobView;
  [(UIView *)switchWellContainerView insertSubview:switchWellImageViewContainer belowSubview:v6];
}

void __79__UISwitchModernVisualElement__modernThumbImageWithColor_mask_traitCollection___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)qword_1EB25D080;
  qword_1EB25D080 = (uint64_t)v0;
}

void __79__UISwitchModernVisualElement__modernGradientImageWithOnColor_traitCollection___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)qword_1EB25D070;
  qword_1EB25D070 = (uint64_t)v0;
}

void __79__UISwitchModernVisualElement__modernThumbImageWithColor_mask_traitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = v3;
  if (v4)
  {
    double v5 = -19.0;
    if (v4 == 1) {
      double v5 = 6.0;
    }
    uint64_t v6 = 0x404C000000000000;
    double v7 = 3.0;
    double v8 = 31.0;
    double v9 = CGPathCreateWithRoundedRect(*(CGRect *)&v5, 15.5, 15.5, 0);
    CGContextAddPath((CGContextRef)[v13 CGContext], v9);
    CGContextClip((CGContextRef)[v13 CGContext]);
    CGPathRelease(v9);
  }
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v11 = 0;
  }
  else {
    double v11 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  v15.double width = 0.0;
  v15.double height = 2.5;
  CGContextSetShadowWithColor(v11, v15, 6.0, *(CGColorRef *)(a1 + 40));
  CGContextSetFillColorWithColor((CGContextRef)[v13 CGContext], *(CGColorRef *)(a1 + 48));
  double v12 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 8.0, 5.0, 27.0, 27.0);
  [v12 fill];
}

- (void)sendStateChangeActions
{
  id v3 = [(UISwitchVisualElement *)self switchControl];
  objc_msgSend(v3, "visualElement:transitionedToOn:", self, -[UISwitchModernVisualElement on](self, "on"));
}

- (void)performStateChangeFeedback
{
  if ([(UISwitchModernVisualElement *)self _feedbackEnabled])
  {
    id v3 = [(UISwitchModernVisualElement *)self _settings];
    [v3 hapticDelay];
    double v5 = v4;

    uint64_t v6 = [(UISwitchVisualElement *)self impactFeedbackGenerator];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__UISwitchModernVisualElement_performStateChangeFeedback__block_invoke;
    v7[3] = &unk_1E52D9F70;
    v7[4] = self;
    [v6 performFeedbackWithDelay:v7 insideBlock:v5];
  }
}

void __57__UISwitchModernVisualElement_performStateChangeFeedback__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) impactFeedbackGenerator];
  double v2 = [*(id *)(a1 + 32) _settings];
  [v2 impactIntensity];
  double v4 = v3;
  [*(id *)(a1 + 32) center];
  objc_msgSend(v7, "impactOccurredWithIntensity:atLocation:", v4, v5, v6);
}

- (void)interactiveChangeToDisplayedOn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISwitchModernVisualElement *)self on] != a3)
  {
    [(UISwitchModernVisualElement *)self setOn:v3 animated:+[UIView areAnimationsEnabled]];
    [(UISwitchModernVisualElement *)self performStateChangeFeedback];
  }
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 type])
  {
    id v8 = [(UISwitchModernVisualElement *)self longPress];

    if (v8 == v6)
    {
      double v9 = [v7 allTouches];
      uint64_t v10 = [v9 count];

      if (v10 == 1)
      {
        double v11 = [v7 allTouches];
        double v12 = [v11 anyObject];

        if ([v12 _isPointerTouch]) {
          double v13 = 0.0;
        }
        else {
          double v13 = 0.01;
        }
      }
      else
      {
        double v13 = 0.01;
      }
      double v14 = [(UISwitchModernVisualElement *)self longPress];
      [v14 setMinimumPressDuration:v13];
    }
  }
  char v15 = [v6 _shouldReceiveEvent:v7];

  return v15;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(UISwitchModernVisualElement *)self longPress];
  if (v9 == v7)
  {
    id v4 = [(UISwitchModernVisualElement *)self pan];
    if (v4 == v8)
    {
      BOOL v11 = 1;
      id v4 = v8;
LABEL_9:

      goto LABEL_10;
    }
  }
  id v10 = [(UISwitchModernVisualElement *)self pan];
  if (v10 == v7)
  {
    id v12 = [(UISwitchModernVisualElement *)self longPress];
    BOOL v11 = v12 == v8;
  }
  else
  {
    BOOL v11 = 0;
  }

  if (v9 == v7) {
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UISwitchModernVisualElement *)self longPress];
  if (v8 != v6)
  {
    id v9 = [(UISwitchModernVisualElement *)self pan];
    if (v9 != v6)
    {
      char isKindOfClass = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = v6;
  if (v8 != v6) {
    goto LABEL_5;
  }
LABEL_6:

  return isKindOfClass & 1;
}

- (void)_handleLongPress:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 state];

  -[UISwitchModernVisualElement _handleLongPressWithGestureLocationInBounds:gestureState:](self, "_handleLongPressWithGestureLocationInBounds:gestureState:", v9, v6, v8);
}

- (void)_handleLongPressWithGestureLocationInBounds:(CGPoint)a3 gestureState:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [(UISwitchModernVisualElement *)self gestureTrackingSession];
  uint64_t v9 = [(UISwitchVisualElement *)self switchControl];
  int v10 = objc_msgSend(v9, "pointMostlyInside:", x, y);

  BOOL v11 = [(UISwitchModernVisualElement *)self on];
  BOOL v12 = [(UISwitchModernVisualElement *)self pressed];
  if (v10)
  {
    [(UISwitchModernVisualElement *)self setPressed:1];
    if (a4 == 1)
    {
      [v8 reset];
      id v17 = [(UISwitchVisualElement *)self impactFeedbackGenerator];
      [v17 activateWithCompletionBlock:0];

      uint64_t v18 = [(UISwitchModernVisualElement *)self on] ^ 1;
      objc_super v19 = [(UISwitchModernVisualElement *)self longPress];
      [v8 setPendingDisplayedOnValue:v18 forGesture:v19];

      goto LABEL_12;
    }
    if (a4 != 3)
    {
      if (a4 != 2)
      {
LABEL_12:
        LOBYTE(v14) = 0;
LABEL_13:
        char v20 = 0;
        goto LABEL_14;
      }
      double v13 = [(UISwitchModernVisualElement *)self pan];
      int v14 = [v8 canApplyPendingOnValueForGesture:v13];

      if (!v14) {
        goto LABEL_13;
      }
LABEL_10:
      [v8 applyPendingDisplayedOnValueWithoutSendingActions];
      goto LABEL_12;
    }
    double v26 = [(UISwitchModernVisualElement *)self longPress];
    int v14 = [v8 canApplyPendingOnValueForGesture:v26];

    if (!v14) {
      goto LABEL_13;
    }
    [v8 applyPendingDisplayedOnValueWithoutSendingActions];
    LOBYTE(v14) = 1;
  }
  else
  {
    [(UISwitchModernVisualElement *)self setPressed:0];
    if (a4 != 3) {
      goto LABEL_10;
    }
    char v15 = [(UISwitchModernVisualElement *)self longPress];
    int v16 = [v8 canApplyPendingOnValueForGesture:v15];

    if (!v16) {
      goto LABEL_10;
    }
    [v8 applyPendingDisplayedOnValueWithoutSendingActions];
    LOBYTE(v14) = 0;
  }
  char v20 = 1;
LABEL_14:
  BOOL v21 = +[UISwitchMVEGestureTrackingSession gestureIsInEndState:a4];
  BOOL v22 = v21;
  if (v21)
  {
    [(UISwitchModernVisualElement *)self setPressed:0];
    [v8 applyPendingDisplayedOnValueWithoutSendingActions];
    double v23 = [(UISwitchVisualElement *)self impactFeedbackGenerator];
    if ([v23 isActive]) {
      [v23 deactivate];
    }

    char v20 = 1;
  }
  if (v11 != [(UISwitchModernVisualElement *)self on]
    || v12 != [(UISwitchModernVisualElement *)self pressed])
  {
    [(UISwitchModernVisualElement *)self _updateDisplayAnimated:1];
  }
  double v24 = (void *)UIApp;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__UISwitchModernVisualElement__handleLongPressWithGestureLocationInBounds_gestureState___block_invoke;
  v27[3] = &unk_1E52DD150;
  char v30 = v20;
  BOOL v31 = v22;
  char v32 = v14;
  id v28 = v8;
  double v29 = self;
  id v25 = v8;
  [v24 _performBlockAfterCATransactionCommits:v27];
}

uint64_t __88__UISwitchModernVisualElement__handleLongPressWithGestureLocationInBounds_gestureState___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 48))
  {
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x1E4F1D410], 0.0, 1u);
    UIEdgeInsets result = [*(id *)(v1 + 32) applyPendingDisplayedOnValueAndSendActions];
  }
  if (*(unsigned char *)(v1 + 49))
  {
    if (*(unsigned char *)(v1 + 50))
    {
      double v2 = [*(id *)(v1 + 40) switchControl];
      [v2 visualElementHadTouchUpInside:*(void *)(v1 + 40)];
    }
    BOOL v3 = *(void **)(v1 + 32);
    return [v3 reset];
  }
  return result;
}

- (void)_handlePan:(id)a3
{
  id v4 = a3;
  [v4 translationInView:self];
  double v6 = v5;
  [v4 locationInView:self];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [v4 state];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__UISwitchModernVisualElement__handlePan___block_invoke;
  v13[3] = &unk_1E52D9F98;
  id v14 = v4;
  char v15 = self;
  id v12 = v4;
  -[UISwitchModernVisualElement _handlePanWithGestureLocationInBounds:horizontalTranslation:gestureState:resetPanTranslationBlock:](self, "_handlePanWithGestureLocationInBounds:horizontalTranslation:gestureState:resetPanTranslationBlock:", v11, v13, v8, v10, v6);
}

uint64_t __42__UISwitchModernVisualElement__handlePan___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTranslation:inView:", *(void *)(a1 + 40), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)_handlePanWithGestureLocationInBounds:(CGPoint)a3 horizontalTranslation:(double)a4 gestureState:(int64_t)a5 resetPanTranslationBlock:(id)a6
{
  id v12 = (void (**)(void))a6;
  double v9 = [(UISwitchModernVisualElement *)self gestureTrackingSession];
  if (a5 == 2)
  {
    double v10 = [(UISwitchModernVisualElement *)self pan];
    int v11 = [v9 updatePendingDisplayedOnValueIfMovementIsEnoughToInitiateChange:v10 forGesture:a4];

    if (v11) {
      v12[2]();
    }
  }
  else if (+[UISwitchMVEGestureTrackingSession gestureIsInEndState:a5])
  {
    [v9 invalidatePendingOnValue];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_opt_new();
  double v6 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 8.0, 5.0, 27.0, 27.0);
  [v5 setVisiblePath:v6];

  double v7 = [[UITargetedPreview alloc] initWithView:self->_knobView parameters:v5];
  double v8 = +[UIPointerEffect effectWithPreview:v7];
  double v9 = +[UIPointerStyle styleWithEffect:v8 shape:0];

  return v9;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UISwitchModernVisualElement;
  [(UIView *)&v4 _dynamicUserInterfaceTraitDidChange];
  if (dyld_program_sdk_at_least())
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __66__UISwitchModernVisualElement__dynamicUserInterfaceTraitDidChange__block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    +[UIView performWithoutAnimation:v3];
  }
}

uint64_t __66__UISwitchModernVisualElement__dynamicUserInterfaceTraitDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateControl];
}

- (void)setThumbTintColor:(id)a3
{
  id v7 = a3;
  if (!-[UIColor isEqual:](self->_thumbTintColor, "isEqual:")) {
    objc_storeStrong((id *)&self->_thumbTintColor, a3);
  }
  knobView = self->_knobView;
  double v6 = [(UISwitchModernVisualElement *)self _effectiveThumbImage];
  [(UIImageView *)knobView setImage:v6];
}

- (void)setOnImage:(id)a3
{
  id v5 = a3;
  if (!-[UIImage isEqual:](self->_onImage, "isEqual:")) {
    objc_storeStrong((id *)&self->_onImage, a3);
  }
  [(UISwitchModernVisualElement *)self _invalidateOnOffImages];
}

- (void)setOffImage:(id)a3
{
  id v5 = a3;
  if (!-[UIImage isEqual:](self->_offImage, "isEqual:")) {
    objc_storeStrong((id *)&self->_offImage, a3);
  }
  [(UISwitchModernVisualElement *)self _invalidateOnOffImages];
}

uint64_t __68__UISwitchModernVisualElement__transitionKnobToPressed_on_animated___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 512) layer];
  objc_msgSend(v2, "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 512) layer];
  objc_msgSend(v3, "setPosition:", *(double *)(a1 + 72), *(double *)(a1 + 80));

  objc_super v4 = [*(id *)(*(void *)(a1 + 32) + 464) layer];
  objc_msgSend(v4, "setBounds:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));

  id v5 = [*(id *)(*(void *)(a1 + 32) + 464) layer];
  objc_msgSend(v5, "setPosition:", *(double *)(a1 + 120), *(double *)(a1 + 128));

  double v6 = [*(id *)(*(void *)(a1 + 32) + 472) layer];
  objc_msgSend(v6, "setBounds:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));

  id v7 = [*(id *)(*(void *)(a1 + 32) + 472) layer];
  objc_msgSend(v7, "setPosition:", *(double *)(a1 + 168), *(double *)(a1 + 176));

  double v8 = *(void **)(*(void *)(a1 + 32) + 448);
  double v9 = *(double *)(a1 + 184);
  double v10 = *(double *)(a1 + 192);
  return objc_msgSend(v8, "setCenter:", v9, v10);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4) {
    [(UISwitchModernVisualElement *)self _switchToStaticMode:1];
  }
}

- (void)_transitionWellViewToPressed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  id v7 = [(UIView *)self->_switchWellView layer];
  double v8 = [v7 presentationLayer];
  [v8 borderWidth];
  double v10 = v9;

  int v11 = [(UIView *)self->_switchWellView layer];
  [v11 borderWidth];
  double v13 = v12;

  [(UISwitchModernVisualElement *)self _wellBorderWidthPressed:v5 on:self->_on];
  if (v10 != v14 && v14 != v13)
  {
    double v16 = v14;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__UISwitchModernVisualElement__transitionWellViewToPressed_animated___block_invoke;
    v23[3] = &unk_1E52D9CD0;
    v23[4] = self;
    *(double *)&v23[5] = v14;
    id v17 = _Block_copy(v23);
    uint64_t v18 = v17;
    if (a4)
    {
      (*((void (**)(void *))v17 + 2))(v17);
      objc_super v19 = [(UIView *)self->_switchWellView layer];
      char v20 = [NSNumber numberWithDouble:v10];
      BOOL v21 = [NSNumber numberWithDouble:v16];
      BOOL v22 = [(UISwitchModernVisualElement *)self _switchTrackAnimationWithFromValue:v20 toValue:v21 on:self->_on];
      [v19 addAnimation:v22 forKey:@"SwitchWellBorderWidth"];
    }
    else
    {
      +[UIView performWithoutAnimation:v17];
    }
  }
}

void __69__UISwitchModernVisualElement__transitionWellViewToPressed_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  [v2 setBorderWidth:*(double *)(a1 + 40)];
}

- (void)_transitionWellViewToOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  id v7 = [(UIView *)self->_switchWellView layer];
  double v8 = [v7 presentationLayer];
  uint64_t v9 = [v8 borderColor];

  double v10 = [(UISwitchModernVisualElement *)self _wellColorOn:v5];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__UISwitchModernVisualElement__transitionWellViewToOn_animated___block_invoke;
  v17[3] = &unk_1E52D9CD0;
  v17[4] = self;
  v17[5] = v10;
  int v11 = _Block_copy(v17);
  double v12 = v11;
  if (a4)
  {
    (*((void (**)(void *))v11 + 2))(v11);
    double v13 = [(UIView *)self->_switchWellView layer];
    double v14 = [(UISwitchModernVisualElement *)self _switchTrackColorAnimationWithFromValue:v9 toValue:v10];
    [v13 addAnimation:v14 forKey:@"SwitchWellColor"];

    char v15 = [(UIView *)self->_leftSwitchWellView layer];
    double v16 = [(UISwitchModernVisualElement *)self _switchTrackColorAnimationWithFromValue:v9 toValue:v10];
    [v15 addAnimation:v16 forKey:@"SwitchWellColor"];
  }
  else
  {
    +[UIView performWithoutAnimation:v11];
  }
}

void __64__UISwitchModernVisualElement__transitionWellViewToOn_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  [v2 setBorderColor:*(void *)(a1 + 40)];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
  [v3 setBorderColor:*(void *)(a1 + 40)];
}

- (CGRect)_switchWellContainerBoundsOn:(BOOL)a3 pressed:(BOOL)a4
{
  [(UISwitchModernVisualElement *)self _leftSwitchWellContainerBoundsOn:a3 pressed:a4];
  double v6 = v5;
  [(UIView *)self bounds];
  double v8 = v7 - v6;
  [(UIView *)self bounds];
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = v8;
  result.size.double height = v9;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGPoint)_switchWellContainerPositionOn:(BOOL)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[UISwitchModernVisualElement _leftSwitchWellContainerBoundsOn:pressed:](self, "_leftSwitchWellContainerBoundsOn:pressed:");
  double v8 = v7;
  [(UISwitchModernVisualElement *)self _switchWellContainerBoundsOn:v5 pressed:v4];
  double v10 = -0.0;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0) {
    double v10 = v8;
  }
  double v11 = v9 * 0.5 + v10;
  [(UIView *)self bounds];
  double v13 = v12 * 0.5;
  double v14 = v11;
  result.double y = v13;
  result.double x = v14;
  return result;
}

- (CGPoint)_switchWellPositionOn:(BOOL)a3 pressed:(BOOL)a4
{
  [(UISwitchModernVisualElement *)self _switchWellContainerBoundsOn:a3 pressed:a4];
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    [(UIView *)self->_switchWellView bounds];
    double v8 = v9 * 0.5;
  }
  else
  {
    double v6 = v5;
    [(UIView *)self->_switchWellView bounds];
    double v8 = v6 + v7 * -0.5;
  }
  [(UIView *)self bounds];
  double v11 = v10 * 0.5;
  double v12 = v8;
  result.double y = v11;
  result.double x = v12;
  return result;
}

- (CGRect)_leftSwitchWellContainerBoundsOn:(BOOL)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(UISwitchModernVisualElement *)self _knobBoundsPressed:a4];
  -[UISwitchModernVisualElement _knobPositionOn:pressed:forBounds:](self, "_knobPositionOn:pressed:forBounds:", v5, v4);
  double v8 = v7;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    [(UIView *)self bounds];
    double v9 = v10 - v8;
  }
  else
  {
    double v9 = v7;
    double v8 = 0.0;
  }
  [(UIView *)self bounds];
  double v12 = 0.0;
  double v13 = v8;
  double v14 = v9;
  result.size.double height = v11;
  result.size.double width = v14;
  result.origin.double y = v12;
  result.origin.double x = v13;
  return result;
}

- (CGPoint)_leftSwitchWellContainerPositionOn:(BOOL)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[UISwitchModernVisualElement _leftSwitchWellContainerBoundsOn:pressed:](self, "_leftSwitchWellContainerBoundsOn:pressed:");
  double v8 = v7;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    [(UISwitchModernVisualElement *)self _switchWellContainerBoundsOn:v5 pressed:v4];
    double v9 = v8 * 0.5 + v10;
  }
  else
  {
    double v9 = v7 * 0.5;
  }
  [(UIView *)self bounds];
  double v12 = v11 * 0.5;
  double v13 = v9;
  result.double y = v12;
  result.double x = v13;
  return result;
}

- (double)_wellBorderWidthPressed:(BOOL)a3 on:(BOOL)a4
{
  double result = 2.0;
  if (a3 || a4) {
    return 15.5;
  }
  return result;
}

- (CGColor)_wellColorOn:(BOOL)a3
{
  if (a3) {
    [(UISwitchModernVisualElement *)self _effectiveOnTintColor];
  }
  else {
  id v3 = [(UISwitchModernVisualElement *)self _effectiveTintColor];
  }
  BOOL v4 = (CGColor *)[v3 CGColor];

  return v4;
}

- (id)_switchTrackPositionAnimationWithFromValue:(id)a3 toValue:(id)a4 on:(BOOL)a5
{
  double v8 = (void *)MEMORY[0x1E4F39B48];
  id v9 = a4;
  id v10 = a3;
  double v11 = [v8 animationWithKeyPath:@"position"];
  double v12 = [(UISwitchModernVisualElement *)self _settings];
  double v13 = v12;
  if (a5)
  {
    [v12 trackBorderGoingOnAnimationDuration];
    double v15 = v14;

    [v11 setDuration:v15];
    double v16 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v11 setTimingFunction:v16];
  }
  else
  {
    [v12 trackBorderGoingOffAnimationDuration];
    double v18 = v17;

    [v11 setDuration:v18];
    objc_super v19 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v11 setTimingFunction:v19];

    char v20 = [(UISwitchModernVisualElement *)self _settings];
    [v20 trackBorderGoingOffAnimationBeginTimeOffset];
    objc_msgSend(v11, "setBeginTime:");

    [v11 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  }
  [v11 setFillMode:*MEMORY[0x1E4F39F98]];
  [v11 setFromValue:v10];

  [v11 setToValue:v9];
  *(float *)&double v21 = 1.0 / UIAnimationDragCoefficient();
  [v11 setSpeed:v21];
  return v11;
}

- (id)_switchTrackAnimationWithFromValue:(id)a3 toValue:(id)a4 on:(BOOL)a5
{
  double v8 = (void *)MEMORY[0x1E4F39B48];
  id v9 = a4;
  id v10 = a3;
  double v11 = [v8 animationWithKeyPath:@"borderWidth"];
  double v12 = [(UISwitchModernVisualElement *)self _settings];
  double v13 = v12;
  if (a5)
  {
    [v12 trackBorderGoingOnAnimationDuration];
    double v15 = v14;

    [v11 setDuration:v15];
    double v16 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v11 setTimingFunction:v16];
  }
  else
  {
    [v12 trackBorderGoingOffAnimationDuration];
    double v18 = v17;

    [v11 setDuration:v18];
    objc_super v19 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v11 setTimingFunction:v19];

    char v20 = [(UISwitchModernVisualElement *)self _settings];
    [v20 trackBorderGoingOffAnimationBeginTimeOffset];
    objc_msgSend(v11, "setBeginTime:");

    [v11 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  }
  [v11 setFillMode:*MEMORY[0x1E4F39F98]];
  [v11 setFromValue:v10];

  [v11 setToValue:v9];
  *(float *)&double v21 = 1.0 / UIAnimationDragCoefficient();
  [v11 setSpeed:v21];
  return v11;
}

- (id)_switchTrackColorAnimationWithFromValue:(id)a3 toValue:(id)a4
{
  double v6 = (void *)MEMORY[0x1E4F39B48];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 animationWithKeyPath:@"borderColor"];
  id v10 = [(UISwitchModernVisualElement *)self _settings];
  [v10 trackColorAnimationDuration];
  objc_msgSend(v9, "setDuration:");

  double v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
  [v9 setTimingFunction:v11];

  [v9 setFromValue:v8];
  [v9 setToValue:v7];

  *(float *)&double v12 = 1.0 / UIAnimationDragCoefficient();
  [v9 setSpeed:v12];
  return v9;
}

- (id)_switchSpringAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 pressed:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = (void *)MEMORY[0x1E4F39C90];
  id v11 = a5;
  id v12 = a4;
  double v13 = [v10 animationWithKeyPath:a3];
  double v14 = [(UISwitchModernVisualElement *)self _settings];
  double v15 = v14;
  if (v6)
  {
    [v14 knobSpringMassAnimationTouchDown];
    double v17 = v16;
    [v15 knobSpringStiffnessAnimationTouchDown];
    double v19 = v18;
    [v15 knobSpringDampingAnimationTouchDown];
    double v21 = v20;
    [v15 knobSpringDurationAnimationTouchDown];
  }
  else
  {
    [v14 knobSpringMassAnimationTouchUp];
    double v17 = v23;
    [v15 knobSpringStiffnessAnimationTouchUp];
    double v19 = v24;
    [v15 knobSpringDampingAnimationTouchUp];
    double v21 = v25;
    [v15 knobSpringDurationAnimationTouchUp];
  }
  double v26 = v22;
  [v13 setMass:v17];
  [v13 setStiffness:v19];
  [v13 setDamping:v21];
  [v13 setDuration:v26];
  [v13 setFillMode:*MEMORY[0x1E4F39F98]];
  [v13 setFromValue:v12];

  [v13 setToValue:v11];
  *(float *)&double v27 = 1.0 / UIAnimationDragCoefficient();
  [v13 setSpeed:v27];

  return v13;
}

- (id)_switchKnobPositionSpringAnimationFromValue:(id)a3 toValue:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F39C90];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 animationWithKeyPath:@"position"];
  id v10 = [(UISwitchModernVisualElement *)self _settings];
  [v10 knobSpringAnimationMass];
  double v12 = v11;
  [v10 knobSpringAnimationStiffness];
  double v14 = v13;
  [v10 knobSpringAnimationDamping];
  double v16 = v15;
  [v10 knobSpringAnimationDuration];
  double v18 = v17;
  [v9 setMass:v12];
  [v9 setStiffness:v14];
  [v9 setDamping:v16];
  [v9 setDuration:v18];
  [v9 setFillMode:*MEMORY[0x1E4F39F98]];
  [v9 setFromValue:v8];

  [v9 setToValue:v7];
  *(float *)&double v19 = 1.0 / UIAnimationDragCoefficient();
  [v9 setSpeed:v19];

  return v9;
}

- (id)_switchKnobWidthSpringAnimationFromValue:(id)a3 toValue:(id)a4 pressed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (void *)MEMORY[0x1E4F39C90];
  id v9 = a4;
  id v10 = a3;
  double v11 = [v8 animationWithKeyPath:@"bounds"];
  double v12 = [(UISwitchModernVisualElement *)self _settings];
  double v13 = v12;
  if (v5)
  {
    [v12 knobTouchDownSpringAnimationMass];
    double v15 = v14;
    [v13 knobTouchDownSpringAnimationStiffness];
    double v17 = v16;
    [v13 knobTouchDownSpringAnimationDamping];
    double v19 = v18;
    [v13 knobTouchDownSpringAnimationDuration];
  }
  else
  {
    [v12 knobSpringAnimationMass];
    double v15 = v21;
    [v13 knobSpringAnimationStiffness];
    double v17 = v22;
    [v13 knobSpringAnimationDamping];
    double v19 = v23;
    [v13 knobSpringAnimationDuration];
  }
  double v24 = v20;
  [v11 setMass:v15];
  [v11 setStiffness:v17];
  [v11 setDamping:v19];
  [v11 setDuration:v24];
  [v11 setFillMode:*MEMORY[0x1E4F39F98]];
  [v11 setFromValue:v10];

  [v11 setToValue:v9];
  *(float *)&double v25 = 1.0 / UIAnimationDragCoefficient();
  [v11 setSpeed:v25];

  return v11;
}

- (id)_switchTrackPositionSpringAnimationFromValue:(id)a3 toValue:(id)a4 on:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (void *)MEMORY[0x1E4F39C90];
  id v9 = a4;
  id v10 = a3;
  double v11 = [v8 animationWithKeyPath:@"position"];
  double v12 = [(UISwitchModernVisualElement *)self _settings];
  double v13 = v12;
  if (v5)
  {
    [v12 trackGoingOffSpringAnimationMass];
    double v15 = v14;
    [v13 trackGoingOffSpringAnimationStiffness];
    double v17 = v16;
    [v13 trackGoingOffSpringAnimationDamping];
    double v19 = v18;
    [v13 trackGoingOffSpringAnimationDuration];
  }
  else
  {
    [v12 trackGoingOnSpringAnimationMass];
    double v15 = v21;
    [v13 trackGoingOnSpringAnimationStiffness];
    double v17 = v22;
    [v13 trackGoingOnSpringAnimationDamping];
    double v19 = v23;
    [v13 trackGoingOnSpringAnimationDuration];
  }
  double v24 = v20;
  [v11 setMass:v15];
  [v11 setStiffness:v17];
  [v11 setDamping:v19];
  [v11 setDuration:v24];
  [v11 setFillMode:*MEMORY[0x1E4F39F98]];
  [v11 setFromValue:v10];

  [v11 setToValue:v9];
  *(float *)&double v25 = 1.0 / UIAnimationDragCoefficient();
  [v11 setSpeed:v25];

  return v11;
}

- (id)_labelOpacityAnimation
{
  id v2 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v2 setDuration:1.27];
  [v2 setValues:&unk_1ED3EF938];
  [v2 setKeyTimes:&unk_1ED3EF950];
  *(float *)&double v3 = 1.0 / UIAnimationDragCoefficient();
  [v2 setSpeed:v3];
  return v2;
}

- (id)_effectiveOffTextColor
{
  if (self->_tintColor) {
    [(UISwitchModernVisualElement *)self _effectiveTintColor];
  }
  else {
  id v2 = +[UIColor colorWithWhite:0.7 alpha:1.0];
  }
  return v2;
}

- (id)_accessibleOnImage
{
  id v2 = _UIImageWithName(@"UISwitchAccessibilityOnImage");
  double v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

- (id)_accessibleOffImage
{
  id v2 = _UIImageWithName(@"UISwitchAccessibilityOffImage");
  double v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

- (void)_setPressed:(BOOL)a3 on:(BOOL)a4 animated:(BOOL)a5 shouldAnimateLabels:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v11 = a7;
  if (__PAIR64__(self->_pressed, self->_on) != __PAIR64__(v9, v8))
  {
    id v13 = v11;
    self->_BOOL pressed = v9;
    self->_BOOL on = v8;
    char v12 = dyld_program_sdk_at_least();
    [(UISwitchModernVisualElement *)self _transitionKnobToOn:v8 animated:v7];
    if (v12)
    {
      [(UISwitchModernVisualElement *)self _transitionKnobToPressed:v9 animated:v7];
      [(UISwitchModernVisualElement *)self _transitionWellViewToPressed:v9 on:v8 animated:v7];
    }
    else
    {
      [(UISwitchModernVisualElement *)self _transitionWellViewToOn:v8 animated:v7];
      [(UISwitchModernVisualElement *)self _transitionKnobToPressed:v9 animated:v7];
      [(UISwitchModernVisualElement *)self _transitionWellViewToPressed:v9 animated:v7];
    }
    [(UISwitchModernVisualElement *)self _transitionImagesToPressed:v9 on:v8 animated:v7];
    id v11 = v13;
    if (v13)
    {
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
      id v11 = v13;
    }
  }
}

- (id)_settings
{
  return +[_UISwitchSettings sharedSettings];
}

- (BOOL)_feedbackEnabled
{
  id v2 = [(UISwitchModernVisualElement *)self _settings];
  char v3 = [v2 feedbackEnabled];

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_selectGestureRecognizer != a3 || [a3 _buttonType] != 4) {
    return 1;
  }
  return [(UIView *)self isEnabled];
}

- (void)_selectGestureChanged:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    BOOL v5 = [(UISwitchModernVisualElement *)self gestureTrackingSession];
    [v5 reset];

    BOOL v6 = [(UISwitchModernVisualElement *)self gestureTrackingSession];
    objc_msgSend(v6, "setPendingDisplayedOnValue:forGesture:", -[UISwitchModernVisualElement on](self, "on") ^ 1, v4);

    BOOL v7 = [(UISwitchModernVisualElement *)self gestureTrackingSession];
    [v7 applyPendingDisplayedOnValueWithoutSendingActions];

    objc_initWeak(&location, self);
    BOOL v8 = (void *)UIApp;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__UISwitchModernVisualElement__selectGestureChanged___block_invoke;
    void v9[3] = &unk_1E52DC308;
    objc_copyWeak(&v10, &location);
    [v8 _performBlockAfterCATransactionCommits:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __53__UISwitchModernVisualElement__selectGestureChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x1E4F1D410], 0.0, 1u);
    uint64_t v1 = [WeakRetained gestureTrackingSession];
    [v1 applyPendingDisplayedOnValueAndSendActions];

    id v2 = [WeakRetained switchControl];
    [v2 visualElementHadTouchUpInside:WeakRetained];

    char v3 = [WeakRetained gestureTrackingSession];
    [v3 reset];
  }
}

- (UIColor)thumbTintColor
{
  return self->_thumbTintColor;
}

- (UIImage)onImage
{
  return self->_onImage;
}

- (UIImage)offImage
{
  return self->_offImage;
}

- (void)setOn:(BOOL)a3
{
  self->_BOOL on = a3;
}

- (void)setGestureTrackingSession:(id)a3
{
}

- (UILongPressGestureRecognizer)longPress
{
  return self->_longPress;
}

- (UIPanGestureRecognizer)pan
{
  return self->_pan;
}

@end