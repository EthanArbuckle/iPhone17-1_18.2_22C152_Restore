@interface SBHomeGestureToStashedFloatingSwitcherModifier
- (CGRect)containerViewBounds;
- (SBHomeGestureToStashedFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toFloatingConfiguration:(int64_t)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_tongueScale;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
@end

@implementation SBHomeGestureToStashedFloatingSwitcherModifier

- (SBHomeGestureToStashedFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toFloatingConfiguration:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBHomeGestureToStashedFloatingSwitcherModifier;
  v10 = [(SBTransitionSwitcherModifier *)&v13 initWithTransitionID:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fromAppLayout, a4);
    v11->_floatingConfiguration = a5;
  }

  return v11;
}

- (CGRect)containerViewBounds
{
  v24.receiver = self;
  v24.super_class = (Class)SBHomeGestureToStashedFloatingSwitcherModifier;
  [(SBHomeGestureToStashedFloatingSwitcherModifier *)&v24 containerViewBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SBHomeGestureToStashedFloatingSwitcherModifier *)self _tongueScale];
  double v12 = v11;
  int64_t floatingConfiguration = self->_floatingConfiguration;
  int v14 = [(SBHomeGestureToStashedFloatingSwitcherModifier *)self isRTLEnabled];
  uint64_t v15 = 3;
  if (v14) {
    uint64_t v15 = 4;
  }
  if (floatingConfiguration == v15)
  {
    double v4 = v8 * -0.5 + v8 * -0.5 * v12;
  }
  else
  {
    int64_t v16 = self->_floatingConfiguration;
    int v17 = [(SBHomeGestureToStashedFloatingSwitcherModifier *)self isRTLEnabled];
    uint64_t v18 = 3;
    if (!v17) {
      uint64_t v18 = 4;
    }
    if (v16 == v18)
    {
      [(SBHomeGestureToStashedFloatingSwitcherModifier *)self switcherViewBounds];
      double v4 = v19 - v8 * 0.5 + v8 * 0.5 * v12;
    }
  }
  double v20 = v4;
  double v21 = v6;
  double v22 = v8;
  double v23 = v10;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (double)_tongueScale
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeGestureToStashedFloatingSwitcherModifier;
  [(SBHomeGestureToStashedFloatingSwitcherModifier *)&v4 containerViewBounds];
  return 180.0 / v2;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  objc_super v4 = [(SBHomeGestureToStashedFloatingSwitcherModifier *)self medusaSettings];
  [v4 cornerRadiusForFloatingApps];
  [(SBHomeGestureToStashedFloatingSwitcherModifier *)self _tongueScale];
  SBRectCornerRadiiForRadius();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.topRight = v16;
  result.bottomRight = v15;
  result.bottomLeft = v14;
  result.topLeft = v13;
  return result;
}

- (unint64_t)slideOverTongueState
{
  return SBFloatingConfigurationIsStashed(self->_floatingConfiguration);
}

- (unint64_t)slideOverTongueDirection
{
  if (SBFloatingConfigurationIsLeft(self->_floatingConfiguration)) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void).cxx_destruct
{
}

@end