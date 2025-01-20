@interface SBFullScreenToHomeSystemApertureSwitcherModifier
- (BOOL)_isEffectivelyHome;
- (BOOL)_isIndexZoomAppLayout:(unint64_t)a3;
- (BOOL)_shouldApplyEffectsToIndex:(unint64_t)a3;
- (BOOL)completesWhenChildrenComplete;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)systemApertureRequiresHeavyShadowForTransition;
- (CGPoint)_collapsedTransitionTargetForZoomDown:(BOOL)a3;
- (CGPoint)expandedSourcePositionForSystemApertureTransition;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)rootContentViewMaskRect;
- (SBFullScreenToHomeSystemApertureSwitcherModifier)initWithTransitionID:(id)a3 zoomModifier:(id)a4 appLayout:(id)a5 direction:(unint64_t)a6 expandedCardFrame:(CGRect)a7 cardScale:(double)a8 cardVelocity:(CGPoint)a9;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)rootContentViewBlurRadius;
- (double)rotationAngleForIndex:(unint64_t)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_blurItemContainerParameters;
- (id)_collapseMeshForNormalizedXDelta:(double)a3;
- (id)_systemApertureSettings;
- (id)_tuckInAtEndMeshForNormalizedXDelta:(double)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleRepositionProgressEvent:(id)a3;
- (id)meshTransformForIndex:(unint64_t)a3;
- (id)repositionProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)systemApertureTransitioningAppLayouts;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBFullScreenToHomeSystemApertureSwitcherModifier

- (SBFullScreenToHomeSystemApertureSwitcherModifier)initWithTransitionID:(id)a3 zoomModifier:(id)a4 appLayout:(id)a5 direction:(unint64_t)a6 expandedCardFrame:(CGRect)a7 cardScale:(double)a8 cardVelocity:(CGPoint)a9
{
  CGFloat y = a9.y;
  CGFloat x = a9.x;
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat v14 = a7.origin.y;
  CGFloat v15 = a7.origin.x;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  if (!v23)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"SBFullScreenToHomeSystemApertureSwitcherModifier.m", 58, @"Invalid parameter not satisfying: %@", @"appLayout != nil" object file lineNumber description];
  }
  v37.receiver = self;
  v37.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  v24 = [(SBTransitionSwitcherModifier *)&v37 initWithTransitionID:v21];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_appLayout, a5);
    v25->_direction = a6;
    p_zoomModifier = (id *)&v25->_zoomModifier;
    objc_storeStrong((id *)&v25->_zoomModifier, a4);
    v25->_shouldClipRegionAboveSystemAperture = 1;
    if (v25->_zoomModifier)
    {
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)v25->_zoomModifier setShouldUpdateIconViewVisibility:0];
      [*p_zoomModifier setShouldMatchMoveToIconView:0];
      [(SBChainableModifier *)v25 addChildModifier:*p_zoomModifier];
    }
    v25->_expandedCardFrame.origin.CGFloat x = v15;
    v25->_expandedCardFrame.origin.CGFloat y = v14;
    v25->_expandedCardFrame.size.CGFloat width = width;
    v25->_expandedCardFrame.size.CGFloat height = height;
    UIRectGetCenter();
    v25->_expandedCardCenter.CGFloat x = v27;
    v25->_expandedCardCenter.CGFloat y = v28;
    v25->_liftOffCardVelocity.CGFloat x = x;
    v25->_liftOffCardVelocity.CGFloat y = y;
    v25->_initialCardScale = a8;
    v29 = +[SBAppSwitcherDomain rootSettings];
    v30 = [v29 systemApertureSettings];

    v38.origin.CGFloat x = v15;
    v38.origin.CGFloat y = v14;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGFloat v31 = CGRectGetWidth(v38);
    [v30 zoomToJindoYFromScreenTopToUseAlternateSettings];
    CGFloat v33 = v32;
    CGAffineTransformMakeScale(&v36, a8, a8);
    v39.origin.CGFloat x = v15;
    v39.origin.CGFloat y = v14;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    CGRectApplyAffineTransform(v39, &v36);
    UIRectCenteredAboutPoint();
    v41.origin.CGFloat x = 0.0;
    v41.origin.CGFloat y = 0.0;
    v41.size.CGFloat width = v31;
    v41.size.CGFloat height = v33;
    v25->_jindoIntersectsIntialCardFrame = CGRectIntersectsRect(v40, v41);
  }
  return v25;
}

