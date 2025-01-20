@interface SBSlideFloatingAppFromBottomSwitcherModifier
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBSlideFloatingAppFromBottomSwitcherModifier)initWithTransitionID:(id)a3 fromFloatingAppLayout:(id)a4 toFloatingAppLayout:(id)a5;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
@end

@implementation SBSlideFloatingAppFromBottomSwitcherModifier

- (SBSlideFloatingAppFromBottomSwitcherModifier)initWithTransitionID:(id)a3 fromFloatingAppLayout:(id)a4 toFloatingAppLayout:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSlideFloatingAppFromBottomSwitcherModifier.m", 28, @"Invalid parameter not satisfying: %@", @"fromFloatingAppLayout" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBSlideFloatingAppFromBottomSwitcherModifier.m", 29, @"Invalid parameter not satisfying: %@", @"toFloatingAppLayout" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  v13 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:v9];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fromFloatingAppLayout, a4);
    objc_storeStrong((id *)&v14->_toFloatingAppLayout, a5);
  }

  return v14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_fromFloatingAppLayout withName:@"fromFloatingAppLayout"];
  id v6 = (id)[v4 appendObject:self->_toFloatingAppLayout withName:@"toFloatingAppLayout"];
  return v4;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  v3 = [(SBSlideFloatingAppFromBottomSwitcherModifier *)&v6 visibleAppLayouts];
  v4 = [v3 setByAddingObject:self->_toFloatingAppLayout];

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  -[SBSlideFloatingAppFromBottomSwitcherModifier frameForIndex:](&v23, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SBSlideFloatingAppFromBottomSwitcherModifier *)self appLayouts];
  v14 = [v13 objectAtIndex:a3];

  if (v14 == self->_toFloatingAppLayout
    && [(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  {
    v15 = [(SBSlideFloatingAppFromBottomSwitcherModifier *)self entityRemovalSettings];
    v16 = [v15 floatingDeclineIntentAnimationSettings];
    [v16 toBeRemovedSlideOutHeightOffsetMultiplier];
    double v18 = v12 * v17;

    double v8 = v8 + v18;
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
  double v8 = (SBAppLayout *)a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  [(SBSlideFloatingAppFromBottomSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
  if (self->_fromFloatingAppLayout == v8 || (double v10 = v9, self->_toFloatingAppLayout == v8)) {
    double v10 = 1.0;
  }

  return v10;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  double v6 = (SBAppLayout *)a4;
  [(SBSlideFloatingAppFromBottomSwitcherModifier *)&v14 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  fromFloatingAppLayout = self->_fromFloatingAppLayout;

  if (fromFloatingAppLayout == v6)
  {
    double v10 = [(SBSlideFloatingAppFromBottomSwitcherModifier *)self switcherSettings];
    double v11 = [v10 floatingSwitcherSettings];
    [v11 dimmingAlpha];
    double v8 = v12;
  }
  return v8;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  -[SBSlideFloatingAppFromBottomSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_);
  double v6 = v5;
  double v7 = [(SBSlideFloatingAppFromBottomSwitcherModifier *)self appLayouts];
  double v8 = [v7 objectAtIndex:a3];

  if (v8 == self->_fromFloatingAppLayout) {
    double v6 = 0.98;
  }

  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBSlideFloatingAppFromBottomSwitcherModifier;
  v4 = (SBAppLayout *)a3;
  double v5 = [(SBTransitionSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  toFloatingAppLayout = self->_toFloatingAppLayout;

  if (toFloatingAppLayout == v4)
  {
    double v7 = objc_msgSend(v5, "mutableCopy", v12.receiver, v12.super_class);
    double v8 = [(SBSlideFloatingAppFromBottomSwitcherModifier *)self switcherSettings];
    double v9 = [v8 animationSettings];
    objc_super v10 = [v9 slideUpSettings];
    [v7 setLayoutSettings:v10];

    double v5 = v7;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fromFloatingAppLayout, 0);
}

@end