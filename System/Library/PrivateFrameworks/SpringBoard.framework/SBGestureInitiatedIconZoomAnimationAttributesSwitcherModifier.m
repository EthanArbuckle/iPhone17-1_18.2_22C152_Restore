@interface SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier
- (SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier)initWithAppLayout:(id)a3 gestureEdge:(unint64_t)a4 liftOffVelocity:(CGPoint)a5;
- (double)_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_layoutSettings;
- (id)_positionSettings;
- (id)_scaleSettings;
- (id)_settingsByInterpolatingBetween:(id)a3 and:(id)a4 progress:(double)a5;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
@end

@implementation SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier

- (SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier)initWithAppLayout:(id)a3 gestureEdge:(unint64_t)a4 liftOffVelocity:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  v11 = [(SBSwitcherModifier *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appLayout, a3);
    v12->_gestureEdge = a4;
    v12->_liftOffVelocity.CGFloat x = x;
    v12->_liftOffVelocity.CGFloat y = y;
  }

  return v12;
}

- (id)handleTransitionEvent:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v17 handleTransitionEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v17.receiver, v17.super_class);

  if (v6 == 2)
  {
    v7 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self homeScreenIconGridSizeClassForAppLayout:self->_appLayout];
    iconGridSizeClass = self->_iconGridSizeClass;
    self->_iconGridSizeClass = v7;

    BOOL v9 = self->_iconGridSizeClass > (NSString *)*MEMORY[0x1E4FA6518];
    self->_overshootScaleForWidgetZoomDown = v9;
    if (v9)
    {
      id v10 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self switcherSettings];
      v11 = [v10 animationSettings];
      [v11 zoomDownWidgetScaleOvershootDuration];
      double v13 = v12;

      objc_super v14 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"OvershootScaleForWidgetZoomDown" reason:v13];
      uint64_t v15 = +[SBChainableModifierEventResponse responseByAppendingResponse:v14 toResponse:v5];

      v5 = (void *)v15;
    }
  }
  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleTimerEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"OvershootScaleForWidgetZoomDown"];
  if (v4)
  {
    self->_overshootScaleForWidgetZoomDown = 0;
    v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    v5 = (void *)v8;
  }
  return v5;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier scaleForIndex:](&v21, sel_scaleForIndex_);
  double v6 = v5;
  v7 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self appLayouts];
  uint64_t v8 = [v7 objectAtIndex:a3];

  if (v8 == self->_appLayout && self->_overshootScaleForWidgetZoomDown)
  {
    BOOL v9 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self switcherSettings];
    objc_super v10 = [v9 animationSettings];

    [v10 zoomDownWidgetScaleVelocityYMinimum];
    double v12 = v11;
    [v10 zoomDownWidgetScaleVelocityYMaximum];
    double v14 = v13;
    [v10 zoomDownWidgetScaleOvershootMinimumMultiplier];
    double v16 = v15;
    [v10 zoomDownWidgetScaleOvershootMaximumMultiplier];
    double v18 = v16 + (v17 - v16) * (-self->_liftOffVelocity.y - v12) / (v14 - v12);
    if (v16 >= v17) {
      double v19 = v16;
    }
    else {
      double v19 = v17;
    }
    if (v16 <= v17) {
      double v17 = v16;
    }
    if (v18 > v19) {
      double v18 = v19;
    }
    if (v18 >= v17) {
      double v17 = v18;
    }
    double v6 = v6 * v17;
  }
  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  id v4 = a3;
  double v5 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  double v6 = objc_msgSend(v5, "mutableCopy", v12.receiver, v12.super_class);

  v7 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self _layoutSettings];
  [v6 setLayoutSettings:v7];

  uint64_t v8 = [v4 switcherLayoutElementType];
  if (!v8)
  {
    BOOL v9 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self _positionSettings];
    [v6 setPositionSettings:v9];

    objc_super v10 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self _scaleSettings];
    [v6 setScaleSettings:v10];
  }
  return v6;
}