- (BOOL)completesWhenChildrenComplete
{
  return self->_zoomModifier != 0;
}

- (void)didMoveToParentModifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (![(SBChainableModifier *)self containsChildModifier:self->_coplanarModifier])
    {
      v5 = [[SBCoplanarSwitcherModifier alloc] initWithActiveAppLayout:self->_appLayout];
      coplanarModifier = self->_coplanarModifier;
      self->_coplanarModifier = v5;

      [(SBCoplanarSwitcherModifier *)self->_coplanarModifier setUsesContainerViewBoundsAsActiveFrame:1];
      [(SBChainableModifier *)self addChildModifier:self->_coplanarModifier];
    }
  }
}

- (id)handleRepositionProgressEvent:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v24 handleRepositionProgressEvent:v4];
  v6 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
  if (self->_direction == 1
    && ([v4 progress],
        [v6 zoomToJindoBeginShowingShadowThreshold],
        BSFloatGreaterThanOrEqualToFloat())
    && ([v4 progress],
        [v6 zoomToJindoEndShowingShadowThreshold],
        BSFloatLessThanFloat()))
  {
    if (self->_showShadow) {
      goto LABEL_9;
    }
    self->_showShadow = 1;
  }
  else
  {
    if (!self->_showShadow) {
      goto LABEL_9;
    }
    self->_showShadow = 0;
  }
  objc_super v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
  uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

  v5 = (void *)v8;
LABEL_9:
  unint64_t direction = self->_direction;
  if (!direction)
  {
    [v4 progress];
    [v6 zoomFromJindoBeginUnblurringProgressThreshold];
    int v10 = BSFloatGreaterThanOrEqualToFloat();
    if (v10 && !self->_unblurred)
    {
      self->_unblurred = v10;
      v11 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
      uint64_t v12 = SBAppendSwitcherModifierResponse(v11, v5);

      v5 = (void *)v12;
    }
    unint64_t direction = self->_direction;
  }
  if (direction == 1)
  {
    [v4 progress];
    [v6 zoomToJindoTuckInThreshold];
    int v13 = BSFloatGreaterThanOrEqualToFloat();
    if (v13)
    {
      if (!self->_tucked)
      {
        self->_tucked = v13;
        CGFloat v14 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
        uint64_t v15 = SBAppendSwitcherModifierResponse(v14, v5);

        v5 = (void *)v15;
      }
    }
  }
  unint64_t v16 = self->_direction;
  if (v16 == 1)
  {
    [v4 progress];
    [v6 zoomToJindoBounceThreshold];
    int v17 = BSFloatGreaterThanOrEqualToFloat();
    if (v17 && !self->_bounced)
    {
      self->_bounced = v17;
      v18 = [[SBInitiateSystemApertureBounceSwitcherEventResponse alloc] initWithAppLayout:self->_appLayout suppressionIdentifierToInvalidate:self->_suppressionIdentifier];
      suppressionIdentifier = self->_suppressionIdentifier;
      self->_suppressionIdentifier = 0;

      uint64_t v20 = +[SBChainableModifierEventResponse responseByAppendingResponse:v18 toResponse:v5];

      v5 = (void *)v20;
    }
    unint64_t v16 = self->_direction;
  }
  if (!v16)
  {
    [v4 progress];
    [v6 zoomFromJindoUnmaskThreshold];
    if (BSFloatGreaterThanOrEqualToFloat())
    {
      self->_shouldClipRegionAboveSystemAperture = 0;
      id v21 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
      uint64_t v22 = SBAppendSwitcherModifierResponse(v21, v5);

      v5 = (void *)v22;
    }
  }

  return v5;
}

