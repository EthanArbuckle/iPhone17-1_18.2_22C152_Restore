@interface SBPIPRestoreToFullScreenSwitcherModifier
- (BOOL)_isFromAppLayoutIndex:(unint64_t)a3;
- (BOOL)_isToAppLayout:(id)a3;
- (BOOL)_isToAppLayoutIndex:(unint64_t)a3;
- (BOOL)_isToOrFromAppLayout:(id)a3;
- (BOOL)_isToOrFromAppLayoutIndex:(unint64_t)a3;
- (BOOL)completesWhenChildrenComplete;
- (BOOL)shouldClippingTakeShadowIntoAccount;
- (BOOL)shouldForceDefaultAnchorPointForTransition;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)_insetFrameForDiffuseShadowRadius:(CGRect)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4;
- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBPIPRestoreToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 transitionModifier:(id)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 toLayoutRole:(int64_t)a7;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (void)setShouldClippingTakeShadowIntoAccount:(BOOL)a3;
- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3;
@end

@implementation SBPIPRestoreToFullScreenSwitcherModifier

- (SBPIPRestoreToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 transitionModifier:(id)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 toLayoutRole:(int64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  v15 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:a3];
  v16 = v15;
  if (v15)
  {
    v15->_toLayoutRole = a7;
    objc_storeStrong((id *)&v15->_fromAppLayout, a5);
    objc_storeStrong((id *)&v16->_toAppLayout, a6);
    [(SBChainableModifier *)v16 addChildModifier:v12];
  }

  return v16;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (id)transitionWillBegin
{
  v16.receiver = self;
  v16.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v16 transitionWillBegin];
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v5];

  v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v6];

  p_toAppLayoutBoundingBox = &self->_toAppLayoutBoundingBox;
  v8 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_toAppLayout];
  [v8 boundingBox];
  p_toAppLayoutBoundingBox->origin.x = v9;
  p_toAppLayoutBoundingBox->origin.y = v10;
  p_toAppLayoutBoundingBox->size.width = v11;
  p_toAppLayoutBoundingBox->size.height = v12;

  id v13 = objc_alloc_init(SBSetupPIPMorphingSwitcherEventResponse);
  -[SBSetupPIPMorphingSwitcherEventResponse setAppLayoutBoundingBox:](v13, "setAppLayoutBoundingBox:", p_toAppLayoutBoundingBox->origin.x, p_toAppLayoutBoundingBox->origin.y, p_toAppLayoutBoundingBox->size.width, p_toAppLayoutBoundingBox->size.height);
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v13];
  id v14 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v4];

  return v14;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if ([(SBPIPRestoreToFullScreenSwitcherModifier *)self _isFromAppLayoutIndex:"_isFromAppLayoutIndex:"])
  {
    [(SBPIPRestoreToFullScreenSwitcherModifier *)self containerViewBounds];
  }
  else if ([(SBTransitionSwitcherModifier *)self isPreparingLayout] {
         && [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToAppLayoutIndex:a3])
  }
  {
    SBRectWithSize();
    [(SBPIPRestoreToFullScreenSwitcherModifier *)self morphToPIPTargetCenter];
    SBUnintegralizedRectCenteredAboutPoint();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    [(SBPIPRestoreToFullScreenSwitcherModifier *)&v9 frameForIndex:a3];
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]
    && [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToAppLayoutIndex:a3])
  {
    [(SBPIPRestoreToFullScreenSwitcherModifier *)self morphToPIPClippingFrame];
  }
  else if ([(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToAppLayoutIndex:a3])
  {
    v15.receiver = self;
    v15.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier clippingFrameForIndex:withBounds:](&v15, sel_clippingFrameForIndex_withBounds_, a3, x, y, width, height);
    SBRectWithSize();
    if (self->_shouldClippingTakeShadowIntoAccount) {
      -[SBPIPRestoreToFullScreenSwitcherModifier _insetFrameForDiffuseShadowRadius:](self, "_insetFrameForDiffuseShadowRadius:");
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier clippingFrameForIndex:withBounds:](&v14, sel_clippingFrameForIndex_withBounds_, a3, x, y, width, height);
  }
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a4;
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]
    && [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToAppLayout:v13])
  {
    -[SBPIPRestoreToFullScreenSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v13, x, y, width, height);
    double v15 = v14;
    double v17 = v16;
    [(SBPIPRestoreToFullScreenSwitcherModifier *)self morphToPIPClippingFrame];
    CGRect v32 = CGRectOffset(v31, -v15, -v17);
LABEL_8:
    CGFloat v22 = v32.origin.x;
    CGFloat v23 = v32.origin.y;
    CGFloat v24 = v32.size.width;
    CGFloat v25 = v32.size.height;
    goto LABEL_9;
  }
  if (![(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToAppLayout:v13])
  {
    v30.receiver = self;
    v30.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier clippingFrameForLayoutRole:inAppLayout:atIndex:withBounds:](&v30, sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_, a3, v13, a5, x, y, width, height);
    goto LABEL_8;
  }
  -[SBPIPRestoreToFullScreenSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v13, x, y, width, height);
  SBRectWithSize();
  CGFloat v22 = v18;
  CGFloat v23 = v19;
  CGFloat v24 = v20;
  CGFloat v25 = v21;
  if (self->_shouldClippingTakeShadowIntoAccount)
  {
    -[SBPIPRestoreToFullScreenSwitcherModifier _insetFrameForDiffuseShadowRadius:](self, "_insetFrameForDiffuseShadowRadius:", v18, v19, v20, v21);
    goto LABEL_8;
  }
