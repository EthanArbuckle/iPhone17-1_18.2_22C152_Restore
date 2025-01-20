@interface UIButtonConfigurationVisualProviderTVOS
- (BOOL)_hasRemovedPlatterForState:(unint64_t)a3;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (double)focusSizeIncrease;
- (id)_floatingContentView;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)effectiveContentView;
- (id)imageEffectContainerView;
- (void)_layoutFloatingContentView;
- (void)_updateBackgroundViewWithConfiguration:(id)a3;
- (void)_updateContentBackdropView;
- (void)cleanupForVisualProvider:(id)a3;
- (void)contextMenuInteraction:(id)a3 updateStyleForMenuWithConfiguration:(id)a4 style:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
@end

@implementation UIButtonConfigurationVisualProviderTVOS

- (void)cleanupForVisualProvider:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIButtonConfigurationVisualProviderTVOS;
  [(UIButtonConfigurationVisualProvider *)&v4 cleanupForVisualProvider:a3];
  [(UIView *)self->_floatingContentView removeFromSuperview];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIButtonConfigurationVisualProviderTVOS;
  [(UIButtonConfigurationVisualProvider *)&v3 layoutSubviews];
  [(UIButtonConfigurationVisualProviderTVOS *)self _layoutFloatingContentView];
  [(UIButtonConfigurationVisualProviderTVOS *)self _updateContentBackdropView];
}

- (id)effectiveContentView
{
  v2 = [(UIButtonConfigurationVisualProviderTVOS *)self _floatingContentView];
  objc_super v3 = [v2 contentView];

  return v3;
}

- (id)imageEffectContainerView
{
  return self->super._imageView;
}

- (id)_floatingContentView
{
  floatingContentView = self->_floatingContentView;
  if (!floatingContentView)
  {
    objc_super v4 = [_UIFloatingContentView alloc];
    v5 = -[_UIFloatingContentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_floatingContentView;
    self->_floatingContentView = v5;

    [(_UIFloatingContentView *)self->_floatingContentView setFloatingContentDelegate:self];
    if (!_UIDeviceHasExternalTouchInput()) {
      [(UIView *)self->_floatingContentView setUserInteractionEnabled:0];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__UIButtonConfigurationVisualProviderTVOS__floatingContentView__block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    +[UIView _performSystemAppearanceModifications:v9];
    v7 = [(UIButtonConfigurationVisualProvider *)self button];
    [v7 addSubview:self->_floatingContentView];

    floatingContentView = self->_floatingContentView;
  }
  return floatingContentView;
}

uint64_t __63__UIButtonConfigurationVisualProviderTVOS__floatingContentView__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 312);
  objc_super v3 = +[_UIFocusAnimationConfiguration configurationWithStyle:1];
  [v2 setFocusAnimationConfiguration:v3];

  [*(id *)(*(void *)(a1 + 32) + 312) setShadowOpacity:0.2];
  [*(id *)(*(void *)(a1 + 32) + 312) setShadowRadius:16.0];
  [*(id *)(*(void *)(a1 + 32) + 312) setShadowVerticalOffset:25.0];
  objc_super v4 = *(void **)(*(void *)(a1 + 32) + 312);
  return [v4 setUseShadowImage:0];
}

- (void)_updateBackgroundViewWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 background];
  [v5 cornerRadius];
  double v7 = v6;
  uint64_t v8 = [v4 cornerStyle];

  switch(v8)
  {
    case 0:
      v9 = +[UIFontMetrics defaultMetrics];
      v10 = [(UIButtonConfigurationVisualProvider *)self button];
      v11 = [v10 traitCollection];
      [v9 scaledValueForValue:v11 compatibleWithTraitCollection:v7];
      objc_msgSend(v5, "setCornerRadius:");

      goto LABEL_8;
    case 1:
      v9 = [(UIButtonConfigurationVisualProvider *)self button];
      [v9 bounds];
      double v13 = 0.25;
      goto LABEL_5;
    case 2:
      v9 = [(UIButtonConfigurationVisualProvider *)self button];
      [v9 bounds];
      double v13 = 0.35;
LABEL_5:
      double v14 = v12 * v13 * 0.5;
      goto LABEL_7;
    case 3:
      v9 = [(UIButtonConfigurationVisualProvider *)self button];
      [v9 bounds];
      double v14 = v15 * 0.5 * 0.5;
LABEL_7:
      [v5 setCornerRadius:v14];
LABEL_8:

      break;
    case 4:
      [v5 setCornerRadius:1.79769313e308];
      break;
    default:
      break;
  }
  if (self->super._backgroundView)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __82__UIButtonConfigurationVisualProviderTVOS__updateBackgroundViewWithConfiguration___block_invoke;
    v20[3] = &unk_1E52D9F98;
    v20[4] = self;
    id v21 = v5;
    +[UIView performWithoutAnimation:v20];
  }
  else
  {
    v16 = [[_UISystemBackgroundView alloc] initWithConfiguration:v5];
    backgroundView = self->super._backgroundView;
    self->super._backgroundView = v16;

    [(UIView *)self->super._backgroundView setUserInteractionEnabled:0];
    v18 = [(UIButtonConfigurationVisualProviderTVOS *)self _floatingContentView];
    v19 = [v18 visualEffectContainerView];
    [v19 addSubview:self->super._backgroundView];
  }
}