- (id)transitionWillBegin
{
  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v14 transitionWillBegin];
  if (*(_OWORD *)&self->_direction == 1)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    suppressionIdentifier = self->_suppressionIdentifier;
    self->_suppressionIdentifier = v4;

    v6 = [[SBRequestSystemApertureElementSuppressionEventResponse alloc] initWithAppLayout:self->_appLayout wantsGlobalSuppression:1 wantsKeyLineEnabled:1 invalidationIdentifier:self->_suppressionIdentifier];
    uint64_t v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v3];

    v3 = (void *)v7;
  }
  unint64_t direction = self->_direction;
  if (direction == 1)
  {
    v9 = objc_alloc_init(SBInvalidateRootContentViewClippingAndBlurEventResponse);
    uint64_t v10 = SBAppendSwitcherModifierResponse(v9, v3);

    unint64_t direction = self->_direction;
    v3 = (void *)v10;
  }
  if (!direction
    && (unint64_t)([(SBFullScreenToHomeSystemApertureSwitcherModifier *)self switcherInterfaceOrientation]- 3) >= 2)
  {
    v11 = objc_alloc_init(SBInitiateSystemApertureStretchEventResponse);
    uint64_t v12 = SBAppendSwitcherModifierResponse(v11, v3);

    v3 = (void *)v12;
  }
  return v3;
}

- (id)transitionDidEnd
{
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v8 transitionDidEnd];
  if (self->_suppressionIdentifier)
  {
    id v4 = [[SBRelinquishSystemApertureElementSuppressionEventResponse alloc] initWithInvalidationIdentifier:self->_suppressionIdentifier];
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    suppressionIdentifier = self->_suppressionIdentifier;
    self->_suppressionIdentifier = 0;

    v3 = (void *)v5;
  }
  return v3;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v5 = self->_direction == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v6 = self->_direction == 1;
  }
  else {
    BOOL v6 = 0;
  }
  if ([(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _isIndexZoomAppLayout:a3]
    && (v5 || v6))
  {
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self containerViewBounds];
    SBRectWithSize();
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _collapsedTransitionTargetForZoomDown:v6];
    SBUnintegralizedRectCenteredAboutPoint();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v11 frameForIndex:a3];
  }
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if (-[SBFullScreenToHomeSystemApertureSwitcherModifier _shouldApplyEffectsToIndex:](self, "_shouldApplyEffectsToIndex:"))
  {
    BOOL v5 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self containerViewBounds];
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
    double v10 = self->_expandedCardCenter.x;
    CGFloat v11 = CGRectGetMidX(v23) - v10;
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGFloat v12 = v11 / CGRectGetWidth(v24) * 1.5;
    double v13 = tanh(v12 + v12);
    double v14 = -v13;
    if (v12 > 0.0) {
      double v14 = v13;
    }
    double v15 = fmin(fmax(v13 * v14, -1.0), 1.0);
    if (self->_jindoIntersectsIntialCardFrame) {
      [v5 zoomToJindoStraightSwipeAlternateScale];
    }
    else {
      [v5 zoomToJindoStraightSwipeScale];
    }
    double v19 = v16;
    [v5 zoomToJindoArcSwipeScale];
    double v18 = v19 + fabs(v15) * (v20 - v19);
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v22 scaleForIndex:a3];
    return v17;
  }
  return v18;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  v3 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  if (self->_direction) {
    [MEMORY[0x1E4F1CAD0] set];
  }
  else {
  v2 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self visibleAppLayouts];
  }
  return v2;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout])
  {
    unint64_t direction = self->_direction;
    double v6 = 0.0;
    if ([(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _isIndexZoomAppLayout:a3]
      && direction == 1)
    {
      double v7 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
      [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self containerViewBounds];
      CGFloat x = v20.origin.x;
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
      double v12 = self->_expandedCardCenter.x;
      CGFloat v13 = CGRectGetMidX(v20) - v12;
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGFloat v14 = v13 / CGRectGetWidth(v21) * 1.5;
      double v15 = tanh(v14 + v14);
      double v16 = -v15;
      if (v14 > 0.0) {
        double v16 = v15;
      }
      double v17 = fmin(fmax(v15 * v16, -1.0), 1.0);
      [v7 xDeltaToRotationMappingFactor];
      double v6 = v18 * v17 + 0.0;
    }
  }
  else
  {
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _isIndexZoomAppLayout:a3];
    return 0.0;
  }
  return v6;
}

