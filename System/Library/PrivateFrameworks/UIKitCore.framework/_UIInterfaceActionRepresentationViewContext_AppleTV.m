@interface _UIInterfaceActionRepresentationViewContext_AppleTV
- (BOOL)highlighted;
- (BOOL)pressed;
- (CATransform3D)_enlargedTransformForSize:(SEL)a3 pressed:(CGSize)a4;
- (UIView)highlightTransformTargetView;
- (_UIInterfaceActionRepresentationViewContext_AppleTV)initWithHighlightTransformTargetView:(id)a3;
- (double)focusedSizeIncrease;
- (id)_newMotionEffectsGroupForHighlightedAction;
- (id)motionEffectsOnAxis:(int64_t)a3;
- (int64_t)actionLayoutAxis;
- (void)_applyHighlightTransform;
- (void)_insertMotionEffects;
- (void)_removeMotionEffects;
- (void)setActionLayoutAxis:(int64_t)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setHighlightTransformTargetView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPressed:(BOOL)a3;
@end

@implementation _UIInterfaceActionRepresentationViewContext_AppleTV

- (_UIInterfaceActionRepresentationViewContext_AppleTV)initWithHighlightTransformTargetView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIInterfaceActionRepresentationViewContext_AppleTV;
  v5 = [(_UIInterfaceActionRepresentationViewContext_AppleTV *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_highlightTransformTargetView, v4);
    v6->_actionLayoutAxis = -1;
    v6->_focusedSizeIncrease = 30.0;
  }

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(_UIInterfaceActionRepresentationViewContext_AppleTV *)self _applyHighlightTransform];
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(_UIInterfaceActionRepresentationViewContext_AppleTV *)self _applyHighlightTransform];
  }
}

- (void)_applyHighlightTransform
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79___UIInterfaceActionRepresentationViewContext_AppleTV__applyHighlightTransform__block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  if (+[UIView _isInAnimationBlock]) {
    v3[2](v3);
  }
  else {
    +[UIView animateWithDuration:6 delay:v3 options:0 animations:dbl_186B92790[!self->_highlighted] completion:0.0];
  }
}

- (CATransform3D)_enlargedTransformForSize:(SEL)a3 pressed:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (a4.width == *MEMORY[0x1E4F1DB30] && a4.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v17 = (_OWORD *)MEMORY[0x1E4F39B10];
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&retstr->m33 = v18;
    long long v19 = v17[7];
    *(_OWORD *)&retstr->m41 = v17[6];
    *(_OWORD *)&retstr->m43 = v19;
    long long v20 = v17[1];
    *(_OWORD *)&retstr->m11 = *v17;
    *(_OWORD *)&retstr->m13 = v20;
    long long v21 = v17[3];
    *(_OWORD *)&retstr->m21 = v17[2];
    *(_OWORD *)&retstr->m23 = v21;
  }
  else
  {
    BOOL v9 = a5;
    v10 = self;
    [(CATransform3D *)self focusedSizeIncrease];
    double v12 = width - v11;
    double v13 = height + -14.0;
    [(CATransform3D *)v10 focusedSizeIncrease];
    if (v9) {
      double v14 = v14 * 0.5;
    }
    if (v12 <= v13) {
      double v15 = v13;
    }
    else {
      double v15 = v12;
    }
    double v16 = (v15 + v14) / v15;
    if (v16 < 1.0) {
      double v16 = 1.0;
    }
    return CATransform3DMakeScale(retstr, v16, v16, v16);
  }
  return self;
}