uint64_t __82__UIButtonConfigurationVisualProviderTVOS__updateBackgroundViewWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 264) setConfiguration:*(void *)(a1 + 40)];
}

- (void)_layoutFloatingContentView
{
  objc_super v3 = [(UIButtonConfigurationVisualProviderTVOS *)self _floatingContentView];
  id v4 = [(UIButtonConfigurationVisualProvider *)self button];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  backgroundView = self->super._backgroundView;
  if (backgroundView) {
    double currentlyAppliedCornerRadius = backgroundView->_currentlyAppliedCornerRadius;
  }
  else {
    double currentlyAppliedCornerRadius = 0.0;
  }
  [(_UIFloatingContentView *)self->_floatingContentView setCornerRadius:currentlyAppliedCornerRadius];
  floatingContentView = self->_floatingContentView;
  uint64_t v8 = self->super._backgroundView;
  if (v8)
  {
    if (*(unsigned char *)&v8->_systemBackgroundViewFlags) {
      v9 = (uint64_t *)MEMORY[0x1E4F39EA8];
    }
    else {
      v9 = (uint64_t *)MEMORY[0x1E4F39EA0];
    }
  }
  else
  {
    v9 = (uint64_t *)MEMORY[0x1E4F39EA0];
  }
  uint64_t v10 = *v9;
  [(_UIFloatingContentView *)floatingContentView setCornerCurve:v10];
}

- (BOOL)_hasRemovedPlatterForState:(unint64_t)a3
{
  int v5 = dyld_program_sdk_at_least();
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = qword_186B9E6F0[v6];
      uint64_t v8 = [(UIButtonConfigurationVisualProviderTVOS *)self _floatingContentView];
      v9 = [v8 backgroundColorForState:v7];

      int v5 = (v7 & ~a3) != 0 || v9 == 0;
    }
    while (v5 == 1 && v6++ != 2);
  }
  return v5;
}

- (void)_updateContentBackdropView
{
  v19[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UIButtonConfigurationVisualProvider *)self button];
  uint64_t v4 = [v3 state];

  if (v4)
  {
    if (v4 == 2)
    {
      double v5 = 0.5;
    }
    else
    {
      uint64_t v6 = [(UIButtonConfigurationVisualProvider *)self button];
      if (-[UIButtonConfigurationVisualProviderTVOS _hasRemovedPlatterForState:](self, "_hasRemovedPlatterForState:", [v6 state]))
      {
        double v5 = 1.0;
      }
      else
      {
        double v5 = 0.0;
      }
    }
  }
  else
  {
    double v5 = 1.0;
  }
  [(UIView *)self->super._backgroundView alpha];
  double v8 = v7;
  +[UIView inheritedAnimationDuration];
  double v10 = v9;
  v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  double v12 = [NSNumber numberWithDouble:v8];
  v19[0] = v12;
  double v13 = [NSNumber numberWithDouble:v5];
  v19[1] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v11 setValues:v14];

  v18[0] = &unk_1ED3F75D8;
  double v15 = [NSNumber numberWithDouble:v10 * 0.99];
  v18[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v11 setKeyTimes:v16];

  [v11 setDuration:v10];
  [v11 setAdditive:1];
  v17 = [(UIView *)self->super._backgroundView layer];
  [v17 addAnimation:v11 forKey:@"opacity"];

  [(UIView *)self->super._backgroundView setAlpha:v5];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  double v7 = [(UIButtonConfigurationVisualProvider *)self button];
  double v8 = [v13 nextFocusedView];

  if (v7 != v8)
  {
    double v9 = [(UIButtonConfigurationVisualProvider *)self button];
    [v9 _setHighlightedWithoutUpdatingState:0];
  }
  double v10 = [(UIButtonConfigurationVisualProviderTVOS *)self _floatingContentView];
  v11 = [(UIButtonConfigurationVisualProvider *)self button];
  objc_msgSend(v10, "setControlState:withAnimationCoordinator:", objc_msgSend(v11, "_stateForFocusUpdateContext:", v13), v6);

  double v12 = [(UIButtonConfigurationVisualProvider *)self button];
  [v12 setNeedsUpdateConfiguration];
}