- (id)meshTransformForIndex:(unint64_t)a3
{
  if ([(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _isIndexZoomAppLayout:"_isIndexZoomAppLayout:"])
  {
    if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout] && self->_direction == 1)
    {
      [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self containerViewBounds];
      CGFloat x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
      double v9 = self->_expandedCardCenter.x;
      CGFloat v10 = CGRectGetMidX(v19) - v9;
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGFloat v11 = v10 / CGRectGetWidth(v20) * 1.5;
      double v12 = tanh(v11 + v11);
      double v13 = -v12;
      if (v11 > 0.0) {
        double v13 = v12;
      }
      double v14 = fmin(fmax(v12 * v13, -1.0), 1.0);
      if (self->_tucked) {
        [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _tuckInAtEndMeshForNormalizedXDelta:v14];
      }
      else {
      double v15 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _collapseMeshForNormalizedXDelta:v14];
      }
    }
    else
    {
      double v15 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _expandMeshForIndex:a3];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    double v15 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v17 meshTransformForIndex:a3];
  }
  return v15;
}

- (CGRect)rootContentViewMaskRect
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v3 = self->_direction == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if (self->_shouldClipRegionAboveSystemAperture)
  {
    v17.receiver = self;
    v17.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v17 rootContentViewMaskRect];
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self containerViewBounds];
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    uint64_t v11 = v7;
    if (!v3)
    {
      [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self systemApertureDefaultFrame];
      CGRectGetMidY(v18);
      uint64_t v4 = v8;
      uint64_t v5 = v9;
      uint64_t v6 = v10;
      uint64_t v7 = v11;
    }
    CGRectGetWidth(*(CGRect *)&v4);
    UIRectInset();
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v16 rootContentViewMaskRect];
  }
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (double)rootContentViewBlurRadius
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v3 = self->_direction == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v4 = self->_direction == 1;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = [(SBTransitionSwitcherModifier *)self isUpdatingLayout];
  int v6 = v3 || v4;
  if (!v5)
  {
    if (!v6) {
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v11 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
    [v11 zoomToFromJindoMaxBlurRadius];
    double v9 = v12;

    return v9;
  }
  if (v6) {
    goto LABEL_14;
  }
  if (self->_direction)
  {
LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v15 rootContentViewBlurRadius];
    return v13;
  }
  uint64_t v7 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
  uint64_t v8 = v7;
  double v9 = 0.0;
  if (!self->_unblurred)
  {
    [v7 zoomToFromJindoMaxBlurRadius];
    double v9 = v10;
  }

  return v9;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  BOOL v4 = (SBAppLayout *)a3;
  v33.receiver = self;
  v33.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  BOOL v5 = [(SBTransitionSwitcherModifier *)&v33 animationAttributesForLayoutElement:v4];
  int v6 = (void *)[v5 mutableCopy];

  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v7 = self->_direction == 1;
  }
  else {
    BOOL v7 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v8 = self->_direction == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v9 = self->_direction == 0;
  }
  else {
    BOOL v9 = 0;
  }
  double v10 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
  uint64_t v11 = v10;
  if (self->_appLayout == v4)
  {
    if (v7)
    {
      if (self->_jindoIntersectsIntialCardFrame)
      {
        objc_super v16 = [v10 zoomToJindoLayoutAlternateSettings];
        [v6 setLayoutSettings:v16];

        objc_super v17 = [v11 zoomToJindoPositionAlternateSettings];
        [v6 setPositionSettings:v17];

        [v11 zoomToJindoScaleAndRotateAlternateSettings];
      }
      else
      {
        CGFloat v27 = [v10 zoomToJindoLayoutSettings];
        [v6 setLayoutSettings:v27];

        CGFloat v28 = [v11 zoomToJindoPositionSettings];
        [v6 setPositionSettings:v28];

        [v11 zoomToJindoScaleAndRotateSettings];
      v29 = };
      [v6 setScaleSettings:v29];

      v30 = [v11 zoomToAndFromJindoMeshSettings];
      [v6 setMeshSettings:v30];

      uint64_t v25 = [v11 zoomToJindoCornerRadiusSettings];
    }
    else
    {
      if (v8)
      {
        [v6 setLayoutUpdateMode:2];
        [v6 setPositionUpdateMode:2];
        [v6 setScaleUpdateMode:2];
        [v6 setMeshUpdateMode:2];
        [v6 setCornerRadiusUpdateMode:2];
        [v6 setUpdateMode:2];
        goto LABEL_30;
      }
      CGRect v21 = [v10 zoomFromJindoLayoutSettings];
      [v6 setLayoutSettings:v21];

      objc_super v22 = [v11 zoomFromJindoPositionSettings];
      [v6 setPositionSettings:v22];

      CGRect v23 = [v11 zoomFromJindoScaleAndRotateSettings];
      [v6 setScaleSettings:v23];

      CGRect v24 = [v11 zoomToAndFromJindoMeshSettings];
      [v6 setMeshSettings:v24];

      uint64_t v25 = [v11 zoomFromJindoCornerRadiusSettings];
    }
    CGFloat v31 = (void *)v25;
    [v6 setCornerRadiusSettings:v25];
  }
  else if ([(SBAppLayout *)v4 switcherLayoutElementType] == 5)
  {
    if (v7)
    {
      double v12 = [v11 zoomToJindoBlurAnimationSettings];
      [v6 setLayoutSettings:v12];

      [v6 setLayoutUpdateMode:3];
      double v13 = [v11 zoomToJindoTopClippingSettings];
      [v6 setClippingSettings:v13];

      double v14 = v6;
      uint64_t v15 = 3;
    }
    else
    {
      if (v8 || v9 && !self->_unblurred)
      {
        CGRect v18 = [v11 zoomFromJindoBlurAnimationSettings];
        [v6 setLayoutSettings:v18];

        CGRect v19 = v6;
        uint64_t v20 = 1;
      }
      else
      {
        v26 = [v11 zoomFromJindoBlurAnimationSettings];
        [v6 setLayoutSettings:v26];

        CGRect v19 = v6;
        uint64_t v20 = 3;
      }
      [v19 setLayoutUpdateMode:v20];
      double v14 = v6;
      uint64_t v15 = 2;
    }
    [v14 setClippingUpdateMode:v15];
  }
