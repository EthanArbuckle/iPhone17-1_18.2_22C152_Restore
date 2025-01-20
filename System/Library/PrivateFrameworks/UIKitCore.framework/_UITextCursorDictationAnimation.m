@interface _UITextCursorDictationAnimation
- (BOOL)isEnabled;
- (CGRect)animatedCursorShapeBounds;
- (UIColor)tintColor;
- (UIStandardTextCursorView)cursorView;
- (UIView)cursorShapeView;
- (_UIStandardTextCursorViewAudioLevelProvider)audioLevelProvider;
- (_UITextCursorDictationAnimation)initWithCursorShapeView:(id)a3;
- (void)_displayLinkFired:(id)a3;
- (void)_setCursorGlowEffectEnabled:(BOOL)a3;
- (void)_setSoundReactiveCursorEnabled:(BOOL)a3;
- (void)cursorShapeDidChange;
- (void)setAnimatedCursorShapeBounds:(CGRect)a3;
- (void)setAudioLevelProvider:(id)a3;
- (void)setCursorView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNeedsInitialDictationAnimation;
- (void)setTintColor:(id)a3;
@end

@implementation _UITextCursorDictationAnimation

- (_UITextCursorDictationAnimation)initWithCursorShapeView:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UITextCursorDictationAnimation;
  v5 = [(_UITextCursorDictationAnimation *)&v24 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cursorShapeView, v4);
    v7 = [UIView alloc];
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = -[UIView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    glowShapeView = v6->_glowShapeView;
    v6->_glowShapeView = (UIView *)v12;

    v14 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v8, v9, v10, v11);
    glowContainerView = v6->_glowContainerView;
    v6->_glowContainerView = v14;

    [(UIView *)v6->_glowContainerView addSubview:v6->_glowShapeView];
    v16 = [[UIDictationGlowEffect alloc] initWithView:v6->_glowShapeView];
    glowEffect = v6->_glowEffect;
    v6->_glowEffect = v16;

    v18 = +[_UIDictationSettingsDomain rootSettings];
    [v18 cursorGlowBlurRadius];
    -[UIDictationGlowEffect setBlurRadius:](v6->_glowEffect, "setBlurRadius:");

    [(UIView *)v6->_glowContainerView setHidden:1];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_cursorShapeView);
    v20 = [WeakRetained tintColor];
    v21 = +[_UIDictationSettingsDomain rootSettings];
    [v21 cursorGlowAlphaMin];
    v22 = objc_msgSend(v20, "colorWithAlphaComponent:");
    [(UIDictationGlowEffect *)v6->_glowEffect setTintColor:v22];

    -[_UITextCursorDictationAnimation setAnimatedCursorShapeBounds:](v6, "setAnimatedCursorShapeBounds:", v8, v9, v10, v11);
    [(_UITextCursorDictationAnimation *)v6 cursorShapeDidChange];
  }

  return v6;
}

- (void)setNeedsInitialDictationAnimation
{
  self->_needsInitialDictationAnimation = 1;
}

