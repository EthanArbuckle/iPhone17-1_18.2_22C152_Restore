@interface SBFullScreenToHomeCenterZoomDownSwitcherModifier
- (BOOL)_isIndexCenterZoomAppLayout:(unint64_t)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode;
- (BOOL)shouldForceDefaultAnchorPointForTransition;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBFullScreenToHomeCenterZoomDownSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 offsetYPercentOfScreenHeight:(double)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_layoutSettings;
- (id)_opacitySettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (void)didMoveToParentModifier:(id)a3;
- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3;
@end

@implementation SBFullScreenToHomeCenterZoomDownSwitcherModifier

- (SBFullScreenToHomeCenterZoomDownSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 offsetYPercentOfScreenHeight:(double)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  v10 = [(SBTransitionSwitcherModifier *)&v13 initWithTransitionID:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a4);
    v11->_offsetYPercentOfScreenHeight = a5;
  }

  return v11;
}

- (void)didMoveToParentModifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
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
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier frameForIndex:](&v21, sel_frameForIndex_);
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]
    && [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self _isIndexCenterZoomAppLayout:a3])
  {
    CGFloat v13 = *MEMORY[0x1E4F1DAD8];
    CGFloat v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self screenScale];
    BSFloatRoundForScale();
    CGFloat v16 = v15;
    v22.origin.CGFloat x = v13;
    v22.origin.CGFloat y = v14;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRect v23 = CGRectOffset(v22, 0.0, v16);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]
    && [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self _isIndexCenterZoomAppLayout:a3])
  {
    double v5 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self switcherSettings];
    objc_super v6 = [v5 animationSettings];
    [v6 centerZoomScale];
    double v8 = v7;

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)&v10 scaleForIndex:a3];
  }
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v5 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self _isIndexCenterZoomAppLayout:a3], v6 = 0.5, double v7 = 0.5, !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)&v8 anchorPointForIndex:a3];
  }
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self _isIndexCenterZoomAppLayout:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  return [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)&v6 shouldPinLayoutRolesToSpace:a3];
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self _isIndexCenterZoomAppLayout:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  return [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)&v6 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (double v6 = 0.0, ([v4 isEqual:self->_appLayout] & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)&v9 perspectiveAngleForAppLayout:v5];
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
  objc_super v10 = v9;
  if (self->_shouldForceDefaultAnchorPointForTransition && [v9 isEqual:self->_appLayout])
  {
    double v11 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self appLayouts];
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier frameForIndex:](self, "frameForIndex:", [v11 indexOfObject:self->_appLayout]);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
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
    v15.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
    double v9 = v11;
    double v10 = v12;
  }

  double v13 = v9;
  double v14 = v10;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  v3 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  BOOL v5 = (void *)[v4 mutableCopy];

  objc_super v6 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  id v7 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self _opacitySettings];
  [v5 setOpacitySettings:v7];

  return v5;
}

- (id)_layoutSettings
{
  v2 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self switcherSettings];
  v3 = [v2 animationSettings];
  id v4 = [v3 centerZoomSettings];

  return v4;
}

- (id)_opacitySettings
{
  v2 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self switcherSettings];
  v3 = [v2 animationSettings];
  id v4 = [v3 centerZoomOpacitySettings];

  return v4;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self displayCornerRadius];
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if ([(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self hasHomeButton]) {
    return 1;
  }
  else {
    return 3;
  }
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

- (id)topMostLayoutElements
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  double v3 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)&v8 topMostLayoutElements];
  double v4 = v3;
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

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
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

- (BOOL)_isIndexCenterZoomAppLayout:(unint64_t)a3
{
  double v4 = self;
  double v5 = [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)self appLayouts];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end