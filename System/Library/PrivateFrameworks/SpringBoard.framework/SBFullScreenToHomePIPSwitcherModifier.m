@interface SBFullScreenToHomePIPSwitcherModifier
- (BOOL)_isIndexSelectedAppLayout:(unint64_t)a3;
- (BOOL)_shouldApplyMorphToPIPToIndex:(unint64_t)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
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
- (SBFullScreenToHomePIPSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 layoutRole:(int64_t)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)rotationAngleForIndex:(unint64_t)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleHideMorphToPIPAppLayoutEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (void)didMoveToParentModifier:(id)a3;
- (void)setShouldClippingTakeShadowIntoAccount:(BOOL)a3;
- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3;
@end

@implementation SBFullScreenToHomePIPSwitcherModifier

- (SBFullScreenToHomePIPSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 layoutRole:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBFullScreenToHomePIPSwitcherModifier.m", 34, @"Invalid parameter not satisfying: %@", @"appLayout != nil" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  v11 = [(SBTransitionSwitcherModifier *)&v15 initWithTransitionID:v9];
  v12 = v11;
  if (v11)
  {
    v11->_layoutRole = a5;
    objc_storeStrong((id *)&v11->_appLayout, a4);
  }

  return v12;
}

- (void)didMoveToParentModifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
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

- (id)transitionWillBegin
{
  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v12 transitionWillBegin];
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = [[SBUpdateContinuousExposeStripsPresentationResponse alloc] initWithPresentationOptions:0 dismissalOptions:1];
  v6 = objc_alloc_init(SBSetupPIPMorphingSwitcherEventResponse);
  objc_super v7 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_appLayout];
  [v7 boundingBox];
  [(SBSetupPIPMorphingSwitcherEventResponse *)v6 setAppLayoutBoundingBox:"setAppLayoutBoundingBox:"];

  v8 = SBAppendSwitcherModifierResponse(v5, v3);
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v8];

  id v9 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v9];

  [(SBChainableModifierEventResponse *)v4 addChildResponse:v6];
  id v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v4];

  return v10;
}

- (id)handleHideMorphToPIPAppLayoutEvent:(id)a3
{
  self->_shouldHide = 1;
  id v4 = a3;
  v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:2];
  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  v6 = [(SBSwitcherModifier *)&v9 handleHideMorphToPIPAppLayoutEvent:v4];

  objc_super v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v5 toResponse:v6];

  return v7;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (-[SBFullScreenToHomePIPSwitcherModifier _shouldApplyMorphToPIPToIndex:](self, "_shouldApplyMorphToPIPToIndex:"))
  {
    v38.receiver = self;
    v38.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    [(SBFullScreenToHomePIPSwitcherModifier *)&v38 frameForIndex:a3];
    SBRectWithSize();
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(SBFullScreenToHomePIPSwitcherModifier *)self morphToPIPTargetCenter];
    CGFloat v35 = v14;
    CGFloat v36 = v13;
    SBUnintegralizedRectCenteredAboutPoint();
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    v23 = SBLogPIP();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v47.origin.x = v6;
      v47.origin.y = v8;
      v47.size.width = v10;
      v47.size.height = v12;
      v32 = NSStringFromCGRect(v47);
      v46.y = v35;
      v46.x = v36;
      v33 = NSStringFromCGPoint(v46);
      v48.origin.x = v16;
      v48.origin.y = v18;
      v48.size.width = v20;
      v48.size.height = v22;
      v34 = NSStringFromCGRect(v48);
      *(_DWORD *)buf = 138543874;
      v40 = v32;
      __int16 v41 = 2114;
      v42 = v33;
      __int16 v43 = 2114;
      v44 = v34;
      _os_log_debug_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEBUG, "[FullscreenToHomeModifier] frameForIndex frame[%{public}@] morphToPIPTargetCenter[%{public}@] centeredFrame:[%{public}@]", buf, 0x20u);
    }
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    [(SBFullScreenToHomePIPSwitcherModifier *)&v37 frameForIndex:a3];
    CGFloat v16 = v24;
    CGFloat v18 = v25;
    CGFloat v20 = v26;
    CGFloat v22 = v27;
  }
  double v28 = v16;
  double v29 = v18;
  double v30 = v20;
  double v31 = v22;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if (-[SBFullScreenToHomePIPSwitcherModifier _shouldApplyMorphToPIPToIndex:](self, "_shouldApplyMorphToPIPToIndex:"))
  {
    [(SBFullScreenToHomePIPSwitcherModifier *)self morphToPIPTargetScale];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    [(SBFullScreenToHomePIPSwitcherModifier *)&v6 scaleForIndex:a3];
  }
  return result;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ([(SBFullScreenToHomePIPSwitcherModifier *)self _isIndexSelectedAppLayout:"_isIndexSelectedAppLayout:"]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    [(SBFullScreenToHomePIPSwitcherModifier *)self morphToPIPClippingFrame];
  }
  else if ([(SBFullScreenToHomePIPSwitcherModifier *)self _isIndexSelectedAppLayout:a3])
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier clippingFrameForIndex:withBounds:](&v15, sel_clippingFrameForIndex_withBounds_, a3, x, y, width, height);
    SBRectWithSize();
    if (self->_shouldClippingTakeShadowIntoAccount) {
      -[SBFullScreenToHomePIPSwitcherModifier _insetFrameForDiffuseShadowRadius:](self, "_insetFrameForDiffuseShadowRadius:");
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier clippingFrameForIndex:withBounds:](&v14, sel_clippingFrameForIndex_withBounds_, a3, x, y, width, height);
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
  if ([(SBFullScreenToHomePIPSwitcherModifier *)self _isIndexSelectedAppLayout:a5]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    [(SBFullScreenToHomePIPSwitcherModifier *)self morphToPIPClippingFrame];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    -[SBFullScreenToHomePIPSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v13, x, y, width, height);
    CGFloat v35 = -v34;
    CGFloat v37 = -v36;
    v43.origin.double x = v27;
    v43.origin.double y = v29;
    v43.size.double width = v31;
    v43.size.double height = v33;
    *(CGRect *)&double v22 = CGRectOffset(v43, v35, v37);
    goto LABEL_8;
  }
  if (![(SBFullScreenToHomePIPSwitcherModifier *)self _isIndexSelectedAppLayout:a5])
  {
    v42.receiver = self;
    v42.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier clippingFrameForLayoutRole:inAppLayout:atIndex:withBounds:](&v42, sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_, a3, v13, a5, x, y, width, height);
    goto LABEL_8;
  }
  -[SBFullScreenToHomePIPSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v13, x, y, width, height);
  SBRectWithSize();
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  if (self->_shouldClippingTakeShadowIntoAccount)
  {
    -[SBFullScreenToHomePIPSwitcherModifier _insetFrameForDiffuseShadowRadius:](self, "_insetFrameForDiffuseShadowRadius:", v14, v15, v16, v17);
LABEL_8:
    double v18 = v22;
    double v19 = v23;
    double v20 = v24;
    double v21 = v25;
  }

  double v38 = v18;
  double v39 = v19;
  double v40 = v20;
  double v41 = v21;
  result.size.double height = v41;
  result.size.double width = v40;
  result.origin.double y = v39;
  result.origin.double x = v38;
  return result;
}