LABEL_9:

  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGRect)_insetFrameForDiffuseShadowRadius:(CGRect)a3
{
  v3 = [(SBPIPRestoreToFullScreenSwitcherModifier *)self switcherSettings];
  v4 = [v3 chamoisSettings];
  [v4 diffuseShadowRadius];
  double v6 = v5;

  SBRectWithSize();
  return CGRectInset(*(CGRect *)&v7, v6 * -2.8, v6 * -2.8);
}

- (double)scaleForIndex:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  -[SBPIPRestoreToFullScreenSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_);
  double v6 = v5;
  BOOL v7 = [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isFromAppLayoutIndex:a3];
  double result = 1.0;
  if (!v7)
  {
    if ([(SBTransitionSwitcherModifier *)self isPreparingLayout])
    {
      BOOL v9 = [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToAppLayoutIndex:a3];
      double result = v6;
      if (v9) {
        [(SBPIPRestoreToFullScreenSwitcherModifier *)self morphToPIPTargetScale];
      }
    }
    else
    {
      return v6;
    }
  }
  return result;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  v3 = [(SBPIPRestoreToFullScreenSwitcherModifier *)&v6 visibleAppLayouts];
  v4 = (void *)[v3 mutableCopy];

  if (self->_fromAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (BOOL v5 = [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToOrFromAppLayoutIndex:a3], v6 = 0.5, v7 = 0.5, !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    [(SBPIPRestoreToFullScreenSwitcherModifier *)&v8 anchorPointForIndex:a3];
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToOrFromAppLayoutIndex:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  return [(SBPIPRestoreToFullScreenSwitcherModifier *)&v6 shouldPinLayoutRolesToSpace:a3];
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToOrFromAppLayoutIndex:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  return [(SBPIPRestoreToFullScreenSwitcherModifier *)&v6 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (double v5 = 0.0, ![(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToOrFromAppLayout:v4]))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    [(SBPIPRestoreToFullScreenSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToOrFromAppLayout:v9])
  {
    objc_super v10 = [(SBPIPRestoreToFullScreenSwitcherModifier *)self appLayouts];
    -[SBPIPRestoreToFullScreenSwitcherModifier frameForIndex:](self, "frameForIndex:", [v10 indexOfObject:v9]);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v27, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    double v12 = v19;
    double v14 = v20;
    double v16 = v21;
    double v18 = v22;
  }

  double v23 = v12;
  double v24 = v14;
  double v25 = v16;
  double v26 = v18;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (double v8 = 0.5,
        double v9 = 0.5,
        ![(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToOrFromAppLayout:v7]))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v14, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    double v8 = v10;
    double v9 = v11;
  }

  double v12 = v8;
  double v13 = v9;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 animationAttributesForLayoutElement:a3];
  id v4 = (void *)[v3 mutableCopy];

  double v5 = [v4 layoutSettings];
  [v4 setClippingSettings:v5];

  return v4;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBPIPRestoreToFullScreenSwitcherModifier *)self displayCornerRadius];
  SBRectCornerRadiiForRadius();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]
    && [(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToAppLayoutIndex:a3])
  {
    [(SBPIPRestoreToFullScreenSwitcherModifier *)self morphToPIPClippingCornerRadius];
    double v6 = v13;
    double v8 = v13;
    double v10 = v13;
    double v12 = v13;
  }
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  result.topRight = v17;
  result.bottomRight = v16;
  result.bottomLeft = v15;
  result.topLeft = v14;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 1.0;
  if (![(SBPIPRestoreToFullScreenSwitcherModifier *)self _isToOrFromAppLayoutIndex:a5])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    [(SBPIPRestoreToFullScreenSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (BOOL)_isFromAppLayoutIndex:(unint64_t)a3
{
  id v4 = self;
  double v5 = [(SBPIPRestoreToFullScreenSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_fromAppLayout];
  return (char)v4;
}

- (BOOL)_isToAppLayoutIndex:(unint64_t)a3
{
  id v4 = self;
  double v5 = [(SBPIPRestoreToFullScreenSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_toAppLayout];
  return (char)v4;
}

- (BOOL)_isToAppLayout:(id)a3
{
  return [a3 isEqual:self->_toAppLayout];
}

- (BOOL)_isToOrFromAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_fromAppLayout]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqual:self->_toAppLayout];
  }

  return v5;
}

- (BOOL)_isToOrFromAppLayoutIndex:(unint64_t)a3
{
  id v4 = self;
  char v5 = [(SBPIPRestoreToFullScreenSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [(SBPIPRestoreToFullScreenSwitcherModifier *)v4 _isToOrFromAppLayout:v6];
  return (char)v4;
}

- (BOOL)shouldClippingTakeShadowIntoAccount
{
  return self->_shouldClippingTakeShadowIntoAccount;
}

- (void)setShouldClippingTakeShadowIntoAccount:(BOOL)a3
{
  self->_shouldClippingTakeShadowIntoAccount = a3;
}

- (BOOL)shouldForceDefaultAnchorPointForTransition
{
  return self->_shouldForceDefaultAnchorPointForTransition;
}

- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3
{
  self->_shouldForceDefaultAnchorPointForTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end