- (id)_layoutSettings
{
  v3 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self switcherSettings];
  id v4 = [v3 animationSettings];

  iconGridSizeClass = self->_iconGridSizeClass;
  if (iconGridSizeClass == (NSString *)*MEMORY[0x1E4FA6560]
    || -[NSString isEqualToString:](iconGridSizeClass, "isEqualToString:"))
  {
    uint64_t v6 = [v4 homeGestureSmallWidgetZoomDownLayoutSettings];
LABEL_14:
    double v11 = (void *)v6;
    goto LABEL_15;
  }
  v7 = self->_iconGridSizeClass;
  if (v7 == (NSString *)*MEMORY[0x1E4FA6530] || -[NSString isEqualToString:](v7, "isEqualToString:"))
  {
    uint64_t v6 = [v4 homeGestureMediumWidgetZoomDownLayoutSettings];
    goto LABEL_14;
  }
  uint64_t v8 = self->_iconGridSizeClass;
  if (v8 == (NSString *)*MEMORY[0x1E4FA6528]
    || -[NSString isEqualToString:](v8, "isEqualToString:")
    || (BOOL v9 = self->_iconGridSizeClass, v9 == (NSString *)*MEMORY[0x1E4FA6538])
    || -[NSString isEqualToString:](v9, "isEqualToString:")
    || (objc_super v10 = self->_iconGridSizeClass, v10 == (NSString *)*MEMORY[0x1E4FA6520])
    || -[NSString isEqualToString:](v10, "isEqualToString:"))
  {
    uint64_t v6 = [v4 homeGestureLargeWidgetZoomDownLayoutSettings];
    goto LABEL_14;
  }
  double v13 = [v4 homeGestureTopRowZoomDownLayoutSettings];
  double v14 = [v4 homeGestureBottomRowZoomDownLayoutSettings];
  [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self _normalizedHomeScreenIconZoomPercentBetweenTopAndBottom];
  double v11 = -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _settingsByInterpolatingBetween:and:progress:](self, "_settingsByInterpolatingBetween:and:progress:", v13, v14);
  [v4 zoomDownVelocityYMinimum];
  double v16 = v15;
  [v4 zoomDownVelocityYMaximum];
  double v18 = v17;
  [v4 zoomDownVelocityYLayoutResponseMultiplier];
  double v20 = v19;
  double v21 = fmin(fmax((-self->_liftOffVelocity.y - v16) / (v18 - v16) + 0.0, 0.0), 1.0);
  [v11 response];
  [v11 setResponse:((v20 + -1.0) * v21 + 1.0) * v22];

LABEL_15:
  return v11;
}

- (id)_positionSettings
{
  v3 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self switcherSettings];
  id v4 = [v3 animationSettings];

  iconGridSizeClass = self->_iconGridSizeClass;
  if (iconGridSizeClass == (NSString *)*MEMORY[0x1E4FA6560]
    || -[NSString isEqualToString:](iconGridSizeClass, "isEqualToString:"))
  {
    uint64_t v6 = [v4 homeGestureSmallWidgetZoomDownPositionSettings];
LABEL_12:
    objc_super v10 = (void *)v6;
    goto LABEL_13;
  }
  v7 = self->_iconGridSizeClass;
  if (v7 == (NSString *)*MEMORY[0x1E4FA6530] || -[NSString isEqualToString:](v7, "isEqualToString:"))
  {
    uint64_t v6 = [v4 homeGestureMediumWidgetZoomDownPositionSettings];
    goto LABEL_12;
  }
  uint64_t v8 = self->_iconGridSizeClass;
  if (v8 == (NSString *)*MEMORY[0x1E4FA6528]
    || -[NSString isEqualToString:](v8, "isEqualToString:")
    || (BOOL v9 = self->_iconGridSizeClass, v9 == (NSString *)*MEMORY[0x1E4FA6520])
    || -[NSString isEqualToString:](v9, "isEqualToString:"))
  {
    uint64_t v6 = [v4 homeGestureLargeWidgetZoomDownPositionSettings];
    goto LABEL_12;
  }
  objc_super v12 = [v4 homeGestureTopRowZoomDownPositionSettings];
  double v13 = [v4 homeGestureBottomRowZoomDownPositionSettings];
  [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self _normalizedHomeScreenIconZoomPercentBetweenTopAndBottom];
  objc_super v10 = -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _settingsByInterpolatingBetween:and:progress:](self, "_settingsByInterpolatingBetween:and:progress:", v12, v13);
  [v4 zoomDownVelocityXMinimum];
  double v15 = v14;
  [v4 zoomDownVelocityXMaximum];
  double v17 = v16;
  [v4 zoomDownVelocityXPositionResponseMultiplier];
  double v19 = v18;
  double v20 = fmin(fmax((fabs(self->_liftOffVelocity.x) - v15) / (v17 - v15) + 0.0, 0.0), 1.0);
  [v10 response];
  [v10 setResponse:((v19 + -1.0) * v20 + 1.0) * v21];
  CAFrameRateRange v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v10, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v23.minimum, *(double *)&v23.maximum, *(double *)&v23.preferred);