- (CGRect)_insetFrameForDiffuseShadowRadius:(CGRect)a3
{
  v3 = [(SBFullScreenToHomePIPSwitcherModifier *)self switcherSettings];
  id v4 = [v3 chamoisSettings];
  [v4 diffuseShadowRadius];
  double v6 = v5;

  SBRectWithSize();
  return CGRectInset(*(CGRect *)&v7, v6 * -2.8, v6 * -2.8);
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  v3 = [(SBFullScreenToHomePIPSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  double v5 = 0.0;
  double v6 = 0.0;
  if ([(SBFullScreenToHomePIPSwitcherModifier *)self switcherInterfaceOrientation] != 1)
  {
    if ([(SBFullScreenToHomePIPSwitcherModifier *)self switcherInterfaceOrientation] == 4)
    {
      double v6 = -1.57079633;
    }
    else if ([(SBFullScreenToHomePIPSwitcherModifier *)self switcherInterfaceOrientation] == 3)
    {
      double v6 = 1.57079633;
    }
    else if ([(SBFullScreenToHomePIPSwitcherModifier *)self switcherInterfaceOrientation] == 2)
    {
      double v6 = 3.14159265;
    }
    else
    {
      double v6 = 0.0;
    }
  }
  if ([(SBFullScreenToHomePIPSwitcherModifier *)self homeScreenInterfaceOrientation] != 1)
  {
    if ([(SBFullScreenToHomePIPSwitcherModifier *)self homeScreenInterfaceOrientation] == 4)
    {
      double v5 = -1.57079633;
    }
    else if ([(SBFullScreenToHomePIPSwitcherModifier *)self homeScreenInterfaceOrientation] == 3)
    {
      double v5 = 1.57079633;
    }
    else if ([(SBFullScreenToHomePIPSwitcherModifier *)self homeScreenInterfaceOrientation] == 2)
    {
      double v5 = 3.14159265;
    }
    else
    {
      double v5 = 0.0;
    }
  }
  BOOL v7 = [(SBFullScreenToHomePIPSwitcherModifier *)self _shouldApplyMorphToPIPToIndex:a3];
  double result = v5 - v6;
  if (!v7) {
    return 0.0;
  }
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v13 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBFullScreenToHomePIPSwitcherModifier *)self switcherSettings];
  BOOL v7 = [v6 animationSettings];
  CGFloat v8 = [v7 iconZoomDownSettings];
  [v5 setLayoutSettings:v8];

  double v9 = +[SBPIPSettingsDomain rootSettings];
  double v10 = [v9 fluidTransitionsSettings];
  double v11 = [v10 sourceClippingFluidBehavior];
  [v5 setClippingSettings:v11];

  return v5;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (BOOL v5 = [(SBFullScreenToHomePIPSwitcherModifier *)self _isIndexSelectedAppLayout:a3],
        double v6 = 0.5,
        double v7 = 0.5,
        !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    [(SBFullScreenToHomePIPSwitcherModifier *)&v8 anchorPointForIndex:a3];
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBFullScreenToHomePIPSwitcherModifier *)self _isIndexSelectedAppLayout:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  return [(SBFullScreenToHomePIPSwitcherModifier *)&v6 shouldPinLayoutRolesToSpace:a3];
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBFullScreenToHomePIPSwitcherModifier *)self _isIndexSelectedAppLayout:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  return [(SBFullScreenToHomePIPSwitcherModifier *)&v6 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (double v6 = 0.0, ([v4 isEqual:self->_appLayout] & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    [(SBFullScreenToHomePIPSwitcherModifier *)&v9 perspectiveAngleForAppLayout:v5];
    double v6 = v7;
  }

  return v6;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = v9;
  if (self->_shouldForceDefaultAnchorPointForTransition && [v9 isEqual:self->_appLayout])
  {
    double v11 = [(SBFullScreenToHomePIPSwitcherModifier *)self appLayouts];
    -[SBFullScreenToHomePIPSwitcherModifier frameForIndex:](self, "frameForIndex:", [v11 indexOfObject:self->_appLayout]);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
    double v19 = v23;
  }

  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  double v27 = v19;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = v7;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (double v9 = 0.5, v10 = 0.5, ([v7 isEqual:self->_appLayout] & 1) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
    double v9 = v11;
    double v10 = v12;
  }

  double v13 = v9;
  double v14 = v10;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBFullScreenToHomePIPSwitcherModifier *)self displayCornerRadius];
  SBRectCornerRadiiForRadius();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(SBFullScreenToHomePIPSwitcherModifier *)self _shouldApplyMorphToPIPToIndex:a3])
  {
    [(SBFullScreenToHomePIPSwitcherModifier *)self morphToPIPClippingCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    double v13 = v6;
    double v14 = v8;
    double v15 = v10;
    double v16 = v12;
  }
  result.topRight = v16;
  result.bottomRight = v15;
  result.bottomLeft = v14;
  result.topLeft = v13;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 0.0;
  if (!self->_shouldHide)
  {
    if ([(SBFullScreenToHomePIPSwitcherModifier *)self _shouldApplyMorphToPIPToIndex:a5])
    {
      [(SBFullScreenToHomePIPSwitcherModifier *)self morphToPIPSourceAlpha];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
      [(SBFullScreenToHomePIPSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    }
    double v9 = v10;
  }

  return v9;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (id)topMostLayoutElements
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  v3 = [(SBFullScreenToHomePIPSwitcherModifier *)&v8 topMostLayoutElements];
  id v4 = v3;
  if (v3)
  {
    double v5 = (void *)[v3 mutableCopy];
    uint64_t v6 = [v5 indexOfObject:self->_appLayout];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      [v5 insertObject:self->_appLayout atIndex:0];
    }
    else {
      [v5 exchangeObjectAtIndex:v6 withObjectAtIndex:0];
    }
  }
  else
  {
    v9[0] = self->_appLayout;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }

  return v5;
}

- (BOOL)_shouldApplyMorphToPIPToIndex:(unint64_t)a3
{
  BOOL v5 = [(SBTransitionSwitcherModifier *)self isUpdatingLayout];
  if (v5)
  {
    LOBYTE(v5) = [(SBFullScreenToHomePIPSwitcherModifier *)self _isIndexSelectedAppLayout:a3];
  }
  return v5;
}

- (BOOL)_isIndexSelectedAppLayout:(unint64_t)a3
{
  id v4 = self;
  BOOL v5 = [(SBFullScreenToHomePIPSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_appLayout];
  return (char)v4;
}

- (BOOL)shouldForceDefaultAnchorPointForTransition
{
  return self->_shouldForceDefaultAnchorPointForTransition;
}

- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3
{
  self->_shouldForceDefaultAnchorPointForTransition = a3;
}

- (BOOL)shouldClippingTakeShadowIntoAccount
{
  return self->_shouldClippingTakeShadowIntoAccount;
}

- (void)setShouldClippingTakeShadowIntoAccount:(BOOL)a3
{
  self->_shouldClippingTakeShadowIntoAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end