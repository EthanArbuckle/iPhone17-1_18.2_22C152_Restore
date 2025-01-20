@interface SBSlideOverToFullScreenSwitcherModifier
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)wantsSlideOverTongue;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBSlideOverToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 slideOverAppLayout:(id)a4 fullScreenAppLayout:(id)a5 replacingMainAppLayout:(id)a6;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)wallpaperStyle;
@end

@implementation SBSlideOverToFullScreenSwitcherModifier

- (SBSlideOverToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 slideOverAppLayout:(id)a4 fullScreenAppLayout:(id)a5 replacingMainAppLayout:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v19 initWithTransitionID:v10];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fromSlideOverAppLayout, a4);
    objc_storeStrong((id *)&v15->_toFullScreenAppLayout, a5);
    objc_storeStrong((id *)&v15->_removedMainAppLayout, a6);
    if (!v13)
    {
      v16 = [[SBHomeScreenZoomSwitcherModifier alloc] initWithTransitionID:v10 direction:2];
      homeScreenZoomModifier = v15->_homeScreenZoomModifier;
      v15->_homeScreenZoomModifier = v16;

      [(SBChainableModifier *)v15 addChildModifier:v15->_homeScreenZoomModifier];
    }
  }

  return v15;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  objc_super v6 = (SBAppLayout *)a3;
  id v7 = a4;
  if (self->_fromSlideOverAppLayout == v6 || self->_toFullScreenAppLayout == v6)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
    v8 = [(SBSlideOverToFullScreenSwitcherModifier *)&v10 preferredAppLayoutToReuseAccessoryForAppLayout:v6 fromAppLayouts:v7];
  }

  return v8;
}

- (id)visibleAppLayouts
{
  v9.receiver = self;
  v9.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  v3 = [(SBSlideOverToFullScreenSwitcherModifier *)&v9 visibleAppLayouts];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SBSlideOverToFullScreenSwitcherModifier_visibleAppLayouts__block_invoke;
  v8[3] = &unk_1E6AF4B60;
  v8[4] = self;
  v4 = objc_msgSend(v3, "bs_filter:", v8);
  v5 = (void *)[v4 mutableCopy];

  [v5 addObject:self->_toFullScreenAppLayout];
  id v6 = v5;

  return v6;
}

uint64_t __60__SBSlideOverToFullScreenSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(*(void *)(a1 + 32) + 136)] ^ 1;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  -[SBSlideOverToFullScreenSwitcherModifier frameForIndex:](&v23, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(SBSlideOverToFullScreenSwitcherModifier *)self appLayouts];
  v14 = [v13 objectAtIndex:a3];

  if (self->_removedMainAppLayout == v14)
  {
    [(SBSlideOverToFullScreenSwitcherModifier *)self containerViewBounds];
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
  }

  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  double v8 = (SBAppLayout *)a4;
  [(SBSlideOverToFullScreenSwitcherModifier *)&v16 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
  double v10 = v9;
  removedMainAppLayout = self->_removedMainAppLayout;

  if (removedMainAppLayout == v8)
  {
    double v12 = [(SBSlideOverToFullScreenSwitcherModifier *)self switcherSettings];
    id v13 = [v12 animationSettings];
    [v13 slideOverToFullScreenOutgoingFinalOpacity];
    double v10 = v14;
  }
  return v10;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  -[SBSlideOverToFullScreenSwitcherModifier scaleForIndex:](&v13, sel_scaleForIndex_);
  double v6 = v5;
  double v7 = [(SBSlideOverToFullScreenSwitcherModifier *)self appLayouts];
  double v8 = [v7 objectAtIndex:a3];

  if (self->_removedMainAppLayout == v8)
  {
    double v9 = [(SBSlideOverToFullScreenSwitcherModifier *)self switcherSettings];
    double v10 = [v9 animationSettings];
    [v10 slideOverToFullScreenOutgoingAppScaleBack];
    double v6 = v11;
  }
  return v6;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 isEqual:self->_toFullScreenAppLayout])
  {
    LODWORD(a3) = [(SBSlideOverToFullScreenSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:self->_toFullScreenAppLayout] ^ 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
    LOBYTE(a3) = [(SBSlideOverToFullScreenSwitcherModifier *)&v8 isLayoutRoleBlurred:a3 inAppLayout:v6];
  }

  return a3;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  id v6 = a4;
  [(SBSlideOverToFullScreenSwitcherModifier *)&v10 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  LODWORD(a3) = objc_msgSend(v6, "isEqual:", self->_toFullScreenAppLayout, v10.receiver, v10.super_class);

  double result = 0.0;
  if (!a3) {
    return v8;
  }
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  double v5 = self;
  v8.receiver = self;
  v8.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  id v6 = a4;
  LOBYTE(a3) = [(SBSlideOverToFullScreenSwitcherModifier *)&v8 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  LOBYTE(v5) = objc_msgSend(v6, "isEqual:", v5->_toFullScreenAppLayout, v8.receiver, v8.super_class);

  return v5 | a3;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBSlideOverToFullScreenSwitcherModifier *)self displayCornerRadius];
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)wallpaperStyle
{
  return 3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  double v4 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBSlideOverToFullScreenSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];
  objc_super v8 = [v7 slideOverToFullScreenAnimationSettings];
  [v5 setLayoutSettings:v8];

  [v5 setUpdateMode:3];
  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  double v3 = [(SBSlideOverToFullScreenSwitcherModifier *)&v6 visibleHomeAffordanceLayoutElements];
  double v4 = (void *)[v3 mutableCopy];

  [v4 removeObject:self->_fromSlideOverAppLayout];
  [v4 removeObject:self->_toFullScreenAppLayout];
  return v4;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenZoomModifier, 0);
  objc_storeStrong((id *)&self->_removedMainAppLayout, 0);
  objc_storeStrong((id *)&self->_toFullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_fromSlideOverAppLayout, 0);
}

@end