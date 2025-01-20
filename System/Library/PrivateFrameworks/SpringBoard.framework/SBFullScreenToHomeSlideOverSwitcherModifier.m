@interface SBFullScreenToHomeSlideOverSwitcherModifier
- (BOOL)_isIndexSlideOverAppLayout:(unint64_t)a3;
- (BOOL)_shouldApplySlideOverLayoutToIndex:(unint64_t)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldBlurUnreadyScenes;
- (BOOL)shouldForceDefaultAnchorPointForTransition;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBFullScreenToHomeSlideOverSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 direction:(unint64_t)a5;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)homeScreenAlpha;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)startingScreenEdge;
- (int64_t)wallpaperStyle;
- (void)setShouldBlurUnreadyScenes:(BOOL)a3;
- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3;
- (void)setStartingScreenEdge:(int64_t)a3;
@end

@implementation SBFullScreenToHomeSlideOverSwitcherModifier

- (SBFullScreenToHomeSlideOverSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 direction:(unint64_t)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  v10 = [(SBTransitionSwitcherModifier *)&v15 initWithTransitionID:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a4);
    v11->_direction = a5;
    v12 = [[SBFullScreenAppLayoutSwitcherModifier alloc] initWithActiveAppLayout:v11->_appLayout];
    fullScreenModifier = v11->_fullScreenModifier;
    v11->_fullScreenModifier = v12;
  }
  return v11;
}

- (id)transitionWillBegin
{
  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v11 transitionWillBegin];
  int64_t v4 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self homeScreenBackdropBlurType];
  if (self->_direction)
  {
    int64_t v5 = v4;
    v6 = [SBUpdateLayoutSwitcherEventResponse alloc];
    if (v5 != 3)
    {
      uint64_t v7 = 10;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = [SBUpdateLayoutSwitcherEventResponse alloc];
  }
  uint64_t v7 = 2;
LABEL_6:
  v8 = [(SBUpdateLayoutSwitcherEventResponse *)v6 initWithOptions:v7 updateMode:2];
  id v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v3];

  return v9;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  int64_t v4 = [(SBSwitcherModifier *)&v8 handleSceneReadyEvent:a3];
  if (self->_shouldBlurUnreadyScenes)
  {
    int64_t v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
    uint64_t v6 = SBAppendSwitcherModifierResponse(v5, v4);

    int64_t v4 = (void *)v6;
  }
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v31.receiver = self;
  v31.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  -[SBFullScreenToHomeSlideOverSwitcherModifier frameForIndex:](&v31, sel_frameForIndex_);
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  if ([(SBFullScreenToHomeSlideOverSwitcherModifier *)self _isIndexSlideOverAppLayout:a3])
  {
    uint64_t v25 = 0;
    v26 = (double *)&v25;
    uint64_t v27 = 0x4010000000;
    v28 = &unk_1D90ED3C6;
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    fullScreenModifier = self->_fullScreenModifier;
    long long v29 = *MEMORY[0x1E4F1DB28];
    long long v30 = v13;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __61__SBFullScreenToHomeSlideOverSwitcherModifier_frameForIndex___block_invoke;
    v24[3] = &unk_1E6AF6358;
    v24[4] = self;
    v24[5] = &v25;
    v24[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fullScreenModifier usingBlock:v24];
    CGFloat x = v26[4];
    CGFloat y = v26[5];
    CGFloat width = v26[6];
    CGFloat height = v26[7];
    _Block_object_dispose(&v25, 8);
  }
  if ([(SBFullScreenToHomeSlideOverSwitcherModifier *)self _shouldApplySlideOverLayoutToIndex:a3])
  {
    [(SBFullScreenToHomeSlideOverSwitcherModifier *)self containerViewBounds];
    double v16 = v15;
    int v17 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self isRTLEnabled];
    double v18 = -v16;
    if (!v17) {
      double v18 = v16;
    }
    if (self->_startingScreenEdge == 1) {
      double v19 = -v18;
    }
    else {
      double v19 = v18;
    }
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGRect v33 = CGRectOffset(v32, v19, 0.0);
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    CGFloat width = v33.size.width;
    CGFloat height = v33.size.height;
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