LABEL_30:

  return v6;
}

- (CGPoint)expandedSourcePositionForSystemApertureTransition
{
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v5 expandedSourcePositionForSystemApertureTransition];
  [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self switcherViewBounds];
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout] && self->_direction == 1)
  {
    double x = self->_expandedCardCenter.x;
    double y = self->_expandedCardCenter.y;
  }
  else
  {
    UIRectGetCenter();
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)repositionProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  id v6 = a4;
  BOOL v7 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v26 repositionProgressNotificationsForLayoutRole:a3 inAppLayout:v6];
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v8 = self->_direction == 1;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
  BOOL v10 = [(SBAppLayout *)self->_appLayout isEqual:v6];

  if (v10)
  {
    if (v8)
    {
      [v9 zoomToJindoBeginShowingShadowThreshold];
      double v12 = v11;
      [v9 zoomToJindoEndShowingShadowThreshold];
      double v14 = v13;
      [v9 zoomToJindoBounceThreshold];
      double v16 = v15;
      [v9 zoomToJindoTuckInThreshold];
      objc_super v17 = objc_msgSend(NSNumber, "numberWithDouble:");
      v28[0] = v17;
      CGRect v18 = [NSNumber numberWithDouble:v16];
      v28[1] = v18;
      CGRect v19 = [NSNumber numberWithDouble:v12];
      v28[2] = v19;
      uint64_t v20 = [NSNumber numberWithDouble:v14];
      v28[3] = v20;
      CGRect v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
      uint64_t v22 = [v7 setByAddingObjectsFromArray:v21];

      BOOL v7 = (void *)v20;
    }
    else
    {
      [v9 zoomToJindoBounceThreshold];
      double v24 = v23;
      [v9 zoomFromJindoBeginUnblurringProgressThreshold];
      objc_super v17 = objc_msgSend(NSNumber, "numberWithDouble:");
      v27[0] = v17;
      CGRect v18 = [NSNumber numberWithDouble:v24];
      v27[1] = v18;
      CGRect v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      uint64_t v22 = [v7 setByAddingObjectsFromArray:v19];
    }

    BOOL v7 = (void *)v22;
  }

  return v7;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v5 = self->_direction == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v6 = self->_direction == 1;
  }
  else {
    BOOL v6 = 0;
  }
  if ([(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _isIndexZoomAppLayout:a3]
    && (v5 || v6))
  {
    BOOL v7 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
    [v7 zoomToFromJindoMaxCornerRadius];
    SBRectCornerRadiiForRadius();
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v16 = v9;
    double v17 = v11;
    double v18 = v13;
    double v19 = v15;
  }
  else
  {
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self displayCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  result.topRight = v19;
  result.bottomRight = v18;
  result.bottomLeft = v17;
  result.topLeft = v16;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 1.0;
  if (![(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _shouldApplyEffectsToIndex:a5])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return self->_direction != 1;
}

- (id)systemApertureTransitioningAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  BOOL v3 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v6 systemApertureTransitioningAppLayouts];
  BOOL v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (BOOL)systemApertureRequiresHeavyShadowForTransition
{
  v4.receiver = self;
  v4.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  return [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v4 systemApertureRequiresHeavyShadowForTransition]|| self->_showShadow;
}

- (id)topMostLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  BOOL v3 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)&v6 topMostLayoutElements];
  objc_super v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_appLayout, 0);

  return v4;
}

