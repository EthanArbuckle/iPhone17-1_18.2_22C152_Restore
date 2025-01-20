@interface SBEntityRemovalDeleteFloatingSwitcherModifier
- (BOOL)_isIndexFromAppLayout:(unint64_t)a3;
- (BOOL)_isIndexToAppLayout:(unint64_t)a3;
- (BOOL)blursFromAppLayout;
- (CGRect)containerViewBounds;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBEntityRemovalDeleteFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 floatingConfiguration:(int64_t)a6;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)_layoutSettings;
- (id)_opacitySettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
- (void)setBlursFromAppLayout:(BOOL)a3;
@end

@implementation SBEntityRemovalDeleteFloatingSwitcherModifier

- (SBEntityRemovalDeleteFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 floatingConfiguration:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v12)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBEntityRemovalDeleteFloatingSwitcherModifier.m", 32, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:v11];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    objc_storeStrong((id *)&v15->_toAppLayout, a5);
    v15->_floatingConfiguration = a6;
    v15->_blursFromAppLayout = 1;
  }

  return v15;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBChainableModifier *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__SBEntityRemovalDeleteFloatingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __87__SBEntityRemovalDeleteFloatingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = SBStringForFloatingConfiguration(*(void *)(*(void *)(a1 + 40) + 152));
  id v4 = (id)[v2 appendObject:v3 withName:@"floatingConfiguration"];

  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 136) withName:@"fromAppLayout"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 144) withName:@"toAppLayout"];
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  id v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  return v4;
}

- (id)transitionWillUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionWillUpdate];
  if (self->_blursFromAppLayout)
  {
    id v4 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_fromAppLayout shouldBlur:1 animationUpdateMode:3];
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    v3 = (void *)v5;
  }
  return v3;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  if (self->_blursFromAppLayout)
  {
    id v4 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_fromAppLayout shouldBlur:0 animationUpdateMode:2];
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    v3 = (void *)v5;
  }
  return v3;
}

- (CGRect)containerViewBounds
{
  uint64_t v3 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self switcherInterfaceOrientation];
  int64_t floatingConfiguration = self->_floatingConfiguration;
  [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:v3 floatingConfiguration:floatingConfiguration];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if ([(SBEntityRemovalDeleteFloatingSwitcherModifier *)self _isIndexFromAppLayout:"_isIndexFromAppLayout:"])
  {
    [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self containerViewBounds];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
    [(SBEntityRemovalDeleteFloatingSwitcherModifier *)&v9 frameForIndex:a3];
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if (![(SBEntityRemovalDeleteFloatingSwitcherModifier *)self _isIndexFromAppLayout:"_isIndexFromAppLayout:"])
  {
    if ([(SBEntityRemovalDeleteFloatingSwitcherModifier *)self _isIndexToAppLayout:a3]
      && [(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
    {
      double v5 = 1.0;
      if (SBReduceMotion()) {
        return v5;
      }
      -[SBEntityRemovalDeleteFloatingSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_, 1, v11.receiver, v11.super_class, self, SBEntityRemovalDeleteFloatingSwitcherModifier);
    }
    else
    {
      -[SBEntityRemovalDeleteFloatingSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3, self, SBEntityRemovalDeleteFloatingSwitcherModifier, v12.receiver, v12.super_class);
    }
    return v9;
  }
  double v5 = 1.0;
  if (!SBReduceMotion())
  {
    double v6 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self entityRemovalSettings];
    double v7 = [v6 floatingDeleteIntentAnimationSettings];
    [v7 toBeRemovedFinalScale];
    double v5 = v8;
  }
  return v5;
}

- (id)visibleAppLayouts
{
  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  uint64_t v3 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)&v7 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_fromAppLayout];

  if (self->_toAppLayout)
  {
    uint64_t v5 = objc_msgSend(v4, "setByAddingObject:");

    id v4 = (void *)v5;
  }
  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  uint64_t v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  objc_super v7 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self _opacitySettings];
  [v5 setOpacitySettings:v7];

  return v5;
}

- (id)_layoutSettings
{
  v2 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self entityRemovalSettings];
  uint64_t v3 = [v2 floatingDeleteIntentAnimationSettings];
  id v4 = [v3 toBeRemovedScaleAnimationSettings];

  return v4;
}

- (id)_opacitySettings
{
  v2 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self entityRemovalSettings];
  uint64_t v3 = [v2 floatingDeleteIntentAnimationSettings];
  id v4 = [v3 toBeRemovedAlphaAnimationSettings];

  return v4;
}

- (id)topMostLayoutElements
{
  v8.receiver = self;
  v8.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  uint64_t v3 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)&v8 topMostLayoutElements];
  id v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_fromAppLayout, 0);

  toAppLayout = self->_toAppLayout;
  if (toAppLayout)
  {
    uint64_t v6 = objc_msgSend(v4, "sb_arrayByInsertingOrMovingObject:toIndex:", toAppLayout, 1);

    id v4 = (void *)v6;
  }
  return v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if ([(SBEntityRemovalDeleteFloatingSwitcherModifier *)self _isIndexFromAppLayout:a5])
  {
    objc_super v9 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self entityRemovalSettings];
    id v10 = [v9 floatingDeleteIntentAnimationSettings];
    [v10 toBeRemovedFinalAlpha];
    double v12 = v11;
  }
  else
  {
    double v12 = 1.0;
    if (![(SBEntityRemovalDeleteFloatingSwitcherModifier *)self _isIndexToAppLayout:a5])
    {
      v15.receiver = self;
      v15.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
      [(SBEntityRemovalDeleteFloatingSwitcherModifier *)&v15 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
      double v12 = v13;
    }
  }

  return v12;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
  uint64_t v6 = (SBAppLayout *)a4;
  [(SBEntityRemovalDeleteFloatingSwitcherModifier *)&v14 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  toAppLayout = self->_toAppLayout;

  if (toAppLayout == v6
    && [(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  {
    id v10 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self switcherSettings];
    double v11 = [v10 floatingSwitcherSettings];
    [v11 dimmingAlpha];
    double v8 = v12;
  }
  return v8;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v7 = 0.0;
  if (![(SBEntityRemovalDeleteFloatingSwitcherModifier *)self _isIndexFromAppLayout:a4]
    && (![(SBEntityRemovalDeleteFloatingSwitcherModifier *)self _isIndexToAppLayout:a4]
     || [(SBTransitionSwitcherModifier *)self transitionPhase] != 1))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBEntityRemovalDeleteFloatingSwitcherModifier;
    [(SBEntityRemovalDeleteFloatingSwitcherModifier *)&v10 shadowOpacityForLayoutRole:a3 atIndex:a4];
    return v8;
  }
  return v7;
}

- (BOOL)_isIndexFromAppLayout:(unint64_t)a3
{
  id v4 = self;
  uint64_t v5 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_fromAppLayout];
  return (char)v4;
}

- (BOOL)_isIndexToAppLayout:(unint64_t)a3
{
  id v4 = self;
  uint64_t v5 = [(SBEntityRemovalDeleteFloatingSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_toAppLayout];
  return (char)v4;
}

- (BOOL)blursFromAppLayout
{
  return self->_blursFromAppLayout;
}

- (void)setBlursFromAppLayout:(BOOL)a3
{
  self->_blursFromAppLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end