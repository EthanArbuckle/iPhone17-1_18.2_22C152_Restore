@interface TUIFocusStylingHelper
- (BOOL)_effectNeedsView;
- (BOOL)canBecomeFocused;
- (BOOL)wantsFocusRing;
- (TUIFocusStyle)style;
- (TUIFocusStylingHelper)initWithContainer:(id)a3 reference:(id)a4 style:(id)a5;
- (UIView)container;
- (UIView)effectView;
- (UIView)reference;
- (id)_cornerCurve;
- (id)focusEffect;
- (id)focusGroupIdentifier;
- (void)_configureEffectView;
- (void)activateEffectWithAnimationCoordinator:(id)a3;
- (void)deactivateEffectWithAnimationCoordinator:(id)a3;
- (void)reset;
- (void)updateStyle:(id)a3;
@end

@implementation TUIFocusStylingHelper

- (TUIFocusStylingHelper)initWithContainer:(id)a3 reference:(id)a4 style:(id)a5
{
  v8 = (UIView *)a3;
  v9 = (UIView *)a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TUIFocusStylingHelper;
  v11 = [(TUIFocusStylingHelper *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_container = v8;
    v11->_reference = v9;
    objc_storeStrong((id *)&v11->_style, a5);
  }

  return v12;
}

- (void)reset
{
  [(UIView *)self->_effectView removeFromSuperview];
  effectView = self->_effectView;
  self->_effectView = 0;

  self->_container = 0;
}

- (void)updateStyle:(id)a3
{
  v5 = (TUIFocusStyle *)a3;
  if (self->_style != v5)
  {
    objc_storeStrong((id *)&self->_style, a3);
    if (self->_effectView) {
      [(TUIFocusStylingHelper *)self _configureEffectView];
    }
  }
}

- (BOOL)wantsFocusRing
{
  return (char *)[(TUIFocusStyle *)self->_style effect] == (char *)&def_141F14 + 1;
}

- (id)focusEffect
{
  if ((char *)[(TUIFocusStyle *)self->_style effect] - 1 > (unsigned char *)&def_141F14 + 2)
  {
    v22 = 0;
    goto LABEL_8;
  }
  [(UIView *)self->_container bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TUIFocusStyle *)self->_style insets];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  [(TUIFocusStyle *)self->_style cornerRadius];
  double v20 = v19;
  v21 = [(TUIFocusStylingHelper *)self _cornerCurve];
  v22 = +[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", v21, v12, v14, v16, v18, v20);

  [v22 setReferenceView:self->_reference];
  [v22 setContainerView:self->_container];
  if ((char *)[(TUIFocusStyle *)self->_style effect] == (char *)&def_141F14 + 2)
  {
    uint64_t v23 = 2;
  }
  else
  {
    if ((char *)[(TUIFocusStyle *)self->_style effect] != (char *)&def_141F14 + 3) {
      goto LABEL_8;
    }
    uint64_t v23 = 1;
  }
  [v22 setPosition:v23];
LABEL_8:

  return v22;
}

- (BOOL)_effectNeedsView
{
  return (int *)[(TUIFocusStyle *)self->_style effect] == &dword_4;
}

- (id)_cornerCurve
{
  unsigned int v2 = [(TUIFocusStyle *)self->_style continuousCurve];
  double v3 = &kCACornerCurveContinuous;
  if (!v2) {
    double v3 = &kCACornerCurveCircular;
  }
  CALayerCornerCurve v4 = *v3;

  return v4;
}

- (void)_configureEffectView
{
  [(UIView *)self->_container bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TUIFocusStyle *)self->_style insets];
  -[UIView setFrame:](self->_effectView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  [(TUIFocusStyle *)self->_style cornerRadius];
  double v16 = v15;
  double v17 = [(UIView *)self->_effectView layer];
  [v17 setCornerRadius:v16];

  double v18 = [(TUIFocusStylingHelper *)self _cornerCurve];
  double v19 = [(UIView *)self->_effectView layer];
  [v19 setCornerCurve:v18];

  id v22 = +[UIColor tintColor];
  double v20 = [(TUIFocusStyle *)self->_style color];
  if (v20)
  {
    [(UIView *)self->_effectView setBackgroundColor:v20];
  }
  else
  {
    v21 = [v22 colorWithAlphaComponent:0.12];
    [(UIView *)self->_effectView setBackgroundColor:v21];
  }
}

- (void)activateEffectWithAnimationCoordinator:(id)a3
{
  id v20 = a3;
  if (self->_effectView) {
    goto LABEL_2;
  }
  if ([(TUIFocusStylingHelper *)self _effectNeedsView])
  {
    [(UIView *)self->_container bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(TUIFocusStyle *)self->_style insets];
    double v17 = [objc_alloc((Class)UIView) initWithFrame:v6 + v13, v8 + v14, v10 - (v13 + v15), v12 - (v14 + v16)];
    effectView = self->_effectView;
    self->_effectView = v17;

    [(UIView *)self->_effectView setAutoresizingMask:18];
    double v19 = [(UIView *)self->_effectView layer];
    [v19 setCornerCurve:kCACornerCurveContinuous];

    [(UIView *)self->_container insertSubview:self->_effectView atIndex:0];
    [(TUIFocusStylingHelper *)self _configureEffectView];
    goto LABEL_7;
  }
  if (self->_effectView)
  {
LABEL_2:
    if (![(TUIFocusStylingHelper *)self _effectNeedsView])
    {
      [(UIView *)self->_effectView removeFromSuperview];
      double v4 = self->_effectView;
      self->_effectView = 0;
    }
  }
LABEL_7:
}

- (void)deactivateEffectWithAnimationCoordinator:(id)a3
{
  [(UIView *)self->_effectView removeFromSuperview];
  effectView = self->_effectView;
  self->_effectView = 0;
}

- (BOOL)canBecomeFocused
{
  return [(TUIFocusStyle *)self->_style effect] != 0;
}

- (id)focusGroupIdentifier
{
  return [(TUIFocusStyle *)self->_style groupIdentifier];
}

- (UIView)container
{
  return self->_container;
}

- (UIView)reference
{
  return self->_reference;
}

- (TUIFocusStyle)style
{
  return self->_style;
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end