LABEL_13:
  return v10;
}

- (id)_scaleSettings
{
  v3 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self switcherSettings];
  id v4 = [v3 animationSettings];

  iconGridSizeClass = self->_iconGridSizeClass;
  if (iconGridSizeClass == (NSString *)*MEMORY[0x1E4FA6560]
    || -[NSString isEqualToString:](iconGridSizeClass, "isEqualToString:"))
  {
    uint64_t v6 = [v4 homeGestureSmallWidgetZoomDownScaleSettings];
LABEL_12:
    objc_super v10 = (void *)v6;
    goto LABEL_13;
  }
  v7 = self->_iconGridSizeClass;
  if (v7 == (NSString *)*MEMORY[0x1E4FA6530] || -[NSString isEqualToString:](v7, "isEqualToString:"))
  {
    uint64_t v6 = [v4 homeGestureMediumWidgetZoomDownScaleSettings];
    goto LABEL_12;
  }
  uint64_t v8 = self->_iconGridSizeClass;
  if (v8 == (NSString *)*MEMORY[0x1E4FA6528]
    || -[NSString isEqualToString:](v8, "isEqualToString:")
    || (BOOL v9 = self->_iconGridSizeClass, v9 == (NSString *)*MEMORY[0x1E4FA6520])
    || -[NSString isEqualToString:](v9, "isEqualToString:"))
  {
    uint64_t v6 = [v4 homeGestureLargeWidgetZoomDownScaleSettings];
    goto LABEL_12;
  }
  objc_super v12 = [v4 homeGestureTopRowZoomDownScaleSettings];
  double v13 = [v4 homeGestureBottomRowZoomDownScaleSettings];
  [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self _normalizedHomeScreenIconZoomPercentBetweenTopAndBottom];
  objc_super v10 = -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _settingsByInterpolatingBetween:and:progress:](self, "_settingsByInterpolatingBetween:and:progress:", v12, v13);

LABEL_13:
  return v10;
}

- (id)_settingsByInterpolatingBetween:(id)a3 and:(id)a4 progress:(double)a5
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FA5F08];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setDefaultValues];
  [v8 dampingRatio];
  [v7 dampingRatio];
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v9, "setDampingRatio:");
  [v8 response];
  [v7 response];
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v9, "setResponse:");
  [v8 retargetImpulse];

  [v7 retargetImpulse];
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v9, "setRetargetImpulse:");
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);
  return v9;
}

- (double)_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom
{
  if ((unint64_t)([(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self switcherInterfaceOrientation]- 1) >= 2)double v3 = 0.0; {
  else
  }
    double v3 = 102.0;
  [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self containerViewBounds];
  double v19 = v4;
  double v5 = [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 indexOfObject:self->_appLayout];

  [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self frameForIndex:v6];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *)self scaleForIndex:v6];
  CGFloat v16 = v15;
  UIRectGetCenter();
  CGAffineTransformMakeScale(&v20, v16, v16);
  v21.origin.CGFloat x = v8;
  v21.origin.CGFloat y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  CGRectApplyAffineTransform(v21, &v20);
  SBUnintegralizedRectCenteredAboutPoint();
  UIRectGetCenter();
  double result = (v17 - v3) / (v19 - v3);
  if (self->_gestureEdge == 1) {
    return 1.0 - result;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconGridSizeClass, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end