- (void)cursorShapeDidChange
{
  p_cursorShapeView = &self->_cursorShapeView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
  [WeakRetained frame];
  -[UIView setFrame:](self->_glowShapeView, "setFrame:");

  v5 = +[_UIDictationSettingsDomain rootSettings];
  [v5 cursorGlowBorderPadding];
  double v7 = v6;

  if (v7 > 0.0)
  {
    id v8 = objc_loadWeakRetained((id *)p_cursorShapeView);
    [v8 frame];
    CGRect v13 = CGRectInset(v12, v7 * -0.5, v7 * -0.5);
    -[UIView setFrame:](self->_glowShapeView, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  }
  id v10 = objc_loadWeakRetained((id *)p_cursorShapeView);
  double v9 = [v10 backgroundColor];
  [(UIView *)self->_glowShapeView setBackgroundColor:v9];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[_UIDictationSettingsDomain rootSettings];
  int v6 = [v5 pulseAnimationEnabled];

  if (v6 && self->_enabled != v3)
  {
    self->_enabled = v3;
    [(_UITextCursorDictationAnimation *)self _setCursorGlowEffectEnabled:v3];
    if (v3)
    {
      if (self->_needsInitialDictationAnimation)
      {
        id v7 = objc_loadWeakRetained((id *)&self->_cursorView);
        [v7 bounds];
        objc_msgSend(v7, "_cursorShapeRectForBounds:");
        CGFloat v9 = v8;
        CGFloat v11 = v10;
        double v13 = v12;
        double v15 = v14;

        memset(&v22, 0, sizeof(v22));
        CGAffineTransformMakeScale(&v22, (v13 + 2.0) / v13, (v15 + 7.0) / v15);
        CGAffineTransform v21 = v22;
        v24.origin.x = v9;
        v24.origin.y = v11;
        v24.size.width = v13;
        v24.size.height = v15;
        CGRect v25 = CGRectApplyAffineTransform(v24, &v21);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __46___UITextCursorDictationAnimation_setEnabled___block_invoke;
        v19[3] = &unk_1E52DA520;
        CGRect v20 = v25;
        v19[4] = self;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __46___UITextCursorDictationAnimation_setEnabled___block_invoke_2;
        v18[3] = &unk_1E52DC3A0;
        v18[4] = self;
        +[UIView animateWithDuration:0x20000 delay:v19 options:v18 animations:0.175 completion:0.0];
        return;
      }
      v16 = self;
      uint64_t v17 = 1;
    }
    else
    {
      v16 = self;
      uint64_t v17 = 0;
    }
    [(_UITextCursorDictationAnimation *)v16 _setSoundReactiveCursorEnabled:v17];
  }
}

- (void)_setCursorGlowEffectEnabled:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(_UITextCursorDictationAnimation *)self cursorView];
    [v4 addSubview:self->_glowContainerView];

    [(UIView *)self->_glowContainerView setHidden:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    int v6 = [WeakRetained tintColor];
    id v7 = +[_UIDictationSettingsDomain rootSettings];
    [v7 cursorGlowAlphaMin];
    double v8 = objc_msgSend(v6, "colorWithAlphaComponent:");
    [(UIDictationGlowEffect *)self->_glowEffect setTintColor:v8];

    id v9 = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    double v10 = [v9 tintColor];
    CGFloat v11 = +[_UIDictationSettingsDomain rootSettings];
    [v11 cursorGlowAlphaMax];
    objc_msgSend(v10, "colorWithAlphaComponent:");
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    glowEffect = self->_glowEffect;
    double v13 = +[_UIDictationSettingsDomain rootSettings];
    [v13 pulseDuration];
    [(UIDictationGlowEffect *)glowEffect setTintColor:v18 animated:1 duration:1 autoreverses:v14 * 0.5 repeatCount:3.40282347e38];
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    v16 = [v15 tintColor];
    [(UIDictationGlowEffect *)self->_glowEffect setTintColor:v16];

    glowContainerView = self->_glowContainerView;
    [(UIView *)glowContainerView removeFromSuperview];
  }
}

- (void)_setSoundReactiveCursorEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = +[_UIDictationSettingsDomain rootSettings];
  int v6 = [v5 soundReactiveCursorEnabled];

  if (v6 && self->_soundReactiveCursorEnabled != v3)
  {
    self->_soundReactiveCursorEnabled = v3;
    id v7 = _UIDictationControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = v3;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Dictation sound reactive cursor is enabled(%d)", (uint8_t *)v23, 8u);
    }

    if (v3)
    {
      if (!self->_levelSmoother)
      {
        double v8 = [_UIDictationAudioLevelSmoother alloc];
        LODWORD(v9) = -1032847360;
        LODWORD(v10) = 1051931443;
        LODWORD(v11) = 1063675494;
        LODWORD(v12) = -10.0;
        double v13 = [(_UIDictationAudioLevelSmoother *)v8 initWithMinimumPower:5 maximumPower:v9 historyLength:v12 attackSpeed:v10 decaySpeed:v11];
        levelSmoother = self->_levelSmoother;
        self->_levelSmoother = v13;
      }
      id v15 = +[UIScreen mainScreen];
      v16 = [v15 displayLinkWithTarget:self selector:sel__displayLinkFired_];
      soundReactiveCursorDisplayLink = self->_soundReactiveCursorDisplayLink;
      self->_soundReactiveCursorDisplayLink = v16;

      id v18 = +[_UIDictationSettingsDomain rootSettings];
      [v18 audioPollingRate];
      [(CADisplayLink *)self->_soundReactiveCursorDisplayLink setPreferredFramesPerSecond:(uint64_t)v19];

      CGRect v20 = self->_soundReactiveCursorDisplayLink;
      CGAffineTransform v21 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v20 addToRunLoop:v21 forMode:*MEMORY[0x1E4F1C4B0]];

      self->_animationStartTime = CACurrentMediaTime();
    }
    else
    {
      [(CADisplayLink *)self->_soundReactiveCursorDisplayLink invalidate];
      CGAffineTransform v22 = self->_soundReactiveCursorDisplayLink;
      self->_soundReactiveCursorDisplayLink = 0;

      -[_UITextCursorDictationAnimation setAnimatedCursorShapeBounds:](self, "setAnimatedCursorShapeBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
  }
}

