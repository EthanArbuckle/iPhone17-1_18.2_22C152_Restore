@interface SBEntityRemovalDeclineFloatingSwitcherModifier
- (BOOL)_isIndexFromAppLayout:(unint64_t)a3;
- (BOOL)_isIndexToAppLayout:(unint64_t)a3;
- (CGRect)containerViewBounds;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBEntityRemovalDeclineFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 floatingConfiguration:(int64_t)a6;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)_layoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
@end

@implementation SBEntityRemovalDeclineFloatingSwitcherModifier

- (SBEntityRemovalDeclineFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 floatingConfiguration:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v12)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBEntityRemovalDeclineFloatingSwitcherModifier.m", 34, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:v11];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    objc_storeStrong((id *)&v15->_toAppLayout, a5);
    v15->_floatingConfiguration = a6;
  }

  return v15;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBChainableModifier *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__SBEntityRemovalDeclineFloatingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __88__SBEntityRemovalDeclineFloatingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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
  v6.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  id v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  return v4;
}

- (CGRect)containerViewBounds
{
  uint64_t v3 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self switcherInterfaceOrientation];
  int64_t floatingConfiguration = self->_floatingConfiguration;
  [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:v3 floatingConfiguration:floatingConfiguration];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if ([(SBEntityRemovalDeclineFloatingSwitcherModifier *)self _isIndexFromAppLayout:"_isIndexFromAppLayout:"])
  {
    [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self containerViewBounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    id v13 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self entityRemovalSettings];
    v14 = [v13 floatingDeclineIntentAnimationSettings];
    [v14 toBeRemovedSlideOutHeightOffsetMultiplier];
    double v16 = v12 * v15;

    double v17 = v8 + v16;
  }
  else
  {
    if ([(SBEntityRemovalDeclineFloatingSwitcherModifier *)self _isIndexToAppLayout:a3])
    {
      [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self containerViewBounds];
    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
      [(SBEntityRemovalDeclineFloatingSwitcherModifier *)&v24 frameForIndex:a3];
    }
    double v6 = v18;
    double v10 = v19;
    double v12 = v20;
  }
  double v21 = v6;
  double v22 = v10;
  double v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v17;
  result.origin.x = v21;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if ([(SBEntityRemovalDeclineFloatingSwitcherModifier *)self _isIndexFromAppLayout:"_isIndexFromAppLayout:"])
  {
    double v5 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self entityRemovalSettings];
    double v6 = [v5 floatingDeclineIntentAnimationSettings];
    double v7 = [v6 defaultAnimationSettings];
    [v7 toBeRemovedFinalScale];
    double v9 = v8;

    return v9;
  }
  else if ([(SBEntityRemovalDeclineFloatingSwitcherModifier *)self _isIndexToAppLayout:a3] {
         && [(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  }
  {
    -[SBEntityRemovalDeclineFloatingSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_, 1, v11.receiver, v11.super_class, self, SBEntityRemovalDeclineFloatingSwitcherModifier);
  }
  else
  {
    -[SBEntityRemovalDeclineFloatingSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3, self, SBEntityRemovalDeclineFloatingSwitcherModifier, v12.receiver, v12.super_class);
  }
  return result;
}

- (id)visibleAppLayouts
{
  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  uint64_t v3 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)&v7 visibleAppLayouts];
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
  v8.receiver = self;
  v8.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  uint64_t v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  v2 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self entityRemovalSettings];
  uint64_t v3 = [v2 floatingDeclineIntentAnimationSettings];
  id v4 = [v3 toBeRemovedSlideOutAnimationSettings];

  return v4;
}

- (id)topMostLayoutElements
{
  v8.receiver = self;
  v8.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  uint64_t v3 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)&v8 topMostLayoutElements];
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
  double v9 = 1.0;
  if (![(SBEntityRemovalDeclineFloatingSwitcherModifier *)self _isIndexFromAppLayout:a5]
    && ![(SBEntityRemovalDeclineFloatingSwitcherModifier *)self _isIndexToAppLayout:a5])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
    [(SBEntityRemovalDeclineFloatingSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
  uint64_t v6 = (SBAppLayout *)a4;
  [(SBEntityRemovalDeclineFloatingSwitcherModifier *)&v14 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  toAppLayout = self->_toAppLayout;

  if (toAppLayout == v6
    && [(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  {
    double v10 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self switcherSettings];
    objc_super v11 = [v10 floatingSwitcherSettings];
    [v11 dimmingAlpha];
    double v8 = v12;
  }
  return v8;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  BOOL v7 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self _isIndexFromAppLayout:a4];
  double result = 1.0;
  if (!v7)
  {
    if (!-[SBEntityRemovalDeclineFloatingSwitcherModifier _isIndexToAppLayout:](self, "_isIndexToAppLayout:", a4, 1.0)
      || (v9 = [(SBTransitionSwitcherModifier *)self transitionPhase], double result = 0.0, v9 != 1))
    {
      v10.receiver = self;
      v10.super_class = (Class)SBEntityRemovalDeclineFloatingSwitcherModifier;
      [(SBEntityRemovalDeclineFloatingSwitcherModifier *)&v10 shadowOpacityForLayoutRole:a3 atIndex:a4];
    }
  }
  return result;
}

- (BOOL)_isIndexFromAppLayout:(unint64_t)a3
{
  id v4 = self;
  uint64_t v5 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_fromAppLayout];
  return (char)v4;
}

- (BOOL)_isIndexToAppLayout:(unint64_t)a3
{
  id v4 = self;
  uint64_t v5 = [(SBEntityRemovalDeclineFloatingSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_toAppLayout];
  return (char)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end