- (id)_systemApertureSettings
{
  v2 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self switcherSettings];
  BOOL v3 = [v2 systemApertureSettings];

  return v3;
}

- (CGPoint)_collapsedTransitionTargetForZoomDown:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self containerViewBounds];
  SBRectWithSize();
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  UIRectGetCenter();
  double v14 = v13;
  double v16 = v15;
  if (v3)
  {
    double v17 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
    v37.origin.CGFloat x = v6;
    v37.origin.CGFloat y = v8;
    v37.size.CGFloat width = v10;
    v37.size.CGFloat height = v12;
    double Height = CGRectGetHeight(v37);
    [v17 zoomToJindoTargetYDisplacement];
    double v34 = v16 - Height * v19;
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self containerViewBounds];
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    double v35 = v14;
    CGFloat v23 = v38.size.height;
    double v32 = self->_expandedCardCenter.x;
    CGFloat v33 = CGRectGetMidX(v38) - v32;
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = v23;
    CGFloat v24 = v33 / CGRectGetWidth(v39) * 1.5;
    double v25 = tanh(v24 + v24);
    double v26 = -v25;
    if (v24 > 0.0) {
      double v26 = v25;
    }
    double v27 = fmin(fmax(v25 * v26, -1.0), 1.0);
    v40.origin.CGFloat x = v6;
    v40.origin.CGFloat y = v8;
    v40.size.CGFloat width = v10;
    v40.size.CGFloat height = v12;
    double v28 = CGRectGetWidth(v40);
    [v17 zoomToJindoTargetXDisplacement];
    double v14 = v35 + v28 * v29 * v27;

    double v30 = v34;
  }
  else
  {
    v41.origin.CGFloat x = v6;
    v41.origin.CGFloat y = v8;
    v41.size.CGFloat width = v10;
    v41.size.CGFloat height = v12;
    double v30 = v16 + CGRectGetHeight(v41) * -0.5;
  }
  double v31 = v14;
  result.CGFloat y = v30;
  result.CGFloat x = v31;
  return result;
}

- (BOOL)_shouldApplyEffectsToIndex:(unint64_t)a3
{
  BOOL v5 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _isEffectivelyHome];
  if (v5)
  {
    LOBYTE(v5) = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _isIndexZoomAppLayout:a3];
  }
  return v5;
}

- (BOOL)_isIndexZoomAppLayout:(unint64_t)a3
{
  objc_super v4 = self;
  BOOL v5 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self appLayouts];
  CGFloat v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_appLayout];
  return (char)v4;
}

- (BOOL)_isEffectivelyHome
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v3 = self->_direction == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v4 = self->_direction == 1;
  }
  else {
    BOOL v4 = 0;
  }
  return v3 || v4;
}