uint64_t __61__SBFullScreenToHomeSlideOverSwitcherModifier_frameForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 152) frameForIndex:a1[6]];
  v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  BOOL v5 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self _isIndexSlideOverAppLayout:"_isIndexSlideOverAppLayout:"];
  double result = 1.0;
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier scaleForIndex:](&v7, sel_scaleForIndex_, a3, 1.0);
  }
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (BOOL v5 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self _isIndexSlideOverAppLayout:a3], v6 = 0.5, v7 = 0.5, !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v8 anchorPointForIndex:a3];
  }
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBFullScreenToHomeSlideOverSwitcherModifier *)self _isIndexSlideOverAppLayout:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  return [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v6 shouldPinLayoutRolesToSpace:a3];
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBFullScreenToHomeSlideOverSwitcherModifier *)self _isIndexSlideOverAppLayout:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  return [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v6 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (double v6 = 0.0, ([v4 isEqual:self->_appLayout] & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v9 perspectiveAngleForAppLayout:v5];
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
  v10 = v9;
  if (self->_shouldForceDefaultAnchorPointForTransition && [v9 isEqual:self->_appLayout])
  {
    double v11 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self appLayouts];
    -[SBFullScreenToHomeSlideOverSwitcherModifier frameForIndex:](self, "frameForIndex:", [v11 indexOfObject:self->_appLayout]);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
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
    v15.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
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
  v6.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  v3 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:a3];
  BOOL v5 = (void *)[v4 mutableCopy];

  objc_super v6 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self switcherSettings];
  id v7 = [v6 animationSettings];
  objc_super v8 = [v7 slideOverSettings];
  [v5 setLayoutSettings:v8];

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 1.0;
  if (![(SBFullScreenToHomeSlideOverSwitcherModifier *)self _isIndexSlideOverAppLayout:a5])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (int64_t)homeScreenBackdropBlurType
{
  if ([(SBFullScreenToHomeSlideOverSwitcherModifier *)self hasHomeButton]) {
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

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return self->_direction != 1;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  if (self->_appLayout == a4) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  return -[SBFullScreenToHomeSlideOverSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v5, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3);
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v6 = (SBAppLayout *)a4;
  if (self->_appLayout == v6 && self->_shouldBlurUnreadyScenes)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    LODWORD(a3) = [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v9 isLayoutRoleContentReady:a3 inAppLayout:v6] ^ 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    LOBYTE(a3) = [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v8 isLayoutRoleBlurred:a3 inAppLayout:v6];
  }

  return a3;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  objc_super v6 = (SBAppLayout *)a4;
  [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v14 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  appLayout = self->_appLayout;

  if (appLayout == v6)
  {
    double v10 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self switcherSettings];
    double v11 = [v10 animationSettings];
    [v11 resizeBlurDelay];
    double v8 = v12;
  }
  return v8;
}

- (double)homeScreenAlpha
{
  int64_t v3 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self homeScreenBackdropBlurType];
  double result = 1.0;
  if (v3 == 3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    [(SBFullScreenToHomeSlideOverSwitcherModifier *)&v5 homeScreenAlpha];
  }
  return result;
}

- (BOOL)_shouldApplySlideOverLayoutToIndex:(unint64_t)a3
{
  BOOL v4 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self _isIndexSlideOverAppLayout:a3];
  if (v4)
  {
    if ([(SBTransitionSwitcherModifier *)self isPreparingLayout] && !self->_direction)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      BOOL v4 = [(SBTransitionSwitcherModifier *)self isUpdatingLayout];
      if (v4) {
        LOBYTE(v4) = self->_direction == 1;
      }
    }
  }
  return v4;
}

- (BOOL)_isIndexSlideOverAppLayout:(unint64_t)a3
{
  BOOL v4 = self;
  objc_super v5 = [(SBFullScreenToHomeSlideOverSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_appLayout];
  return (char)v4;
}

- (int64_t)startingScreenEdge
{
  return self->_startingScreenEdge;
}

- (void)setStartingScreenEdge:(int64_t)a3
{
  self->_startingScreenEdge = a3;
}

- (BOOL)shouldBlurUnreadyScenes
{
  return self->_shouldBlurUnreadyScenes;
}

- (void)setShouldBlurUnreadyScenes:(BOOL)a3
{
  self->_shouldBlurUnreadyScenes = a3;
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
  objc_storeStrong((id *)&self->_fullScreenModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end