- (void)_insertMotionEffects
{
  if (!self->_installedHighlightedActionMotionEffectsGroup)
  {
    v3 = [(_UIInterfaceActionRepresentationViewContext_AppleTV *)self _newMotionEffectsGroupForHighlightedAction];
    installedHighlightedActionMotionEffectsGroup = self->_installedHighlightedActionMotionEffectsGroup;
    self->_installedHighlightedActionMotionEffectsGroup = v3;

    v5 = [(UIMotionEffectGroup *)self->_installedHighlightedActionMotionEffectsGroup motionEffects];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75___UIInterfaceActionRepresentationViewContext_AppleTV__insertMotionEffects__block_invoke;
    v6[3] = &unk_1E52DA2E8;
    v6[4] = self;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

- (void)_removeMotionEffects
{
  installedHighlightedActionMotionEffectsGroup = self->_installedHighlightedActionMotionEffectsGroup;
  if (installedHighlightedActionMotionEffectsGroup)
  {
    id v4 = [(UIMotionEffectGroup *)installedHighlightedActionMotionEffectsGroup motionEffects];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75___UIInterfaceActionRepresentationViewContext_AppleTV__removeMotionEffects__block_invoke;
    v6[3] = &unk_1E52DA2E8;
    v6[4] = self;
    [v4 enumerateObjectsUsingBlock:v6];

    v5 = self->_installedHighlightedActionMotionEffectsGroup;
    self->_installedHighlightedActionMotionEffectsGroup = 0;
  }
}

- (id)_newMotionEffectsGroupForHighlightedAction
{
  v3 = objc_alloc_init(UIMotionEffectGroup);
  id v4 = [(_UIInterfaceActionRepresentationViewContext_AppleTV *)self motionEffectsOnAxis:[(_UIInterfaceActionRepresentationViewContext_AppleTV *)self actionLayoutAxis]];
  [(UIMotionEffectGroup *)v3 setMotionEffects:v4];

  return v3;
}

- (id)motionEffectsOnAxis:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if (a3 != 1 && a3 != -1) {
    goto LABEL_4;
  }
  v5 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"transform.rotation.x" type:1];
  v6 = [NSNumber numberWithDouble:-0.0698131701];
  [(UIInterpolatingMotionEffect *)v5 setMinimumRelativeValue:v6];

  v7 = [NSNumber numberWithDouble:0.0698131701];
  [(UIInterpolatingMotionEffect *)v5 setMaximumRelativeValue:v7];

  [v4 addObject:v5];
  objc_super v8 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:1];
  BOOL v9 = [NSNumber numberWithDouble:-4.0];
  [(UIInterpolatingMotionEffect *)v8 setMinimumRelativeValue:v9];

  v10 = [NSNumber numberWithDouble:4.0];
  [(UIInterpolatingMotionEffect *)v8 setMaximumRelativeValue:v10];

  [v4 addObject:v8];
  if (a3 != 1)
  {
LABEL_4:
    double v11 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"transform.rotation.y" type:0];
    double v12 = [NSNumber numberWithDouble:-0.0698131701];
    [(UIInterpolatingMotionEffect *)v11 setMinimumRelativeValue:v12];

    double v13 = [NSNumber numberWithDouble:0.0698131701];
    [(UIInterpolatingMotionEffect *)v11 setMaximumRelativeValue:v13];

    [v4 addObject:v11];
    double v14 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:0];
    double v15 = [NSNumber numberWithDouble:-4.0];
    [(UIInterpolatingMotionEffect *)v14 setMinimumRelativeValue:v15];

    double v16 = [NSNumber numberWithDouble:4.0];
    [(UIInterpolatingMotionEffect *)v14 setMaximumRelativeValue:v16];

    [v4 addObject:v14];
  }
  return v4;
}

- (UIView)highlightTransformTargetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightTransformTargetView);
  return (UIView *)WeakRetained;
}

- (void)setHighlightTransformTargetView:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (int64_t)actionLayoutAxis
{
  return self->_actionLayoutAxis;
}

- (void)setActionLayoutAxis:(int64_t)a3
{
  self->_actionLayoutAxis = a3;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_highlightTransformTargetView);
  objc_storeStrong((id *)&self->_installedHighlightedActionMotionEffectsGroup, 0);
}

@end