- (void)_displayLinkFired:(id)a3
{
  id v4 = a3;
  if (self->_soundReactiveCursorDisplayLink)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    [WeakRetained bounds];
    double v7 = v6;

    id v8 = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    [v8 bounds];
    double v10 = v9;

    if (v7 > 0.0 && v10 > 0.0)
    {
      CFTimeInterval v11 = CACurrentMediaTime();
      double v12 = v11 - self->_animationStartTime;
      double v13 = +[_UIDictationSettingsDomain rootSettings];
      [v13 pulseDuration];
      double v15 = v14;

      if (v12 <= v15)
      {
        double v18 = v15 - v12;
        if (v12 < v15 * 0.5) {
          double v18 = v12;
        }
        double v19 = -((v18 / (v15 * 0.5) + -2.0) * (v18 / (v15 * 0.5)));
        CGRect v20 = +[_UIDictationSettingsDomain rootSettings];
        [v20 pulseWidthMaxBump];
        double v17 = v19 * v21 / v10;

        CGAffineTransform v22 = +[_UIDictationSettingsDomain rootSettings];
        [v22 pulseHeightMaxBump];
        double v16 = v19 * v23 / v7;
      }
      else
      {
        self->_animationStartTime = v11;
        double v16 = 0.0;
        double v17 = 0.0;
      }
      id v24 = objc_loadWeakRetained((id *)&self->_audioLevelProvider);
      [v24 audioLevel];
      int v26 = v25;

      LODWORD(v27) = v26;
      [(_UIDictationAudioLevelSmoother *)self->_levelSmoother smoothedLevelForMicPower:v27];
      float v29 = v28 * 0.95 + 0.05;
      v30 = +[_UIDictationSettingsDomain rootSettings];
      [v30 audioHeightMaxBump];
      double v32 = (v7 + v31) / v7;

      double v33 = v29;
      double v34 = v16 + (v32 + -1.0) * v33 + 1.0;
      v35 = +[_UIDictationSettingsDomain rootSettings];
      [v35 audioWidthMaxBump];
      double v37 = (v10 + v36) / v10;

      double v38 = v17 + (v37 + -1.0) * v33 + 1.0;
      if (v37 < v38) {
        double v38 = v37;
      }
      if (v32 >= v34) {
        CGFloat v39 = v34;
      }
      else {
        CGFloat v39 = v32;
      }
      if (v38 > 0.0 && v39 > 0.0)
      {
        memset(&v48, 0, sizeof(v48));
        CGAffineTransformMakeScale(&v48, v38, v39);
        v40 = +[_UIDictationSettingsDomain rootSettings];
        [v40 audioScaleAnimationDampingRatio];
        double v42 = v41;
        v43 = +[_UIDictationSettingsDomain rootSettings];
        [v43 audioScaleAnimationResponse];
        v45 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:v42 response:v44];

        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        CGAffineTransform v47 = v48;
        v46[2] = __53___UITextCursorDictationAnimation__displayLinkFired___block_invoke;
        v46[3] = &unk_1E52E7948;
        v46[4] = self;
        +[UIView _animateUsingSpringBehavior:v45 tracking:0 animations:v46 completion:0];
      }
    }
  }
}

- (UIView)cursorShapeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
  return (UIView *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIStandardTextCursorView)cursorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cursorView);
  return (UIStandardTextCursorView *)WeakRetained;
}

- (void)setCursorView:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (_UIStandardTextCursorViewAudioLevelProvider)audioLevelProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioLevelProvider);
  return (_UIStandardTextCursorViewAudioLevelProvider *)WeakRetained;
}

- (void)setAudioLevelProvider:(id)a3
{
}

- (CGRect)animatedCursorShapeBounds
{
  double x = self->_animatedCursorShapeBounds.origin.x;
  double y = self->_animatedCursorShapeBounds.origin.y;
  double width = self->_animatedCursorShapeBounds.size.width;
  double height = self->_animatedCursorShapeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnimatedCursorShapeBounds:(CGRect)a3
{
  self->_animatedCursorShapeBounds = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioLevelProvider);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_cursorView);
  objc_destroyWeak((id *)&self->_cursorShapeView);
  objc_storeStrong((id *)&self->_levelSmoother, 0);
  objc_storeStrong((id *)&self->_glowEffect, 0);
  objc_storeStrong((id *)&self->_glowShapeView, 0);
  objc_storeStrong((id *)&self->_glowContainerView, 0);
  objc_storeStrong((id *)&self->_soundReactiveCursorDisplayLink, 0);
}

@end