- (double)focusSizeIncrease
{
  [(_UIFloatingContentView *)self->_floatingContentView focusedSizeIncrease];
  return result;
}

- (void)setFocusSizeIncrease:(double)a3
{
}

- (void)setSelected:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIButtonConfigurationVisualProviderTVOS;
  [(UIButtonConfigurationVisualProvider *)&v6 setSelected:a3];
  uint64_t v4 = [(UIButtonConfigurationVisualProviderTVOS *)self _floatingContentView];
  double v5 = [(UIButtonConfigurationVisualProvider *)self button];
  objc_msgSend(v4, "setControlState:animated:", objc_msgSend(v5, "state"), +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UIButtonConfigurationVisualProviderTVOS;
  -[UIButtonConfigurationVisualProvider setHighlighted:animated:](&v8, sel_setHighlighted_animated_, a3);
  objc_super v6 = [(UIButtonConfigurationVisualProviderTVOS *)self _floatingContentView];
  double v7 = [(UIButtonConfigurationVisualProvider *)self button];
  objc_msgSend(v6, "setControlState:animated:", objc_msgSend(v7, "state"), v4);
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [(UIButtonConfigurationVisualProvider *)self button];
  objc_super v6 = _UIControlMenuSupportTargetedPreviewOverViews(v5, 0, 0);

  double v7 = [v6 target];
  objc_super v8 = [v7 container];

  double v9 = [v6 view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v14 = [v6 target];
  [v14 center];
  double v16 = round(v15 - v13 * 0.5);
  double v18 = round(v17 - v11 * 0.5);
  v19 = [v8 _window];
  objc_msgSend(v8, "convertRect:toView:", v19, v18, v16, v11, v13);
  double v21 = v20;
  double v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  LODWORD(v9) = [v4 prefersHorizontalAttachment];
  v28 = [v8 _window];
  v29 = v28;
  if (v9) {
    double v30 = _UIControlMenuAttachmentPointForRectInContainerForHorizontalAttachment(v28, v21, v23, v25, v27);
  }
  else {
    double v30 = _UIControlMenuAttachmentPointForRectInContainer(v28, v21, v23, v25, v27);
  }
  double v32 = v30;
  double v33 = v31;

  double v34 = v32;
  double v35 = v33;
  result.y = v35;
  result.x = v34;
  return result;
}

- (void)contextMenuInteraction:(id)a3 updateStyleForMenuWithConfiguration:(id)a4 style:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    id v17 = v7;
    id v8 = a4;
    double v9 = [(UIButtonConfigurationVisualProvider *)self button];
    double v10 = _UIControlMenuSupportTargetedPreviewOverViews(v9, 0, 0);

    double v11 = [(UIButtonConfigurationVisualProvider *)self button];
    [v11 menuAttachmentPointForConfiguration:v8];
    double v13 = v12;
    double v15 = v14;

    LODWORD(v11) = [v8 prefersHorizontalAttachment];
    double v16 = [(UIButtonConfigurationVisualProvider *)self button];
    if (v11) {
      _UIControlMenuSupportUpdateStyleWithHorizontalPreference(v17, v16, v10, v13, v15);
    }
    else {
      _UIControlMenuSupportUpdateStyle(v17, v16, v10, v13, v15);
    }

    id v7 = v17;
  }
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v4 = [(UIButtonConfigurationVisualProvider *)self button];
  double v5 = _UIControlMenuSupportTargetedPreviewOverViews(v4, 0, 0);

  return v5;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v4 = [(UIButtonConfigurationVisualProvider *)self button];
  double v5 = _UIControlMenuSupportTargetedPreviewOverViews(v4, 0, 0);

  return v5;
}

- (void).cxx_destruct
{
}

@end