- (id)_collapseMeshForNormalizedXDelta:(double)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  v12[1] = 0;
  if (a3 <= 0.0)
  {
    double v13 = a3 * 0.9 + 0.0 + 0.1;
    double v14 = a3 * -0.2 + 0.0;
    long long v15 = xmmword_1D8FD1140;
    uint64_t v16 = 0;
    double v17 = a3 + 0.5;
    uint64_t v18 = 0;
    double v3 = 1.2;
  }
  else
  {
    double v13 = a3 * 1.2 + 0.0 + 0.1;
    double v14 = a3 * -0.2 + 0.0;
    long long v15 = xmmword_1D8FD1140;
    uint64_t v16 = 0;
    double v17 = a3 + 0.5;
    uint64_t v18 = 0;
    double v3 = 0.9;
  }
  long long v19 = xmmword_1D8FD1150;
  uint64_t v20 = 0;
  double v21 = a3 * v3 + 1.0 + -0.1;
  double v22 = a3 * 0.2 + 0.0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  long long v25 = xmmword_1D8FD1160;
  long long v26 = xmmword_1D8FD1170;
  __asm { FMOV            V1.2D, #0.5 }
  long long v27 = _Q1;
  long long v28 = _Q1;
  long long v29 = xmmword_1D8FD1180;
  long long v30 = xmmword_1D8FD1190;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = 0x3FE0000000000000;
  long long v34 = xmmword_1D8FD11A0;
  double v35 = a3 * 0.1 + 1.1;
  long long v36 = xmmword_1D8FD1140;
  long long v37 = xmmword_1D8FD11B0;
  __asm { FMOV            V2.2D, #1.0 }
  long long v38 = xmmword_1D8FD11C0;
  long long v39 = _Q2;
  uint64_t v40 = 0x3FF0000000000000;
  double v41 = v35;
  uint64_t v42 = 0;
  long long v43 = xmmword_1D8FD11D0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  long long v46 = xmmword_1D8FD11E0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  long long v49 = xmmword_1D8FD11F0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  long long v52 = xmmword_1D8FD1200;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  CGFloat v10 = [MEMORY[0x1E4F39C18] meshTransformWithVertexCount:9 vertices:v12 faceCount:4 faces:&v43 depthNormalization:*MEMORY[0x1E4F39ED8]];
  return v10;
}

- (id)_tuckInAtEndMeshForNormalizedXDelta:(double)a3
{
  BOOL v4 = -[SBFullScreenToHomeSystemApertureSwitcherModifier _collapseMeshForNormalizedXDelta:](self, "_collapseMeshForNormalizedXDelta:");
  BOOL v5 = (void *)[v4 mutableCopy];
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  if (v4)
  {
    [v4 vertexAtIndex:6];
    uint64_t v12 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    [v4 vertexAtIndex:8];
  }
  else
  {
    uint64_t v12 = 0;
    long long v10 = 0uLL;
    long long v11 = 0uLL;
  }
  *(double *)&long long v14 = 0.06 - a3 * 0.2;
  *(double *)&long long v11 = 0.94 - a3 * 0.2;
  long long v7 = v13;
  long long v8 = v14;
  uint64_t v9 = v15;
  [v5 replaceVertexAtIndex:6 withVertex:&v7];
  long long v7 = v10;
  long long v8 = v11;
  uint64_t v9 = v12;
  [v5 replaceVertexAtIndex:8 withVertex:&v7];

  return v5;
}

- (id)_blurItemContainerParameters
{
  double v3 = [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self _systemApertureSettings];
  unint64_t direction = self->_direction;
  BOOL v5 = [SBBlurItemContainerParameters alloc];
  [v3 zoomToFromJindoMaxBlurRadius];
  double v7 = v6;
  [(SBFullScreenToHomeSystemApertureSwitcherModifier *)self screenScale];
  double v9 = v8;
  if (direction == 1) {
    [v3 zoomToJindoBlurAnimationSettings];
  }
  else {
  long long v10 = [v3 zoomFromJindoBlurAnimationSettings];
  }
  long long v11 = [(SBBlurItemContainerParameters *)v5 initWithBlurRadius:1 shouldRasterize:1 rasterizationScale:1 inputQuality:v10 inputIntermediateBitDepth:v7 blurAnimationSettings:v9];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressionIdentifier, 0);
  objc_storeStrong((id *)&self->_zoomModifier, 0);
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end