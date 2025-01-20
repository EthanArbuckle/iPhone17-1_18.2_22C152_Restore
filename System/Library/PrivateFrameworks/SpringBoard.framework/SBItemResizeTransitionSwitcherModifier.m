@interface SBItemResizeTransitionSwitcherModifier
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBItemResizeTransitionSwitcherModifier)initWithTransitionID:(id)a3 selectedAppLayout:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)keyboardSuppressionMode;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
@end

@implementation SBItemResizeTransitionSwitcherModifier

- (SBItemResizeTransitionSwitcherModifier)initWithTransitionID:(id)a3 selectedAppLayout:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
  v8 = [(SBTransitionSwitcherModifier *)&v11 initWithTransitionID:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_selectedAppLayout, a4);
  }

  return v9;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v29.receiver = self;
  v29.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
  -[SBItemResizeTransitionSwitcherModifier frameForIndex:](&v29, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SBItemResizeTransitionSwitcherModifier *)self appLayouts];
  v14 = [v13 objectAtIndex:a3];
  if ([v14 isOrContainsAppLayout:self->_selectedAppLayout])
  {
    v28.receiver = self;
    v28.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
    [(SBItemResizeTransitionSwitcherModifier *)&v28 frameForIndex:a3];
    double v16 = v15;
    double v18 = v17;
    [(SBItemResizeTransitionSwitcherModifier *)self containerViewBounds];
    double v20 = v19;
    double v22 = v21;

    if (v16 == v20 && v18 == v22)
    {
      double v10 = v10 + 0.000000001;
      double v12 = v12 + 0.000000001;
    }
  }
  else
  {
  }
  double v24 = v6;
  double v25 = v8;
  double v26 = v10;
  double v27 = v12;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
  double v5 = [(SBTransitionSwitcherModifier *)&v11 animationAttributesForLayoutElement:v4];
  double v6 = (void *)[v5 mutableCopy];

  if (![v4 switcherLayoutElementType]
    && [v4 isOrContainsAppLayout:self->_selectedAppLayout])
  {
    [v6 setLayoutUpdateMode:3];
    double v7 = [(SBItemResizeTransitionSwitcherModifier *)self switcherSettings];
    double v8 = [v7 chamoisSettings];
    double v9 = [v8 liveResizeAfterReleaseLayoutAnimationSettings];
    [v6 setLayoutSettings:v9];
  }
  return v6;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isOrContainsAppLayout:self->_selectedAppLayout])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
    BOOL v5 = [(SBItemResizeTransitionSwitcherModifier *)&v7 wantsSceneResizesHostedContextForAppLayout:v4];
  }

  return v5;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
}

- (void).cxx_destruct
{
}

@end